
local DWAPUtils = require("DWAPUtils")
DWAPKeys = {}
DWAPKeys.onNewGame = function(playerObj, _)
    DWAPUtils.dprint("DWAPKeys.onNewGame")
    if not playerObj then playerObj = getSpecificPlayer(0); end
    if not playerObj then return end
    -- local data = ModData.getOrCreate("DWAP_UnsyncedKeys")

    local configs = DWAPUtils.loadConfigs()
    local configIndex = SandboxVars.DWAP.EnableAllLocations and DWAPUtils.selectedSafehouse or 1
    local config = configs[configIndex]
    if config and config.doorKeys then
        if config.doorKeys and SandboxVars.DWAP.SpawnWithMapAndKeys then
            local keyId = DWAPUtils.getSafehouseKeyId()
            --- @type InventoryItem
            local key = instanceItem("Base.Key1")
            key:setName(config.doorKeys.name)
            key:setKeyId(keyId)
            playerObj:getInventory():AddItem(key)
            DWAPUtils.dprint(("Added key %s to player inventory"):format(key:getDisplayName()))
        end
        if SandboxVars.DWAP.SpawnInBase then
            local flashlight = instanceItem("Base.HandTorch")
            playerObj:getInventory():AddItem(flashlight)
        end
    end
    table.wipe(configs)
end

Events.OnNewGame.Add(DWAPKeys.onNewGame)

Events.OnClientCommand.Add(function(module, command, player, args)
    if module == "DWAP" then
        if command == "updateBuildingKeyId" then
            local data = ModData.getOrCreate("DWAP_UnsyncedKeys")
            local index = tonumber(args[1])
            if index and data then
                data[index] = nil
            end
        end
    end
end)

-- Events.OnReceiveGlobalModData.Add(function(_, data)
--     if data.DWAP_UnsyncedKeys then
--         local playerObj = getSpecificPlayer(0)
--         if not playerObj then return end
--         local inventory = playerObj:getInventory()
--         for k, v in pairs(data.DWAP_UnsyncedKeys) do
--             local key = inventory:FindAndReturn(k)
--             if key then
--                 key:setKeyId(v)
--             end
--         end
--     end
-- end)
