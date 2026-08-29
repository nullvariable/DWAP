local wtcBasement = { x = 1248, y = 7366, z = -10 }
-- local wtcMainFloor = {x = 1242, y = 7386, z = 2}
local wtcMainFloor = { x = 1225, y = 7367, z = -1 }
local generator = { x = 1251, y = 7373, z = -10 }

local QuillManor = {
    group = "Brandenburg",               -- bit south and west but close enough
    baseBuildings = {
        { x = 1221, y = 7384, z = 1 },   -- manor
        { x = 1248, y = 7322, z = 0 },   -- shed
        { x = 1226, y = 7366, z = -10 }, -- basement
    },
    spawn = { x = 1221, y = 7384, z = 1 },
    waterTanks = {
        { sprite = "industry_02_72",  x = wtcBasement.x,  y = wtcBasement.y,  z = wtcBasement.z,  sourceType = "generator", source = { x = generator.x, y = generator.y, z = generator.z } },
        { sprite = "dwap_tiles_01_9", x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z, sourceType = "generator", source = { x = generator.x, y = generator.y, z = generator.z } },
    },
    waterFixtures = {
        -- basement - kitchen
        { sprite = "fixtures_sinks_01_18",    x = 1232, y = 7359, z = -10, sourceType = "tank", source = { x = wtcBasement.x, y = wtcBasement.y, z = wtcBasement.z } },
        { sprite = "fixtures_sinks_01_34",    x = 1236, y = 7359, z = -10, sourceType = "tank", source = { x = wtcBasement.x, y = wtcBasement.y, z = wtcBasement.z } },
        -- basement - bedroom north
        { sprite = "fixtures_bathroom_01_1",  x = 1237, y = 7360, z = -10, sourceType = "tank", source = { x = wtcBasement.x, y = wtcBasement.y, z = wtcBasement.z } },
        { sprite = "fixtures_bathroom_01_32", x = 1237, y = 7358, z = -10, sourceType = "tank", source = { x = wtcBasement.x, y = wtcBasement.y, z = wtcBasement.z } },
        { sprite = "fixtures_sinks_01_2",     x = 1239, y = 7358, z = -10, sourceType = "tank", source = { x = wtcBasement.x, y = wtcBasement.y, z = wtcBasement.z } },
        -- basement - gym
        { sprite = "fixtures_sinks_01_24",    x = 1241, y = 7371, z = -10, sourceType = "tank", source = { x = wtcBasement.x, y = wtcBasement.y, z = wtcBasement.z } },
        { sprite = "appliances_laundry_01_0", x = 1237, y = 7371, z = -10, sourceType = "tank", source = { x = wtcBasement.x, y = wtcBasement.y, z = wtcBasement.z } },
        -- basement - bedroom south
        { sprite = "fixtures_sinks_01_1",     x = 1228, y = 7373, z = -10, sourceType = "tank", source = { x = wtcBasement.x, y = wtcBasement.y, z = wtcBasement.z } },
        { sprite = "fixtures_bathroom_01_25", x = 1228, y = 7371, z = -10, sourceType = "tank", source = { x = wtcBasement.x, y = wtcBasement.y, z = wtcBasement.z } },
        { sprite = "fixtures_bathroom_01_0",  x = 1230, y = 7371, z = -10, sourceType = "tank", source = { x = wtcBasement.x, y = wtcBasement.y, z = wtcBasement.z } },
        -- basement - security bunkroom
        { sprite = "fixtures_sinks_01_17",    x = 1217, y = 7370, z = -10, sourceType = "tank", source = { x = wtcBasement.x, y = wtcBasement.y, z = wtcBasement.z } },
        { sprite = "fixtures_bathroom_01_7",  x = 1221, y = 7373, z = -10, sourceType = "tank", source = wtcBasement, }, -- security, bld 4,28#4
        -- main floors --
        -- bathroom behind elevator
        { sprite = "fixtures_bathroom_01_0",  x = 1226, y = 7364, z = 0,   sourceType = "tank", source = { x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z } },
        { sprite = "fixtures_sinks_01_6",     x = 1227, y = 7366, z = 0,   sourceType = "tank", source = { x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z } },
        -- bathroom next to kitchen
        { sprite = "fixtures_bathroom_01_3",  x = 1226, y = 7395, z = 0,   sourceType = "tank", source = { x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z } },
        { sprite = "fixtures_sinks_01_4",     x = 1225, y = 7393, z = 0,   sourceType = "tank", source = { x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z } },
        -- kitchen
        { sprite = "fixtures_sinks_01_33",    x = 1223, y = 7395, z = 0,   sourceType = "tank", source = { x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z } },
        { sprite = "appliances_laundry_01_6", x = 1217, y = 7398, z = 0,   sourceType = "tank", source = { x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z } },
        { sprite = "fixtures_sinks_01_16",    x = 1216, y = 7392, z = 0,   sourceType = "tank", source = { x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z } },
        -- 2nd floor --
        -- north bathroom
        { sprite = "fixtures_sinks_01_4",     x = 1233, y = 7366, z = 1,   sourceType = "tank", source = { x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z } },
        { sprite = "fixtures_bathroom_01_25", x = 1233, y = 7364, z = 1,   sourceType = "tank", source = { x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z } },
        { sprite = "fixtures_bathroom_01_0",  x = 1236, y = 7364, z = 1,   sourceType = "tank", source = { x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z } },
        -- south bathroom
        { sprite = "fixtures_sinks_01_4",     x = 1233, y = 7396, z = 1,   sourceType = "tank", source = { x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z } },
        { sprite = "fixtures_bathroom_01_52", x = 1233, y = 7398, z = 1,   sourceType = "tank", source = { x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z } },
        { sprite = "fixtures_bathroom_01_3",  x = 1236, y = 7398, z = 1,   sourceType = "tank", source = { x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z } },
        -- west bathroom
        { sprite = "fixtures_sinks_01_5",     x = 1222, y = 7379, z = 1,   sourceType = "tank", source = { x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z } },
        { sprite = "fixtures_bathroom_01_55", x = 1224, y = 7379, z = 1,   sourceType = "tank", source = { x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z } },
        { sprite = "fixtures_bathroom_01_3",  x = 1224, y = 7381, z = 1,   sourceType = "tank", source = { x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z } },
    },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 1251, y = 7373, z = -10 },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 1249, y = 7373, z = -10, },
            fakeGenerators = {
                { x = 1215, y = 7393, z = -1, },
                { x = 1242, y = 7393, z = -1, },
                { x = 1215, y = 7363, z = -1, },
                { x = 1242, y = 7363, z = -1, },
                { x = 1230, y = 7363, z = -9, },
                { x = 1230, y = 7363, z = -5, },
                { x = 1257, y = 7365, z = -10, },
            },
        },
    },
    doorKeys = {
        name = "Quill Manor Key",
        doors = {
            { sprite = "fixtures_doors_01_45", x = 1241, y = 7382, z = 0, },
            { sprite = "fixtures_doors_01_33", x = 1224, y = 7370, z = -10, },
        },
    },
    map = { name = "DWAPStashMap32", },
    objectSpawns = {

        { barricade = "metal",    enabled = "Barricade", target = "walls_commercial_02_54", x = 1230, y = 7364, z = 0, },
        { barricade = "metal",    enabled = "Barricade", target = "walls_commercial_02_54", x = 1239, y = 7364, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_72", x = 1242, y = 7366, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_72", x = 1242, y = 7370, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_72", x = 1242, y = 7374, z = 0, }, -- window W | hall, bld 4,28#0
        { barricade = "metalbar", enabled = "Barricade", target = "walls_commercial_02_52", x = 1242, y = 7378, z = 0, }, -- window W | hall, bld 4,28#0
        { barricade = "metalbar", enabled = "Barricade", target = "walls_commercial_02_53", x = 1242, y = 7377, z = 0, }, -- window W | hall, bld 4,28#0
        { barricade = "metalbar", enabled = "Barricade", target = "walls_commercial_02_51", x = 1242, y = 7379, z = 0, }, -- window W | hall, bld 4,28#0
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_72", x = 1242, y = 7381, z = 0, }, -- window W | hall, bld 4,28#0
        { barricade = "metalbar", enabled = "Barricade", target = "walls_commercial_02_53", x = 1242, y = 7383, z = 0, }, -- window W | hall, bld 4,28#0
        { barricade = "metalbar", enabled = "Barricade", target = "walls_commercial_02_52", x = 1242, y = 7384, z = 0, }, -- window W | hall, bld 4,28#0
        { barricade = "metalbar", enabled = "Barricade", target = "walls_commercial_02_51", x = 1242, y = 7385, z = 0, }, -- window W | hall, bld 4,28#0
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_72", x = 1242, y = 7388, z = 0, }, -- window W | hall, bld 4,28#0
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_72", x = 1242, y = 7392, z = 0, }, -- window W | diningroom, bld 4,28#0
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_72", x = 1242, y = 7396, z = 0, }, -- window W | diningroom, bld 4,28#0
        { barricade = "metalbar", enabled = "Barricade", target = "walls_commercial_02_54", x = 1239, y = 7399, z = 0, }, -- window N | diningroom, bld 4,28#0
        { barricade = "metalbar", enabled = "Barricade", target = "walls_commercial_02_54", x = 1230, y = 7399, z = 0, }, -- window N | diningroom, bld 4,28#0
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_9",  x = 1225, y = 7399, z = 0, }, -- window N | kitchen, bld 4,28#0
    },
    loot = {
        {
            note = "counter @ kitchen",
            coords = { x = 1216, y = 7395, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        {
            note = "counter @ kitchen",
            coords = { x = 1216, y = 7394, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPFish",
        },
        {
            note = "counter @ kitchen",
            coords = { x = 1216, y = 7393, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        {
            note = "fridge @ kitchen",
            coords = { x = 1223, y = 7394, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPFridge",
        },
        {
            note = "freezer @ kitchen",
            coords = { x = 1223, y = 7394, z = 0 },
            slot = "freezer",
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        {
            note = "fridge @ kitchen",
            coords = { x = 1222, y = 7394, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPFridge",
        },
        {
            note = "freezer @ kitchen",
            coords = { x = 1222, y = 7394, z = 0 },
            slot = "freezer",
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        -- only basement for now.
        -- security room
        { -- E1 desk1
            note = "desk @ security",
            coords = { x = 1221, y = 7376, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E2 desk2
            note = "desk @ security",
            coords = { x = 1218, y = 7377, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E3
            note = "counter @ security",
            coords = { x = 1222, y = 7376, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E4
            note = "counter @ security",
            coords = { x = 1222, y = 7375, z = -10 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E5
            note = "counter @ security",
            coords = { x = 1222, y = 7374, z = -10 },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        -- security bunkroom
        { -- E6
            note = "militarylocker @ security",
            coords = { x = 1217, y = 7373, z = -10 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E7
            note = "militarylocker @ security",
            coords = { x = 1217, y = 7372, z = -10 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E8
            note = "counter @ security",
            coords = { x = 1217, y = 7370, z = -10 },
            distIncludeJunk = false,
            tag = "DWAPMed",
        },
        { -- E9
            note = "medicine @ security",
            coords = { x = 1217, y = 7370, z = -10 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E10
            note = "locker @ security",
            coords = { x = 1220, y = 7370, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E11
            note = "metal_shelves @ security",
            coords = { x = 1222, y = 7370, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E12
            note = "metal_shelves @ security",
            coords = { x = 1222, y = 7371, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E13
            note = "metal_shelves @ security",
            coords = { x = 1222, y = 7372, z = -10 },
            special = "essentials",
        },
        { -- E14
            note = "metal_shelves @ security",
            coords = { x = 1222, y = 7373, z = -10 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E15
            note = "militarylocker @ security",
            coords = { x = 1220, y = 7373, z = -10 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E16
            note = "militarylocker @ security",
            coords = { x = 1219, y = 7373, z = -10 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        -- living room
        { -- E17
            note = "sidetable @ livingroom",
            coords = { x = 1217, y = 7363, z = -10 },
            dist = { "MusicStoreCDs" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E18
            note = "dishescabinet @ livingroom",
            coords = { x = 1222, y = 7358, z = -10 },
            dist = { "CrateVHSTapes" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E19
            note = "dishescabinet @ livingroom",
            coords = { x = 1223, y = 7358, z = -10 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        -- dining
        { -- E20
            note = "counter @ kitchen",
            coords = { x = 1225, y = 7361, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E21
            note = "counter @ kitchen",
            coords = { x = 1225, y = 7360, z = -10 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E22
            note = "counter @ kitchen",
            coords = { x = 1225, y = 7359, z = -10 },
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E23
            note = "counter @ kitchen",
            coords = { x = 1225, y = 7358, z = -10 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E24
            note = "counter @ kitchen",
            coords = { x = 1226, y = 7358, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E25
            note = "fridge @ kitchen",
            coords = { x = 1230, y = 7358, z = -10 },
            dist = { "BurgerKitchenFridge", },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E26
            note = "freezer @ kitchen",
            coords = { x = 1230, y = 7358, z = -10 },
            slot = "freezer",
            dist = { "BurgerKitchenFreezer", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E27
            note = "counter @ kitchen",
            coords = { x = 1231, y = 7358, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E28
            note = "counter @ kitchen",
            coords = { x = 1232, y = 7358, z = -10 },
            dist = { "KitchenCannedFood" },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E29
            note = "counter @ kitchen",
            coords = { x = 1232, y = 7359, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        -- pantry
        { -- E30
            note = "freezer @ pantry",
            coords = { x = 1233, y = 7358, z = -10 },
            dist = { "FreezerIceCream", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E31
            note = "freezer @ pantry",
            coords = { x = 1234, y = 7358, z = -10 },
            dist = { "CatfishKitchenFreezer", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E32
            note = "freezer @ pantry",
            coords = { x = 1235, y = 7358, z = -10 },
            dist = { "FreezerIceCream", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E33
            note = "freezer @ pantry",
            coords = { x = 1236, y = 7358, z = -10 },
            dist = { "ButcherFreezer", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E34
            note = "freezer @ pantry",
            coords = { x = 1236, y = 7360, z = -10 },
            dist = { "WesternKitchenFreezer", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E35
            note = "fridge @ pantry",
            coords = { x = 1236, y = 7361, z = -10 },
            dist = { "BurgerKitchenFreezer", },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E36
            note = "metal_shelves @ pantry",
            coords = { x = 1236, y = 7362, z = -10 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E37
            note = "metal_shelves @ pantry",
            coords = { x = 1236, y = 7363, z = -10 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E38
            note = "crate @ pantry",
            coords = { x = 1234, y = 7363, z = -10 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E39
            note = "crate @ pantry",
            coords = { x = 1234, y = 7363, z = -10 },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E40
            note = "crate @ pantry",
            coords = { x = 1234, y = 7363, z = -10 },
            stack = 3,
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E41
            note = "crate @ pantry",
            coords = { x = 1233, y = 7363, z = -10 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E42
            note = "crate @ pantry",
            coords = { x = 1233, y = 7363, z = -10 },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E43
            note = "crate @ pantry",
            coords = { x = 1233, y = 7363, z = -10 },
            stack = 3,
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E44
            note = "metal_shelves @ pantry",
            coords = { x = 1234, y = 7361, z = -10 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E45
            note = "metal_shelves @ pantry",
            coords = { x = 1233, y = 7361, z = -10 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        -- rec area/hallway
        { -- E46
            note = "shelves @ recreation",
            coords = { x = 1228, y = 7370, z = -10 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E47
            note = "shelves @ recreation",
            coords = { x = 1228, y = 7369, z = -10 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E48
            note = "dishescabinet @ recreation",
            coords = { x = 1233, y = 7364, z = -10 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E49
            note = "dishescabinet @ recreation",
            coords = { x = 1234, y = 7364, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E50
            note = "dishescabinet @ recreation",
            coords = { x = 1241, y = 7365, z = -10 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E51
            note = "dishescabinet @ recreation",
            coords = { x = 1242, y = 7365, z = -10 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        -- north bedroom
        { -- E52
            note = "dresser @ bedroom",
            coords = { x = 1242, y = 7358, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E53
            note = "counter @ bedroom",
            coords = { x = 1239, y = 7358, z = -10 },
            distIncludeJunk = false,
            tag = "DWAPMed",
        },
        { -- E54
            note = "wardrobe @ bedroom",
            coords = { x = 1244, y = 7364, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E55
            note = "wardrobe @ bedroom",
            coords = { x = 1243, y = 7364, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -- generator room/warehouse
        { -- E56
            note = "crate @ warehouse",
            coords = { x = 1250, y = 7365, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E57
            note = "crate @ warehouse",
            coords = { x = 1250, y = 7365, z = -10 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E58
            note = "crate @ warehouse",
            coords = { x = 1251, y = 7365, z = -10 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E59
            note = "crate @ warehouse",
            coords = { x = 1251, y = 7365, z = -10 },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E60
            note = "counter @ warehouse",
            coords = { x = 1252, y = 7365, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E61
            note = "counter @ warehouse",
            coords = { x = 1254, y = 7365, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E62
            note = "counter @ warehouse",
            coords = { x = 1256, y = 7365, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E63
            note = "metal_shelves @ warehouse",
            coords = { x = 1256, y = 7370, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E64
            note = "metal_shelves @ warehouse",
            coords = { x = 1256, y = 7371, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E65
            note = "metal_shelves @ warehouse",
            coords = { x = 1256, y = 7373, z = -10 },
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E66
            note = "metal_shelves @ warehouse",
            coords = { x = 1256, y = 7374, z = -10 },
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = { 8, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E67
            note = "metal_shelves @ warehouse",
            coords = { x = 1256, y = 7376, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E68
            note = "metal_shelves @ warehouse",
            coords = { x = 1256, y = 7377, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E69
            note = "metal_shelves @ warehouse",
            coords = { x = 1254, y = 7370, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E70
            note = "metal_shelves @ warehouse",
            coords = { x = 1254, y = 7371, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E71
            note = "metal_shelves @ warehouse",
            coords = { x = 1254, y = 7373, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E72
            note = "metal_shelves @ warehouse",
            coords = { x = 1254, y = 7374, z = -10 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E73
            note = "metal_shelves @ warehouse",
            coords = { x = 1254, y = 7376, z = -10 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E74
            note = "metal_shelves @ warehouse",
            coords = { x = 1254, y = 7377, z = -10 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E75
            note = "metal_shelves @ warehouse",
            coords = { x = 1252, y = 7370, z = -10 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E76
            note = "metal_shelves @ warehouse",
            coords = { x = 1252, y = 7371, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E77
            note = "metal_shelves @ warehouse",
            coords = { x = 1250, y = 7370, z = -10 },
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E78
            note = "metal_shelves @ warehouse",
            coords = { x = 1250, y = 7371, z = -10 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E79
            note = "metal_shelves @ warehouse",
            coords = { x = 1248, y = 7370, z = -10 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E80
            note = "metal_shelves @ warehouse",
            coords = { x = 1248, y = 7371, z = -10 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        -- gym
        { -- E81
            note = "metal_shelves @ gym",
            coords = { x = 1240, y = 7377, z = -10 },
            dist = { "FitnessTrainer" },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E82
            note = "clothingdryer @ gym",
            coords = { x = 1238, y = 7371, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -- south bedroom
        { -- E83
            note = "filingcabinet @ bedroom",
            coords = { x = 1231, y = 7371, z = -10 },
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E84
            note = "desk @ bedroom",
            coords = { x = 1232, y = 7371, z = -10 },
            dist = { "MusicStoreCDs" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E85
            note = "wardrobe @ bedroom",
            coords = { x = 1233, y = 7376, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E86
            note = "wardrobe @ bedroom",
            coords = { x = 1233, y = 7377, z = -10 },
            dist = { "CrateVHSTapes" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E87
            note = "dresser @ bedroom",
            coords = { x = 1228, y = 7377, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E88
            note = "counter @ bedroom",
            coords = { x = 1228, y = 7373, z = -10 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E89
            note = "medicine @ bedroom",
            coords = { x = 1228, y = 7373, z = -10 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
    },
}

-- if getActivatedMods():contains("\\Gelevator") then
--     table.insert(QuillManor.objectSpawns, { sprite = "blends_natural_01_23", x = 1228, y = 7363, z = 0, isFloor = true, })
--     table.insert(QuillManor.objectSpawns, { sprite = "blends_natural_01_23", x = 1227, y = 7363, z = 0, isFloor = true, })
--     table.insert(QuillManor.objectSpawns, { sprite = "blends_natural_01_23", x = 1226, y = 7363, z = 0, isFloor = true, })
-- else
--     table.insert(QuillManor.objectSpawns, { sprite = "fixtures_railings_01_29", x = 1226, y = 7363, z = 0, })
--     table.insert(QuillManor.objectSpawns, { sprite = "fixtures_railings_01_29", x = 1227, y = 7363, z = 0, })
--     table.insert(QuillManor.objectSpawns, { sprite = "fixtures_railings_01_29", x = 1228, y = 7363, z = 0, })
--     table.insert(QuillManor.objectSpawns, { sprite = "fixtures_railings_01_28", x = 1229, y = 7363, z = 0, })
--     table.insert(QuillManor.objectSpawns, { x = 1226, y = 7378, z = -10, removeWall = "north", })
-- end
return QuillManor
