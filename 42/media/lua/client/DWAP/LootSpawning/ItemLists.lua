require 'Items/ProceduralDistributions'
require 'Items/Distributions'
require "RecordedMedia/recorded_media"
local DWAPUtils = require("DWAPUtils")
local random = newrandom()
DWAP_LootSpawning = DWAP_LootSpawning or {}

local recordedMedia
local allCDs = {}
local allVHS = {}
local allSkillBooks = {}
local skillBooks1 = {}
local skillBooks2 = {}
local allSkillMags = {}
local seedPackets = {}
local allSeeds = {}
local allMaps = {}
local cachedDistItemLists = {}
local excludeStrings = {
    "Key",
    "IDCard",
    "CreditCard",
    "HamRadio",
    "FishingTackle",
    "Paperbag",
}
local excludeItems = {
    ["TakeoutBox_Chinese"] = true,
    ["IcePick"] = true,
    ["IDcard_Blank"] = true,
    ["BLTAnnotations"] = true,
    ["HeavyChain"] = true,
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
local kitchenTools = {
    "BakingPan",
    "Kettle",
    "RoastingPan",
    "KitchenTongs",
    "GridlePan",
    "GlassTumbler",
    "GlassWine",
    "Vinegar_Jug",
    "TinOpener",
    "MugWhite",
    "MugWhite",
    "Plate",
    "Plate",
    "Saucepan",
    "Pan",
    "KitchenKnife",
    "MeatCleaver",
    "Mop",
    "Broom",
    "Bleach",
    "Sponge",
    "CleaningLiquid2",
    "MortarPestle",
    "Kettle_Copper",
    "Corkscrew",
    "CheeseCloth",
    "Pot",
    "MuffinTray",
    "BakingTray",
    "Bowl",
    "Bowl",
    "Bowl",
    "Bowl",
    "P38",
    "Spork",
    "Spork",
}
local kitchenToolsSpices = {
    "Salt",
    "Pepper",
    "Lard",
    "Ketchup",
    "Hotsauce",
    "Honey",
    "JamFruit",
    "JamMarmalade",
    "MapleSyrup",
    "Margarine",
    "Marinara",
    "Mustard",
    "OilOlive",
    "OilVegetable",
    "PeanutButter",
    "RiceVinegar",
    "Soysauce",
    "TomatoPaste",
    "Vinegar2",
    "BasilDried",
    "ChamomileDried",
    "ChivesDried",
    "CilantroDried",
    "Cinnamon",
    "MarigoldDried",
    "MintHerbDried",
    "OreganoDried",
    "ParsleyDried",
    "RosemaryDried",
    "SageDried",
    "ThymeDried",
    "Capers",
    "Olives",
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

Events.OnInitRecordedMedia.Add(function(_recordedMedia)
    --- @cast recordedMedia RecordedMedia
    recordedMedia = _recordedMedia
    allCDs = recordedMedia:getAllMediaForType(0)
    allVHS = recordedMedia:getAllMediaForCategory("Retail-VHS")
    DWAPUtils.dprint("Media Titles loaded allCDs: " .. allCDs:size() .. " allVHS: " .. allVHS:size())
end)

--- Get the cache key for the distribution list combo
--- @param distLists table[string]: The distribution list to get the cache key for
--- @param distIncludeJunk boolean: Whether to include junk items in the cache key
--- @return string: The cache key for the distribution list
local function getDistCacheKey(distLists, distIncludeJunk)
    local sorted_table = {}
    for _, v in ipairs(distLists) do
        table.insert(sorted_table, v)
    end

    -- Sort the copied table alphabetically
    table.sort(sorted_table)

    -- Concatenate the sorted strings with a delimiter
    local key = table.concat(sorted_table, ":") -- Using ":" as a delimiter
    -- If the key is longer than 60 characters, take the capitals and the next letter after them to make the key
    if #key > 60 then
        local srcKey = key
        key = ""
        for i = 1, #srcKey do
            local char = srcKey:sub(i, i)
            if char and char:match("%u") then
                local nextChar = srcKey:sub(i + 1, i + 1) or ""
                key = key .. char .. nextChar
                i = i + 1 -- Skip the next character
            end
        end
    end

    if distIncludeJunk then
        key = key .. ":junk"
    end
    return key
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

--- Get all of the items from the distribution lists, then filter them and save it to the cache variable
--- @param distLists table[string]: The distribution list to get the items from
--- @param distIncludeJunk boolean: Whether to include junk items in the list
local function getCachedDistItemList(_distLists, distIncludeJunk)
    local cacheKey = getDistCacheKey(_distLists, distIncludeJunk)
    if cachedDistItemLists[cacheKey] then
        return cachedDistItemLists[cacheKey]
    end

    local distLists = _distLists

    local tempNoDupes = {}
    local items = {}
    for i = 1, #distLists do
        local distList = distLists[i]
        local distListItems
        if ProceduralDistributions.list[distList] and ProceduralDistributions.list[distList].items then
            if distIncludeJunk then
                distListItems = ProceduralDistributions.list[distList].items
                if ProceduralDistributions.list[distList].junk and #ProceduralDistributions.list[distList].junk > 0 then
                    for j = 1, #ProceduralDistributions.list[distList].junk do
                        distListItems[#distListItems+1] = ProceduralDistributions.list[distList].junk[j]
                    end
                end
            else
                distListItems = ProceduralDistributions.list[distList].items
            end
        else
            local distTable = Distributions[1]
            distListItems = {}
            if distList:find(".") then
                local distListParts = splitDot(distList)
                for j = 1, #distListParts do
                    local distListPart = distListParts[j]
                    if distTable[distListPart] then
                        distTable = distTable[distListPart]
                    else
                        break
                    end
                end
            else
                distTable = Distributions[distList]
            end
            if distTable and distTable.items then
                distListItems = distTable.items
            end
        end
        if distListItems and #distListItems > 0 then
            for j = 1, #distListItems do
                local item = distListItems[j]
                if convertItems[item] then
                    item = convertItems[item]
                end
                if item and type(item) == "string" and not excludeItems[item] and not tempNoDupes[item] then
                    items[#items + 1] = item
                    tempNoDupes[item] = true
                end
            end
        end
    end

    cachedDistItemLists[cacheKey] = items
    return items
end

--- Test if an item is a skill book/magazine
--- @param category string: The category of the item
--- @param name string: The name of the item
--- @param item Item: The item to test
--- @return number: 0 if not a skill book, 1 if a skill book, 2 if a skill magazine
local function isSkillLiterature(category, name, item)
    if category == "SkillBook" and not (name:find("Set")) and not item:getLuaCreate() then
        if item:hasTag("Magazine") then
            return 2
        else
            return 1
        end
    end
    return 0
end

--- Test if an item is a seed
--- @param category string: The category of the item
--- @param name string: The name of the item
--- @param item Item: The item to test
--- @return boolean: True if the item is a seed, false otherwise
local function isSeed(category, name, item)
    if seedPackets[name] then
        return true
    end
    if item:hasTag("isSeed") and not item:hasTag("isCutting") and item:getActualWeight() < 1 then
        return true
    end
    return false
end

--- Test if an item is a map
--- @param category string: The category of the item
--- @param name string: The name of the item
--- @return boolean: True if the item is a map, false otherwise
local function isMap(category, name)
    return category == "Cartography" and name ~= "Map"
end

local function getSeedPacketRecipe()
    local recipes = CraftRecipeManager.getRecipesForTag("Farming")
    for i = 0, recipes:size()-1 do
        local recipe = recipes:get(i)
        if recipe and recipe:getName() == "OpenPacketOfSeeds" then
            return recipe
        end
    end
    return nil
end

--- Get specialty items like seeds, maps, and skill books, put them in their own lists and the exclude list
function DWAP_LootSpawning.populateItems()
    local startTime = getTimeInMillis()
    DWAPUtils.dprint("Populating items...")
    local seedPacketRecipe = getSeedPacketRecipe()
    if not seedPacketRecipe or not seedPacketRecipe.canUseItem then
        DWAPUtils.dprint("ERROR Seed packet recipe not found")
        return
    end
    local items = getAllItems()
    local itemSize = items:size()-1
    for i = 0, itemSize do
        local item = items:get(i)
        if item then
            local name = item:getName()
            if item:getObsolete() or item:isHidden() then
                excludeItems[name] = true
            end
            if name:find("BagSeed") then
                local canUse = seedPacketRecipe:canUseItem(tostring(name))
                DWAPUtils.dprint("Seed packet recipe can use item: " .. name .. " = " .. tostring(canUse))
            end
            if not excludeItems[name] then
                local module = item:getModuleName()
                local category = item:getDisplayCategory()
                -- is this a skill book?
                local skillBookType = isSkillLiterature(category, name, item)
                if skillBookType == 1 then
                    allSkillBooks[#allSkillBooks + 1] = module .. "." .. name
                    excludeItems[name] = true
                    excludeItems[module .. "." .. name] = true
                elseif skillBookType == 2 then
                    allSkillMags[#allSkillMags + 1] = module .. "." .. name
                    excludeItems[name] = true
                    excludeItems[module .. "." .. name] = true
                elseif isSeed(category, name, item) or seedPacketRecipe:canUseItem(name) then
                    -- is this a seed/seed packet?
                    local ii = instanceItem(module .. "." .. name)
                    if ii and (instanceof(ii, "Food") and not ii:isFresh()) then
                        allSeeds[#allSeeds + 1] = module .. "." .. name
                        excludeItems[name] = true
                        excludeItems[module .. "." .. name] = true
                    elseif ii and not instanceof(ii, "Food") then
                        allSeeds[#allSeeds + 1] = module .. "." .. name
                        excludeItems[name] = true
                        excludeItems[module .. "." .. name] = true
                    end
                elseif isMap(category, name) then
                    -- is this a map?
                    allMaps[#allMaps + 1] = module .. "." .. name
                    excludeItems[name] = true
                    excludeItems[module .. "." .. name] = true
                else
                    for j = 1, #excludeStrings do
                        if name:find(excludeStrings[j]) then
                            excludeItems[name] = true
                            excludeItems[module .. "." .. name] = true
                            break
                        end
                    end
                end
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
    local endTime = getTimeInMillis()
    DWAPUtils.dprint("Processed "..itemSize.." items in " .. (endTime - startTime) .. " ms")

    DWAPUtils.dprint("Excluded items: ")
    DWAPUtils.dprint(excludeItems)
    DWAPUtils.dprint("Excluded items end")
end

--- get the items for the special "essentials" list
--- @return table: The list of essential items
function DWAP_LootSpawning.getEssentials()
    return essentials
end

--- get the items for the special kitchenTools list
--- @return table: The list of  kitchen tools
function DWAP_LootSpawning.getKitchenTools()
    return  kitchenTools
end
--- get the items for the special kitchenToolsSpices list
--- @return table: The list of kitchen tools spices
function DWAP_LootSpawning.getKitchenToolsSpices()
    return kitchenToolsSpices
end
--- get the items for the special "gunLockers" list
--- @return table: The list of gun locker items
function DWAP_LootSpawning.getGunLockers()
    return gunLockers
end
--- get all the media names for CDs
--- @return table: The list of all CDs
function DWAP_LootSpawning.getAllCDs()
    return allCDs
end
--- get all the media names for VHS
--- @return table: The list of all VHS
function DWAP_LootSpawning.getAllVHS()
    return allVHS
end
--- get all items for skillbooks
--- @return table: The list of all skill books
function DWAP_LootSpawning.getAllSkillBooks()
    return allSkillBooks
end
--- get all items for skill magazines
--- @return table: The list of all skill magazines
function DWAP_LootSpawning.getAllSkillMags()
    return allSkillMags
end
--- get all items for first half of skill books
--- @return table: The list of all skill books
function DWAP_LootSpawning.getSkillBooks1()
    return skillBooks1
end
--- get all items for second half of skill books
--- @return table: The list of all skill books
function DWAP_LootSpawning.getSkillBooks2()
    return skillBooks2
end
--- get all items for seeds/seed packets
--- @return table: The list of all seeds/seed packets
function DWAP_LootSpawning.getAllSeeds()
    return allSeeds
end
--- get all items for maps
--- @return table: The list of all maps
function DWAP_LootSpawning.getAllMaps()
    return allMaps
end
--- get items from the distribution lists
--- @param distLists table[string]: The distribution lists to get items from
--- @param distIncludeJunk boolean: Whether to include junk items in the list
--- @return table: The list of items from the distribution lists
function DWAP_LootSpawning.getItemsWithDistLists(distLists, distIncludeJunk)
    local items = {}
    if distLists and #distLists > 0 then
        items = getCachedDistItemList(distLists, distIncludeJunk)
    end
    return items
end


local previousMediaSpawns = {}
--- Name a media item, replacing duplicates with a different item
--- @param item string: The item to name
--- @param replaceDuplicateWith? string: The item to replace duplicates with
--- @return InventoryItem
function DWAP_LootSpawning.nameMediaItem(item, replaceDuplicateWith)
    DWAPUtils.dprint("nameMediaItem: " .. tostring(item) .. " replaceDuplicateWith: " .. tostring(replaceDuplicateWith))
    local media = allVHS
    if type(item) == "string" then
        if item == "Disc_Retail" or item == "Base.Disc_Retail" then
            media = allCDs
        end
    end
    if not media then
        DWAPUtils.dprint("No media found for item: " .. tostring(item))
        return instanceItem(replaceDuplicateWith)
    end
    local ii = instanceItem(item)
    if not ii then return instanceItem(replaceDuplicateWith) end
    local tries = 0
    local found = false
    while not found and tries < 10 do
        local mediaItem = media:get(random:random(0, media:size() - 1))
        --- @type MediaData
        if mediaItem then
            local id = mediaItem:getId()
            DWAPUtils.dprint("Testing random media item id: " .. tostring(id) .. " getTranslatedTitle: " .. tostring(mediaItem:getTranslatedTitle()))
            if not replaceDuplicateWith or not previousMediaSpawns[id] then
                ii:setRecordedMediaData(mediaItem)
                previousMediaSpawns[id] = true
                return ii
            end
        end
        tries = tries + 1
    end
    if not found and replaceDuplicateWith then
        DWAPUtils.dprint("No media found for item: " .. tostring(item) .. " replacing with: " .. tostring(replaceDuplicateWith))
        return instanceItem(replaceDuplicateWith)
    end
    return ii
end
print("ItemLists.lua loaded")