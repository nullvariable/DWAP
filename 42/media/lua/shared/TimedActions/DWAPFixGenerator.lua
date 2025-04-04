--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"
local DWAPUtils = require("DWAPUtils")

DWAPFixGenerator = ISBaseTimedAction:derive("DWAPFixGenerator");

function DWAPFixGenerator:isValid()
    return self.generator:getObjectIndex() ~= -1 and
        not self.generatorData.running and
        self.generatorData.condition < 100 and
        self.character:getInventory():containsTypeRecurse("ElectronicsScrap")
end

function DWAPFixGenerator:waitToStart()
    self.character:faceThisObject(self.generator)
    return self.character:shouldBeTurning()
end

function DWAPFixGenerator:update()
    self.character:faceThisObject(self.generator)

    self.character:setMetabolicTarget(Metabolics.UsingTools);
end

function DWAPFixGenerator:start()
    self:setActionAnim("Loot")
    self.character:SetVariable("LootPosition", "Low")
    self.character:reportEvent("EventLootItem")
    self.sound = self.character:playSound("GeneratorRepair")
end

function DWAPFixGenerator:stop()
    self.character:stopOrTriggerSound(self.sound)
    ISBaseTimedAction.stop(self);
end

function DWAPFixGenerator:continueFixing()
    local generator = DWAP_Gen:GetGenerator(self.genIndex)
    DWAPUtils.dprint(generator.condition)
    DWAPUtils.dprint(generator.condition < 100)
    if generator and generator.condition < 100 then
        local scrapItem = self.character:getInventory():getFirstTypeRecurse("ElectronicsScrap")
        if scrapItem then
            local previousAction = self
            if scrapItem:getContainer() ~= self.character:getInventory() then
                local action = ISInventoryTransferAction:new(self.character, scrapItem, scrapItem:getContainer(),
                    self.character:getInventory(), nil)
                ISTimedActionQueue.addAfter(self, action)
                previousAction = action
            end
            ISTimedActionQueue.addAfter(previousAction, DWAPFixGenerator:new(self.character, self.generator, self.generatorData, self.genIndex));
        end
    end
end

function DWAPFixGenerator:perform()
    self.character:stopOrTriggerSound(self.sound)

    if isClient() then
        self:continueFixing()
    end

    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self);
end

function DWAPFixGenerator:complete()
    local scrapItem = self.character:getInventory():getFirstTypeRecurse("ElectronicsScrap");

    if not scrapItem then return false; end;
    self.character:removeFromHands(scrapItem);
    self.character:getInventory():Remove(scrapItem);
    sendRemoveItemFromContainer(self.character:getInventory(), scrapItem);

    DWAP_Gen:RepairGen(self.genIndex, 4 +
    (1 * (self.character:getPerkLevel(Perks.Electricity)) / 2))
    addXp(self.character, Perks.Electricity, 5)

    if not isClient() and not isServer() then
        self:continueFixing()
    end

    return true
end

function DWAPFixGenerator:getDuration()
    if self.character:isTimedActionInstant() then
        return 1
    end
    return 150 - (self.character:getPerkLevel(Perks.Electricity) * 3)
end

--- @param character IsoGameCharacter
--- @param generatorObj IsoGenerator
--- @param generatorData table
--- @param genIndex number
function DWAPFixGenerator:new(character, generatorObj, generatorData, genIndex)
    local o = ISBaseTimedAction.new(self, character);
    o.generator = generatorObj;
    o.generatorData = generatorData;
    o.genIndex = genIndex;
    o.maxTime = o:getDuration()
    o.caloriesModifier = 4;
    return o;
end
