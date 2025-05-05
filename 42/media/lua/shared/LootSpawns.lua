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
    "IDCard",
    "CreditCard",
    "TakeoutBox_Chinese",
    "Paperbag_Jays",
    "IcePick",
    "FishingTackle", -- seems to be in some distrbutions but doesn't exist currently
}
local convertItems = {
    -- ["PetrolCanEmpty"] = "JerryCanEmpty",
}

local essentials = {
    "Gloves_LeatherGlovesBlack",
    "Bag_ALICE_BeltSus_Camo",
    "SleepingBag_Camo_Packed",
    "MagnesiumFirestarter",
    "TentGreen_Packed",
    "WaterPurificationTablets",
    "AlcoholBandage",
    "Pills",
    "PillsSleepingTablets",
    "PillsAntiDep",
    "PillsBeta",
    "PillsVitamins",
    "EntrenchingTool",
    "Eraser",
    "Pencil",
    "Pen",
    "Scissors",
    "FlashLight_AngleHead_Army",
    "ClayTool",
    "Saw",
    "MetalworkingPliers",
    "Tongs",
    "WeldingMask",
    "BlowTorch",
    "Crowbar",
    "Handiknife",
    "Hammer",
    "MasonsChisel",
    "MasonsTrowel",
    "MetalworkingChisel",
    "MetalworkingPunch",
    "PickAxe",
    "PipeWrench",
    "Screwdriver",
    "Sledgehammer",
    "WoodAxe",
    "Wrench",
    "RubberHose",
    "CanteenMilitary",
    "Bag_ALICEpack_Army",
    "PonchoGreen",
    "Shoes_ArmyBoots",
    "Trousers_Padded_HuntingCamo",
    "Vest_Hunting_Camo",
    "Jacket_HuntingCamo",
    "Battery",
    "Notebook",
    "WristWatch_Left_DigitalBlack",
}

local gunLockers = {
    {
        "AssaultRifle2",
        "M14Clip",
        "M14Clip",
        "M14Clip",
        "M14Clip",
        "M14Clip",
        "x4Scope",
        "x8Scope",
        "Laser",
        "AmmoStraps",
        "RecoilPad",
        "RedDot",
        "308Box",
    },
    {
        "Pistol3",
        "GunLight",
        "Laser",
        "44Clip",
        "44Clip",
        "44Clip",
        "44Clip",
        "44Clip",
        "Bullets44Box",
    },
    {
        "ShotgunSawnoff",
        "AmmoStraps",
        "ChokeTubeFull",
        "AmmoStrap_Shells",
        "RecoilPad",
        "ShotgunShellsCarton",
        "ShotgunShellsBox",
    },
}
local gunLockersRain42 = {
    {
        "ColtCommando",
        "RFNGP_GunCase_ColtCommando",
        "556Clip",
        "556Clip",
        "556Clip",
        "556Clip",
        "556Clip",
        "x4ACOGScope",
        "x8ACOGScope",
        "SOCOMRedDot",
        "223556Suppressor",
        "GunLight",
        "Foregrip1",
        "556Box",
    },
    {
        "Pistol3",
        "GunLight",
        "TritiumSights",
        "Laser",
        "RedDot",
        "DIYSuppressor",
        "44Clip",
        "44Clip",
        "44Clip",
        "44Clip",
        "44Clip",
        "Bullets44Box",
    },
    {
        "HKM23",
        "RFNGP_GunCase_HKM23",
        "GunLight",
        "SOCOMRedDot",
        "45Suppressor",
        "Compensator",
        "USPClip",
        "USPClip",
        "USPClip",
        "USPClip",
        "USPClip",
        "Bullets45Box",
    },
    {
        "ShotgunSawnoff",
        "Sling",
        "GunLight",
        "Shellholder",
        "ShotgunShellsCarton",
        "ShotgunShellsBox",
    },
    {
        "AA12",
        "RFNGP_GunCase_AA12",
        "AA12Magazine",
        "AA12Magazine",
        "AA12Magazine",
        "TritiumSights",
        "ChokeTubeFull",
        "Sling",
        "Shellholder",
        "12gSuppressor",
        "GunLight",
        "RecoilPad",
        "Foregrip1",
        "ShotgunShellsCarton",
        "ShotgunShellsBox",
    },
    {
        "MP5SD",
        "9mm30Magazine",
        "9mm30Magazine",
        "9mm30Magazine",
        "9mm30Magazine",
        "9mm30Magazine",
        "x4ACOGScope",
        "SOCOMRedDot",
        "GunLight",
        "Foregrip1",
        "Sling",
        "Bullets9mmBox",
    },
    {
        "G3",
        "RFNGP_GunCase_G3",
        "M14Clip",
        "M14Clip",
        "M14Clip",
        "M14Clip",
        "M14Clip",
        "308762Suppressor",
        "x4ACOGScope",
        "x8ACOGScope",
        "SOCOMRedDot",
        "GunLight",
        "Foregrip1",
        "Sling",
        "762Box",
    },
    {
        "M249",
        "RFNGP_GunCase_M249",
        "M249Clip",
        "M249Clip",
        "M249Clip",
        "x4ACOGScope",
        "x8ACOGScope",
        "GunLight",
        "Foregrip1",
        "Sling",
        "556Box",
    },
}
local gunLockersVanillaExpansion = {
    {
        "cj_sg552_commando",
        "CJWD40",
        "GUNOIL2",
        "CJGCK",
        "1x_scope_ru",
        "3x_scope_us",
        "1x_scope_us",
        "4x_scope_us",
        "25x_scope_us",
        "4x_scope_us_2",
        "8x_scope_us",
        "suppressor_us_5_56",
        "556Clip",
        "556Clip",
        "556Clip",
        "556Clip",
        "556Clip",
        "556Box",
    },
    {
        "cj_glock_17",
        "CJWD40",
        "GUNOIL2",
        "CJGCK",
        "1x_scope_ru",
        "3x_scope_us",
        "1x_scope_us",
        "4x_scope_us",
        "25x_scope_us",
        "4x_scope_us_2",
        "8x_scope_us",
        "suppressor_us_9mm",
        "MagGlock17",
        "MagGlock17",
        "MagGlock17",
        "MagGlock17",
        "MagGlock17",
        "Bullets9mmBox",
    },
    {
        "cj_intratec_9",
        "CJWD40",
        "GUNOIL2",
        "CJGCK",
        "1x_scope_ru",
        "3x_scope_us",
        "1x_scope_us",
        "4x_scope_us",
        "25x_scope_us",
        "4x_scope_us_2",
        "8x_scope_us",
        "MagTEC",
        "MagTEC",
        "MagTEC",
        "MagTEC",
        "MagTEC",
        "Bullets9mmBox",
    },
    {
        "cj_walther_pp",
        "CJWD40",
        "GUNOIL2",
        "CJGCK",
        "1x_scope_ru",
        "3x_scope_us",
        "1x_scope_us",
        "4x_scope_us",
        "25x_scope_us",
        "4x_scope_us_2",
        "8x_scope_us",
        "MagWalther_PP",
        "MagWalther_PP",
        "MagWalther_PP",
        "MagWalther_PP",
        "MagWalther_PP",
        "CJ22LRBox",
    },
    {
        "cj_ak74_m",
        "CJWD40",
        "GUNOIL2",
        "CJGCK",
        "1x_scope_ru",
        "2x_scope_ru",
        "1x_scope_ru_2",
        "3x_scope_us",
        "1x_scope_us",
        "4x_scope_us",
        "4x_scope_ru_2",
        "4x_scope_ru_3",
        "25x_scope_us",
        "4x_scope_us_2",
        "8x_scope_us",
        "suppressor_ru_5_45",
        "MagAK74M",
        "MagAK74M",
        "MagAK74M",
        "MagAK74M",
        "MagAK74M",
        "CJ545Box",
    },
    {
        "cj_aa_12",
        "CJWD40",
        "GUNOIL2",
        "CJGCK",
        "1x_scope_ru",
        "3x_scope_us",
        "1x_scope_us",
        "4x_scope_us",
        "25x_scope_us",
        "4x_scope_us_2",
        "8x_scope_us",
        "MagAA12",
        "MagAA12",
        "MagAA12",
        "ShotgunShellsCarton",
        "ShotgunShellsBox",
    },
    {
        "cj_m1897_sawn",
        "CJWD40",
        "GUNOIL2",
        "CJGCK",
        "1x_scope_ru",
        "3x_scope_us",
        "1x_scope_us",
        "4x_scope_us",
        "25x_scope_us",
        "4x_scope_us_2",
        "8x_scope_us",
        "ShotgunShellsCarton",
        "ShotgunShellsBox",
    },
    {
        "cj_mp5sd2",
        "CJWD40",
        "GUNOIL2",
        "CJGCK",
        "1x_scope_ru",
        "3x_scope_us",
        "1x_scope_us_2",
        "1x_scope_us_3",
        "1x_scope_us",
        "4x_scope_us",
        "25x_scope_us",
        "4x_scope_us_2",
        "8x_scope_us",
        "MagMP5SD2",
        "MagMP5SD2",
        "MagMP5SD2",
        "MagMP5SD2",
        "MagMP5SD2",
        "Bullets9mmBox",
    },
}

Events.OnLoad.Add(function()
    local testItem = getItem("RFNGP_GunCase_M249")
    local testItem2 = getItem("OpenCJGCK")
    if testItem or testItem2 then
        gunLockers = {}
        if testItem then
            for i = 1, #gunLockersRain42 do
                gunLockers[#gunLockers+1] = gunLockersRain42[i]
            end
        end
        if testItem2 then
            for i = 1, #gunLockersVanillaExpansion do
                gunLockers[#gunLockers+1] = gunLockersVanillaExpansion[i]
            end
        end
    end
end)

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

--- Given a list of items, remove any that are in the excludeItems list
--- @param items table{string}
--- @return table{string}
local function removeExcludeItems(items)
    if not items then return {} end
    local quickExclude = {}
    for i = 1, #excludeItems do
        quickExclude[excludeItems[i]] = true
    end
    local newItems = {}
    for i = 1, #items do
        local item = items[i]
        if item and type(item) == "string" then
            DWAPUtils.dprint("removeExcludeItems")
            DWAPUtils.dprint(item)
            DWAPUtils.dprint("type "..type(item))
            if convertItems[item] then
                item = convertItems[item]
            end
            local exclude = false
            if quickExclude[item] then
                exclude = true
            else
                for j = 1, #excludeItems do
                    if item == excludeItems[j] or (type(item) == "string" and item:match(excludeItems[j])) then
                        exclude = true
                        break
                    end
                end
            end
            if not exclude then
                table.insert(newItems, item)
            end
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

--- Get the cache key for a set of distribution lists
--- @param distLists table{string}
--- @param includeJunk boolean
--- @return string
local function getDistItemsCacheKey(distLists, includeJunk)
    local key = ""
    for i = 1, #distLists do
        local dlist = distLists[i]
        if i > 1 then key = key .. "," end
        key = key .. dlist
    end
    if includeJunk then
        key = key .. "true"
    else
        key = key .. "false"
    end
    return key
end

local getDistItemsCache = {}
local function getDistItems(distLists, includeJunk)
    if not distLists then return {} end
    if "string" == type(distLists) then
        distLists = { distLists }
    end
    local key = getDistItemsCacheKey(distLists, includeJunk)
    if getDistItemsCache[key] then
        return getDistItemsCache[key]
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
    getDistItemsCache[key] = items
    return items
end

local function populateItems()
    local items = getAllItems()
    local is = items:size()-1
    for i = 0, is do
        local item = items:get(i)
        if item and not item:getObsolete() and not item:isHidden() then
            --- @type string
            local name = item:getName()
            --- @type string
            local module = item:getModuleName()
            --- @type string
            local category = item:getDisplayCategory()
            if category == "SkillBook" and not (name:find("Set")) and not item:getLuaCreate() then
                if item:hasTag("Magazine") then
                    table.insert(allSkillMags, module .. "." .. name)
                    excludeItems[#excludeItems+1] = name
                else
                    table.insert(allSkillBooks, module .. "." .. name)
                    excludeItems[#excludeItems+1] = name
                end
            elseif item:hasTag("isSeed") then
                table.insert(allSeeds, module .. "." .. name)
                excludeItems[#excludeItems+1] = name
            elseif category == "Cartography" and name ~= "Map" then
                table.insert(allMaps, module .. "." .. name)
                excludeItems[#excludeItems+1] = name
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
    DWAPUtils.dprint("excludeItems: " .. #excludeItems)
    DWAPUtils.dprint(excludeItems)
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

local function addItem(container, item, count, frozen)
    local _count = count or 1
    if not item or not container then
        DWAPUtils.dprint("WARN addItem: item or container is nil")
        return
    end
    if item == "VHS_Retail" or item == "Base.VHS_Retail" then
        item = nameMediaItem(item, "MagazineCrossword")
        container:AddItem(item)
    elseif item == "Disc_Retail" or item == "Base.Disc_Retail" then
        item = nameMediaItem(item, "MagazineWordsearch")
        container:AddItem(item)
        -- string contains "Empty"
    elseif item:match("Empty") then
        item = handleEmptyItem(item)
        container:AddItem(item)
    else
        if frozen then
            for i = 1, _count do
                local result = container:AddItem(item)
                if instanceof(result, "Food") then
                    DWAPUtils.dprint("Freezing item: " .. item)
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
            elseif config.special == "essentials" then
                for i = 1, #essentials do
                    local item = essentials[i]
                    if item then
                        addItem(container, item)
                    end
                end
            elseif config.special == "gunlocker" and level < 4 then -- specifically loads a single gun and clips/ammo for a locker
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
                end
            end
        elseif config.randUntilFull then
            DWAPUtils.dprint("randUntilFull")
            local items = {}
            if config.items then
                for i = 1, #config.items do
                    items[#items+1] = config.items[i].name
                end
            elseif config.dist then
                items = getDistItems(config.dist, config.distIncludeJunk)
            end
            local alreadySpawnedContainers = {}
            if not items then return end
            local item = items[random:random(1, #items)]
            local hasRoom = checkHasRoom(container, level)
            local tries = 0
            while hasRoom and tries < 100 do
                if not items or #items < 2 and alreadySpawnedContainers and #alreadySpawnedContainers > 0 then
                    for i = 0, #alreadySpawnedContainers do
                        items[#items+1] = alreadySpawnedContainers[i]
                    end
                    alreadySpawnedContainers = {}
                    DWAPUtils.dprint("Added containers to items: " .. #alreadySpawnedContainers)
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
                            DWAPUtils.dprint("Added container: " .. item)
                        end
                    end
                end
                tries = tries + 1
            end
        else
            DWAPUtils.dprint("final loot else")
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
end

local function loadConfigs()
    local configs = DWAPUtils.loadConfigs()
    local safehouseIndex = DWAPUtils.selectedSafehouse or SandboxVars.DWAP.Safehouse - 1
    local nonPrimaryLootLevel = SandboxVars.DWAP.Loot
    populateItems()
    for i = 1, #configs do
        local config = configs[i]
        if config and config.loot then
            if (nonPrimaryLootLevel == 1 and i ~= safehouseIndex) or nonPrimaryLootLevel == 4 then
                config.loot = {}
            else
                local rewwriteLevel = nonPrimaryLootLevel == 3 and i ~= safehouseIndex
                for j = 1, #config.loot do
                    if rewwriteLevel and type(config.loot[j].level) == "string" then
                        -- overwrite to low
                        config.loot[j].level = 3
                    end
                    setLootConfigValue(config.loot[j])
                    -- try to precache the items
                    if config.loot[j].dist then
                        getDistItems(config.loot[j].dist, config.loot[j].distIncludeJunk)
                    end
                end
            end
        end
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
    if not SandboxVars.DWAP.Loot or SandboxVars.DWAP.Loot > 3 then return end
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
    if not SandboxVars.DWAP.Loot or SandboxVars.DWAP.Loot > 3 then return end
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
