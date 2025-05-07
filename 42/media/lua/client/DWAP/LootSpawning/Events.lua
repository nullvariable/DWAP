local DWAPUtils = require("DWAPUtils")
local random = newrandom()

local lootConfig = {}
local lootByCoords = {}

--- Turn a set of coords into a hash
--- @return number
local hashCoords = DWAPUtils.hashCoords

--- populate the lootConfig table with a single config entry
--- @param config table
local function setLootConfigValue(config)
    if not config then return end
    if not config.coords then
        DWAPUtils.dprint("Loot config missing coords")
        DWAPUtils.dprint(config)
        return
    end
    local x = config.coords.x
    local y = config.coords.y
    local z = config.coords.z
    local coordsKey = hashCoords(x, y, z)
    local index = #lootConfig+1
    lootConfig[index] = config
    lootByCoords[coordsKey] = index
end

--- get the loot config for a set of coords
--- @param x number
--- @param y number
--- @param z number
--- @return table|nil lootConfig, number|nil index, number|nil coordsKey loot config, lootByCoords index, hash of coords
local function getLootForCoords(x, y, z)
    local coordsKey = hashCoords(x, y, z)
    local index = lootByCoords[coordsKey]
    if index then
        return lootConfig[index], index, coordsKey
    end
    return nil, nil, nil
end

--- Remove a loot entry by index and coordsKey
--- @param index number
--- @param coordsKey number
local function removeLootEntry(index, coordsKey)
    if not index then return end
    local config = lootConfig[index]
    if not config then return end
    lootConfig[index] = nil
    lootByCoords[coordsKey] = nil
end

--- split a string by dot
--- @param str string
--- @return table
local function splitDot(str)
    local t = {}
    for w in str:gmatch("([^%.]+)") do
        table.insert(t, w)
    end
    return t
end

--- check if there's room in a container, based on the desired level and the container's max capacity
--- @param container ItemContainer
--- @param desiredLevel number
--- @return boolean
local function checkHasRoom(container, desiredLevel)
    if not container then return false end
    if desiredLevel == 4 then return false end
    if desiredLevel == 1 or not desiredLevel then return container:hasRoomFor(nil, 1) end
    local weight = container:getContentsWeight()
    local maxWeight = container:getMaxWeight()
    -- 2 = 60%, 3 = 30%
    if desiredLevel == 2 then
        return weight < (maxWeight * 0.6)
    elseif desiredLevel == 3 then
        return weight < (maxWeight * 0.3)
    end
    return false
end

--- fixes empty items
--- @param item string
--- @return InventoryItem|nil item
local function handleEmptyItem(item)
    --- @type InventoryItem
    local ii = instanceItem(item)
    if not ii then return nil end
    local flContainer = ii:getFluidContainer()
    if not flContainer then return ii end
    flContainer:Empty()
    return ii
end

--- add an item to a container
--- @param container ItemContainer
--- @param item string
--- @param count? number
--- @param frozen? boolean
--- @return InventoryItem|nil item
local function addItem(container, item, count, frozen)
    DWAPUtils.dprint("addItem")
    DWAPUtils.dprint({item = item, count = count, frozen = frozen})
    local _count = count or 1
    if not item or not container then
        DWAPUtils.dprint("WARN addItem: item or container is nil")
        return
    end
    if item == "VHS_Retail" or item == "Base.VHS_Retail" then
        local ii = DWAP_LootSpawning.nameMediaItem(item, "MagazineCrossword")
        DWAPUtils.dprint("VHS item: " .. tostring(ii))
        container:AddItem(ii)
    elseif item == "Disc_Retail" or item == "Base.Disc_Retail" then
        local ii = DWAP_LootSpawning.nameMediaItem(item, "MagazineWordsearch")
        container:AddItem(ii)
    elseif type(item) == "string" and item:match("Empty") then
        local ii = handleEmptyItem(item)
        if not ii then return end
        container:AddItems(ii, _count)
    else
        if frozen then
            for i = 1, _count do
                --- @type Food|InventoryItem
                local result = container:AddItem(item)
                if instanceof(result, "Food") then
                    result:setFrozen(true)
                    result:setFreezingTime(100)
                end
            end
        else
            container:AddItems(item, _count)
        end
    end
end

--- @param container ItemContainer
--- @param config table
--- @param index number
--- @param coordsKey number
local function fillContainer(container, config, index, coordsKey)
    if not container or not config then return end
    local containerType = container:getType()
    if not config.stove and (containerType == "microwave" or container:isStove()) then
        return
    end
    container:emptyIt()
    -- local level = SandboxVars.DWAP[spawnConfig.level] or 4
    local level = 3
    if type(config.level) == "string" then
        level = SandboxVars.DWAP[config.level] or 4
    elseif type(config.level) == "number" then
        level = config.level
    end
    if config.sandboxEnable ~= nil and not SandboxVars.DWAP[config.sandboxEnable] then
        removeLootEntry(index, coordsKey)
        return
    end
    if config.special then
        if config.special == "maps" then
            local allMaps = DWAP_LootSpawning.getAllMaps()
            for i = 1, #allMaps do
                local item = allMaps[i]
                if item then
                    addItem(container, item)
                    allMaps[i] = nil
                end
            end
        elseif config.special == "skillbooks1" then
            local skillBooks1 = DWAP_LootSpawning.getSkillBooks1()
            for i = 1, #skillBooks1 do
                local item = skillBooks1[i]
                if item then
                    addItem(container, item)
                    skillBooks1[i] = nil
                end
            end
        elseif config.special == "skillbooks2" then
            local skillBooks2 = DWAP_LootSpawning.getSkillBooks2()
            for i = 1, #skillBooks2 do
                local item = skillBooks2[i]
                if item then
                    addItem(container, item)
                    skillBooks2[i] = nil
                end
            end
        elseif config.special == "skillmags" then
            local allSkillMags = DWAP_LootSpawning.getAllSkillMags()
            for i = 1, #allSkillMags do
                local item = allSkillMags[i]
                if item then
                    addItem(container, item)
                    allSkillMags[i] = nil
                end
            end
        elseif config.special == "SeedLibrary" then
            local allSeeds = DWAP_LootSpawning.getAllSeeds()
            for i = 1, #allSeeds do
                local item = allSeeds[i]
                if item then
                    local count = random:random(5, 10)
                    addItem(container, item, count)
                    allSeeds[i] = nil
                end
            end
            level = SandboxVars.DWAP.Loot_FarmLevel or 4
            local hasRoom = checkHasRoom(container, level)
            local tries = 0
            while hasRoom and tries < 100 do
                local item = allSeeds[random:random(1, #allSeeds)]
                addItem(container, item)
                hasRoom = checkHasRoom(container, level)
                tries = tries + 1
            end
        elseif config.special == "essentials" then
            local essentials = DWAP_LootSpawning.getEssentials()
            for i = 1, #essentials do
                local item = essentials[i]
                if item then
                    addItem(container, item)
                end
            end
        elseif config.special == "gunlocker" and level < 4 then -- specifically loads a single gun and clips/ammo for a locker
            local gunLockers = DWAP_LootSpawning.getGunLockers()
            local gunLocker = random:random(1, #gunLockers)
            for i = 1, #gunLockers[gunLocker] do
                local item = gunLockers[gunLocker][i]
                if item then
                    addItem(container, item)
                end
            end
            local hasRoom = checkHasRoom(container, level)
            local tries = 0
            while hasRoom and tries < 100 do
                local item = gunLockers[gunLocker][#gunLockers[gunLocker]]
                addItem(container, item)
                hasRoom = checkHasRoom(container, level)
                tries = tries + 1
            end
        end
    elseif config.randUntilFull then
        local items = {}
        if config.dist then
            items = DWAP_LootSpawning.getItemsWithDistLists(config.dist, config.distIncludeJunk)
        end
        if config.items then
            for i = 1, #config.items do
                if config.items[i].count then
                    local count = random:random(config.items[i].count[1], config.items[i].count[2])
                    for j = 1, count do
                        if config.items[i].chance then
                            if config.items[i].chance == 1 or config.items[i].chance >= (random:random(1, 100) / 100) then
                                items[#items+1] = config.items[i].name
                                addItem(container, config.items[i].name, 1, config.frozen)
                            end
                        else
                            items[#items+1] = config.items[i].name
                            addItem(container, config.items[i].name, 1, config.frozen)
                        end
                    end
                else
                    items[#items+1] = config.items[i].name
                    addItem(container, config.items[i].name, 1, config.frozen)
                end
            end
        end

        local alreadySpawnedContainers = {}
        if not items or #items < 1 then return end
        local item = items[random:random(1, #items)]
        local hasRoom = true -- first item always has room
        local tries = 0
        while hasRoom and tries < 100 do
            if not items or #items < 2 and alreadySpawnedContainers and #alreadySpawnedContainers > 0 then
                for i = 0, #alreadySpawnedContainers do
                    items[#items+1] = alreadySpawnedContainers[i]
                end
                alreadySpawnedContainers = {}
                -- DWAPUtils.dprint("Added containers to items: " .. #alreadySpawnedContainers)
            end
            local randindex = random:random(1, #items)
            item = items[randindex]
            hasRoom = checkHasRoom(container, level)
            if hasRoom and item then
                addItem(container, item, 1, config.frozen)
                if type(item) == "string" then
                    local ii = instanceItem(item)
                    if ii and ii:getCategory() == "Container" then
                        items[randindex] = nil
                        alreadySpawnedContainers[#alreadySpawnedContainers+1] = item
                        -- DWAPUtils.dprint("Added container: " .. item)
                    end
                end
            end
            tries = tries + 1
        end
    else
        -- DWAPUtils.dprint("final loot else")
        local items = config.items or {}
        local dist = config.dist or {"RandomFiller"}
        if config.dist or #items < 1 then
            local _items = DWAP_LootSpawning.getItemsWithDistLists(dist, config.distIncludeJunk)
            if _items then
                for i = 1, #_items do
                    items[#items+1] = { name = _items[i] }
                end
            end
        end
        if not items then return end
        for k = 1, #items do
            local item = items[k]
            if item then
                if item.chance then
                    if item.chance == 1 or item.chance >= (random:random(1, 100) / 100) then
                        local count = random:random(item.count[1], item.count[2])
                        addItem(container, item.name, count, config.frozen)
                    end
                else
                    addItem(container, item.name, 1, config.frozen)
                end
            end
        end
    end
    removeLootEntry(index, coordsKey)
end

local function loadConfigs()
    local configs = DWAPUtils.loadConfigs()
    local safehouseIndex = DWAPUtils.selectedSafehouse or SandboxVars.DWAP.Safehouse - 1
    if #configs == 1 then
        safehouseIndex = 1
    end
    local nonPrimaryLootLevel = SandboxVars.DWAP.Loot
    for i = 1, #configs do
        local config = configs[i]
        local count = 0
        if config and config.loot then
            if (nonPrimaryLootLevel == 1 and i ~= safehouseIndex) or nonPrimaryLootLevel == 4 then
                config.loot = {}
            else
                local rewriteLevel = nonPrimaryLootLevel == 3 and i ~= safehouseIndex
                for j = 1, #config.loot do
                    if rewriteLevel and type(config.loot[j].level) == "string" then
                        -- overwrite to low
                        config.loot[j].level = 3
                    end
                    if config.loot[j].special and config.loot[j].special ~= "gunlocker" and i ~= safehouseIndex then
                        config.loot[j] = nil
                    else
                        setLootConfigValue(config.loot[j])
                        -- try to precache the items
                        if config.loot[j].dist then
                            DWAP_LootSpawning.getItemsWithDistLists(config.loot[j].dist, config.loot[j].distIncludeJunk)
                        end
                        count = count + 1
                    end
                end
            end
        end
        DWAPUtils.dprint("Done. Loot config count: " .. count)
    end
end

--- Handle Custom Loot Spawns
--- @param roomType string
--- @param containerType string
--- @param container ItemContainer
local function onFillContainer(roomType, containerType, container)
    if isMultiplayer() and isClient() then return end
    if not SandboxVars.DWAP.Loot or SandboxVars.DWAP.Loot > 3 then return end
    if not container or roomType == "Container" then return end
    local square = container:getSourceGrid()
    if square then
        local z = square:getZ()
        if containerType == "overhead" or container:getContainerPosition() == "High" then z = z + 0.5 end
        local loot, index, coordsKey = getLootForCoords(square:getX(), square:getY(), z)
        if loot and index and coordsKey then
            DWAPUtils.dprint(("onFillContainer: %s %s"):format(square:getX(), square:getY()))
            DWAPUtils.dprint({index = index, roomType = roomType, containerType = containerType, coordsKey = coordsKey})
            DWAPUtils.DeferThrottled(function()
                fillContainer(container, loot, index, coordsKey)
                ItemPickerJava.updateOverlaySprite(container:getParent())
            end)
        end
    end
end

-- Events.OnInitGlobalModData.Add(function()
Events.OnPostMapLoad.Add(function()
    if not SandboxVars.DWAP.Loot or SandboxVars.DWAP.Loot == 4 then
        DWAPUtils.dprint("Loot spawning disabled")
        return
    end
    DWAP_LootSpawning.populateItems()
    local modData = ModData.getOrCreate("DWAP_Loot")
    if modData and modData.init then
        lootConfig = modData.lootConfig
        lootByCoords = modData.lootByCoords
        Events.OnFillContainer.Add(onFillContainer)
    else
        loadConfigs()
        modData.lootConfig = lootConfig
        modData.lootByCoords = lootByCoords
        modData.init = true
        Events.OnFillContainer.Add(onFillContainer)
    end
end)

Events.OnSave.Add(function()
    if not SandboxVars.DWAP.Loot or SandboxVars.DWAP.Loot == 4 then
        DWAPUtils.dprint("Loot spawning disabled")
        return
    end
    local modData = ModData.getOrCreate("DWAP_Loot")
    if modData and modData.init then
        modData.lootConfig = lootConfig
        modData.lootByCoords = lootByCoords
    end
end)
print("Events.lua loaded")