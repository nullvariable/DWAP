if isClient() then return end

local DWAPUtils = require("DWAPUtils")
require "Map/SGlobalObjectSystem"
local DWAPWaterObject = require "DWAP/DWAPWaterObject_server"

DWAPWaterSystem = SGlobalObjectSystem:derive("DWAPWaterSystem")

function DWAPWaterSystem:noise(message)
    if self.wantNoise then
        if type(message) == "string" then
            print(self.systemName .. ': ' .. message)
        else
            DWAPUtils.dprint(message)
        end
    end
end

function DWAPWaterSystem:new()
    local o = SGlobalObjectSystem.new(self, "DWAPWaterSystem")
    setmetatable(o, self)
    self.__index = self

    self:noise("Creating new instance")
    return o
end

function DWAPWaterSystem:initSystem()
    self:noise("Initializing system")
    if DWAPUtils.getSaveVersion() < 17 or not SandboxVars.DWAP.EnableWaterSystem then
        self.active = false
        self:noise("Skipping initialization due to save version or sandbox settings")
        return
    else
        self.active = true
    end

    -- Initialize water shutoff detection
    self.hadWorldWaterLastTick = DWAPUtils.WorldWaterStillAvailable()
    if self.hadWorldWaterLastTick then
        self:noise("InitSystem: watching for water shutoff")
        Events.EveryHours.Add(self.waterIntervalTick)
    else
        self:noise("InitSystem: No water detected, triggering shutoff")
        self:onWaterShutoff()
    end
end

function DWAPWaterSystem:waterIntervalTick()
    if DWAPUtils.WorldWaterStillAvailable() then
        self.hadWorldWaterLastTick = true
    elseif self.hadWorldWaterLastTick then
        self:noise("Water shutoff detected")
        self.hadWorldWaterLastTick = false
        self:onWaterShutoff()
        Events.EveryHours.Remove(self.waterIntervalTick)
    end
end

function DWAPWaterSystem:isValidIsoObject(isoObject)
    if not isoObject then return false end

    -- Check if this object has DWAP water system mod data
    local modData = isoObject:getModData()
    return modData.objectType ~= nil
end

--- Refill all generator-powered tanks
--- @param maxAmount number Maximum amount to add per tank
function DWAPWaterSystem:refillTanksFromSource(maxAmount)
    for i = 1, self:getLuaObjectCount() do
        local tankObj = self:getLuaObjectByIndex(i)
        if tankObj and tankObj:isTank() then
            local isoObject = tankObj:getIsoObject()
            if isoObject then
                local modData = isoObject:getModData()
                -- If tank has a generator source, check if generator has power and refill
                if modData.waterSource then
                    -- Add logic here to check generator power and refill tank
                    -- This would need to be implemented based on your generator system
                end
            end
        end
    end
end

--- Handle water shutoff event
function DWAPWaterSystem:onWaterShutoff()
    self:noise("Water shutoff detected")

    self.waterIsShutoff = true
    -- Connect all fixtures to their tanks based on their stored connection data
    self:noise("Found " .. self:getLuaObjectCount() .. " Lua objects")
    for i = 1, self:getLuaObjectCount() do
        local luaObj = self:getLuaObjectByIndex(i)
        if luaObj and luaObj:isFixture() then
            local isoObject = luaObj:getIsoObject()
            if isoObject and luaObj.connection and luaObj.connection.x then
                DWAPUtils.connectWaterTank(isoObject, {
                    x = luaObj.connection.x,
                    y = luaObj.connection.y,
                    z = luaObj.connection.z
                })
            end
        end
    end

    -- Start generator refill if any tanks are generator-powered
    Events.EveryHours.Add(function()
        self:refillTanksFromSource(6) -- 6 water per hour (1 per 10 minutes * 6)
    end)
end

function DWAPWaterSystem:newLuaObject(globalObject)
    self:noise("DWAPWaterSystem:newLuaObject")
    return DWAPWaterObject:new(self, globalObject)
end

function DWAPWaterSystem:OnObjectAboutToBeRemoved(isoObject)
    self:noise("DWAPWaterSystem:OnObjectAboutToBeRemoved")
    return
end

function DWAPWaterSystem:OnObjectAdded(isoObject)
    self:noise("DWAPWaterSystem:OnObjectAdded")
    if not isoObject or not self.active then return end
    self:noise("OnObjectAdded called for: " .. tostring(isoObject:getName()))
    if self:isValidIsoObject(isoObject) then
        self:loadIsoObject(isoObject)
    end
end

function DWAPWaterSystem:OnClientCommand(command, playerObj, args)
    self:noise("Received client command: " .. tostring(command))

    if command == "connectToTank" then
        self:handleConnectToTank(playerObj, args)
    elseif command == "disconnectFromTank" then
        self:handleDisconnectFromTank(playerObj, args)
    end
end

function DWAPWaterSystem:handleConnectToTank(playerObj, args)
    local fixtureX, fixtureY, fixtureZ = args.fixtureX, args.fixtureY, args.fixtureZ
    local tankX, tankY, tankZ = args.tankX, args.tankY, args.tankZ

    self:noise("Connecting fixture at " .. fixtureX .. "," .. fixtureY .. "," .. fixtureZ ..
        " to tank at " .. tankX .. "," .. tankY .. "," .. tankZ)

    -- Get the fixture lua object
    local fixtureObj = self:getLuaObjectAt(fixtureX, fixtureY, fixtureZ)
    if not fixtureObj or not fixtureObj:isFixture() then
        self:noise("Invalid fixture object")
        return
    end

    -- Get the tank lua object to verify it exists
    local tankObj = self:getLuaObjectAt(tankX, tankY, tankZ)
    if not tankObj or not tankObj:isTank() then
        self:noise("Invalid tank object")
        return
    end

    -- Update the fixture's connection
    fixtureObj.connection = { x = tankX, y = tankY, z = tankZ }
    fixtureObj:saveData(true)

    -- Use DWAPUtils to handle the actual plumbing connection
    local fixtureIso = fixtureObj:getIsoObject()
    if fixtureIso then
        DWAPUtils.connectWaterTank(fixtureIso, { x = tankX, y = tankY, z = tankZ })
    end

    -- Notify client of successful connection
    self:sendCommand("updateWaterObject", { x = fixtureX, y = fixtureY, z = fixtureZ })
end

function DWAPWaterSystem:handleDisconnectFromTank(playerObj, args)
    local fixtureX, fixtureY, fixtureZ = args.fixtureX, args.fixtureY, args.fixtureZ

    self:noise("Disconnecting fixture at " .. fixtureX .. "," .. fixtureY .. "," .. fixtureZ)

    local fixtureObj = self:getLuaObjectAt(fixtureX, fixtureY, fixtureZ)
    if not fixtureObj or not fixtureObj:isFixture() then
        self:noise("Invalid fixture object")
        return
    end

    -- Clear the connection
    fixtureObj.connection = { x = nil, y = nil, z = nil }
    fixtureObj:saveData(true)

    -- Use DWAPUtils to handle the disconnection
    local fixtureIso = fixtureObj:getIsoObject()
    if fixtureIso then
        fixtureIso:setUsesExternalWaterSource(false)
        fixtureIso:transmitModData()
    end

    -- Notify client of successful disconnection
    self:sendCommand("updateWaterObject", { x = fixtureX, y = fixtureY, z = fixtureZ })
end

SGlobalObjectSystem.RegisterSystemClass(DWAPWaterSystem)
