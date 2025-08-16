
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
    local endFuel = 0;
    while self.fluidCont and self.fluidCont:getAmount() >= 1.0 and self.generatorData.fuel + endFuel < self.generatorData.capacity do
        local amount = self.fluidCont:getAmount() - 1.0;
        self.fluidCont:adjustAmount(amount);
        endFuel = endFuel + 1;
    end

    self.petrol:syncItemFields()
    if self.version == 1 then
        DWAP_Gen:AddFuel(self.genIndex, endFuel)
    else
        DWAPPowerSystem.instance:AddFuel(self.genIndex, endFuel)
    end

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

    o.version = DWAPUtils.getSaveVersion() < 17 and 1 or 2
    return o;
end