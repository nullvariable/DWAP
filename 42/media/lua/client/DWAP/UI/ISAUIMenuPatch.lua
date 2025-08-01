local DWAPUtils = require("DWAPUtils")

--- Hide ISA menu items for DWAP powerbanks, keeping only the status option
--- @param player any
--- @param context ISContextMenu
--- @param worldobjects table
--- @param test boolean
local function hideDWAPPowerbankMenuItems(player, context, worldobjects, test)
    if not worldobjects or #worldobjects <= 0 then return end
    print('hideDWAPPowerbankMenuItems')

    local dwapPowerbank = nil
    local x, y, z
    for i = 1, #worldobjects do
        local obj = worldobjects[i]
        if obj then
            x, y, z = obj:getX(), obj:getY(), obj:getZ()
            break
        end
    end
    
    -- Check if this location matches any DWAP powerbank
    if DWAP_Gen2 and DWAP_Gen2.generators then
        for index, generator in pairs(DWAP_Gen2.generators) do
            if generator and generator.solar and generator.solar.powerbank then
                local powerbank = generator.solar.powerbank
                if x == powerbank.x and y == powerbank.y and z == powerbank.z then
                    dwapPowerbank = powerbank
                    DWAPUtils.dprint("DWAP_ISA: Found DWAP powerbank (generator " .. index .. ") at " .. x .. "," .. y .. "," .. z)
                    break
                end
            end
        end
    end

    if dwapPowerbank then
        DWAPUtils.dprint("DWAP_ISA: Found DWAP powerbank, removing ISA context menu items")

        -- Find the ISA BatteryBank submenu option
        local batteryBankOptionText = getText("ContextMenu_ISA_BatteryBank")
        local batteryBankOption = nil
        
        for i, option in ipairs(context.options) do
            if option.name == batteryBankOptionText and option.subOption then
                batteryBankOption = option
                DWAPUtils.dprint("DWAP_ISA: Found ISA BatteryBank menu option")
                break
            end
        end
        
        if batteryBankOption then
            -- Get the submenu and remove the turn on/off options
            local subMenu = context:getSubMenu(batteryBankOption.subOption)
            if subMenu then
                DWAPUtils.dprint("DWAP_ISA: Found ISA submenu with " .. #subMenu.options .. " options")
                
                -- Remove turn on/off options
                local turnOffText = getText("ContextMenu_Turn_Off")
                local turnOnText = getText("ContextMenu_Turn_On")
                
                local removed = 0
                for i = #subMenu.options, 1, -1 do
                    local option = subMenu.options[i]
                    if option.name == turnOffText or option.name == turnOnText then
                        DWAPUtils.dprint("DWAP_ISA: Removing option: " .. option.name)
                        table.remove(subMenu.options, i)
                        removed = removed + 1
                        -- Update option IDs
                        for j = i, #subMenu.options do
                            subMenu.options[j].id = j
                        end
                    end
                end
                
                subMenu.numOptions = #subMenu.options + 1 -- +1 because numOptions seems to be 1-based
                subMenu:calcHeight()
                
                DWAPUtils.dprint("DWAP_ISA: Removed " .. removed .. " options from ISA submenu")
            else
                DWAPUtils.dprint("DWAP_ISA: Could not find ISA submenu")
            end
        else
            DWAPUtils.dprint("DWAP_ISA: Could not find ISA BatteryBank option")
        end
    end
end

if (getActivatedMods():contains("ISA") and SandboxVars.DWAP.EnableGenSystemSolar) then
    Events.OnFillWorldObjectContextMenu.Add(hideDWAPPowerbankMenuItems)
end
