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
    "Essential_Bag_ALICE_BeltSus_Camo",
    "SleepingBag_Camo_Packed",
    "TentGreen_Packed",
    "EntrenchingTool",
    "FlashLight_AngleHead_Army",
    "ClayTool",
    "Saw",
    "MetalworkingPliers",
    "Tongs",
    "WeldingMask",
    "BlowTorch",
    "Crowbar",
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
    "CanteenMilitary",
    "Bag_ALICEpack_Army",
    "Shoes_ArmyBoots",
    "Trousers_Padded_HuntingCamo",
    "Vest_Hunting_Camo",
    "Jacket_HuntingCamo",
    "WristWatch_Left_DigitalBlack",
}
local essentialsAlice = {
    "MagnesiumFirestarter",
    "WaterPurificationTablets",
    "AlcoholBandage",
    "Pills",
    "PillsSleepingTablets",
    "PillsAntiDep",
    "PillsBeta",
    "PillsVitamins",
    "Eraser",
    "Pencil",
    "Pen",
    "Scissors",
    "Handiknife",
    "RubberHose",
    "PonchoGreen",
    "Battery",
    "Notebook",
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
    "RollingPin",
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

-- limit to 1 of an item
local throttleSpawn = {
    ["CDplayer"] = true,
    ["Earbuds"] = true,
    ["Headphones"] = true,
    ["TvWideScreen"] = true,
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

local gunLockersFirearmsMod = {
}

local function respectFirearmsModSandboxSettings()
    LootSuppressor = (SandboxVars.Firearms.LootSuppressor)

    SpawnAK47 = (SandboxVars.Firearms.SpawnAK47)
    SpawnSKS = (SandboxVars.Firearms.SpawnSKS)
    SpawnM1Garand = (SandboxVars.Firearms.SpawnM1Garand)
    SpawnMP5 = (SandboxVars.Firearms.SpawnMP5)
    SpawnMAC10 = (SandboxVars.Firearms.SpawnMAC10)
    SpawnUZI = (SandboxVars.Firearms.SpawnUZI)
    SpawnSPAS12 = (SandboxVars.Firearms.SpawnSPAS12)
    SpawnWinchester73 = (SandboxVars.Firearms.SpawnWinchester73)
    SpawnWinchester94 = (SandboxVars.Firearms.SpawnWinchester94)
    SpawnRossi92 = (SandboxVars.Firearms.SpawnRossi92)
    SpawnPython = (SandboxVars.Firearms.SpawnPython)
    SpawnAR15 = (SandboxVars.Firearms.SpawnAR15)
    SpawnColtAce = (SandboxVars.Firearms.SpawnColtAce)
    SpawnColtScout = (SandboxVars.Firearms.SpawnColtScout)
    SpawnM733 = (SandboxVars.Firearms.SpawnM733)
    SpawnGlock17 = (SandboxVars.Firearms.SpawnGlock17)
    SpawnAnaconda = (SandboxVars.Firearms.SpawnAnaconda)
    SpawnFNFal = (SandboxVars.Firearms.SpawnFNFal)
    SpawnG3 = (SandboxVars.Firearms.SpawnG3)
    SpawnM37 = (SandboxVars.Firearms.SpawnM37)
    SpawnM16A2 = (SandboxVars.Firearms.SpawnM16A2)
    SpawnM24 = (SandboxVars.Firearms.SpawnM24)
    SpawnRuger22 = (SandboxVars.Firearms.SpawnRuger22)
    SpawnMossberg500 = (SandboxVars.Firearms.SpawnMossberg500)
    SpawnMossberg500Tactical = (SandboxVars.Firearms.SpawnMossberg500Tactical)
    SpawnRemington870 = (SandboxVars.Firearms.SpawnRemington870)
    SpawnICA19 = (SandboxVars.Firearms.SpawnICA19)

    SpawnSuppressors = (SandboxVars.Firearms.SpawnSuppressors)
    SpawnHandgunSuppressors = (SandboxVars.Firearms.SpawnHandgunSuppressors)
    SpawnRifleSuppressors = (SandboxVars.Firearms.SpawnRifleSuppressors)
    SpawnShotgunSuppressors = (SandboxVars.Firearms.SpawnShotgunSuppressors)

    if SpawnAK47 then
        local akItems = {
            "AK47",
            "AK_Mag",
            "AK_Mag",
            "AK_Mag",
            "AK_Mag",
            "AK_Mag",
            "Sling_Camo",
            "Rifle_Flashlight",
            "762x39Box",
        }
        if SpawnSuppressors and SpawnRifleSuppressors then
            table.insert(akItems, "308Silencer")
        end
        gunLockersFirearmsMod[#gunLockersFirearmsMod + 1] = akItems
    end
    if SpawnSKS then
        local sksItems = {
            "SKS",
            "Sling_Olive",
            "Rifle_Flashlight",
            "762x39Box",
        }
        if SpawnSuppressors and SpawnRifleSuppressors then
            table.insert(sksItems, "308Silencer")
        end
        gunLockersFirearmsMod[#gunLockersFirearmsMod + 1] = sksItems
    end
    if SpawnM1Garand then
        local m1Items = {
            "M1Garand",
            "M1GarandClip",
            "M1GarandClip",
            "M1GarandClip",
            "M1GarandClip",
            "M1GarandClip",
            "Sling_Leather",
            "Bullets3006Box",
        }
        if SpawnSuppressors and SpawnRifleSuppressors then
            table.insert(m1Items, "ImprovisedSilencer")
        end
        gunLockersFirearmsMod[#gunLockersFirearmsMod + 1] = m1Items
    end
    if SpawnMP5 then
        local mp5Items = {
            "MP510",
            "MP510Mag",
            "MP510Mag",
            "MP510Mag",
            "MP510Mag",
            "MP510Mag",
            "MP5_Stock_Extended",
            "Sling_Camo",
            "RedDot",
            "x2Scope",
            "x4Scope",
            "Bullets10mmBox",
        }
        if SpawnSuppressors and SpawnHandgunSuppressors then
            table.insert(mp5Items, "10mmSilencer")
        end
        gunLockersFirearmsMod[#gunLockersFirearmsMod + 1] = mp5Items
    end
    if SpawnMAC10 then
        local mac10Items = {
            "Mac10",
            "Mac10Mag",
            "Mac10Mag",
            "Mac10Mag",
            "Mac10Mag",
            "Mac10Mag",
            "Mac10_Stock_Extended",
            "Sling",
            "RedDot",
            "x2Scope",
            "Bullets45Box",
        }
        if SpawnSuppressors and SpawnHandgunSuppressors then
            table.insert(mac10Items, "45Silencer")
        end
        gunLockersFirearmsMod[#gunLockersFirearmsMod + 1] = mac10Items
    end
    if SpawnUZI then
        local uziItems = {
            "UZI",
            "UZIMag",
            "UZIMag",
            "UZIMag",
            "UZIMag",
            "UZIMag",
            "9mmCompensator",
            "UZI_Stock_Extended",
            "Sling",
            "RedDot",
            "x2Scope",
            "Bullets9mmBox",
        }
        if SpawnSuppressors and SpawnHandgunSuppressors then
            table.insert(uziItems, "9mmSilencer")
        end
        gunLockersFirearmsMod[#gunLockersFirearmsMod + 1] = uziItems
    end
    if SpawnSPAS12 then
        local SPAS12Items = {
            "SPAS12",
            "AmmoStock",
            "SPAS12_Stock_Extended",
            "GunLightImprovised",
            "ChokeTubeFull",
            "ChokeTubeImproved",
            "Sling_Leather",
            "ShotgunShellsBox",
        }
        if SpawnSuppressors and SpawnShotgunSuppressors then
            table.insert(SPAS12Items, "ShotgunSilencer")
        end
        gunLockersFirearmsMod[#gunLockersFirearmsMod + 1] = SPAS12Items
    end
    if SpawnWinchester73 then
        local win73Items = {
            "Winchester73",
            "Sling",
            "RecoilPad",
            "AmmoStraps",
            "Bullets4440Box",
        }
        if SpawnSuppressors and SpawnRifleSuppressors then
            table.insert(win73Items, "ImprovisedSilencer")
        end
        gunLockersFirearmsMod[#gunLockersFirearmsMod + 1] = win73Items
    end
    if SpawnAR15 then
        local ar15Items = {
            "AR15",
            "556Clip",
            "556Clip",
            "556Clip",
            "556Clip",
            "556Clip",
            "Rifle_Flashlight",
            "Sling",
            "x4ACOGScope",
            "556Box",
        }
        if SpawnSuppressors and SpawnRifleSuppressors then
            table.insert(ar15Items, "ImprovisedSilencer")
        end
        gunLockersFirearmsMod[#gunLockersFirearmsMod + 1] = ar15Items
    end
    if SpawnGlock17 then
        local glock17Items = {
            "Glock17",
            "Glock17Mag",
            "Glock17Mag",
            "Glock17Mag",
            "Glock17Mag",
            "Glock17Mag",
            "9mmCompensator",
            "GunLight",
            "Laser",
            "RedDot",
            "Bullets9mmBox",
        }
        if SpawnSuppressors and SpawnHandgunSuppressors then
            table.insert(glock17Items, "9mmSilencer")
        end
        gunLockersFirearmsMod[#gunLockersFirearmsMod + 1] = glock17Items
    end
end

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

-- Per-item weight boosts applied AFTER a pool resolves to {name, weight}.
-- The v2 tag pools name whole vanilla ProceduralDistributions lists; the
-- per-item weights inside those lists come from the base game and are
-- otherwise unreachable from our configs. This is the one lever to re-rank a
-- single item within a pool without forking the vanilla distribution.
--
-- Each rule is a Lua pattern matched against the (bare) item name and a
-- multiplier applied once to the summed weight. Order matters only in that the
-- first matching rule wins (break below). Seeded to lift canned-food "boxes"
-- (a full case of cans), which vanilla weights ~100x below the single cans
-- (0.02-0.1 vs 2-8); x25 lands a box near ~1.5 -- an occasional find that still
-- stays below a single can. Patterns are unanchored at the start so a
-- "Base."-qualified name still matches; the "_Box$" tail keeps them off the
-- single cans.
local WEIGHT_BOOSTS = {
    { pattern = "Canned%w*_Box$", mult = 25 },
    { pattern = "Tinned%w*_Box$", mult = 25 },
    { pattern = "TunaTin_Box$", mult = 25 },
    { pattern = "MysteryCan_Box$", mult = 25 },
    { pattern = "Macandcheese_Box$", mult = 25 },
}

--- Get all of the items from the distribution lists, then filter them and save it to the cache variable
--- @param distLists table[string]: The distribution list to get the items from
--- @param distIncludeJunk boolean: Whether to include junk items in the list
local function getCachedDistItemList(_distLists, distIncludeJunk)
    local cacheKey = getDistCacheKey(_distLists, distIncludeJunk)
    if cachedDistItemLists[cacheKey] then
        return cachedDistItemLists[cacheKey]
    end

    local distLists = _distLists

    -- Weighted builder: an array of { name = <string>, weight = <number> }.
    -- indexByName maps a name to its slot in `items` so that repeated vanilla
    -- names SUM their weights instead of collapsing to a single equal-weight
    -- entry (vanilla repeats a name to make it more common; that repeat signal
    -- plus the numeric weight are both recovered here in one pass).
    local items = {}
    local indexByName = {}

    -- Fold one name/weight pair into the builder: apply the convertItems remap
    -- and excludeItems filtering (unchanged from before), default a missing or
    -- non-number weight to 1, and either append a new entry or add to the
    -- weight of an existing one.
    local function addWeighted(name, weight)
        if convertItems[name] then
            name = convertItems[name]
        end
        if not name or type(name) ~= "string" or excludeItems[name] then
            return
        end
        if type(weight) ~= "number" then
            weight = 1
        end
        local existing = indexByName[name]
        if existing then
            items[existing].weight = items[existing].weight + weight
        else
            items[#items + 1] = { name = name, weight = weight }
            indexByName[name] = #items
        end
    end

    for i = 1, #distLists do
        local distList = distLists[i]
        local distListItems
        -- interleaved: vanilla ProceduralDistributions items are a flat
        -- name/weight array ({ "Name", w, "Name2", w2, ... }); the
        -- Distributions fallback below is a bare-string array with no weights.
        local interleaved = true
        if ProceduralDistributions.list[distList] and ProceduralDistributions.list[distList].items then
            -- Read the vanilla array without aliasing or mutating it; the
            -- builder copies each pair out into its own entries.
            distListItems = ProceduralDistributions.list[distList].items
        else
            local distTable = Distributions[1]
            distListItems = {}
            interleaved = false
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
            if interleaved then
                -- Walk name/weight pairs; a missing trailing weight defaults to
                -- 1 inside addWeighted (weight arg is nil).
                for j = 1, #distListItems, 2 do
                    addWeighted(distListItems[j], distListItems[j + 1])
                end
            else
                -- Fallback path yields bare strings; give each weight 1.
                for j = 1, #distListItems do
                    addWeighted(distListItems[j], 1)
                end
            end
        end

        -- Fold junk into the pool when requested. Only the interleaved
        -- ProceduralDistributions branch has a .junk (the Distributions
        -- dot-path fallback does not). The junk ITEMS live at .junk.items --
        -- the same interleaved name/weight array shape as the main .items --
        -- NOT at .junk itself (a { rolls, items } hash with no integer keys).
        -- Route each pair through addWeighted (writes only into the local
        -- builder, never the vanilla table) at weight * 0.5. Vanilla applies a
        -- flat x1.4 junk boost (§3.6); DWAP deliberately rolls junk BELOW
        -- vanilla to cut container clutter (0.5 ~= 1/3 of vanilla's weight --
        -- raise toward 1.4 to restore vanilla junk density, or lower toward 0
        -- for less). A missing trailing weight defaults to 1 inside
        -- addWeighted, so multiply an explicit 1 in that case.
        if distIncludeJunk and interleaved then
            local junk = ProceduralDistributions.list[distList]
                and ProceduralDistributions.list[distList].junk
            local junkItems = junk and junk.items
            if junkItems and #junkItems > 0 then
                for j = 1, #junkItems, 2 do
                    local w = junkItems[j + 1]
                    if type(w) ~= "number" then w = 1 end
                    addWeighted(junkItems[j], w * 0.5)
                end
            end
        end
    end

    -- Re-rank individual items within the resolved pool. Runs once per unique
    -- (dist set, junk) key because the result is cached below; weightedPickIndex
    -- reads these weights directly.
    for i = 1, #items do
        local nm = items[i].name
        for b = 1, #WEIGHT_BOOSTS do
            if string.find(nm, WEIGHT_BOOSTS[b].pattern) then
                items[i].weight = items[i].weight * WEIGHT_BOOSTS[b].mult
                break
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
    -- Authoritative, category-independent detection: read the item script's own
    -- fields. A skill book declares SkillTrained (getSkillTrained ~= ""); a
    -- recipe magazine declares LearnedRecipes (getLearnedRecipes non-empty).
    -- Both are base script-Item accessors, so this is safe for every item from
    -- getAllItems(). The old display-category string test ("SkillBook") let any
    -- skill book with a different category leak, which surfaced once tag
    -- migration broadened Media containers onto the full book-dist pool. Reading
    -- the fields catches them regardless of category or the MAGAZINE tag.
    local skill = item:getSkillTrained()
    if skill and skill ~= "" then
        return 1
    end
    -- Recipe magazine = teaches recipes AND is tagged a magazine. The MAGAZINE
    -- gate is essential: seed packets (*BagSeed) also carry LearnedRecipes
    -- ("base:carrot growing season" etc.) but are NOT magazines, and must fall
    -- through to the seed branch in populateItems, not be stripped as skill mags.
    local recipes = item:getLearnedRecipes()
    if recipes and recipes:size() > 0 and item:hasTag(ItemTag.MAGAZINE) then
        return 2
    end
    -- Fallback heuristic for anything the fields miss (kept from before). The
    -- "Set" guard only applies here so a skill-book set still resolves above.
    if name:find("Set") then return 0 end
    -- 42.20 moved recipe/skill magazines from SkillBook to RecipeResource
    if (category == "SkillBook" or category == "RecipeResource") and item:hasTag(ItemTag.MAGAZINE) then
        return 2
    end
    if category == "SkillBook" then
        return 1
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
    if item:hasTag(ItemTag.IS_SEED) and not item:hasTag(ItemTag.IS_CUTTING) and item:getActualWeight() < 1 then
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
    if getActivatedMods():contains("\\2256623447/firearmmod") or getActivatedMods():contains("\\2256623447/firearmmodbeta") then
        gunLockers = {}
        respectFirearmsModSandboxSettings()
        for i = 1, #gunLockersFirearmsMod do
            gunLockers[#gunLockers+1] = gunLockersFirearmsMod[i]
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
--- @return table, table: The list of essentials and essentialsAlice
function DWAP_LootSpawning.getEssentials()
    return essentials, essentialsAlice
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

--- Check if an item is in the throttleSpawn list
--- @param item string: The item to check
--- @return boolean : True if the item is in the throttleSpawn list, false otherwise
function DWAP_LootSpawning.isThrottleSpawnItem(item)
    if not item or type(item) ~= "string" then
        return false
    end
    return throttleSpawn[item]
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
        -- Return a SHALLOW COPY of the cached outer array: a fresh table whose
        -- elements are the same inner { name, weight } refs. Callers nil out
        -- OUTER slots (holes) and append entries; they never mutate the inner
        -- tables, so the cached array stays canonical for every consumer.
        local cached = getCachedDistItemList(distLists, distIncludeJunk)
        for i = 1, #cached do
            items[i] = cached[i]
        end
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
