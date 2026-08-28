local wtc1 = { x = 10773, y = 10551, z = -1, }
local pb1 = { x = 10771, y = 10551, z = -1 }
local RustyRifle = {
    group = "Muldraugh",
    baseBuildings = {
        { x = 10748, y = 10543, z = 1 },  --main bar
        { x = 10764, y = 10544, z = -1 }, --bar basement
        { x = 10765, y = 10553, z = -1 }, --extended basement
        { x = 10778, y = 10574, z = 0 },  --workshop/booze storage
        { x = 10763, y = 10529, z = 0 },  --shed
    },
    spawn = { x = 10748, y = 10543, z = 1 },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 10770, y = 10551, z = pb1.z },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 10768, y = 10551, z = -1, },
            fakeGenerators = {
                { x = 10759, y = 10549, z = -1, createTile = true },
                { x = 10775, y = 10566, z = -1, createTile = true },
            },
        },
    },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc1.x, y = wtc1.y, z = wtc1.z, sourceType = "generator", source = { x = 10770, y = 10551, z = -1 } },
    },
    waterFixtures = {
        -- owner's suite
        { sprite = "fixtures_sinks_01_5",     x = 10753, y = 10546, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_33", x = 10753, y = 10544, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_2",     x = 10754, y = 10544, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_0",  x = 10755, y = 10544, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        -- kitchen
        { sprite = "fixtures_sinks_01_10",    x = 10755, y = 10543, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_10",    x = 10755, y = 10544, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        -- restrooms
        { sprite = "fixtures_sinks_01_13",    x = 10768, y = 10545, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_13",    x = 10768, y = 10544, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_0",  x = 10768, y = 10542, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_0",  x = 10769, y = 10542, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_0",  x = 10770, y = 10542, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        -- shelter
        { sprite = "fixtures_bathroom_01_3",  x = 10764, y = 10557, z = -1, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_16",    x = 10760, y = 10556, z = -1, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_17",    x = 10764, y = 10562, z = -1, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
    },
    doorKeys = {
        name = "Rusty Rifle",
        doors = {
            { sprite = "location_community_church_small_01_65", x = 10761, y = 10554, z = 0, },
            { sprite = "fixtures_doors_01_7",                   x = 10776, y = 10575, z = 0, },
            { sprite = "fixtures_doors_01_29",                  x = 10762, y = 10531, z = 0, },
            { sprite = "fixtures_doors_01_37",                  x = 10750, y = 10595, z = 0, },
            { sprite = "fixtures_doors_01_9",                   x = 10765, y = 10548, z = -1, },
        },
    },
    map = { name = "DWAPStashMap23", },
    objectSpawns = {
        -- { sprite = "crafted_01_11", x = wtc1.x, y = wtc1.y, z = wtc1.z, enabled = "EnableWaterSystem", }, -- invisible "tank" to simulate the well
        -- { sprite = "camping_01_64", x = 10776, y = 10563, z = 0, enabled = "EnableWaterSystem", }, -- fountain
        { sprite = "industry_02_175", x = pb1.x,             y = pb1.y,                                      z = pb1.z, disabled = "EnableGenSystemSolar", clearExisting = true, },

        -- { sprite = "fixtures_railings_01_29", x = 10777, y = 10577, z = 0, clearExisting = true, }, -- basement railing
        -- { sprite = "fixtures_railings_01_29", x = 10778, y = 10577, z = 0, clearExisting = true, }, -- basement railing
        -- { sprite = "fixtures_railings_01_29", x = 10779, y = 10577, z = 0, clearExisting = true, }, -- basement railing
        -- { sprite = "fixtures_railings_01_28", x = 10780, y = 10577, z = 0, clearExisting = true, }, -- basement railing
        -- { sprite = "fixtures_railings_01_31", x = 10780, y = 10577, z = 0, }, -- basement railing

        -- -- between basements door
        -- { sprite = "location_sewer_01_19", x = 10765, y = 10548, z = -1, replaceWall = true, },
        -- { sprite = "fixtures_doors_01_9", x = 10765, y = 10548, z = -1, isDoor = true, doorN = true, },
        -- { sprite = "location_sewer_01_0", x = 10766, y = 10548, z = -1, replaceWall = true, },

        -- basement bookshelves
        -- { sprite = "furniture_shelving_01_40", x = 10764, y = 10542, z = -1, isContainer = true, clearExisting = false, },
        -- { sprite = "furniture_shelving_01_40", x = 10765, y = 10542, z = -1, isContainer = true, clearExisting = false, },
        -- { sprite = "furniture_shelving_01_40", x = 10766, y = 10542, z = -1, isContainer = true, clearExisting = false, },

        { barricade = "metalbar",     enabled = "Barricade", target = "walls_exterior_wooden_01_33",         x = 10748, y = 10548,                         z = 1, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "fixtures_doors_01_5",                 x = 10748, y = 10548,                         z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_exterior_wooden_01_33",         x = 10754, y = 10548,                         z = 0, },
        { barricade = "metalbar",     enabled = "Barricade", target = "walls_exterior_wooden_01_33",         x = 10754, y = 10548,                         z = 1, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_exterior_wooden_01_33",         x = 10757, y = 10555,                         z = 0, },
        { barricade = "wood",         enabled = "Barricade", target = "walls_exterior_wooden_01_33",         x = 10759, y = 10555,                         z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "location_community_church_small_01_65", x = 10761, y = 10555,                       z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_exterior_wooden_01_33",         x = 10764, y = 10555,                         z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_exterior_wooden_01_33",         x = 10766, y = 10555,                         z = 0, },
    },
    loot = {
        -- owner suite
        -- bedroom
        { -- E1
            note = "shelves @ bedroom",
            coords = { x = 10747, y = 10543, z = 1 },
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E2
            note = "dresser @ bedroom",
            coords = { x = 10750, y = 10542, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E3
            note = "wardrobe @ bedroom",
            coords = { x = 10749, y = 10544, z = 1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E4
            note = "wardrobe @ bedroom",
            coords = { x = 10750, y = 10544, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -- hallway
        { -- E5
            note = "shelves @ lobby",
            coords = { x = 10751, y = 10542, z = 1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E6
            note = "dishescabinet @ lobby",
            coords = { x = 10752, y = 10542, z = 1 },
            dist = { "CrateToiletPaper" },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E7
            note = "dishescabinet @ lobby",
            coords = { x = 10753, y = 10542, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E8
            note = "counter @ lobby",
            coords = { x = 10754, y = 10542, z = 1 },
            special = "essentials",
        },
        { -- E9
            note = "counter @ lobby",
            coords = { x = 10755, y = 10542, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        -- living room
        { -- E10
            note = "shelves @ livingroom",
            coords = { x = 10750, y = 10545, z = 1 },
            dist = { "MusicStoreCDs" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        -- kitchen
        { -- E11
            note = "counter @ kitchen",
            coords = { x = 10753, y = 10546, z = 1 },
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E12
            note = "shelves @ kitchen",
            coords = { x = 10755, y = 10546, z = 1 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        -- bathroom
        { -- E13
            note = "counter @ bathroom",
            coords = { x = 10754, y = 10544, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        -- storage closet
        { -- E14
            note = "cardboardbox @ barstorage",
            coords = { x = 10766, y = 10543, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E15
            note = "cardboardbox @ barstorage",
            coords = { x = 10766, y = 10542, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E16
            note = "cardboardbox @ barstorage",
            coords = { x = 10766, y = 10542, z = 1 },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E17
            note = "cardboardbox @ barstorage",
            coords = { x = 10767, y = 10542, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        -- main floor
        -- bar area
        { -- E18
            note = "counter @ bar",
            coords = { x = 10756, y = 10544, z = 0 },
            dist = { "CrateLiquor" },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E19
            note = "counter @ bar",
            coords = { x = 10756, y = 10543, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E20
            note = "counter @ bar",
            coords = { x = 10756, y = 10542, z = 0 },
            dist = { "StoreKitchenCafe" },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E21
            note = "fridge @ bar",
            coords = { x = 10758, y = 10542, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E22
            note = "freezer @ bar",
            coords = { x = 10758, y = 10542, z = 0 },
            slot = "freezer",
            dist = { "FreezerIceCream", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E23
            note = "shelves @ bar",
            coords = { x = 10760, y = 10542, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPBooze",
        },
        { -- E24
            note = "counter @ bar",
            coords = { x = 10762, y = 10542, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E25
            note = "counter @ bar",
            coords = { x = 10759, y = 10544, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E26
            note = "counter @ bar",
            coords = { x = 10762, y = 10544, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -- main kitchen
        { -- E27
            note = "fridge @ barkitchen",
            coords = { x = 10755, y = 10545, z = 0 },
            dist = { "PizzaKitchenFridge" },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E28
            note = "freezer @ barkitchen",
            coords = { x = 10755, y = 10545, z = 0 },
            slot = "freezer",
            dist = { "PizzaKitchenFreezer", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E29
            note = "counter @ barkitchen",
            coords = { x = 10755, y = 10544, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E30
            note = "counter @ barkitchen",
            coords = { x = 10755, y = 10543, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E31
            note = "counter @ barkitchen",
            coords = { x = 10755, y = 10542, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E32
            note = "counter @ barkitchen",
            coords = { x = 10753, y = 10542, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E33
            note = "counter @ barkitchen",
            coords = { x = 10752, y = 10542, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E34
            note = "freezer @ barkitchen",
            coords = { x = 10753, y = 10547, z = 0 },
            dist = { "FreezerIceCream", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E35
            note = "freezer @ barkitchen",
            coords = { x = 10754, y = 10547, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        -- garage
        { -- E36
            note = "metal_shelves @ garage",
            coords = { x = 10747, y = 10546, z = 0 },
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            level = "Loot_BuildMatsLevel",
        },
        { -- E37
            note = "metal_shelves @ garage",
            coords = { x = 10747, y = 10545, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E38
            note = "toolcabinet @ garage",
            coords = { x = 10747, y = 10544, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E39
            note = "metal_shelves @ garage",
            coords = { x = 10747, y = 10542, z = 0 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E40
            note = "smallbox @ garage",
            coords = { x = 10751, y = 10542, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        -- basement
        -- first room
        { -- E41
            note = "shelves @ distillerystorage",
            coords = { x = 10764, y = 10542, z = -1, },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E42
            note = "shelves @ distillerystorage",
            coords = { x = 10765, y = 10542, z = -1, },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E43
            note = "shelves @ distillerystorage",
            coords = { x = 10766, y = 10542, z = -1, },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E44
            note = "freezer @ distillerystorage",
            coords = { x = 10767, y = 10547, z = -1 },
            dist = { "FreezerIceCream", },
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        { -- E45
            note = "crate @ distillerystorage",
            coords = { x = 10766, y = 10547, z = -1 },
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E46
            note = "freezer @ hallway",
            coords = { x = 10766, y = 10550, z = -1 },
            dist = { "FreezerIceCream", },
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        { -- E47
            note = "freezer @ hallway",
            coords = { x = 10766, y = 10551, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        { -- E48
            note = "fridge @ hallway",
            coords = { x = 10766, y = 10552, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFridge",
        },
        { -- E49
            note = "freezer @ hallway",
            coords = { x = 10766, y = 10552, z = -1 },
            slot = "freezer",
            dist = { "FreezerGeneric" },
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        -- shelter room
        { -- E50
            note = "militarylocker @ storage",
            coords = { x = 10763, y = 10557, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E51
            note = "militarylocker @ storage",
            coords = { x = 10762, y = 10557, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E52
            note = "counter @ storage",
            coords = { x = 10760, y = 10557, z = -1 },
            dist = { "BakeryKitchenFreezer" },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E53
            note = "overhead @ storage",
            coords = { x = 10760, y = 10557, z = -1 },
            slot = "upper",
            dist = { "ArmyStorageAmmunition", },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E54
            note = "counter @ storage",
            coords = { x = 10760, y = 10556, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E55
            note = "overhead @ storage",
            coords = { x = 10760, y = 10556, z = -1 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E56
            note = "counter @ storage",
            coords = { x = 10760, y = 10555, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E57
            note = "overhead @ storage",
            coords = { x = 10760, y = 10555, z = -1 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        -- gambling room
        { -- E58
            note = "shelves @ storage",
            coords = { x = 10761, y = 10562, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E59
            note = "shelves @ storage",
            coords = { x = 10762, y = 10562, z = -1 },
            dist = { "CrateLiquor", "DishCabinetVIPLounge" },
            distIncludeJunk = false,
            level = 3,
        },
        { -- E60
            note = "shelves @ storage",
            coords = { x = 10763, y = 10562, z = -1 },
            dist = { "CrateLiquor", "DishCabinetVIPLounge" },
            distIncludeJunk = true,
            level = 3,
        },
        { -- E61
            note = "counter @ storage",
            coords = { x = 10764, y = 10562, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        -- workshop area
        { -- E62
            note = "metal_shelves @ barstorage",
            coords = { x = 10782, y = 10575, z = 0 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E63
            note = "crate @ barstorage",
            coords = { x = 10782, y = 10573, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E64
            note = "crate @ barstorage",
            coords = { x = 10782, y = 10573, z = 0 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E65
            note = "crate @ barstorage",
            coords = { x = 10782, y = 10572, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E66
            note = "shelves @ barstorage",
            coords = { x = 10782, y = 10570, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E67
            note = "shelves @ barstorage",
            coords = { x = 10781, y = 10570, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E68
            note = "shelves @ barstorage",
            coords = { x = 10780, y = 10570, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E69
            note = "shelves @ barstorage",
            coords = { x = 10779, y = 10570, z = 0 },
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E70
            note = "shelves @ barstorage",
            coords = { x = 10782, y = 10568, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E71
            note = "shelves @ barstorage",
            coords = { x = 10781, y = 10568, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E72
            note = "shelves @ barstorage",
            coords = { x = 10780, y = 10568, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E73
            note = "shelves @ barstorage",
            coords = { x = 10779, y = 10568, z = 0 },
            sandboxEnable = 'SeedLibrary',
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = { 8, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E74
            note = "shelves @ barstorage",
            coords = { x = 10782, y = 10566, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E75
            note = "shelves @ barstorage",
            coords = { x = 10781, y = 10566, z = 0 },
            dist = { "ArmyStorageGuns", },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E76
            note = "shelves @ barstorage",
            coords = { x = 10780, y = 10566, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E77
            note = "shelves @ barstorage",
            coords = { x = 10779, y = 10566, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        -- shed out back
        { -- E78
            note = "metal_shelves @ garagestorage",
            coords = { x = 10761, y = 10531, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E79
            note = "metal_shelves @ garagestorage",
            coords = { x = 10761, y = 10530, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E80
            note = "metal_shelves @ garagestorage",
            coords = { x = 10761, y = 10528, z = 0 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E81
            note = "metal_shelves @ garagestorage",
            coords = { x = 10762, y = 10528, z = 0 },
            slot = "upper",
            dist = { "ArtStorePottery", },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E82
            note = "metal_shelves @ garagestorage",
            coords = { x = 10763, y = 10528, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(RustyRifle.objectSpawns, { enabled = "EnableLadders", x = 10752, y = 10547, z = 0, removeFloor = true, })
else
    table.insert(RustyRifle.objectSpawns,
        { sprite = "location_sewer_01_0", x = 10765, y = 10548, z = -1, replaceWall = false, })
end


return RustyRifle
