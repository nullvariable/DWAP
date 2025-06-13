local DWAPUtils = require("DWAPUtils")

-- Events.OnNewGame.Add(function()
--     local configs = DWAPUtils.loadConfigs()
--     local configIndex = SandboxVars.DWAP.EnableAllLocations and DWAPUtils.selectedSafehouse or 1
--     local config = configs[configIndex]
--     if SandboxVars.DWAP.SpawnInBase then
--         local coords = {}
--         if config and config.spawn then
--             coords = config.spawn
--         end
--         table.wipe(configs)
--         if coords then
--             local player = getPlayer()
--             player:teleportTo(coords.x, coords.y, coords.z)
--             if SandboxVars.DWAP.EnableGenSystem then
--                 DWAPUtils.Defer(function()
--                     DWAPSquareLoaded:AddEvent(
--                         DWAPUtils.lightsOn,
--                         coords.x, coords.y, coords.z,
--                         true
--                     )
--                 end)
--             end
--             DWAPUtils.dprint(("Teleported player to %s %s %s"):format(coords.x, coords.y, coords.z))
--         else
--             error("No spawn coords found")
--         end
--     end

-- end)

-- Events.OnInitWorld.Add(function()
Events.OnInitGlobalModData.Add(function()
    if SandboxVars.DWAP.SpawnInBase then
        local configs = DWAPUtils.loadConfigs()
        local configIndex = 1
        if SandboxVars.DWAP.EnableAllLocations then
            configIndex = DWAPUtils.getSafehouseIndex()
        end
        local config = configs[configIndex]
        local coords = {}
        if config and config.spawn then
            coords = config.spawn
        end
        table.wipe(configs)
        if coords then
            DWAPUtils.dprint(coords)
            local name = ("#%s | %s %s %s"):format(DWAPUtils.selectedSafehouse, coords.x, coords.y, coords.z)
            DWAPUtils.dprint("Overriding spawn to ".. name)
            getWorld():setLuaPosX(coords.x);
            getWorld():setLuaPosY(coords.y);
            getWorld():setLuaPosZ(coords.z);
            if SandboxVars.DWAP.EnableGenSystem then
                DWAPSquareLoaded:AddEvent(
                    DWAPUtils.lightsOn,
                    coords.x, coords.y, coords.z,
                    true
                )
            end
        end
    end
end)

local optionalSpawnFunctions = {
    DWAP_31_beforeTeleport = function(config)
        DWAPUtils.dprint("Running before teleport function for optional spawn")
        local player = getPlayer()
        -- clear inventory
        local inventory = player:getInventory()
        if inventory then
        -- save any keys, but clear the rest
            local iitems = inventory:getItems()
            for i = inventory:getItems():size() - 1, 0, -1 do
                local item = iitems:get(i)
                DWAPUtils.dprint(("Checking item: '%s' (%s) (%s) (%s)"):format(item:getName(), tostring(item:getLootType()), tostring(item:isVisualAid()), tostring(item:IsMap())))
                if item:getLootType() ~= "Key" and not item:isVisualAid() and not item:IsMap() then
                    DWAPUtils.dprint("Removing item from inventory: " .. item:getName())
                    if player:isEquippedClothing(item) then
                        player:removeWornItem(item, false)
                    end
                    inventory:Remove(item)
                    sendRemoveItemFromContainer(inventory, item)
                end
            end
            -- put on prison outfit
            local bs = inventory:AddItem("Base.Boilersuit_Prisoner")
            player:setWornItem("Boilersuit", bs)
            local ff = inventory:AddItem("Base.Shoes_FlipFlop")
            player:setClothingItem_Feet(ff)
        end
        if config then
            Events.OnZombieCreate.Add(function(zombie)
                local x, y, z = config.coords.x, config.coords.y, config.coords.z
                if zombie then
                    local zombieX, zombieY, zombieZ = zombie:getX(), zombie:getY(), zombie:getZ()
                    if zombieX >= x - 15 and zombieX <= x + 15 and
                    zombieY >= y - 15 and zombieY <= y + 15 and
                    zombieZ == z then
                        DWAPUtils.dprint("Removing zombie: " .. zombieX .. ", " .. zombieY)
                        -- prevent zombie spawns
                        zombie:removeFromWorld()
                        zombie:removeFromSquare()
                    end
                end
            end)
        end
    end,
    -- DWAP_31_afterTeleport = function(config)
    --     DWAPUtils.dprint("Running after teleport function for optional spawn")
    --     local player = getPlayer()
    --     local square = player:getCurrentSquare()
    --     local x, y, z = square:getX(), square:getY(), square:getZ()
    -- end
}

local function confirmOptionalSpawn(_, button, optionalSpawn)
    DWAPUtils.dprint(optionalSpawn)
    if button.internal == "YES" then
        DWAPUtils.dprint("Optional spawn confirmed")
        local x, y, z = optionalSpawn.coords.x, optionalSpawn.coords.y, optionalSpawn.coords.z
        if optionalSpawn.beforeTeleport and optionalSpawnFunctions[optionalSpawn.beforeTeleport] then
            local optionalBefore = optionalSpawnFunctions[optionalSpawn.beforeTeleport]
            DWAPUtils.dprint("Running before teleport function")
            local success, err = pcall(optionalBefore, optionalSpawn)
            if not success then
                DWAPUtils.dprint("Error in beforeTeleport function: " .. tostring(err))
            end
        end
        if isClient() then
            SendCommandToServer("/teleportto " .. x .. "," .. y .. "," .. z);
        else
            getPlayer():teleportTo(x, y, z)
	    end
        if optionalSpawn.afterTeleport and optionalSpawnFunctions[optionalSpawn.afterTeleport] then
            local optionalSpawnAfter = optionalSpawnFunctions[optionalSpawn.afterTeleport]
            DWAPUtils.dprint("Running after teleport function")
            local success, err = pcall(optionalSpawnAfter, optionalSpawn)
            if not success then
                DWAPUtils.dprint("Error in afterTeleport function: " .. tostring(err))
            end
        end
    else
        DWAPUtils.dprint("Optional spawn cancelled")
    end
end
Events.OnLoad.Add(function()
    DWAP_Spawn = ModData.getOrCreate("DWAP_Spawn")
    if DWAP_Spawn and not DWAP_Spawn.done then
        local configs = DWAPUtils.loadConfigs()
        local configIndex = 1
        if SandboxVars.DWAP.EnableAllLocations then
            configIndex = DWAPUtils.getSafehouseIndex()
        end
        local config = configs[configIndex]
        table.wipe(configs)
        DWAPUtils.dprint(config.optionalSpawn and config.optionalSpawn.question or "No optional spawn question")
        if config.optionalSpawn then
            local width = 380
            local x = getCore():getScreenWidth() / 2 - (width / 2)
            local height = 120
            local y = getCore():getScreenHeight() / 2 - (height / 2)
            local dialog = ISModalDialog:new(x,y, width, height, getText(config.optionalSpawn.question), true, nil, confirmOptionalSpawn, nil, config.optionalSpawn)
            dialog:initialise()
            dialog:addToUIManager()
            dialog:bringToTop()
            setGameSpeed(0)
            DWAP_Spawn.done = true
        else
            DWAP_Spawn.done = true
        end
    end
end)
