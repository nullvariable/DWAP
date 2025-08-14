if isClient() then return end

require "Map/SGlobalObject"
local DWAPUtils = require("DWAPUtils")

---@class DWAPPowerObject : SGlobalObject
---@field luaSystem DWAPPowerSystem
local DWAPPowerObject = SGlobalObject:derive("DWAPPowerObject")

function DWAPPowerObject:new(luaSystem, globalObject)
    return SGlobalObject.new(self, luaSystem, globalObject)
end

function DWAPPowerObject:initNew()
    self.DWAPObjectType = "generator" -- "generator" or "fixture"
    self.DWAPGeneratorIndex = -1 -- Index in the generator list
    self.DWAPEmitter = nil -- Emitter for this object, if applicable
end

function DWAPPowerObject.convertToIsoGenerator(isoObject)
    if not isoObject then
        DWAPPowerSystem.instance:noise("convertToIsoGenerator called with nil isoObject")
        return nil
    end

    if instanceof(isoObject, "IsoGenerator") then
        -- Already a generator, no conversion needed
        DWAPPowerSystem.instance:noise("DWAPPowerObject: Object is already an IsoGenerator")
        isoObject:setCondition(100)
        isoObject:setFuel(100)
        isoObject:setConnected(true)
        return isoObject
    end

    local square = isoObject:getSquare()
    local index = isoObject:getObjectIndex()
    if not square or not index then
        DWAPPowerSystem.instance:noise("DWAPPowerObject: Cannot convert - no square or index found")
        return isoObject
    end

    local removeSuccess = pcall(function()
        square:transmitRemoveItemFromSquare(isoObject)
        square:RemoveTileObject(isoObject)
    end)
    if not removeSuccess then
        -- the sprite is invisible anyway, so doesn't break anything, just a hygiene thing.
        DWAPPowerSystem.instance:noise("DWAPPowerObject: Warning - failed to remove original object")
    end

    local cell = getCell()
    local generator = nil
    local createSuccess = pcall(function()
        generator = IsoGenerator.new(cell)
        generator:setSprite(isoObject:getSprite())
        generator:setSquare(square)
    end)

    if not createSuccess or not generator then
        DWAPPowerSystem.instance:noise("DWAPPowerObject: Failed to create IsoGenerator with IsoGenerator.new")
        return nil
    end

    generator:setCondition(100)
    generator:setFuel(100)
    generator:setConnected(true)
    square:AddSpecialObject(generator, index)
    -- Transmit to clients (following base game pattern)
    generator:transmitCompleteItemToClients()
    cell:addToProcessIsoObjectRemove(generator)

    DWAPPowerSystem.instance:noise("DWAPPowerObject: Successfully converted to IsoGenerator at " .. square:getX() .. "," .. square:getY() .. "," .. square:getZ())
    return generator

end

function DWAPPowerObject:shouldBeRunning()
    if self.DWAPObjectType == "generator" then
        local generator = self.luaSystem.generators[self.DWAPGeneratorIndex]
        if generator then
            return generator.running and generator.fuel > 0 and generator.condition > 0
        end
    end
    return false
end

function DWAPPowerObject:setActivated(activated)
    local isoObject = self:getIsoObject()
    if not isoObject then
        DWAPPowerSystem.instance:noise("DWAPPowerObject:setActivated called with nil isoObject")
        return
    end
    isoObject:setCondition(100)
    isoObject:setFuel(100)
    isoObject:setConnected(true)
    isoObject:setActivated(activated)
    DWAPUtils.Defer(function()
        if isoObject then
            isoObject:setSurroundingElectricity()
        end
    end)
    DWAPUtils.DeferMinute(function()
        if isoObject then
            isoObject:setSurroundingElectricity()
        end
    end)
    getCell():addToProcessIsoObjectRemove(isoObject)
end

function DWAPPowerObject:shouldMakeNoise()
    if self.DWAPObjectType == "controlPanel" then
        local generator = self.luaSystem.generators[self.DWAPGeneratorIndex]
        if generator then
            return generator.running and not generator.solarmode
        end
    end
    return false
end

function DWAPPowerObject:transitionNoise(starting)
    local isoObject = self:getIsoObject()
    if not isoObject then
        DWAPPowerSystem.instance:noise("DWAPPowerObject:transitionNoise called with nil isoObject")
        return
    end

    local square = isoObject:getSquare()
    if not square then
        DWAPPowerSystem.instance:noise("DWAPPowerObject:transitionNoise called with nil square")
        return
    end

    if starting then
        square:playSound("GeneratorStarting")
    else
        square:playSound("GeneratorStopping")
    end
end


function DWAPPowerObject:makeNoise(makeNoise)
    local isoObject = self:getIsoObject()
    if not isoObject then
        DWAPPowerSystem.instance:noise("DWAPPowerObject:makeNoise called with nil isoObject")
        return
    end
    local x, y, z = isoObject:getX(), isoObject:getY(), isoObject:getZ()
    if makeNoise then
        if not self.emitter then
            self.emitter = getWorld():getFreeEmitter(x, y, z)
            self.emitter:setVolumeAll(self.luaSystem:getSoundVolume(self.DWAPGeneratorIndex))
            self.emitter:playSound("GeneratorLoop")
        else
            local success, result = pcall(function()
                ---@diagnostic disable-next-line: need-check-nil
                return self.emitter:isPlaying("GeneratorLoop")
            end)
            if not success then
                DWAPPowerSystem.instance:noise("DWAPPowerObject:makeNoise - pcall failed: " .. tostring(result))
            elseif not result then
                self.emitter:setVolumeAll(self.luaSystem:getSoundVolume(self.DWAPGeneratorIndex))
                self.emitter:playSound("GeneratorLoop")
            end
        end
    else
        if self.emitter then
            self.emitter:stopAll()
            self.emitter = nil
        end
    end
end

---called from loadIsoObject function when making new globalObject & luaObject
function DWAPPowerObject:stateFromIsoObject(isoObject)
    self:noise("DWAPPowerObject:stateFromIsoObject called")
    if not isoObject then return end
    self:initNew()

    self:fromModData(isoObject:getModData())
    if self.DWAPObjectType == "generator" then
        self:noise("DWAPPowerObject:stateFromIsoObject - setting up generator state")
        self:setActivated(self:shouldBeRunning())
    elseif self.DWAPObjectType == "controlPanel" then
        self:noise("DWAPPowerObject:stateFromIsoObject - configuring control panel")
        self:makeNoise(self:shouldMakeNoise())
    end
end

function DWAPPowerObject:stateToIsoObject(isoObject)
    -- Sync lua object state to iso object
    self:toModData(isoObject:getModData())
    self:noise("DWAPPowerObject:stateToIsoObject called")

    if self.DWAPObjectType == "generator" then
        self:noise("DWAPPowerObject:stateToIsoObject - setting generator state")
        self:setActivated(self:shouldBeRunning())
    elseif self.DWAPObjectType == "controlPanel" then
        self:noise("DWAPPowerObject:stateToIsoObject - configuring control panel")
        self:makeNoise(self:shouldMakeNoise())
    end

    if isServer() then
        isoObject:transmitModData()
    end
end

function DWAPPowerObject:fromModData(modData)
    self.DWAPObjectType = modData.DWAPObjectType or modData["objectType"] or "generator"
    self.DWAPGeneratorIndex = modData.DWAPGeneratorIndex or modData["DWAPGeneratorIndex"] or -1
end

function DWAPPowerObject:toModData(modData)
    modData.DWAPObjectType = self.DWAPObjectType
    modData.DWAPGeneratorIndex = self.DWAPGeneratorIndex
end

function DWAPPowerObject:saveData(transmit)
    local isoObject = self:getIsoObject()
    if not isoObject then return end
    self:toModData(isoObject:getModData())
    if transmit and isServer() then
        isoObject:transmitModData()
    end
end

return DWAPPowerObject
