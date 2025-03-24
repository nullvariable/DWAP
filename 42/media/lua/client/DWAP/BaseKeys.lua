DWAPKeysCL = DWAPKeysCL or {}

local DWAPUtils = require("DWAPUtils")

DWAPKeysCL.updateBuildingKeyId = function(params)
    assert(params.coords, "table")
    assert(params.keyId, "number")
    DWAPUtils.dprint(("updateBuildingKeyId %s %s"):format(params.coords.x, params.coords.y))
    local coords = params.coords
    local keyId = params.keyId
    local square = getCell():getGridSquare(coords.x, coords.y, coords.z)
    if not square then
        DWAPUtils.dprint("Square not found")
        return
    end
    local building = square:getBuilding()
    if building then
        local def = building:getDef()
        if def and def:getKeyId() ~= keyId then
            def:setKeyId(keyId)
            def:setKeySpawned(def:getKeySpawned() + 1)
            DWAPUtils.dprint(("Updated building key ID to %d"):format(keyId))
        else
            if not def then
                DWAPUtils.dprint("Building def not found")
            else
                DWAPUtils.dprint(("Building key ID already set to %d"):format(keyId))
            end
        end
    else
        local objs = square:getObjects()
        for i=0, objs:size()-1 do
            local obj = objs:get(i)
            obj:setKeyId(keyId)

            local doubleDoorObjects = buildUtil.getDoubleDoorObjects(obj)
            for j=1,#doubleDoorObjects do
                local object = doubleDoorObjects[j]
                object:setKeyId(keyId)
            end

            local garageDoorObjects = buildUtil.getGarageDoorObjects(obj)
            for j=1,#garageDoorObjects do
                local object = garageDoorObjects[j]
                object:setKeyId(keyId)
            end
        end
    end
end

Events.OnNewGame.Add(function()
    if SandboxVars.DWAP.SpawnWithMapAndKeys then
        DWAPUtils.dprint("DWAPKeysCL.OnNewGame")
        local configs = DWAPUtils.loadConfigs()
        local configIndex = SandboxVars.DWAP.EnableAllLocations and DWAPUtils.selectedSafehouse or 1
        local config = configs[configIndex]
        if config then
            if config.doorKeys then
                local keyId = DWAPUtils.getSafehouseKeyId()
                for i = 1, #config.doorKeys.doors do
                    local door = config.doorKeys.doors[i]
                    DWAPUtils.dprint(("Adding key to door %s %s %s"):format(door.x, door.y, door.z))
                    if door.isProp then
                        DWAPSquareLoaded:AddHookEvent(
                            "PropSpawned",
                            DWAPKeysCL.updateBuildingKeyId,
                            door.x,
                            door.y,
                            door.z,
                            true,
                            {
                                coords = {x = door.x, y = door.y, z = door.z},
                                keyId = keyId
                            }
                        )
                    end
                end
            end
            if config.map then
                local playerObj = getPlayer()
                if not playerObj then return end
                local stash = StashSystem.getStash(config.map.name)
                if stash then
                    local mapItem = instanceItem(stash:getItem())
                    StashSystem.doStashItem(stash, mapItem)
                    mapItem:setCustomName(true)
                    playerObj:getInventory():AddItem(mapItem)
                    DWAPUtils.dprint(("Added map %s to player inventory"):format(mapItem:getDisplayName()))
                end
            end
        end
        table.wipe(configs)
    end
end)

Events.OnLoad.Add(function()
    if SandboxVars.DWAP.SpawnWithMapAndKeys then
        local configs = DWAPUtils.loadConfigs()
        local configIndex = SandboxVars.DWAP.EnableAllLocations and DWAPUtils.selectedSafehouse or 1
        local config = configs[configIndex]
        if config then
            if config.doorKeys then
                local keyId = DWAPUtils.getSafehouseKeyId()
                for i = 1, #config.doorKeys.doors do
                    local door = config.doorKeys.doors[i]
                    DWAPUtils.dprint(("Adding key to door %s %s %s"):format(door.x, door.y, door.z))
                    DWAPSquareLoaded:AddEvent(
                        DWAPKeysCL.updateBuildingKeyId,
                        door.x,
                        door.y,
                        door.z,
                        true,
                        {
                            coords = {x = door.x, y = door.y, z = door.z},
                            keyId = keyId
                        }
                    )
                end
            end
        end
        table.wipe(configs)
    end
end)

-- if mapsToSpawn then
    --     --     for i = 1, #mapsToSpawn do
    --     --         local stash = StashSystem.getStash(mapsToSpawn[i])
    --     --         if stash then
    --     --             local map = instanceItem(stash:getItem())
    --     --             StashSystem.doStashItem(stash, map)
    --     --             getPlayer():getInventory():AddItem(map)
    --     --             DWAPUtils.dprint(("Added map %s to player inventory"):format(map:getDisplayName()))
    --     --         end
    --     --     end
    --     --     mapsToSpawn = nil
    --     -- end

-- if SandboxVars.DWAP.SpawnWithMapAndKeys and config and config.map then
--     local playerObj = getPlayer()
--     if not playerObj then return end
--     local map = instanceItem("RosewoodMap")
--     local stash = StashSystem.getStash(config.map)
--     StashSystem.doStashItem(stash, map)
--     map:setCustomName(true)
--     playerObj:getInventory():AddItem(map)
--     DWAPUtils.dprint(("Added map %s to player inventory"):format(map:getDisplayName()))
-- end
