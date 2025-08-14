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
	SGlobalObjectSystem.initSystem(self)
    self:noise("Initializing system")
    if DWAPUtils.getSaveVersion() < 17 or not SandboxVars.DWAP.EnableWaterSystem then
        self.active = false
        self:noise("Skipping initialization due to save version or sandbox settings")
        return
    else
        self.active = true
    end
    self.system:setModDataKeys({'waterShutOffHappened'})
    self.system:setObjectModDataKeys({
        objectType = "objectType",
        connection = "connection"
    })
    -- Initialize water shutoff detection
    if not self.waterShutOffHappened then
        self.hadWorldWaterLastTick = DWAPUtils.WorldWaterStillAvailable()
        if self.hadWorldWaterLastTick then
            self:noise("[InitSystem] watching for water shutoff")
            -- Wrap handler to preserve self
            self._waterTickHandler = function() self:waterIntervalTick() end
            Events.EveryHours.Add(self._waterTickHandler)
        end
    end
    -- Start generator refill if any tanks are generator-powered
    local waterSystem = self
    Events.EveryHours.Add(function()
        waterSystem:refillTanksFromSource(6) -- 6 water per hour (1 per 10 minutes * 6)
    end)
end

function DWAPWaterSystem:waterIntervalTick()
    if DWAPUtils.WorldWaterStillAvailable() then
        self.hadWorldWaterLastTick = true
    elseif self.hadWorldWaterLastTick then
        self:noise("Water shutoff detected")
        self.hadWorldWaterLastTick = false
        self:onWaterShutoff()
        -- Remove wrapped handler
        if self._waterTickHandler then
            Events.EveryHours.Remove(self._waterTickHandler)
            self._waterTickHandler = nil
        end
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
    if not self.waterShutOffHappened then return end
    for i = 1, self:getLuaObjectCount() do
        local tankObj = self:getLuaObjectByIndex(i)
        if tankObj and tankObj:isTank() then
            local isoObject = tankObj:getIsoObject()
            if isoObject then
                local fluidComponent = isoObject:getComponent("Fluid")
                if fluidComponent then
                    local currentAmount = fluidComponent:getAmount()
                    local newAmount = math.min(currentAmount + maxAmount, fluidComponent:getCapacity())
                    fluidComponent:setAmount(newAmount)
                    self:noise(string.format("Refilled tank at %d,%d,%d to %d/%d",
                        isoObject:getX(), isoObject:getY(), isoObject:getZ(),
                        newAmount, fluidComponent:getCapacity()))
                end
            end
        end
    end
end

--- Handle water shutoff event
function DWAPWaterSystem:onWaterShutoff()
    self:noise("Water shutoff started")
    if self.waterShutOffHappened then
        self:noise("Water shutoff already happened, skipping")
        return
    end
    self.waterShutOffHappened = true
    -- Connect all fixtures to their tanks based on their stored connection data
    self:noise("Found " .. self:getLuaObjectCount() .. " Lua objects")
    for i = 1, self:getLuaObjectCount() do
        -- Use Lua object wrapper, not raw GlobalObject
        local luaObj = self:getLuaObjectByIndex(i)
        if not luaObj then
            self:noise(string.format("[onWaterShutoff] nil luaObj at index %d", i))
        elseif luaObj:isFixture() then
            local isoObject = luaObj:getIsoObject()
            -- Prefer luaObj.connection; fallback to modData if needed
            local conn = luaObj.connection
            if (not conn or not conn.x) and isoObject then
                local md = isoObject:getModData()
                conn = md and md.connection or conn
            end
            if isoObject and conn and conn.x then
                DWAPUtils.connectWaterTank(isoObject, { x = conn.x, y = conn.y, z = conn.z })
            end
        end
    end
end

function DWAPWaterSystem:newLuaObject(globalObject)
    self:noise("DWAPWaterSystem:newLuaObject")
    return DWAPWaterObject:new(self, globalObject)
end

-- function DWAPWaterSystem:OnObjectAboutToBeRemoved(isoObject)
--     self:noise("DWAPWaterSystem:OnObjectAboutToBeRemoved")
--     return
-- end

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
    if command == "plumbNewFixture" then
        self:handlePlumbNewFixture(playerObj, args)
    end
end

function DWAPWaterSystem:handlePlumbNewFixture(playerObj, args)
    local fixtureX, fixtureY, fixtureZ = args.fixtureX, args.fixtureY, args.fixtureZ
    local tankX, tankY, tankZ = args.tankX, args.tankY, args.tankZ

    self:noise("Plumbing new fixture at " .. fixtureX .. "," .. fixtureY .. "," .. fixtureZ .. 
              " to tank at " .. tankX .. "," .. tankY .. "," .. tankZ)

    local square = getCell():getGridSquare(fixtureX, fixtureY, fixtureZ)
    if not square then
        self:noise("No square found at fixture location")
        return
    end

    local isoObject = nil
    for i=1,square:getObjects():size() do
        local obj = square:getObjects():get(i-1)
        -- Look for objects that can be plumbed (sinks, toilets, etc.)
        if obj and obj:getSpriteName() == args.itemToPipe then
            isoObject = obj
            break
        end
    end

    if not isoObject then
        self:noise("No plumbable iso object found at fixture location")
        return
    end
    local objectData = {
        type = "fixture",
        sprite = args.itemToPipe,
        x = fixtureX, y = fixtureY, z = fixtureZ,
        source = { x = tankX, y = tankY, z = tankZ }
    }
    DWAPWaterObject.onNewFixtureObject(isoObject, objectData, self)
end

SGlobalObjectSystem.RegisterSystemClass(DWAPWaterSystem)
return DWAPWaterSystem