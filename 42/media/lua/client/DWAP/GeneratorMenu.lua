DWAP = DWAP or {}

local DWAPUtils = require("DWAPUtils")
local GeneratorWindow = require("DWAP/UI/GeneratorWindow")
local DWAPPowerSystem = require("DWAPPowerSystem_client")

--- is IndustrialRevolution or FunctionalAppliances mod active?
--- @return boolean
local function isGreenSiloActive()
    if getActivatedMods():contains("\\IndustrialRevolution") and SandboxVars.IndustrialRevolution.EnableSiloGenerators then
        return true
    end
    if getActivatedMods():contains("\\FunctionalAppliances") and SandboxVars.FunctionalAppliances.FAEnableSiloGenerators then
        return true
    end
    return false
end

--- Check if the item is a petrol container and has space for petrol
--- @param item InventoryItem
local function predicatePetrolNotFull(item)
    return item:getFluidContainer() and
        ((item:getFluidContainer():contains(Fluid.Petrol) and item:getFluidContainer():getFreeCapacity() > 0) or item:getFluidContainer():isEmpty())
end

--- Check if the item is a petrol container and has petrol in it
--- @param item InventoryItem
local function predicatePetrol(item)
    -- if true then return true end
    local fc = item:getFluidContainer()
    return fc and fc:contains(Fluid.Petrol) and (fc:getAmount() >= 0.5)
end

--- move player to the generator
local function walkToGen(objectCoords)
    local player = getPlayer()
    local square = getSquare(objectCoords.x, objectCoords.y, objectCoords.z)
    local frontSquare = getSquare(objectCoords.x, objectCoords.y + 1, objectCoords.z)
    ISTimedActionQueue.add(ISWalkToTimedAction:new(player, frontSquare))
    player:faceLocation(square:getX(), square:getY())
end

local stringCache = {
    removeFA = {}
}

local titleText = getText("IGUI_DWAP_GeneratorWindow_Title")
DWAP.worldObjectContextMenu_17 = function(_, context, worldObjects, test)
    for i = 1, #worldObjects do
        local object = worldObjects[i]
        if object and object:getModData().DWAPObjectType == "controlPanel" then
            if isGreenSiloActive() then
                -- Try to prevent conflicts with the silo generator mod
                -- https://steamcommunity.com/sharedfiles/filedetails/?id=3042138819
                -- https://steamcommunity.com/sharedfiles/filedetails/?id=3400131934
                for _, v in pairs(stringCache.removeFA) do
                    context:removeOptionByName(v)
                end
            end
            local genIndex = object:getModData().DWAPGeneratorIndex
            if not genIndex or type(genIndex) ~= "number" then
                DWAPUtils.dprint("No generator config found for index: " .. tostring(genIndex))
                return
            end
            local generator = DWAPPowerSystem.instance:getGeneratorInfo(genIndex)
            if not generator then
                return
            end

            local player = getPlayer()
            local skilled = player:getPerkLevel(Perks.Electricity) >= 3 or player:isRecipeActuallyKnown("Generator")
            local playerInventory = player:getInventory()

            context:addOptionOnTop(titleText, nil, function()
                GeneratorWindow.OnOpenPanel(player:getPlayerNum(), genIndex)
            end)
            if not generator.running then
                if generator.condition < 100 then
                    local opt = context:addOption(getText("ContextMenu_GeneratorFix"), nil, function()
                        walkToGen({ x = object:getX(), y = object:getY(), z = object:getZ() })
                        local scrapItem = playerInventory:getFirstTypeRecurse("ElectronicsScrap");
                        if scrapItem then
                            ISInventoryPaneContextMenu.transferIfNeeded(player, scrapItem);
                            ISTimedActionQueue.add(DWAPFixGenerator:new(player, object, generator, genIndex));
                        end
                    end)
                    if not skilled then
                        opt.notAvailable = true
                        local tooltip = ISWorldObjectContextMenu.addToolTip();
                        tooltip.description = getText("ContextMenu_GeneratorPlugTT");
                        opt.toolTip = tooltip;
                    end
                    if not playerInventory:containsTypeRecurse("ElectronicsScrap") then
                        local tooltip = ISWorldObjectContextMenu.addToolTip();
                        opt.notAvailable = true;
                        tooltip.description = getText("ContextMenu_GeneratorFixTT");
                        opt.toolTip = tooltip;
                    end
                    if player:tooDarkToRead() then
                        opt.notAvailable = true
                        local tooltip = ISInventoryPaneContextMenu.addToolTip();
                        tooltip.description = getText("ContextMenu_TooDarkToSee");
                        opt.toolTip = tooltip;
                    end
                end
            end
            local hose = playerInventory:getFirstTagRecurse(ItemTag.SIPHON_GAS)
            if hose then
                local possibleGasContainers = playerInventory:getAllEvalRecurse(predicatePetrolNotFull)
                if possibleGasContainers:size() > 0 then
                    ---@type ISContextMenu
                    local subContext = ISContextMenu:getNew(context)
                    local menuOption = context:addOption("Siphon Fuel")
                    context:addSubMenu(menuOption, subContext)
                    for j = 0, possibleGasContainers:size() - 1 do
                        ---@type InventoryItem
                        local item = possibleGasContainers:get(j)
                        -- DWAPUtils.dprint(item:getID())
                        subContext:addOption(("Siphon Gas into %s"):format(item:getName()), nil, function()
                            DWAPUtils.dprint(("Siphoning gas to %s"):format(item:getName()))
                            walkToGen({ x = object:getX(), y = object:getY(), z = object:getZ() })
                            ISInventoryPaneContextMenu.equipWeapon(item, false, false, player:getPlayerNum())
                            ISInventoryPaneContextMenu.equipWeapon(hose, true, false, player:getPlayerNum())
                            ISTimedActionQueue.add(DWAPSiphonFuel:new(player, object, item, generator, genIndex))
                        end)
                    end
                end
            end
            local gasContainers = playerInventory:getAllEvalRecurse(predicatePetrol)
            if gasContainers and gasContainers:size() > 0 then
                DWAPUtils.dprint("Gas containers found")
                ---@type ISContextMenu
                local subContext = ISContextMenu:getNew(context)
                local menuOption = context:addOption("Fuel Generator")
                context:addSubMenu(menuOption, subContext)
                for j = 0, gasContainers:size() - 1 do
                    ---@type InventoryItem
                    local item = gasContainers:get(j)
                    DWAPUtils.dprint(("adding item %s"):format(item:getName()))
                    subContext:addOption(("Add From %s"):format(item:getName()), nil, function()
                        DWAPUtils.dprint(("Emptying %s"):format(item:getName()))
                        walkToGen({ x = object:getX(), y = object:getY(), z = object:getZ() })
                        -- DWAPUtils.dprint(type(MRPAddFuel))
                        ISTimedActionQueue.add(ISEquipWeaponAction:new(player, item, 50, true, false))
                        ISTimedActionQueue.add(DWAPAddFuel:new(player, object, item, generator, genIndex))
                    end)
                end
            end
            return
        end
    end
end

DWAP.hideGeneratorMenuItems_17 = function(_, context, worldObjects, test)
    if test == true or not SandboxVars.DWAP.EnableGenSystem then return end
    for i = 1, #worldObjects do
        local object = worldObjects[i]
        if object and object:getModData().DWAPObjectType == "generator" then
            -- 42.20+: the vanilla options are nested in a submenu under a single "Generator" option
            context:removeOptionByName(getText("ContextMenu_Generator"))
            context:removeOptionByName(getText("ContextMenu_GeneratorInfo"))
            context:removeOptionByName(getText("ContextMenu_Turn_Off"))
            context:removeOptionByName(getText("ContextMenu_Turn_On"))
            context:removeOptionByName(getText("ContextMenu_GeneratorPlug"))
            context:removeOptionByName(getText("ContextMenu_GeneratorUnplug"))
            context:removeOptionByName(getText("ContextMenu_GeneratorAddFuel"))
            context:removeOptionByName(getText("ContextMenu_GeneratorFix"))
            -- Also remove any conflicting mod options if present
            if isGreenSiloActive() then
                for _, v in pairs(stringCache.removeFA) do
                    context:removeOptionByName(v)
                end
            end
            return
        end
    end
end

Events.OnInitGlobalModData.Add(function()
    if SandboxVars.FunctionalAppliances then
        stringCache.removeFA = {
            ["UI_FunctionalAppliances_turngeneratoron"] = getText("UI_FunctionalAppliances_turngeneratoron"),
            ["UI_FunctionalAppliances_turngeneratoroff"] = getText("UI_FunctionalAppliances_turngeneratoroff"),
            ["UI_FunctionalAppliances_status"] = getText("UI_FunctionalAppliances_status"),
            ["UI_FunctionalAppliances_autostartactivated"] = getText("UI_FunctionalAppliances_autostartactivated"),
            ["UI_FunctionalAppliances_autostartdeactivated"] = getText("UI_FunctionalAppliances_autostartdeactivated"),
            ["UI_FunctionalAppliances_deactivateautostart"] = getText("UI_FunctionalAppliances_deactivateautostart"),
            ["UI_FunctionalAppliances_activateautostart"] = getText("UI_FunctionalAppliances_activateautostart"),
            ["UI_FunctionalAppliances_addfuel"] = getText("UI_FunctionalAppliances_addfuel"),
            ["UI_FunctionalAppliances_addallfuel"] = getText("UI_FunctionalAppliances_addallfuel"),
            ["UI_FunctionalAppliances_takefuel"] = getText("UI_FunctionalAppliances_takefuel"),
            ["UI_FunctionalAppliances_fixgenerator"] = getText("UI_FunctionalAppliances_fixgenerator"),
            ["UI_FunctionalAppliances_takegeneratormagazine"] = getText("UI_FunctionalAppliances_takegeneratormagazine"),
        }
    end
    if SandboxVars.IndustrialRevolution then
        local removeIR = {
            ["UI_IndustrialRevolution_turngeneratoron"] = getText("UI_IndustrialRevolution_turngeneratoron"),
            ["UI_IndustrialRevolution_turngeneratoroff"] = getText("UI_IndustrialRevolution_turngeneratoroff"),
            ["UI_IndustrialRevolution_status"] = getText("UI_IndustrialRevolution_status"),
            ["UI_IndustrialRevolution_autostartactivated"] = getText("UI_IndustrialRevolution_autostartactivated"),
            ["UI_IndustrialRevolution_autostartdeactivated"] = getText("UI_IndustrialRevolution_autostartdeactivated"),
            ["UI_IndustrialRevolution_deactivateautostart"] = getText("UI_IndustrialRevolution_deactivateautostart"),
            ["UI_IndustrialRevolution_activateautostart"] = getText("UI_IndustrialRevolution_activateautostart"),
            ["UI_IndustrialRevolution_addfuel"] = getText("UI_IndustrialRevolution_addfuel"),
            ["UI_IndustrialRevolution_addfuel".. ":"] = getText("UI_IndustrialRevolution_addfuel").. ":",
            ["UI_IndustrialRevolution_addallfuel"] = getText("UI_IndustrialRevolution_addallfuel"),
            ["UI_IndustrialRevolution_takefuel"] = getText("UI_IndustrialRevolution_takefuel"),
            ["UI_IndustrialRevolution_fixgenerator"] = getText("UI_IndustrialRevolution_fixgenerator"),
            ["UI_IndustrialRevolution_takegeneratormagazine"] = getText("UI_IndustrialRevolution_takegeneratormagazine"),
        }
        stringCache.removeFA = stringCache.removeFA or {}
        for k, v in pairs(removeIR) do
            stringCache.removeFA[k] = v
        end
    end

    if SandboxVars.DWAP.EnableGenSystem then
        Events.OnFillWorldObjectContextMenu.Add(DWAP.hideGeneratorMenuItems_17)
        Events.OnFillWorldObjectContextMenu.Add(DWAP.worldObjectContextMenu_17)
    end
end)
