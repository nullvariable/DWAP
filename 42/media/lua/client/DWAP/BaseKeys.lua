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
    if params.sprite and params.sprite:find('garage') then
        DWAPUtils.dprint("Garage door found, attempting to set key ID")
        local objects = square:getObjects()
        for i = 0, objects:size() - 1 do
            local obj = objects:get(i)
            if obj:getSpriteName() == params.sprite then
                local garageDoorObjects = buildUtil.getGarageDoorObjects(obj)
                DWAPUtils.dprint(("Found garage door object %s"):format(obj:getSpriteName()))
                for j=1,#garageDoorObjects do
                    local object = garageDoorObjects[j]
                    object:setKeyId(keyId)
                    object:setLocked(false)
                    object:syncIsoObject(false, 0, nil, nil);
                end
            end
        end
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
    elseif params.buildingOnly then
        -- baseBuildings anchors come through here. They exist to reach a
        -- building def; if this one does not resolve, keying every loose object
        -- on the square is not what was asked for.
        DWAPUtils.dprint(("No building at anchor %d,%d,%d"):format(coords.x, coords.y, coords.z))
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

Events.OnNewGame.Add(function(playerObj)
        DWAPUtils.dprint("DWAPKeysCL.OnNewGame")
        local configs = DWAPUtils.loadConfigs()
        local configIndex = DWAPUtils.getPrimaryConfigIndex()
        local keyIdBase = DWAPUtils.getSafehouseKeyId()
        print('Client BaseKeys. ' .. keyIdBase)
        for i = 1, #configs do
            local config = configs[i]
            if config then
                if (SandboxVars.DWAP.SpawnWithMapAndKeys and i == configIndex) or (config.doorKeys and config.doorKeys.extra) then
                    if config.doorKeys then
                        local keyId = keyIdBase + i
                        for j = 1, #config.doorKeys.doors do
                            local door = config.doorKeys.doors[j]
                            DWAPUtils.dprint(("Adding key %s to door %s %s %s"):format(keyId, door.x, door.y, door.z))
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
                                        keyId = keyId,
                                        sprite = door.sprite,
                                    }
                                )
                            end
                        end
                    end
                end
                if config.map and ((SandboxVars.DWAP.SpawnWithMapAndKeys and i == configIndex) or config.map.extra) then
                    local stash = StashSystem.getStash(config.map.name)
                    if stash then
                        local mapItem = instanceItem(stash:getItem())
                        StashSystem.doStashItem(stash, mapItem)
                        mapItem:setCustomName(true)
                        playerObj:getInventory():AddItem(mapItem)
                        DWAPUtils.dprint(("Added map %s to player inventory"):format(mapItem:getDisplayName()))

                        -- readd the original stash so it can be used if the player dies and starts a new character etc.
                        pcall(function()
                            local stashBuilding = StashBuilding.new(stash:getName(), stash:getBuildingX(), stash:getBuildingY())
                            local possibleStashes = StashSystem.getPossibleStashes()
                            possibleStashes:add(stashBuilding)
                        end)
                    else
                        DWAPUtils.dprint(("No stash found for map %s"):format(tostring(config.map)))
                    end
                end
            end
        end
        table.wipe(configs)
end)

Events.OnLoad.Add(function()
    local configs = DWAPUtils.loadConfigs()
    local configIndex = DWAPUtils.getPrimaryConfigIndex()
    local keyIdBase = DWAPUtils.getSafehouseKeyId()
    for c = 1, #configs do
        local config = configs[c]
        if config and ((configIndex == c and SandboxVars.DWAP.SpawnWithMapAndKeys) or (config.doorKeys and config.doorKeys.extra)) then
            if config.doorKeys then
                local keyId = keyIdBase + c
                for i = 1, #config.doorKeys.doors do
                    local door = config.doorKeys.doors[i]
                    DWAPUtils.dprint(("configIndex:%d Adding key to door %s %s %s"):format(configIndex, door.x, door.y, door.z))
                    DWAPSquareLoaded:AddEvent(
                        DWAPKeysCL.updateBuildingKeyId,
                        door.x,
                        door.y,
                        door.z,
                        true,
                        {
                            coords = {x = door.x, y = door.y, z = door.z},
                            keyId = keyId,
                            sprite = door.sprite,
                        }
                    )
                end
                -- Also key from the baseBuildings anchors. A door often sits on
                -- an exterior wall square, and if that square does not resolve
                -- a building then its entry never reaches def:setKeyId at all -
                -- which is what the spare "insurance" doors have been working
                -- around. Anchors are interior by construction, one per
                -- physical building, so they reach every def including a
                -- basement that counts as its own building because it has an
                -- outside entrance. Additive and idempotent: doors still run,
                -- and a def that already carries this key is left alone.
                if config.baseBuildings then
                    for i = 1, #config.baseBuildings do
                        local anchor = config.baseBuildings[i]
                        DWAPSquareLoaded:AddEvent(
                            DWAPKeysCL.updateBuildingKeyId,
                            anchor.x,
                            anchor.y,
                            anchor.z,
                            true,
                            {
                                coords = {x = anchor.x, y = anchor.y, z = anchor.z},
                                keyId = keyId,
                                buildingOnly = true,
                            }
                        )
                    end
                end
            end
        end
    end
    table.wipe(configs)
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
