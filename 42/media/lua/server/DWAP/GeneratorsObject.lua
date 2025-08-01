-- DWAP Individual Generator Object for SGlobalObjectSystem
-- Represents a single generator with its associated fake generators and power data

if isClient() then return end

-- Only load for save version 17 and above
local DWAPUtils = require "DWAPUtils"
if DWAPUtils.getSaveVersion() < 17 then return end

require "Map/SGlobalObject"

---@class DWAPGeneratorObject : SGlobalObject
---@field luaSystem table Reference to the parent system
DWAPGeneratorObject = SGlobalObject:derive("DWAPGeneratorObject")

function DWAPGeneratorObject:new(luaSystem, globalObject)
    return SGlobalObject.new(self, luaSystem, globalObject)
end

function DWAPGeneratorObject:initNew()
    -- Core generator properties
    self.fuelCapacity = 100
    self.fuel = 100
    self.condition = 100
    self.running = false

    -- Fake generators configuration
    self.fakeGenerators = {}

    -- Power tracking
    self.objectsPowered = {}
    self.chunkCoverage = {}

    -- Sound and visual state
    self.soundPlaying = false
    self.lastSoundUpdate = 0

    -- Statistics
    self.hourlyFuelConsumption = 1.0
    self.lastHourlyTick = math.floor(getGameTime():getWorldAgeHours())
end

---Called from loadIsoObject function when making new globalObject & luaObject
---This is called for IsoObjects that did not have a Lua object when loaded
function DWAPGeneratorObject:stateFromIsoObject(isoObject)
    self:initNew()

    -- For now, just initialize with default values
    -- In the future, we can add specific logic to sync with IsoGenerator if needed

    -- Initialize fake generators and power tracking
    self:calculateChunkCoverage()

    -- Mark for network sync
    self:saveData(true)
end

---Called from loadIsoObject function when luaObject exists
function DWAPGeneratorObject:stateToIsoObject(isoObject)
    self:toModData(isoObject:getModData())
    isoObject:transmitModData()

    -- Catch up on any missed time while the generator was not loaded
    self:catchUpFuelAndCondition()

    -- For now, we just handle ModData sync
    -- In the future, we can add specific logic to apply state to IsoGenerator if needed
end

function DWAPGeneratorObject:fromModData(modData)
    for i, key in ipairs(self.luaSystem.savedObjectModData) do
        self[key] = modData[key]
    end
end

function DWAPGeneratorObject:toModData(modData)
    for i, key in ipairs(self.luaSystem.savedObjectModData) do
        modData[key] = self[key]
    end
end

function DWAPGeneratorObject:saveData(transmit)
    local isoObject = self:getIsoObject()
    if not isoObject then return end
    self:toModData(isoObject:getModData())
    if transmit then
        isoObject:transmitModData()
    end
end

--- Called when this object is about to be removed from the system
function DWAPGeneratorObject:aboutToRemoveFromSystem()
    -- Cleanup any resources, sound effects, etc.
    if self.soundPlaying then
        self:stopSound()
    end

    -- Clear power connections
    self.objectsPowered = {}
    self.chunkCoverage = {}
end

--- Handle IsoObject changes (e.g., generator runs out of fuel)
--- @param isoObject IsoObject
function DWAPGeneratorObject:OnIsoObjectChangedItself(isoObject)
    if not isoObject then return end

    -- For now, just handle generic IsoObject changes
    -- In the future, we can add specific logic for IsoGenerator sync if needed
    self:saveData(true)
end

--- Handle ModData changes
--- @param isoObject IsoObject
function DWAPGeneratorObject:OnModDataChangeItself(isoObject)
    if not isoObject then return end

    -- Sync any ModData changes
    if instanceof(isoObject, "IsoGenerator") then
        self:fromModData(isoObject:getModData())
    end
end

--- Set up fake generators for coverage area
--- @param fakeGenConfig table Configuration for fake generators
function DWAPGeneratorObject:setupFakeGenerators(fakeGenConfig)
    self.fakeGenerators = fakeGenConfig or {}

    -- Calculate chunk coverage based on fake generators
    self:calculateChunkCoverage()

    self:saveData(true)
end

--- Calculate which chunks this generator covers
function DWAPGeneratorObject:calculateChunkCoverage()
    local coverage = {}

    for _, fakeGen in ipairs(self.fakeGenerators) do
        -- Calculate chunk coordinates for this fake generator's range
        local range = fakeGen.range or 10
        local minX = math.floor((fakeGen.x - range) / 10)
        local maxX = math.floor((fakeGen.x + range) / 10)
        local minY = math.floor((fakeGen.y - range) / 10)
        local maxY = math.floor((fakeGen.y + range) / 10)

        for wx = minX, maxX do
            for wy = minY, maxY do
                local hash = DWAPUtils.hashCoords(wx, wy, 0)
                coverage[hash] = { wx = wx, wy = wy }
            end
        end
    end

    self.chunkCoverage = coverage
end

--- Get current power consumption
--- @return number Total power being consumed
function DWAPGeneratorObject:getPowerConsumption()
    local totalPower = 0

    for _, objectData in pairs(self.objectsPowered) do
        totalPower = totalPower + (objectData.drain or 0)
    end

    return totalPower
end

--- Add a powered object to tracking
--- @param x number
--- @param y number
--- @param z number
--- @param drain number Power drain amount
--- @param items table List of powered items
function DWAPGeneratorObject:addPoweredObject(x, y, z, drain, items)
    local hash = DWAPUtils.hashCoords(x, y, z)
    self.objectsPowered[hash] = {
        x = x,
        y = y,
        z = z,
        drain = drain,
        items = items or {},
        lastUpdate = getTimestamp()
    }

    self:saveData(true)
end

--- Remove a powered object from tracking
--- @param x number
--- @param y number
--- @param z number
function DWAPGeneratorObject:removePoweredObject(x, y, z)
    local hash = DWAPUtils.hashCoords(x, y, z)
    self.objectsPowered[hash] = nil

    self:saveData(true)
end

--- Start generator sound
function DWAPGeneratorObject:startSound()
    -- Sound implementation here
    self.soundPlaying = true
    self:saveData(true)
end

--- Stop generator sound
function DWAPGeneratorObject:stopSound()
    -- Sound cleanup here
    self.soundPlaying = false
    self:saveData(true)
end

--- Perform hourly maintenance (fuel consumption, condition degradation)
function DWAPGeneratorObject:hourlyTick()
    if not self.running then return end

    -- Consume fuel based on power usage
    local powerUsage = self:getPowerConsumption()
    local fuelConsumption = math.max(0.1, powerUsage * 0.01) -- Base consumption + power-based

    self.fuel = math.max(0, self.fuel - fuelConsumption)

    -- Degrade condition slightly
    local conditionLoss = 0.1 + (powerUsage * 0.001)
    self.condition = math.max(0, self.condition - conditionLoss)

    -- Stop if out of fuel or broken
    if self.fuel <= 0 or self.condition <= 0 then
        self.running = false
        self:stopSound()
    end

    self.lastHourlyTick = math.floor(getGameTime():getWorldAgeHours())
    self:saveData(true)
end

--- Catch up on missed hours when generator was not loaded
--- Similar to base game IsoGenerator catch-up logic
function DWAPGeneratorObject:catchUpFuelAndCondition()
    if not self.running then return end
    
    local currentHour = math.floor(getGameTime():getWorldAgeHours())
    local lastHour = self.lastHourlyTick or currentHour
    
    -- If lastHourlyTick is stored as timestamp, convert it to world hours
    -- This assumes lastHourlyTick was stored as world age hours, adjust if using different time system
    if self.lastHourlyTick == 0 then
        self.lastHourlyTick = currentHour
        return
    end
    
    local hoursPassed = currentHour - lastHour
    if hoursPassed <= 0 then return end
    
    -- Limit catch-up to prevent excessive calculations (similar to base game approach)
    hoursPassed = math.min(hoursPassed, 168) -- Max 1 week catch-up
    
    local powerUsage = self:getPowerConsumption()
    local totalFuelConsumed = 0
    local totalConditionLoss = 0
    
    -- Process each missed hour
    for hour = 1, hoursPassed do
        local fuelConsumption = math.max(0.1, powerUsage * 0.01)
        local conditionLoss = 0.1 + (powerUsage * 0.001)
        
        totalFuelConsumed = totalFuelConsumed + fuelConsumption
        totalConditionLoss = totalConditionLoss + conditionLoss
        
        -- Stop processing if we would run out of fuel or condition
        if self.fuel - totalFuelConsumed <= 0 or self.condition - totalConditionLoss <= 0 then
            break
        end
    end
    
    -- Apply the accumulated changes
    self.fuel = math.max(0, self.fuel - totalFuelConsumed)
    self.condition = math.max(0, self.condition - totalConditionLoss)
    
    -- Stop if out of fuel or broken
    if self.fuel <= 0 or self.condition <= 0 then
        self.running = false
        self:stopSound()
    end
    
    self.lastHourlyTick = currentHour
    self:saveData(true)
end

--- Turn generator on
function DWAPGeneratorObject:turnOn()
    if self.fuel > 0 and self.condition > 0 then
        self.running = true
        self:startSound()
        self:saveData(true)
    end
end

--- Turn generator off
function DWAPGeneratorObject:turnOff()
    self.running = false
    self:stopSound()
    self:saveData(true)
end

--- Add fuel to generator
--- @param amount number Amount of fuel to add
function DWAPGeneratorObject:addFuel(amount)
    self.fuel = math.min(self.fuelCapacity, self.fuel + amount)
    self:saveData(true)
end

--- Repair generator
--- @param amount number Amount to repair (condition points)
function DWAPGeneratorObject:repair(amount)
    self.condition = math.min(100, self.condition + amount)
    self:saveData(true)
end

--- Get generator status for UI
--- @return table Status information
function DWAPGeneratorObject:getStatus()
    local count = 0
    for _ in pairs(self.objectsPowered) do
        count = count + 1
    end

    return {
        fuel = self.fuel,
        fuelCapacity = self.fuelCapacity,
        condition = self.condition,
        running = self.running,
        powerUsage = self:getPowerConsumption(),
        poweredObjectCount = count
    }
end

--- Update generator state (called regularly by the system)
function DWAPGeneratorObject:update()
    self:catchUpFuelAndCondition()
end

return DWAPGeneratorObject
