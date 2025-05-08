--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************
--- @see ISPlumbItem media\lua\shared\TimedActions\ISPlumbItem.lua
require "TimedActions/ISBaseTimedAction"

DWAPPlumbToWaterTank = ISBaseTimedAction:derive("DWAPPlumbToWaterTank");

function DWAPPlumbToWaterTank:isValid()
    return self.character:isEquipped(self.wrench);
    --	return true;
end

function DWAPPlumbToWaterTank:update()
    self.character:faceThisObject(self.itemToPipe)

    self.character:setMetabolicTarget(Metabolics.MediumWork);
end

function DWAPPlumbToWaterTank:start()
    self.sound = self.character:playSound("RepairWithWrench")
end

function DWAPPlumbToWaterTank:stop()
    self.character:stopOrTriggerSound(self.sound)
    ISBaseTimedAction.stop(self);
end

function DWAPPlumbToWaterTank:perform()
    self.character:stopOrTriggerSound(self.sound)

    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self);
end

function DWAPPlumbToWaterTank:complete()
    if self.itemToPipe then
        self.itemToPipe:getModData().canBeWaterPiped = false
        self.itemToPipe:setUsesExternalWaterSource(true)
        self.itemToPipe:transmitModData()
        self.itemToPipe:sendObjectChange('usesExternalWaterSource', { value = true })
        buildUtil.setHaveConstruction(self.itemToPipe:getSquare(), true);
        local newFixture = {
            sprite = self.itemToPipe:getSpriteName(),
            x = self.itemToPipe:getX(),
            y = self.itemToPipe:getY(),
            z = self.itemToPipe:getZ(),
            sourceType = "tank",
            source = {x = self.waterTank.x, y = self.waterTank.y, z = self.waterTank.z},
        }
        DWAP_WaterSystem:addFixture(newFixture, true)
        DWAP_WaterSystem:InitializeFixture(newFixture)
    else
        print('sq is null or index is invalid')
    end

    return true;
end

function DWAPPlumbToWaterTank:getDuration()
    if self.character:isTimedActionInstant() then
        return 1;
    end
    return 100
end

--- @param character IsoGameCharacter
--- @param itemToPipe IsoObject
--- @param wrench InventoryItem
--- @param waterTank WaterTank
function DWAPPlumbToWaterTank:new(character, itemToPipe, wrench, waterTank)
    local o = ISBaseTimedAction.new(self, character)
    o.character = character;
    o.itemToPipe = itemToPipe;
    o.wrench = wrench;
    o.waterTank = waterTank;
    o.maxTime = o:getDuration();
    return o;
end
