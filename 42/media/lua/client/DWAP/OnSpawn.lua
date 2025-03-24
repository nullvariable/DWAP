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
