local wtc = { x = 12327, y = 1326, z = -1 } -- waterTankCoords
local pb1 = { x = 12325, y = 1325, z = -1 }
local LVPawnshop = {
    group = "Louisville",
    baseBuildings = {
        { x = 12324, y = 1325, z = 0 },  -- pawnshop
        { x = 12324, y = 1325, z = -1 }, -- basement
    },
    spawn = { x = 12326, y = 1329, z = 0 },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = { x = 12331, y = 1326, z = -1 } },
    },
    waterFixtures = {
        -- pawnshop proper
        { sprite = "fixtures_bathroom_01_5",  x = 12329, y = 1327, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_15",    x = 12329, y = 1328, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

        -- basement
        { sprite = "fixtures_sinks_01_8",     x = 12324, y = 1333, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_8",  x = 12317, y = 1334, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_3",  x = 12317, y = 1336, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_33", x = 12315, y = 1336, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_17",    x = 12315, y = 1334, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_32",    x = 12310, y = 1334, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "appliances_laundry_01_1", x = 12310, y = 1336, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

        -- upstairs apts
        { sprite = "fixtures_sinks_01_8",     x = 12328, y = 1330, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_25", x = 12328, y = 1327, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_0",  x = 12329, y = 1327, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_2",     x = 12330, y = 1327, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

        { sprite = "fixtures_sinks_01_8",     x = 12322, y = 1330, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_25", x = 12322, y = 1327, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_0",  x = 12323, y = 1327, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_2",     x = 12324, y = 1327, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

        { sprite = "fixtures_sinks_01_10",    x = 12321, y = 1330, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_25", x = 12321, y = 1327, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_0",  x = 12320, y = 1327, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_2",     x = 12319, y = 1327, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

        { sprite = "fixtures_sinks_01_8",     x = 12310, y = 1328, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_25", x = 12310, y = 1325, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_0",  x = 12311, y = 1325, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_2",     x = 12312, y = 1325, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

    },
    doorKeys = {
        name = "Pawnshop",
        doors = {
            { sprite = "fixtures_doors_02_5",  x = 12318, y = 1335, z = 0, },
            { sprite = "fixtures_doors_01_33", x = 12332, y = 1331, z = 0, },
            { sprite = "fixtures_doors_02_5",  x = 12332, y = 1327, z = 1, },
            { sprite = "fixtures_doors_01_33", x = 12322, y = 1334, z = -1, },
        },
    },
    map = { name = "DWAPStashMap13", },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 12331, y = 1326, z = pb1.z },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 12329, y = 1326, z = -1, },
            fakeGenerators = {
                { x = 12326, y = 1337, z = -1, createTile = false },
            },
        },
    },
    objectSpawns = {
        { sprite = "industry_02_175", x = pb1.x,             y = pb1.y,                       z = pb1.z, disabled = "EnableGenSystemSolar", clearExisting = true, },

        { barricade = "metal",        enabled = "Barricade", target = "walls_commercial_01_41", x = 12311, y = 1337,                        z = 0, },
        { barricade = "metal",        enabled = "Barricade", target = "walls_commercial_01_41", x = 12312, y = 1337,                        z = 0, },
        { barricade = "metal",        enabled = "Barricade", target = "walls_commercial_01_41", x = 12314, y = 1337,                        z = 0, },
        { barricade = "metal",        enabled = "Barricade", target = "walls_commercial_01_41", x = 12315, y = 1337,                        z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "fixtures_doors_01_49", x = 12318, y = 1336,                          z = 0, },
        { barricade = "metal",        enabled = "Barricade", target = "walls_commercial_01_41", x = 12321, y = 1337,                        z = 0, },
        { barricade = "metal",        enabled = "Barricade", target = "walls_commercial_01_41", x = 12322, y = 1337,                        z = 0, },
        { barricade = "metal",        enabled = "Barricade", target = "walls_commercial_01_41", x = 12324, y = 1337,                        z = 0, },
        { barricade = "metal",        enabled = "Barricade", target = "walls_commercial_01_41", x = 12325, y = 1337,                        z = 0, },
    },
    loot = {
        -- basement
        -- kitchen/rec room
        { -- E1 trash box by entry
            note = "smallbox @ kitchen",
            coords = { x = 12330, y = 1329, z = -1 },
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E2
            note = "sidetable @ kitchen",
            coords = { x = 12328, y = 1329, z = -1 },
            dist = { "CrateVHSTapes" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E3
            note = "woodstove @ kitchen",
            coords = { x = 12327, y = 1329, z = -1 },
            items = {
                { name = 'Base.Firewood', chance = 1, count = { 10, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E4
            note = "counter @ kitchen",
            coords = { x = 12324, y = 1331, z = -1 },
            dist = { "Homesteading", },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E5
            note = "counter @ kitchen",
            coords = { x = 12324, y = 1331, z = -1 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E6
            note = "counter @ kitchen",
            coords = { x = 12324, y = 1332, z = -1 },
            dist = { "CrateCannedFood", },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E7
            note = "counter @ kitchen",
            coords = { x = 12324, y = 1332, z = -1 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E8
            note = "counter @ kitchen",
            coords = { x = 12324, y = 1333, z = -1 },
            dist = { "GigamartDryGoods" },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E9
            note = "counter @ kitchen",
            coords = { x = 12324, y = 1333, z = -1 },
            slot = "upper",
            dist = { "KitchenCannedFood" },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E10
            note = "counter @ kitchen",
            coords = { x = 12324, y = 1334, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E11
            note = "counter @ kitchen",
            coords = { x = 12324, y = 1334, z = -1 },
            slot = "upper",
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E12 fridge
            note = "fridge @ kitchen",
            coords = { x = 12324, y = 1336, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E13
            note = "fridge @ kitchen",
            coords = { x = 12324, y = 1336, z = -1 },
            slot = "freezer",
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E14 bookcases
            note = "shelves @ kitchen",
            coords = { x = 12331, y = 1335, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E15
            note = "shelves @ kitchen",
            coords = { x = 12331, y = 1334, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E16
            note = "shelves @ kitchen",
            coords = { x = 12331, y = 1333, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        -- armory
        { -- E17
            note = "militarylocker @ security",
            coords = { x = 12323, y = 1334, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E18
            note = "militarylocker @ security",
            coords = { x = 12323, y = 1335, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E19
            note = "militarylocker @ security",
            coords = { x = 12323, y = 1336, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        -- bunk room 1
        { -- E20
            note = "militarycrate @ bedroom",
            coords = { x = 12320, y = 1336, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E21
            note = "locker @ bedroom",
            coords = { x = 12319, y = 1336, z = -1 },
            dist = { "FishermanTools" },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E22
            note = "locker @ bedroom",
            coords = { x = 12318, y = 1334, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        -- bathroom
        { -- E23
            note = "counter @ bathroom",
            coords = { x = 12315, y = 1334, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPMed",
        },
        { -- E24
            note = "medicine @ bathroom",
            coords = { x = 12315, y = 1334, z = -1 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPMed",
        },
        -- bunk room
        { -- E25
            note = "locker @ bedroom",
            coords = { x = 12312, y = 1334, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E26
            note = "medicine @ bedroom",
            coords = { x = 12314, y = 1334, z = -1 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E27
            note = "militarycrate @ bedroom",
            coords = { x = 12314, y = 1336, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -- laundry room
        { -- E28
            note = "counter @ laundry",
            coords = { x = 12310, y = 1335, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        -- warehouse
        { -- E29
            note = "metal_shelves @ warehouse",
            coords = { x = 12323, y = 1328, z = -1 },
            special = "essentials",
        },
        { -- E30
            note = "metal_shelves @ warehouse",
            coords = { x = 12323, y = 1327, z = -1 },
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E31 freezer
            note = "freezer @ warehouse",
            coords = { x = 12323, y = 1325, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E32 freezer
            note = "freezer @ warehouse",
            coords = { x = 12322, y = 1325, z = -1 },
            dist = { "FreezerIceCream", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E33 freezer
            note = "freezer @ warehouse",
            coords = { x = 12321, y = 1325, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E34
            note = "metal_shelves @ warehouse",
            coords = { x = 12320, y = 1325, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E35
            note = "metal_shelves @ warehouse",
            coords = { x = 12319, y = 1325, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E36 metal shelves
            note = "metal_shelves @ warehouse",
            coords = { x = 12317, y = 1326, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E37
            note = "metal_shelves @ warehouse",
            coords = { x = 12316, y = 1326, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E38
            note = "metal_shelves @ warehouse",
            coords = { x = 12314, y = 1326, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E39
            note = "metal_shelves @ warehouse",
            coords = { x = 12313, y = 1326, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E40 wood crates
            note = "crate @ warehouse",
            coords = { x = 12320, y = 1327, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E41
            note = "crate @ warehouse",
            coords = { x = 12319, y = 1327, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFarm",
        },
        { -- E42
            note = "crate @ warehouse",
            coords = { x = 12319, y = 1327, z = -1 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPFarm",
        },
        { -- E43 metal shelves
            note = "metal_shelves @ warehouse",
            coords = { x = 12317, y = 1328, z = -1 },
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = { 8, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E44
            note = "metal_shelves @ warehouse",
            coords = { x = 12316, y = 1328, z = -1 },
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E45
            note = "metal_shelves @ warehouse",
            coords = { x = 12314, y = 1328, z = -1 },
            items = {
                { name = 'Base.Firewood', chance = 1, count = { 10, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E46
            note = "metal_shelves @ warehouse",
            coords = { x = 12313, y = 1328, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E47 cardboardboxes
            note = "cardboardbox @ warehouse",
            coords = { x = 12320, y = 1329, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E48
            note = "cardboardbox @ warehouse",
            coords = { x = 12319, y = 1329, z = -1 },
            dist = { "ToolFactoryHandles" },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E49 cardboardboxes
            note = "cardboardbox @ warehouse",
            coords = { x = 12320, y = 1330, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E50
            note = "cardboardbox @ warehouse",
            coords = { x = 12319, y = 1330, z = -1 },
            dist = { "CrateToiletPaper" },
            distIncludeJunk = false,
            tag = "DWAPTools",
        },
        { -- E51 metal shelves
            note = "metal_shelves @ warehouse",
            coords = { x = 12317, y = 1330, z = -1 },
            dist = { "CrateLumber" },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E52
            note = "metal_shelves @ warehouse",
            coords = { x = 12316, y = 1330, z = -1 },
            dist = { "CrateSheetMetal", },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E53
            note = "metal_shelves @ warehouse",
            coords = { x = 12314, y = 1330, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E54
            note = "metal_shelves @ warehouse",
            coords = { x = 12313, y = 1330, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E55 metal shelves
            note = "metal_shelves @ warehouse",
            coords = { x = 12320, y = 1332, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E56
            note = "metal_shelves @ warehouse",
            coords = { x = 12319, y = 1332, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E57
            note = "metal_shelves @ warehouse",
            coords = { x = 12317, y = 1332, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E58
            note = "metal_shelves @ warehouse",
            coords = { x = 12316, y = 1332, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E59
            note = "metal_shelves @ warehouse",
            coords = { x = 12314, y = 1332, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E60
            note = "metal_shelves @ warehouse",
            coords = { x = 12313, y = 1332, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        -- Pawnshop
        { -- E61
            note = "counter @ pawnshop",
            coords = { x = 12321, y = 1327, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E62
            note = "counter @ pawnshop",
            coords = { x = 12319, y = 1327, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E63 closet
            note = "metal_shelves @ janitor",
            coords = { x = 12330, y = 1329, z = 0 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        -- pawnshop gun room
        { -- E64
            note = "locker @ gunstore",
            coords = { x = 12328, y = 1329, z = 0 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E65
            note = "locker @ gunstore",
            coords = { x = 12329, y = 1329, z = 0 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        -- pawnshop proper
        { -- E66
            note = "metal_shelves @ pawnshop",
            coords = { x = 12333, y = 1332, z = 0 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E67
            note = "shelves @ pawnshop",
            coords = { x = 12321, y = 1331, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E68
            note = "metal_shelves @ pawnshop",
            coords = { x = 12332, y = 1332, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E69
            note = "metal_shelves @ pawnshop",
            coords = { x = 12331, y = 1332, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E70
            note = "sidetable @ livingroom",
            coords = { x = 12328, y = 1335, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E71
            note = "metal_shelves @ pawnshop",
            coords = { x = 12310, y = 1325, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E72
            note = "metal_shelves @ pawnshop",
            coords = { x = 12311, y = 1325, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E73
            note = "metal_shelves @ pawnshop",
            coords = { x = 12312, y = 1325, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E74
            note = "metal_shelves @ pawnshop",
            coords = { x = 12313, y = 1325, z = 0 },
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = { 8, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E75
            note = "toolcabinet @ pawnshop",
            coords = { x = 12329, y = 1336, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E76
            note = "shelves @ pawnshop",
            coords = { x = 12316, y = 1325, z = 0 },
            slot = "upper",
            dist = { "GasStoreEmergency" },
            distIncludeJunk = true,
            level = 2,
        },
        { -- E77
            note = "shelves @ pawnshop",
            coords = { x = 12317, y = 1325, z = 0 },
            slot = "upper",
            dist = { "StoreCounterTobacco" },
            distIncludeJunk = true,
            level = 1,
        },
        { -- E78
            note = "shelves @ pawnshop",
            coords = { x = 12318, y = 1325, z = 0 },
            slot = "upper",
            dist = { "CandyStoreSnacks" },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E79
            note = "counter @ pawnshop",
            coords = { x = 12315, y = 1325, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        -- storage room
        { -- E80
            note = "metal_shelves @ pawnshop",
            coords = { x = 12322, y = 1327, z = 0 },
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            level = "Loot_BuildMatsLevel",
        },
        { -- E81
            note = "metal_shelves @ pawnshop",
            coords = { x = 12322, y = 1328, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E82
            note = "metal_shelves @ pawnshop",
            coords = { x = 12322, y = 1330, z = 0 },
            dist = { "WeldingWorkshopMetal", },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E83
            note = "metal_shelves @ pawnshop",
            coords = { x = 12322, y = 1331, z = 0 },
            dist = { "CrateLumber" },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E84
            note = "metal_shelves @ pawnshop",
            coords = { x = 12324, y = 1327, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E85
            note = "metal_shelves @ pawnshop",
            coords = { x = 12324, y = 1328, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E86
            note = "metal_shelves @ pawnshop",
            coords = { x = 12324, y = 1330, z = 0 },
            dist = { "ToolFactoryIngots" },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E87
            note = "metal_shelves @ pawnshop",
            coords = { x = 12324, y = 1331, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },

        -- apts
        { -- E88
            note = "counter @ kitchen",
            coords = { x = 12330, y = 1329, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E89
            note = "locker @ livingroom",
            coords = { x = 12329, y = 1332, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E90
            note = "fridge @ kitchen",
            coords = { x = 12328, y = 1331, z = 1 },
            slot = "freezer",
            dist = { "FreezerIceCream", },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E91
            note = "fridge @ kitchen",
            coords = { x = 12322, y = 1331, z = 1 },
            slot = "freezer",
            dist = { "FreezerRich", },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E92
            note = "dresser @ livingroom",
            coords = { x = 12322, y = 1336, z = 1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E93
            note = "counter @ kitchen",
            coords = { x = 12324, y = 1329, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(LVPawnshop.objectSpawns,
        { enabled = "EnableLadders", sprite = "industry_trucks_01_49", x = 12322, y = 1313, z = -1, clearExisting = true, replaceWall = true, })
    table.insert(LVPawnshop.objectSpawns,
        { enabled = "EnableLadders", x = 12323, y = 1313, z = -1, clearExisting = true, })
    table.insert(LVPawnshop.objectSpawns,
        { enabled = "EnableLadders", x = 12324, y = 1313, z = -1, clearExisting = true, })
    table.insert(LVPawnshop.objectSpawns, { enabled = "EnableLadders", removeFloor = true, x = 12321, y = 1313, z = 0, })
    table.insert(LVPawnshop.objectSpawns,
        { enabled = "EnableLadders", sprite = "floors_interior_tilesandwood_01_31", x = 12323, y = 1313, z = 0, })
    table.insert(LVPawnshop.objectSpawns,
        { enabled = "EnableLadders", sprite = "floors_interior_tilesandwood_01_31", x = 12324, y = 1313, z = 0, })
end

return LVPawnshop
