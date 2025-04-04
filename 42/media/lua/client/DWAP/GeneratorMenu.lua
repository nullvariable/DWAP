DWAP = DWAP or {}

local DWAPUtils = require("DWAPUtils")

local generatorControls = {}

--- is IndustrialRevolution or FunctionalAppliances mod active?
--- @return boolean
local function isGreenSiloActive()
    if SandboxVars.IndustrialRevolution and SandboxVars.IndustrialRevolution.EnableSiloGenerators then
        return true
    end
if SandboxVars.FunctionalAppliances and SandboxVars.FunctionalAppliances.FAEnableSiloGenerators then
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
    ["ContextMenu_GeneratorInfo"] = getText("ContextMenu_GeneratorInfo"),
    ["ContextMenu_Turn_Off"] = getText("ContextMenu_Turn_Off"),
    ["ContextMenu_Turn_On"] = getText("ContextMenu_Turn_On"),
    ["ContextMenu_GeneratorPlug"] = getText("ContextMenu_GeneratorPlug"),
    ["ContextMenu_GeneratorUnplug"] = getText("ContextMenu_GeneratorUnplug"),
    ["ContextMenu_GeneratorAddFuel"] = getText("ContextMenu_GeneratorAddFuel"),
    ["ContextMenu_GeneratorFix"] = getText("ContextMenu_GeneratorFix"),

    removeFA = {}
}
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
        stringCache.removeFA = {
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
    end
end)

Events.OnLoad.Add(function()
    generatorControls = DWAP_Gen:GetControlPoints()
end)

function TestLoad()
    generatorControls = DWAP_Gen:GetControlPoints()
end

--- Check if the object is a generator control
--- @param objectCoords table
--- @return number|boolean
local function getControl(objectCoords)
    --- @type number|boolean
    local control = false
    for i = 1, #generatorControls do
        local _control = generatorControls[i]
        if _control and _control.x == objectCoords.x and _control.y == objectCoords.y and _control.z == objectCoords.z then
            control = i
            break
        end
    end
    return control
end

--- Context menu for the bunker generator
---@param _ number
---@param context ISContextMenu
---@param worldobjects table
---@param test boolean
DWAP.worldObjectContextMenu = function(_, context, worldobjects, test)
    if test == true then return true end
    if not SandboxVars.DWAP.EnableGenSystem then return end
    if not worldobjects or #worldobjects <= 0 then return end

    local object = worldobjects[1]
    local objectCoords = { x = object:getX(), y = object:getY(), z = object:getZ() }
    
    local control = getControl(objectCoords)
    if control then
        -- context:removeOptionByName(stringCache["ContextMenu_GeneratorInfo"])
        -- context:removeOptionByName(stringCache["ContextMenu_Turn_Off"])
        -- context:removeOptionByName(stringCache["ContextMenu_Turn_On"])
        -- context:removeOptionByName(stringCache["ContextMenu_GeneratorPlug"])
        -- context:removeOptionByName(stringCache["ContextMenu_GeneratorUnplug"])
        -- context:removeOptionByName(stringCache["ContextMenu_GeneratorAddFuel"])
        -- context:removeOptionByName(stringCache["ContextMenu_GeneratorFix"])
        if isGreenSiloActive() then
            -- Try to prevent conflicts with the silo generator mod
            -- https://steamcommunity.com/sharedfiles/filedetails/?id=3042138819
            -- https://steamcommunity.com/sharedfiles/filedetails/?id=3400131934
            for _, v in pairs(stringCache.removeFA) do
                context:removeOptionByName(v)
            end
        end

        DWAPUtils.dprint("Generator context menu")
        local generator = DWAP_Gen:GetGenerator(control)
        if not generator then return end

        context:addOptionOnTop(("Fuel: %0.0f / %0.0f"):format(generator.fuel, generator.capacity))
        context:addOptionOnTop(("Condition: %0.0f"):format(generator.condition))

        local player = getPlayer()
        local skilled = player:getPerkLevel(Perks.Electricity) >= 3 or player:isRecipeActuallyKnown("Generator")
        local playerInventory = player:getInventory()

        if generator.running then
            context:addOption(getText("ContextMenu_Turn_Off"), nil, function()
                DWAP_Gen:TurnOffGen(control)
            end)
        else
            if generator.condition > 0 then
                context:addOption(getText("ContextMenu_Turn_On"), nil, function()
                    DWAP_Gen:TurnOnGen(control)
                end)
            end
            if generator.condition < 100 then
                local opt = context:addOption(getText("ContextMenu_GeneratorFix"), nil, function()
                    DWAPUtils.dprint("Fixing generator")
                    walkToGen(objectCoords)
                    local scrapItem = playerInventory:getFirstTypeRecurse("ElectronicsScrap");
                    if scrapItem then
                        ISInventoryPaneContextMenu.transferIfNeeded(player, scrapItem);
                        ISTimedActionQueue.add(DWAPFixGenerator:new(player, object, generator, control));
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
            end
        end

        local hose = playerInventory:getFirstTagRecurse("SiphonGas")
        if hose then
            local possibleGasContainers = playerInventory:getAllEvalRecurse(predicatePetrolNotFull)
            if possibleGasContainers:size() > 0 then
                ---@type ISContextMenu
                local subContext = ISContextMenu:getNew(context)
                local menuOption = context:addOption("Siphon Fuel")
                context:addSubMenu(menuOption, subContext)
                for i = 0, possibleGasContainers:size() - 1 do
                    ---@type InventoryItem
                    local item = possibleGasContainers:get(i)
                    DWAPUtils.dprint(item:getID())
                    subContext:addOption(("Siphon Gas into %s"):format(item:getName()), nil, function()
                        DWAPUtils.dprint(("Siphoning gas to %s"):format(item:getName()))
                        walkToGen(objectCoords)
                        ISInventoryPaneContextMenu.equipWeapon(item, false, false, player:getPlayerNum())
                        ISInventoryPaneContextMenu.equipWeapon(hose, true, false, player:getPlayerNum())
                        ISTimedActionQueue.add(DWAPSiphonFuel:new(player, object, item, generator, control))
                    end)
                end
            end
        end
        local gasContainers = playerInventory:getAllEvalRecurse(predicatePetrol)
        DWAPUtils.dprint(type(gasContainers))
        if gasContainers and gasContainers:size() > 0 then
            DWAPUtils.dprint("Gas containers found")
            ---@type ISContextMenu
            local subContext = ISContextMenu:getNew(context)
            local menuOption = context:addOption("Fuel Generator")
            context:addSubMenu(menuOption, subContext)
            for i = 0, gasContainers:size() - 1 do
                ---@type InventoryItem
                local item = gasContainers:get(i)
                DWAPUtils.dprint(("adding item %s"):format(item:getName()))
                subContext:addOption(("Add From %s"):format(item:getName()), nil, function()
                    DWAPUtils.dprint(("Emptying %s"):format(item:getName()))
                    walkToGen(objectCoords)
                    -- DWAPUtils.dprint(type(MRPAddFuel))
                    ISTimedActionQueue.add(ISEquipWeaponAction:new(player, item, 50, true, false))
                    ISTimedActionQueue.add(DWAPAddFuel:new(player, object, item, generator, control))
                end)
            end
        end
    end
end
-- Events.OnPreFillWorldObjectContextMenu.Add(DWAP.worldObjectContextMenu)
Events.OnFillWorldObjectContextMenu.Add(DWAP.worldObjectContextMenu)

--- Hide the generator menu items
--- @deprecated we don't create generator items any more so this should be unneeded
--- @param _ any
--- @param context ISContextMenu
--- @param worldobjects table
--- @param test boolean
DWAP.hideGeneratorMenuItems = function(_, context, worldobjects, test)
    if test == true then return true end
    if not SandboxVars.DWAP.EnableGenSystem then return end
    if not worldobjects or #worldobjects <= 0 then return end

    local object = worldobjects[1]
    local objectCoords = { x = object:getX(), y = object:getY(), z = object:getZ() }

    local control = getControl(objectCoords)
    if control then
        DWAPUtils.dprint("Generator context menu")
        -- local square = object:getSquare()
        -- for i = 0, square:getObjects():size() - 1 do
        --     object = square:getObjects():get(i)
        --     objectCoords = { x = object:getX(), y = object:getY(), z = object:getZ() }
        --     if object:getObjectName() == "IsoGenerator" then
                context:removeOptionByName(getText("ContextMenu_GeneratorInfo"))
                context:removeOptionByName(getText("ContextMenu_Turn_Off"))
                context:removeOptionByName(getText("ContextMenu_Turn_On"))
                context:removeOptionByName(getText("ContextMenu_GeneratorPlug"))
                context:removeOptionByName(getText("ContextMenu_GeneratorUnplug"))
                context:removeOptionByName(getText("ContextMenu_GeneratorAddFuel"))
                context:removeOptionByName(getText("ContextMenu_GeneratorFix"))
        --     end
        -- end
    end
end
-- Events.OnFillWorldObjectContextMenu.Add(DWAP.hideGeneratorMenuItems)
-- Events.OnPreFillWorldObjectContextMenu.Add(DWAP.hideGeneratorMenuItems)
