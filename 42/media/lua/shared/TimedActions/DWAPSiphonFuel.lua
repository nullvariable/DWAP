
require "TimedActions/ISBaseTimedAction"
local DWAPUtils = require("DWAPUtils")

DWAPSiphonFuel = ISBaseTimedAction:derive("DWAPSiphonFuel");
if isClient() then
    require "DWAP/DWAPPowerSystem_client"
else
    require "DWAP/DWAPPowerSystem_server"
end

function DWAPSiphonFuel:isValid()
    return self.character:isPrimaryHandItem(self.petrol) or self.character:isSecondaryHandItem(self.petrol)
end

function DWAPSiphonFuel:waitToStart()
    -- self.character:faceThisObject(self.generator)
    -- player:faceLocation(square:getX(), square:getY())
    self.character:faceThisObject(self.generator)
    return self.character:shouldBeTurning()
end

function DWAPSiphonFuel:update()
    self.character:faceThisObject(self.generator)

    self.character:setMetabolicTarget(Metabolics.HeavyDomestic);
end

function DWAPSiphonFuel:start()
    self:setActionAnim("refuelgascan")
    -- Don't call setOverrideHandModels() with self.petrol, the right-hand mask
    -- will bork the animation.
    self:setOverrideHandModels(self.petrol:getStaticModel(), nil)
	self.sound = self.character:playSound("CanisterAddFuelSiphon")
end

function DWAPSiphonFuel:stop()
    self.character:stopOrTriggerSound(self.sound)
    ISBaseTimedAction.stop(self);
end

function DWAPSiphonFuel:perform()
    self.character:stopOrTriggerSound(self.sound)

    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self);
end

function DWAPSiphonFuel:complete()
	self.fluidCont:addFluid(Fluid.Petrol, self.itemTarget - self.itemStart)
    DWAPUtils.dprint("DWAPSiphonFuel:complete " ..tostring(self.itemTarget).." "..tostring(self.tankStart).." "..tostring(self.tankTarget))
    if self.version == 1 then
        DWAP_Gen:RemoveFuel(self.genIndex, self.tankStart - self.tankTarget)
    else
        DWAPPowerSystem.instance:RemoveFuel(self.genIndex, self.tankStart - self.tankTarget)
    end

    self.petrol:syncItemFields()

    return true;
end

function DWAPSiphonFuel:getDuration()
    self.itemStart = self.fluidCont:getAmount();
    self.tankStart = self.generatorData.fuel;
    local add = self.fluidCont:getFreeCapacity();
    local take = math.min(add, self.tankStart);
    self.tankTarget = self.tankStart - take;
    self.itemTarget = self.itemStart + take;
    self.amountSent = math.ceil(self.tankStart);
    if self.character:isTimedActionInstant() then
        return 1;
    end
	return take * 50
end

function DWAPSiphonFuel:new(character, generator, petrolCan, generatorData, genIndex)
    -- print("DWAPSiphonFuel:new")
    local o = ISBaseTimedAction.new(self, character);
    o.petrol = petrolCan;
    o.fluidCont = o.petrol:getFluidContainer();
    o.generator = generator;
    o.generatorData = generatorData;
    o.genIndex = genIndex;
    o.maxTime = o:getDuration();

    o.version = DWAPUtils.getSaveVersion() < 17 and 1 or 2
    -- print(o.maxTime)
    -- print("DWAPSiphonFuel:new end")
    return o;
end