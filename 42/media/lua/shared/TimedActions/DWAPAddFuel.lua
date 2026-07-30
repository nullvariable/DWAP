
require "TimedActions/ISBaseTimedAction"

DWAPAddFuel = ISBaseTimedAction:derive("DWAPAddFuel");
local DWAPUtils = require("DWAPUtils")
if isClient() then
    require "DWAP/DWAPPowerSystem_client"
else
    require "DWAP/DWAPPowerSystem_server"
end

function DWAPAddFuel:isValid()
    if self.generatorData.fuel >= self.generatorData.capacity then
        ISBaseTimedAction.stop(self)
    end
    return self.character:isPrimaryHandItem(self.petrol) or self.character:isSecondaryHandItem(self.petrol)
end

function DWAPAddFuel:waitToStart()
    -- self.character:faceThisObject(self.generator)
    -- player:faceLocation(square:getX(), square:getY())
    self.character:faceThisObject(self.generator)
    return self.character:shouldBeTurning()
end

function DWAPAddFuel:update()
    self.character:faceThisObject(self.generator)

    self.character:setMetabolicTarget(Metabolics.HeavyDomestic);
end

function DWAPAddFuel:start()
    self:setActionAnim("refuelgascan")
    -- Don't call setOverrideHandModels() with self.petrol, the right-hand mask
    -- will bork the animation.
    self:setOverrideHandModels(self.petrol:getStaticModel(), nil)
    self.sound = self.character:playSound("GeneratorAddFuel")
end

function DWAPAddFuel:stop()
    self.character:stopOrTriggerSound(self.sound)
    ISBaseTimedAction.stop(self);
end

function DWAPAddFuel:perform()
    self.character:stopOrTriggerSound(self.sound)

    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self);
end

function DWAPAddFuel:complete()
    -- matches vanilla ISAddFuel:complete (42.20): fill by exact amount instead of whole liters
    local endFuel = math.min(self.fluidCont:getAmount(), self.generatorData.capacity - self.generatorData.fuel)
    self.fluidCont:adjustAmount(self.fluidCont:getAmount() - endFuel)

    self.petrol:syncItemFields()
    DWAPPowerSystem.instance:AddFuel(self.genIndex, endFuel)

    return true;
end

function DWAPAddFuel:getDuration()
    if self.character:isTimedActionInstant() then
        return 1;
    end
    return 70 + (self.fluidCont:getAmount() * 50)
end

function DWAPAddFuel:new(character, generator, petrolCan, generatorData, genIndex)
    -- print("DWAPAddFuel:new")
    local o = ISBaseTimedAction.new(self, character);
    o.petrol = petrolCan;
    o.fluidCont = o.petrol:getFluidContainer();
    o.generator = generator;
    o.generatorData = generatorData;
    o.genIndex = genIndex;
    o.maxTime = o:getDuration();
    return o;
end