require 'Items/ProceduralDistributions'
require 'Items/Distributions'
require "RecordedMedia/recorded_media"
local DWAPUtils = require("DWAPUtils")
local random = newrandom()

local distItemsCache = {}
local distItemsWJunkCache = {}
local lootConfig = {}
local lootByCoords = {}
local recordedMedia
local allCDs = {}
local allVHS = {}
local allSkillBooks = {}
local skillBooks1 = {}
local skillBooks2 = {}
local allSkillMags = {}
local allSeeds = {}
local allMaps = {}
local excludeItems = {
    "Key",
    "BookAiming",
    "BookButchering",
    "BookBlacksmith",
    "BookCarving",
    "BookCarpentry",
    "BookCooking",
    "BookElectricty",
    "BookFarming",
    "BookFirstAid",
    "BookFishing",
    "BookForaging",
    "BookFlintKnapping",
    "BookGlassmaking",
    "BookHusbandry",
    "BookLongBlade",
    "BookMaintenance",
    "BookMasonry",
    "BookMechanic",
    "BookMetalWelding",
    "BookPottery",
    "BookReloading",
    "BookTailoring",
    "BookTrapping",
    "BookTracking",
    "Money",
    "HerbalistMag",
    "Magazine1",
    "Magazine2",
    "Mag1",
    "Mag2",
    "Mag3",
    "Mag4",
    "Mag5",
    "Mag6",
    "Mag7",
    "Mag8",
    "Mag9",
    "Mag10",
    "Mag11",
    "IDCard",
    "CreditCard",
    "FishingTackle", -- seems to be in some distrbutions but doesn't exist currently
}
local convertItems = {
    ["PetrolCanEmpty"] = "JerryCanEmpty",
}

--- Turn a set of coords into a hash
--- @return number
local hashCoords = DWAPUtils.hashCoords

--- populate the lootConfig table with a single config entry
--- @param config table
local function setLootConfigValue(config)
    if not config then return end
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

--- Given a list of items, remove any that are in the excludeItems list
--- @param items table{string}
--- @return table{string}
local function removeExcludeItems(items)
    if not items then return {} end
    local newItems = {}
    for i = 1, #items do
        local item = items[i]
        if convertItems[item] then
            item = convertItems[item]
        end
        local exclude = false
        for j = 1, #excludeItems do
            if item == excludeItems[j] or string.match(item, excludeItems[j]) then
                exclude = true
                break
            end
        end
        if not exclude then
            table.insert(newItems, item)
        end
    end
    return newItems
end

--- Find items in the ProceduralDistributions or Distributions tables
--- @param key string
--- @param withJunk boolean
--- @return table items, table junkItems
local function findDistItems(key, withJunk)
    if withJunk then
        if distItemsWJunkCache[key] then return distItemsCache[key], distItemsWJunkCache[key] end
    else
        if distItemsCache[key] then return distItemsCache[key], {} end
    end
    if ProceduralDistributions.list[key] and ProceduralDistributions.list[key].items then
        if withJunk then
            return ProceduralDistributions.list[key].items, ProceduralDistributions.list[key].junk
        else
            return ProceduralDistributions.list[key].items, {}
        end
    end
    local distTable = Distributions[1]
    if distTable and distTable[key] then
        return distTable[key].items, {}
    end
    -- use . notation
    local keys = splitDot(key)
    for i = 1, #keys do
        local k = keys[i]
        if distTable[k] then
            distTable = distTable[k]
        end
    end
    if not distTable or not distTable.items then
        distItemsCache[key] = {}
        distItemsWJunkCache[key] = {}
        return {}, {}
    end
    distItemsCache[key] = distTable.items
    distItemsWJunkCache[key] = distTable.junk
    if withJunk then
        return distTable.items, distTable.junk
    else
        return distTable.items, {}
    end
end

local function getDistItems(distLists, includeJunk)
    if not distLists then return {} end
    if "string" == type(distLists) then
        distLists = { distLists }
    end
    local items = {}
    for i = 1, #distLists do
        local dlist = distLists[i]
        local dItems, jItems = findDistItems(dlist, includeJunk)
        dItems = removeExcludeItems(dItems)
        if dItems then
            for j = 1, #dItems do
                local item = dItems[j]
                if type(item) == "string" then
                    -- table.insert(items, "Base." .. item)
                    table.insert(items, item)
                end
            end
        end
        if includeJunk then
            jItems = removeExcludeItems(jItems)
            if jItems then
                for j = 1, #jItems do
                    local item = jItems[j]
                    if type(item) == "string" then
                        -- table.insert(items, "Base." .. item)
                        table.insert(items, item)
                    end
                end
            end
        end
    end
    return items
end

local function populateItems()
    local items = getAllItems()
    for i = 0, items:size()-1 do
        local item = items:get(i)
        if item and not item:getObsolete() and not item:isHidden() then
            --- @type string
            local name = item:getName()
            --- @type string
            local module = item:getModuleName()
            --- @type string
            local category = item:getDisplayCategory()
            if category == "SkillBook" and not (name:find("Set")) and not item:getLuaCreate() then
                local tags = item:getTags()
                local skip = false
                if tags and tags:size() > 0 then
                    for j = 0, tags:size()-1 do
                        local tag = tags:get(j)
                        if tag == "Magazine" then
                            table.insert(allSkillMags, module .. "." .. name)
                            skip = true
                            break
                        end
                    end
                end
                if not skip then
                    table.insert(allSkillBooks, module .. "." .. name)
                end
            elseif name:find("Seed") and not name:find("Empty") and not name:find("Paste") then
                table.insert(allSeeds, module .. "." .. name)
            elseif name ~= "Map" and name:find("Map") and category == "Cartography" then
                table.insert(allMaps, module .. "." .. name)
            end
        end
    end
    -- split allSkillBooks into 1 and 2
    local half = math.floor(#allSkillBooks / 2)
    for i = 1, #allSkillBooks do
        local item = allSkillBooks[i]
        if item then
            if i <= half then
                table.insert(skillBooks1, item)
            else
                table.insert(skillBooks2, item)
            end
        end
    end
end

local previousMediaSpawns = {}
local function nameMediaItem(item, replaceDuplicateWith)
    local media = allVHS
    if type(item) == "string" then
        if item == "Disc_Retail" or item == "Base.Disc_Retail" then
            media = allCDs
        end
    end
    if not media then return end
    local ii = instanceItem(item)
    if not ii then return item end
    local tries = 0
    local notFound = true
    while notFound and tries < 10 do
        local mediaItem = media:get(random:random(0, media:size() - 1))
        --- @type MediaData
        if mediaItem then
            local id = mediaItem:getId()
            if not replaceDuplicateWith or not previousMediaSpawns[id] then
                ii:setRecordedMediaData(mediaItem)
                previousMediaSpawns[id] = true
                notFound = false
            end
        end
        tries = tries + 1
    end
    if notFound and replaceDuplicateWith then
        return instanceItem(replaceDuplicateWith)
    end
    return ii
end

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
end

local function handleEmptyItem(item)
    item = instanceItem(item)
    if not item then return end
    local flContainer = item:getFluidContainer()
    if not flContainer then return item end
    flContainer:Empty()
    return item
end

local function addItem(container, item, count)
    local _count = count or 1
    if item == "VHS_Retail" or item == "Base.VHS_Retail" then
        item = nameMediaItem(item, "MagazineCrossword")
        container:AddItem(item)
    elseif item == "Disc_Retail" or item == "Base.Disc_Retail" then
        item = nameMediaItem(item, "MagazineWordsearch")
        container:AddItem(item)
        -- string contains "Empty"
    elseif string.match(item, "Empty") then
        item = handleEmptyItem(item)
        container:AddItem(item)
    else
        container:AddItems(item, _count)
    end
end

--- @param container ItemContainer
--- @param config table
--- @param index number
--- @param coordsKey number
local function fillContainer(container, config, index, coordsKey)
    if not container or not config then return end
    container:emptyIt()
    -- local level = SandboxVars.DWAP[spawnConfig.level] or 4
    local level = 4
    if type(config.level) == "string" then
        level = SandboxVars.DWAP[config.level] or 4
    elseif type(config.level) == "number" then
        level = config.level
    end
    if container then
        if config.sandboxEnable ~= nil and not SandboxVars.DWAP[config.sandboxEnable] then
            removeLootEntry(index, coordsKey)
            return
        end
        if config.special then
            if config.special == "maps" and allMaps and #allMaps > 0 then
                for i = 1, #allMaps do
                    local item = allMaps[i]
                    if item then
                        addItem(container, item)
                        allMaps[i] = nil
                    end
                end
            elseif config.special == "skillbooks1" and skillBooks1 and #skillBooks1 > 0 then
                for i = 1, #skillBooks1 do
                    local item = skillBooks1[i]
                    if item then
                        addItem(container, item)
                        skillBooks1[i] = nil
                    end
                end
            elseif config.special == "skillbooks2" and skillBooks2 and #skillBooks2 > 0 then
                for i = 1, #skillBooks2 do
                    local item = skillBooks2[i]
                    if item then
                        addItem(container, item)
                        skillBooks2[i] = nil
                    end
                end
            elseif config.special == "skillmags" and allSkillMags and #allSkillMags > 0 then
                for i = 1, #allSkillMags do
                    local item = allSkillMags[i]
                    if item then
                        addItem(container, item)
                        allSkillMags[i] = nil
                    end
                end
            elseif config.special == "SeedLibrary" and allSeeds and #allSeeds > 0 then
                for i = 1, #allSeeds do
                    local item = allSeeds[i]
                    if item then
                        local count = item:find("Bag") and 1 or random:random(5, 10)
                        addItem(container, item, count)
                        allSeeds[i] = nil
                    end
                end
            end
        elseif config.randUntilFull then
            local items = getDistItems(config.dist, config.distIncludeJunk)
            if not items then return end
            local item = items[random:random(1, #items)]
            local hasRoom = checkHasRoom(container, level)
            local tries = 0
            while hasRoom and tries < 100 do
                item = items[random:random(1, #items)]
                hasRoom = checkHasRoom(container, level)
                if hasRoom and item then
                    addItem(container, item)
                end
                tries = tries + 1
            end
        else
            local items = config.items
            if not items then
                items = getDistItems(config.dist, config.distIncludeJunk)
            end
            if not items then return end
            for k = 1, #items do
                local item = items[k]
                if item then
                    if item.chance then
                        if item.chance == 1 or item.chance >= (random:random(1, 100) / 100) then
                            local count = random:random(item.count[1], item.count[2])
                            addItem(container, item.name, count)
                        end
                    else
                        addItem(container, item)
                    end
                end
            end
        end
        removeLootEntry(index, coordsKey)
    end
end

local function loadConfigs()
    local configs = DWAPUtils.loadConfigs()
    for i = 1, #configs do
        local config = configs[i]
        if config and config.loot then
            for j = 1, #config.loot do
                setLootConfigValue(config.loot[j])
            end
        end
    end
    populateItems()
end

--- Handle Custom Loot Spawns
--- @param roomType string
--- @param containerType string
--- @param container ItemContainer
local function onFillContainer(roomType, containerType, container)
    if isMultiplayer() and isClient() then return end
    if not SandboxVars.DWAP.Loot then return end
    if not container or roomType == "Container" then return end
    local square = container:getSourceGrid()
    if square then
        local z = square:getZ()
        if containerType == "overhead" or container:getContainerPosition() == "High" then z = z + 0.5 end
        local loot, index, coordsKey = getLootForCoords(square:getX(), square:getY(), z)
        if loot and index and coordsKey then
            DWAPUtils.dprint(("onFillContainer: %s %s"):format(square:getX(), square:getY()))
            DWAPUtils.dprint({index = index, roomType = roomType, containerType = containerType, coordsKey = coordsKey})
            -- DWAPUtils.dprint(("onFillContainer: %s %s %s %s"):format(roomType, containerType, square:getX(), square:getY()))
            DWAPUtils.DeferThrottled(function()
                fillContainer(container, loot, index, coordsKey)
                ItemPickerJava.updateOverlaySprite(container:getParent())
            end)
        end
    end
end

Events.OnInitRecordedMedia.Add(function(_recordedMedia)
    --- @cast recordedMedia RecordedMedia
    recordedMedia = _recordedMedia
end)

-- local recordedMedia
-- local allCDs = {}
-- local allVHS = {}
-- local allSkillBooks = {}
-- local allSeeds = {}
-- local allMaps = {}

Events.OnInitGlobalModData.Add(function()
    if not SandboxVars.DWAP.Loot then return end
    allCDs = recordedMedia:getAllMediaForType(0)
    allVHS = recordedMedia:getAllMediaForCategory("Retail-VHS")
    --- @cast allCDs ArrayList
    --- @cast allVHS ArrayList
    local modData = ModData.getOrCreate("DWAP_Loot")
    if modData and modData.init then
        lootConfig = modData.lootConfig
        lootByCoords = modData.lootByCoords
        -- allCDs = modData.allCDs
        -- allVHS = modData.allVHS
        allSkillBooks = modData.allSkillBooks
        skillBooks1 = modData.skillBooks1
        skillBooks2 = modData.skillBooks2
        allSkillMags = modData.allSkillMags
        allSeeds = modData.allSeeds
        allMaps = modData.allMaps
        Events.OnFillContainer.Add(onFillContainer)
    else
        loadConfigs()
        modData.lootConfig = lootConfig
        modData.lootByCoords = lootByCoords
        -- modData.allCDs = allCDs
        -- modData.allVHS = allVHS
        modData.allSkillBooks = allSkillBooks
        modData.skillBooks1 = skillBooks1
        modData.skillBooks2 = skillBooks2
        modData.allSkillMags = allSkillMags
        modData.allSeeds = allSeeds
        modData.allMaps = allMaps
        modData.init = true
        Events.OnFillContainer.Add(onFillContainer)
    end
end)

Events.OnSave.Add(function()
    if not SandboxVars.DWAP.Loot then return end
    local modData = ModData.getOrCreate("DWAP_Loot")
    if modData and modData.init then
        modData.lootConfig = lootConfig
        modData.lootByCoords = lootByCoords
        -- modData.allCDs = allCDs
        -- modData.allVHS = allVHS
        modData.allSkillBooks = allSkillBooks
        modData.skillBooks1 = skillBooks1
        modData.skillBooks2 = skillBooks2
        modData.allSkillMags = allSkillMags
        modData.allSeeds = allSeeds
        modData.allMaps = allMaps
    end
end)
