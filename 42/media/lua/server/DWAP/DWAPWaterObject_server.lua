if isClient() then return end

require "Map/SGlobalObject"
local DWAPUtils = require("DWAPUtils")

---@class DWAPWaterObject_Server : SGlobalObject
---@field luaSystem DWAPWaterSystem_Server
local DWAPWaterObject = SGlobalObject:derive("DWAPWaterObject")

function DWAPWaterObject:new(luaSystem, globalObject)
    return SGlobalObject.new(self, luaSystem, globalObject)
end

function DWAPWaterObject:initNew()
    self.objectType = "tank" -- "tank" or "fixture"
    self.connection = { x = nil, y = nil, z = nil }
end

---called from loadIsoObject function when making new globalObject & luaObject
function DWAPWaterObject:stateFromIsoObject(isoObject)
    self:initNew()

    -- Load data from modData that was set by Water.lua
    self:fromModData(isoObject:getModData())

    -- If this is a fixture and has a connection, establish the plumbing connection
    if self.objectType == "fixture" and self.connection.x and self.connection.y and self.connection.z then
        DWAPUtils.connectWaterTank(isoObject, {
            x = self.connection.x,
            y = self.connection.y,
            z = self.connection.z
        })
    end

    -- Sync with clients if needed
    if isServer() then
        isoObject:transmitModData()
    end
end

---called from loadIsoObject function when luaObject exists
function DWAPWaterObject:stateToIsoObject(isoObject)
    -- Sync lua object state to iso object
    self:toModData(isoObject:getModData())

    -- If this is a fixture and has a connection, ensure plumbing connection is active
    if self.objectType == "fixture" and self.connection.x and self.connection.y and self.connection.z then
        DWAPUtils.connectWaterTank(isoObject, {
            x = self.connection.x,
            y = self.connection.y,
            z = self.connection.z
        })
    end

    if isServer() then
        isoObject:transmitModData()
    end
end

function DWAPWaterObject:fromModData(modData)
    self.objectType = modData.objectType or modData["objectType"] or "tank"
    self.connection = modData.connection or modData["connection"] or { x = nil, y = nil, z = nil }
end

function DWAPWaterObject:toModData(modData)
    modData.objectType = self.objectType
    modData.connection = self.connection
end

function DWAPWaterObject:isFixture()
    return self.objectType == "fixture"
end

function DWAPWaterObject:isTank()
    return self.objectType == "tank"
end

function DWAPWaterObject:setConnection(x, y, z)
    self.connection = { x = x, y = y, z = z }
    self:saveData(true)
end

function DWAPWaterObject:clearConnection()
    self.connection = { x = nil, y = nil, z = nil }
    self:saveData(true)
end

function DWAPWaterObject:saveData(transmit)
    local isoObject = self:getIsoObject()
    if not isoObject then return end
    self:toModData(isoObject:getModData())
    if transmit and isServer() then
        isoObject:transmitModData()
    end
end

--- Static method to handle new fixture objects created by MapObjects
--- @param isoObject IsoObject The fixture object
--- @param data table Object data from config
-- Two separate reasons a fixture ends up dry, both handled here.
--
-- 1. ORDERING. Fixtures and tanks convert in chunk-STREAMING order, not config
--    order, so a fixture is regularly set up before the tank it points at.
--    connectWaterTank is a one-shot - it parks the fixture under the tank,
--    calls doFindExternalWaterSource and moves it back - so running a frame
--    early finds nothing and reports nothing. Config 02 had 13 fixtures land
--    across three frames ahead of their tank on 2026-08-07.
--
-- 2. RELOAD. IsoObject.externalWaterSource is a runtime Java field, not saved
--    mod data, so every chunk unload/reload drops it. A fixture that is already
--    converted takes the isValidIsoObject branch in Water.lua and only gets
--    re-attached, never re-connected - which is why walking out of a base and
--    back in left every fixture dry until the right-click fallback ran.
--
-- Fixtures waiting on a tank that has no fluid yet are keyed by the tank's
-- coord hash. The tank drains them when it converts or reloads, which is the
-- cheap path, but that CANNOT be the only path: a tank converts once, at world
-- load, and a fixture that parks later never gets released by it. Config 03 on
-- 2026-08-07 added its fluid container on frame 0 and stranded ten fixtures
-- that parked on frame 15793 when the player walked back in - the tank's chunk
-- simply had not streamed yet at the moment they checked.
--
-- So a sweeper backs it up. It only exists while something is actually waiting:
-- registering the first fixture hooks OnTick, the last one released unhooks it,
-- and in between it wakes one tick in SWEEP_EVERY. Idle cost is zero.
local pendingByTank = {}
local sweepHooked = false
local sweepCountdown = 0
local SWEEP_EVERY = 15      -- ticks between checks while anything is pending
local SWEEP_GIVE_UP = 900   -- stop waiting on a tank that never turns up

--- Is the tank at these coords able to satisfy a connection yet?
--- IsoObject.FindExternalWaterSource searches z+1 for an object where
--- hasFluid() is true (which is why connectWaterTank parks the fixture at
--- z-1), so that - not the object merely existing - is the real precondition.
--- Cheap: one getGridSquare and a short object walk.
local function tankHasFluid(connection)
    local square = getCell():getGridSquare(connection.x, connection.y, connection.z)
    if not square then return false end
    local objects = square:getObjects()
    for i = 0, (objects and objects:size() or 0) - 1 do
        local o = objects:get(i)
        if o and o.hasFluid and o:hasFluid() then return true end
    end
    return false
end

local function doConnect(isoObject, connection, data, waterSystem, note)
    -- fixture streamed back out while it waited: connectWaterTank would restore
    -- a nil square
    local square = isoObject:getSquare()
    if not square then return end
    -- A square outlives its chunk. It stays reachable through the cache while
    -- square.chunk is already nil, and setSquareChanged then dereferences
    -- square.chunk.loadedBits and throws (PathfindNative.squareChanged). The
    -- deferred tank flush fires long after the fixture's chunk may have gone,
    -- so this is reachable in normal travel. Leave the fixture pending - the
    -- onLoad path reconnects it when its chunk streams back in.
    if not square:getChunk() then return end
    DWAPUtils.connectWaterTank(isoObject, connection)
    if waterSystem then
        waterSystem:noise(("fixture at %d,%d,%d %s - source %s"):format(
            data.x, data.y, data.z, note,
            isoObject:hasExternalWaterSource() and "found" or "NOT FOUND"))
    end
end

--- Make sure a fixture is actually piped to its tank, connecting now if the
--- tank is ready and parking it against the tank's coords if not. Safe to call
--- repeatedly: an already-connected fixture returns immediately, so the reload
--- path can call it unconditionally.
--- @param connection table tank coords from the fixture's mod data
--- @param data table the fixture's config entry (coords, for logging)
function DWAPWaterObject.ensureFixtureConnected(isoObject, connection, data, waterSystem, note)
    if not connection or not connection.x then return end
    -- while the mains still run, fixtures draw from the world and need no tank
    if DWAPUtils.WorldWaterStillAvailable() then return end
    if isoObject:hasExternalWaterSource() then return end
    DWAPUtils.Defer(function()
        if not isoObject:getSquare() then return end
        if isoObject:hasExternalWaterSource() then return end
        if tankHasFluid(connection) then
            doConnect(isoObject, connection, data, waterSystem, note or "connected")
            return
        end
        local key = DWAPUtils.hashCoords(connection.x, connection.y, connection.z)
        local bucket = pendingByTank[key]
        if not bucket then
            bucket = { connection = connection, waited = 0, waterSystem = waterSystem, items = {} }
            pendingByTank[key] = bucket
        end
        -- Keyed by the FIXTURE's own coords, not appended: both MapObjects
        -- hooks fire for the same object on a load - OnNew converts it and
        -- parks it, then OnLoad sees it as valid and parks it again - so an
        -- array parked every fixture twice and paid two connectWaterTank calls
        -- for each. One entry per tile, last registration wins.
        local fixtureKey = DWAPUtils.hashCoords(data.x, data.y, data.z)
        if bucket.items[fixtureKey] then return end
        bucket.items[fixtureKey] = { isoObject = isoObject, connection = connection, data = data }
        DWAPWaterObject.startPendingSweep()
        if waterSystem then
            waterSystem:noise(("fixture at %d,%d,%d waiting on tank %d,%d,%d"):format(
                data.x, data.y, data.z, connection.x, connection.y, connection.z))
        end
    end)
end

--- Retry loop for fixtures whose tank never announced itself. Hooked only while
--- pendingByTank has something in it and unhooked the moment it drains, so this
--- costs nothing in the normal case. Named (not a closure) so it can be removed.
local function sweepPendingTanks()
    sweepCountdown = sweepCountdown - 1
    if sweepCountdown > 0 then return end
    sweepCountdown = SWEEP_EVERY
    local remaining = 0
    for key, bucket in pairs(pendingByTank) do
        if tankHasFluid(bucket.connection) then
            DWAPWaterObject.flushPendingForTank(bucket.connection.x, bucket.connection.y,
                bucket.connection.z, bucket.waterSystem)
        else
            bucket.waited = bucket.waited + SWEEP_EVERY
            if bucket.waited >= SWEEP_GIVE_UP then
                pendingByTank[key] = nil
                if bucket.waterSystem then
                    bucket.waterSystem:noise(("gave up waiting on tank %d,%d,%d - it never reported fluid"):format(
                        bucket.connection.x, bucket.connection.y, bucket.connection.z))
                end
            else
                remaining = remaining + 1
            end
        end
    end
    if remaining == 0 then
        Events.OnTick.Remove(sweepPendingTanks)
        sweepHooked = false
    end
end

function DWAPWaterObject.startPendingSweep()
    if sweepHooked then return end
    sweepHooked = true
    sweepCountdown = SWEEP_EVERY
    Events.OnTick.Add(sweepPendingTanks)
end

--- A tank coming back from a chunk reload takes the loadIsoObject branch, not
--- onNewTankObject, so it has to release its waiting fixtures itself. Reports
--- rather than guesses when a reloaded tank has no fluid - that is the shape of
--- the "present but has no fluid container" tanks the 2026-08-07 audit found,
--- and it would strand every fixture pointing at it.
function DWAPWaterObject.onLoadTankObject(isoObject, data, waterSystem)
    DWAPUtils.Defer(function()
        if isoObject.hasFluid and isoObject:hasFluid() then
            DWAPWaterObject.flushPendingForTank(data.x, data.y, data.z, waterSystem)
        elseif waterSystem then
            waterSystem:noise(("tank at %d,%d,%d reloaded WITHOUT fluid - fixtures cannot connect to it"):format(
                data.x, data.y, data.z))
        end
    end)
end

--- Connect every fixture that was waiting on this tank. Iterates with pairs:
--- the bucket is keyed by fixture coord hash so entries can be de-duplicated,
--- which means `#items` is 0 and an ipairs-style loop silently connects nothing.
--- That is exactly what stranded ten fixtures at config 03 on 2026-08-07.
function DWAPWaterObject.flushPendingForTank(x, y, z, waterSystem)
    local key = DWAPUtils.hashCoords(x, y, z)
    local bucket = pendingByTank[key]
    if not bucket then return end
    pendingByTank[key] = nil
    local system = waterSystem or bucket.waterSystem
    for _, w in pairs(bucket.items) do
        doConnect(w.isoObject, w.connection, w.data, system, "connected once its tank loaded")
    end
end

--- @param waterSystem DWAPWaterSystem The water system instance
function DWAPWaterObject.onNewFixtureObject(isoObject, data, waterSystem)
    if not waterSystem.active then return end
    waterSystem:noise("Setting up fixture at " .. data.x .. "," .. data.y .. "," .. data.z)

    local modData = isoObject:getModData()
    modData.objectType = "fixture"
    modData.waterSource = data.source or nil

    -- Set connection if there's a source
    if data.source then
        modData.connection = {
            x = data.source.x,
            y = data.source.y,
            z = data.source.z
        }

        -- If water is already shut off, connect immediately - but fixtures and
        -- tanks convert in chunk-STREAMING order, not config order, so the
        -- fixture regularly gets here first. Travelling 3 -> 1 on 2026-08-07
        -- set up config 01's sink at 5575,9367 on frame 8369 and only gave its
        -- tank at 5579,9372 a fluid container on frame 8370; connecting in that
        -- gap silently finds nothing and leaves the fixture dry until the
        -- right-click fallback rebuilds it. Hand ourselves to the tank instead
        -- of retrying on the tick.
        DWAPWaterObject.ensureFixtureConnected(isoObject, modData.connection, data,
            waterSystem, "connected on convert")
    else
        modData.connection = { x = nil, y = nil, z = nil }
    end

    -- Transmit mod data to clients
    isoObject:transmitModData()
end

--- Static method to handle new tank objects created by MapObjects
--- @param isoObject IsoObject The tank object
--- @param data table Object data from config
--- @param waterSystem DWAPWaterSystem The water system instance
function DWAPWaterObject.onNewTankObject(isoObject, data, waterSystem)
    if not waterSystem.active then return end
    waterSystem:noise("Setting up fluid container for tank at " .. data.x .. "," .. data.y .. "," .. data.z)

    -- Set up mod data first
    local modData = isoObject:getModData()
    modData.objectType = "tank"
    modData.connection = { x = nil, y = nil, z = nil }
    modData.waterSource = data.source or nil

    -- Replace the object with a thumpable
    local square = getCell():getGridSquare(data.x, data.y, data.z)
    if not square then
        waterSystem:noise("No square found at " .. data.x .. "," .. data.y .. "," .. data.z)
        return
    end
    local index = isoObject:getObjectIndex()
    local thumpable = IsoThumpable.new(isoObject:getCell(), square, data.sprite, false)

    -- Copy mod data to new thumpable object
    local thumpableModData = thumpable:getModData()
    thumpableModData.objectType = "tank"
    thumpableModData.connection = { x = nil, y = nil, z = nil }
    thumpableModData.waterSource = data.source or nil

    -- Create and add fluid container
    local fluidContainer = ComponentType.FluidContainer:CreateComponent()
    if fluidContainer then
        -- Use pcall to safely attempt fluid container setup
        pcall(function()
            if fluidContainer.setCapacity then
                fluidContainer:setCapacity(SandboxVars.DWAP.WaterTankCapacity or 4000)
            end
            if fluidContainer.addFluid then
                fluidContainer:addFluid(FluidType.Water, SandboxVars.DWAP.WaterLevel or 2000)
            end
        end)
        GameEntityFactory.AddComponent(thumpable, true, fluidContainer)
    end

    square:AddTileObject(thumpable)
    DWAPUtils.tryRemoveTileObject(square, isoObject, "water fixture convert")
    square:transmitAddObjectToSquare(thumpable, index)

    waterSystem:noise("Fluid container added to tank at " .. data.x .. "," .. data.y .. "," .. data.z)

    -- Any fixture that converted before this tank parked itself against these
    -- coords; the fluid container exists now, so connect them. Deferred by one
    -- tick so the container is settled on the object first.
    DWAPUtils.Defer(function()
        DWAPWaterObject.flushPendingForTank(data.x, data.y, data.z, waterSystem)
    end)
end

return DWAPWaterObject
