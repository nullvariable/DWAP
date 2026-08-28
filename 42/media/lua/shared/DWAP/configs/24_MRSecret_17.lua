local wtc1 = { x = 9850, y = 13117, z = -4, }
local pb1 = { x = 9850, y = 13108, z = -1 }
local MRSecret = {
    group = "March Ridge",
    baseBuildings = {
        { x = 9850, y = 13111, z = 1 },  -- apartment
        { x = 9841, y = 13119, z = -4 }, -- basement
        { x = 9833, y = 13127, z = 0 },  -- shed
    },
    spawn = { x = 9850, y = 13111, z = 1 },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 9848, y = 13117, z = -4 },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 9846, y = 13117, z = -4, },
            fakeGenerators = {
                { x = 9849, y = 13128, z = -1, createTile = true },
                { x = 9849, y = 13103, z = -1, createTile = true },
            },
        },
    },
    waterTanks = {
        { sprite = "dwap_tiles_01_8", x = wtc1.x, y = wtc1.y, z = wtc1.z, sourceType = "generator", source = { x = 9848, y = 13117, z = -4 } },
    },
    waterFixtures = {
        -- apts
        { sprite = "fixtures_sinks_01_8",     x = 9844, y = 13121, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_2",     x = 9851, y = 13120, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_0",  x = 9852, y = 13120, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_55", x = 9851, y = 13122, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_2",     x = 9850, y = 13120, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_2",     x = 9851, y = 13120, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_0",  x = 9852, y = 13120, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },

        { sprite = "fixtures_sinks_01_8",     x = 9844, y = 13118, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_0",     x = 9851, y = 13119, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_3",  x = 9852, y = 13119, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_55", x = 9851, y = 13117, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_0",     x = 9850, y = 13119, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_0",     x = 9851, y = 13119, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_3",  x = 9852, y = 13119, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },

        { sprite = "fixtures_sinks_01_8",     x = 9844, y = 13109, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_2",     x = 9851, y = 13108, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_0",  x = 9852, y = 13108, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_55", x = 9851, y = 13110, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_2",     x = 9850, y = 13108, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_2",     x = 9851, y = 13108, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_0",  x = 9852, y = 13108, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },

        { sprite = "fixtures_sinks_01_8",     x = 9844, y = 13106, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_0",     x = 9851, y = 13107, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_3",  x = 9852, y = 13107, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_55", x = 9851, y = 13105, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_0",     x = 9850, y = 13107, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_0",     x = 9851, y = 13107, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_3",  x = 9852, y = 13107, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },

        { sprite = "fixtures_sinks_01_8",     x = 9844, y = 13097, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_2",     x = 9851, y = 13096, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_0",  x = 9852, y = 13096, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_55", x = 9851, y = 13098, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_2",     x = 9850, y = 13096, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_2",     x = 9851, y = 13096, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_0",  x = 9852, y = 13096, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },

        { sprite = "fixtures_sinks_01_8",     x = 9844, y = 13094, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_0",     x = 9851, y = 13095, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_3",  x = 9852, y = 13095, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_55", x = 9851, y = 13093, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_0",     x = 9850, y = 13095, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_0",     x = 9851, y = 13095, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_3",  x = 9852, y = 13095, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },

        -- basement
        { sprite = "fixtures_sinks_01_25",    x = 9834, y = 13119, z = -1, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_25",    x = 9834, y = 13119, z = -4, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },

        { sprite = "fixtures_bathroom_01_32", x = 9840, y = 13114, z = -4, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_2",     x = 9842, y = 13114, z = -4, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_0",  x = 9843, y = 13114, z = -4, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_0",  x = 9844, y = 13114, z = -4, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_2",     x = 9845, y = 13114, z = -4, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_25", x = 9847, y = 13114, z = -4, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "appliances_laundry_01_2", x = 9850, y = 13123, z = -4, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
    },
    doorKeys = {
        name = "March Ridge Complex",
        doors = {
            { sprite = "fixtures_doors_01_28", x = 9834, y = 13129, z = 0, },
            { sprite = "fixtures_doors_01_44", x = 9853, y = 13124, z = 0, },
            { sprite = "fixtures_doors_01_32", x = 9851, y = 13114, z = -1, },
        },
    },
    map = { name = "DWAPStashMap24", },
    objectSpawns = {
        { barricade = "metalbar",     target="fixtures_windows_01_1", x = 9833, y = 13131, z = 0, }, -- window N | garagestorage, bld 38,51#4
        { barricade = "metalbar",     target="fixtures_windows_01_0", x = 9835, y = 13127, z = 0, }, -- window W | garagestorage, bld 38,51#4

        { barricade = "wood",         enabled = "Barricade",            target = "walls_exterior_house_02_40", x = 9853,  y = 13121,                         z = 0, },
        { barricade = "wood",         enabled = "Barricade",            target = "walls_exterior_house_02_40", x = 9853,  y = 13118,                         z = 0, },
        { barricade = "wood",         enabled = "Barricade",            target = "walls_exterior_house_02_40", x = 9853,  y = 13109,                         z = 0, },
        { barricade = "wood",         enabled = "Barricade",            target = "walls_exterior_house_02_40", x = 9853,  y = 13106,                         z = 0, },
        { barricade = "wood",         enabled = "Barricade",            target = "walls_exterior_house_02_40", x = 9853,  y = 13097,                         z = 0, },
        { barricade = "wood",         enabled = "Barricade",            target = "walls_exterior_house_02_40", x = 9853,  y = 13094,                         z = 0, },
        { barricade = "wood",         enabled = "Barricade",            target = "fixtures_doors_01_44",       x = 9854,  y = 13091,                         z = 0, },
        { barricade = "wood",         enabled = "Barricade",            target = "fixtures_doors_01_44",       x = 9854,  y = 13100,                         z = 0, },
        { barricade = "wood",         enabled = "Barricade",            target = "fixtures_doors_01_44",       x = 9854,  y = 13103,                         z = 0, },
        { barricade = "wood",         enabled = "Barricade",            target = "fixtures_doors_01_44",       x = 9854,  y = 13115,                         z = 0, },
        { barricade = "wood",         enabled = "Barricade",            target = "fixtures_doors_01_44",       x = 9854,  y = 13124,                         z = 0, },

        { barricade = "wood",         enabled = "Barricade",            target = "fixtures_doors_01_44",       x = 9844,  y = 13124,                         z = 0, },
        { barricade = "wood",         enabled = "Barricade",            target = "walls_interior_house_04_92", x = 9844,  y = 13121,                         z = 0, },
        { barricade = "wood",         enabled = "Barricade",            target = "walls_interior_house_04_92", x = 9844,  y = 13118,                         z = 0, },
        { barricade = "wood",         enabled = "Barricade",            target = "fixtures_doors_01_44",       x = 9844,  y = 13115,                         z = 0, },
        { barricade = "wood",         enabled = "Barricade",            target = "walls_interior_house_04_92", x = 9844,  y = 13109,                         z = 0, },
        { barricade = "wood",         enabled = "Barricade",            target = "walls_interior_house_04_92", x = 9844,  y = 13106,                         z = 0, },
        { barricade = "wood",         enabled = "Barricade",            target = "fixtures_doors_01_44",       x = 9844,  y = 13103,                         z = 0, },
        { barricade = "wood",         enabled = "Barricade",            target = "fixtures_doors_01_44",       x = 9844,  y = 13100,                         z = 0, },
        { barricade = "wood",         enabled = "Barricade",            target = "walls_interior_house_04_92", x = 9844,  y = 13097,                         z = 0, },
        { barricade = "wood",         enabled = "Barricade",            target = "walls_interior_house_04_92", x = 9844,  y = 13094,                         z = 0, },
        { barricade = "wood",         enabled = "Barricade",            target = "fixtures_doors_01_44",       x = 9844,  y = 13091,                         z = 0, },
    },
    loot = {
        -- spawn apartment
        -- 2nd floor
        -- bedroom
        { -- E1
            note = "shelves @ bedroom",
            coords = { x = 9852, y = 13110, z = 1 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E2
            note = "sidetable @ bedroom",
            coords = { x = 9853, y = 13113, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E3
            note = "dresser @ bedroom",
            coords = { x = 9849, y = 13112, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -- office
        { -- E4
            note = "militarylocker @ bedroom",
            coords = { x = 9847, y = 13108, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E5
            note = "desk @ bedroom",
            coords = { x = 9844, y = 13109, z = 1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        -- closet
        { -- E6
            note = "metal_shelves @ closet",
            coords = { x = 9849, y = 13108, z = 1 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -- bathroom
        { -- E7
            note = "counter @ bathroom",
            coords = { x = 9850, y = 13108, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E8
            note = "counter @ bathroom",
            coords = { x = 9851, y = 13108, z = 1 },
            dist = { "BathroomCounter" },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -- first floor
        -- bathroom
        { -- E9
            note = "counter @ bathroom",
            coords = { x = 9851, y = 13108, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        -- kitchen
        { -- E10
            note = "counter @ kitchen",
            coords = { x = 9846, y = 13108, z = 0 },
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E11
            note = "counter @ kitchen",
            coords = { x = 9844, y = 13108, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E12
            note = "counter @ kitchen",
            coords = { x = 9844, y = 13109, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E13
            note = "counter @ kitchen",
            coords = { x = 9844, y = 13110, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E14
            note = "fridge @ kitchen",
            coords = { x = 9844, y = 13113, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E15
            note = "freezer @ kitchen",
            coords = { x = 9844, y = 13113, z = 0 },
            slot = "freezer",
            dist = { "FreezerGeneric" },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E16
            note = "counter @ kitchen",
            coords = { x = 9845, y = 13113, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E17
            note = "freezer @ kitchen",
            coords = { x = 9848, y = 13108, z = 0 },
            dist = { "FreezerIceCream", },
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        { -- E18
            note = "freezer @ livingroom",
            coords = { x = 9849, y = 13108, z = 0 },
            dist = { "FreezerIceCream", },
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        -- apt 1 extras
        { -- E19
            note = "counter @ kitchen",
            coords = { x = 9844, y = 13120, z = 0 },
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E20
            note = "counter @ kitchen",
            coords = { x = 9844, y = 13121, z = 0 },
            dist = { "CrateVHSTapes" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E21
            note = "counter @ kitchen",
            coords = { x = 9844, y = 13122, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E22
            note = "fridge @ kitchen",
            coords = { x = 9844, y = 13125, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E23
            note = "counter @ kitchen",
            coords = { x = 9845, y = 13125, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E24
            note = "counter @ kitchen",
            coords = { x = 9844, y = 13098, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E25
            note = "freezer @ kitchen",
            coords = { x = 9844, y = 13101, z = 0 },
            slot = "freezer",
            dist = { "FreezerIceCream", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E26
            note = "counter @ kitchen",
            coords = { x = 9845, y = 13101, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        -- entrance shed
        { -- E27
            note = "metal_shelves @ garagestorage",
            coords = { x = 9831, y = 13126, z = 0 },
            sandboxEnable = 'SeedLibrary',
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = { 8, 10 } },
            },
            level = "Loot_FarmLevel",
        },

        -- complex, -1
        -- guard station
        { -- E28
            note = "counter @ hall",
            coords = { x = 9831, y = 13124, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E29
            note = "counter @ hall",
            coords = { x = 9832, y = 13124, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E30
            note = "counter @ hall",
            coords = { x = 9833, y = 13124, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E31
            note = "counter @ hall",
            coords = { x = 9833, y = 13125, z = -1 },
            dist = { "CampingStoreBackpacks" },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -- -1 stairwell
        { -- E32
            note = "cardboardbox @ storage",
            coords = { x = 9830, y = 13116, z = -1 },
            dist = { "ArtStorePottery", },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E33
            note = "cardboardbox @ hall",
            coords = { x = 9831, y = 13127, z = -1 },
            dist = { "ToolFactoryHandles" },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        -- complex, -4
        -- stairwell
        { -- E34
            note = "militarycrate @ storage",
            coords = { x = 9830, y = 13116, z = -4 },
            dist = { "CrateLumber" },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E35
            note = "militarycrate @ storage",
            coords = { x = 9830, y = 13116, z = -4 },
            stack = 2,
            dist = { "CrateLumber" },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E36
            note = "militarycrate @ storage",
            coords = { x = 9831, y = 13116, z = -4 },
            dist = { "CrateSheetMetal" },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E37
            note = "militarycrate @ storage",
            coords = { x = 9831, y = 13116, z = -4 },
            stack = 2,
            dist = { "CrateSheetMetal" },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E38
            note = "militarycrate @ storage",
            coords = { x = 9830, y = 13118, z = -4 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E39
            note = "militarycrate @ storage",
            coords = { x = 9830, y = 13118, z = -4 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E40
            note = "militarycrate @ storage",
            coords = { x = 9831, y = 13118, z = -4 },
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            level = "Loot_BuildMatsLevel",
        },
        { -- E41
            note = "militarycrate @ storage",
            coords = { x = 9832, y = 13118, z = -4 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        -- guard desk
        { -- E42
            note = "desk @ hall",
            coords = { x = 9838, y = 13124, z = -4 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        -- armory
        { -- E43
            note = "militarylocker @ armory",
            coords = { x = 9837, y = 13122, z = -4 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E44
            note = "militarylocker @ armory",
            coords = { x = 9837, y = 13121, z = -4 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E45
            note = "militarylocker @ armory",
            coords = { x = 9837, y = 13120, z = -4 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E46
            note = "militarylocker @ armory",
            coords = { x = 9837, y = 13119, z = -4 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E47
            note = "militarylocker @ armory",
            coords = { x = 9839, y = 13122, z = -4 },
            dist = { "DrugLabGuns" },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E48
            note = "militarylocker @ armory",
            coords = { x = 9839, y = 13121, z = -4 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E49
            note = "militarycrate @ armory",
            coords = { x = 9839, y = 13120, z = -4 },
            dist = { "ArmyStorageAmmunition", },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E50
            note = "militarycrate @ armory",
            coords = { x = 9839, y = 13120, z = -4 },
            stack = 2,
            dist = { "ArmyStorageAmmunition", },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E51
            note = "militarycrate @ armory",
            coords = { x = 9839, y = 13119, z = -4 },
            dist = { "ArmyStorageAmmunition", },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E52
            note = "militarycrate @ armory",
            coords = { x = 9839, y = 13119, z = -4 },
            stack = 2,
            dist = { "ArmyStorageAmmunition", },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        -- workroom
        { -- E53
            note = "desk @ storage",
            coords = { x = 9840, y = 13122, z = -4 },
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E54
            note = "desk @ storage",
            coords = { x = 9840, y = 13120, z = -4 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E55
            note = "filingcabinet @ storage",
            coords = { x = 9842, y = 13119, z = -4 },
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        -- bunk room
        { -- E56
            note = "locker @ bedroom",
            coords = { x = 9845, y = 13126, z = -4 },
            special = "essentials",
        },
        { -- E57
            note = "locker @ bedroom",
            coords = { x = 9847, y = 13126, z = -4 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E58
            note = "shelves @ bedroom",
            coords = { x = 9850, y = 13126, z = -4 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E59
            note = "shelves @ bedroom",
            coords = { x = 9851, y = 13126, z = -4 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        -- bunk room kitchen
        { -- E60
            note = "counter @ bedroom",
            coords = { x = 9851, y = 13124, z = -4 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E61
            note = "overhead @ bedroom",
            coords = { x = 9851, y = 13124, z = -4 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E62
            note = "counter @ bedroom",
            coords = { x = 9849, y = 13124, z = -4 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E63
            note = "overhead @ bedroom",
            coords = { x = 9849, y = 13124, z = -4 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E64
            note = "fridge @ bedroom",
            coords = { x = 9848, y = 13124, z = -4 },
            dist = { "SafehouseFridge" },
            distIncludeJunk = true,
            tag = "DWAPFridge",
        },
        { -- E65
            note = "freezer @ bedroom",
            coords = { x = 9848, y = 13124, z = -4 },
            slot = "freezer",
            dist = { "SafehouseFreezer" },
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        { -- E66
            note = "overhead @ bedroom",
            coords = { x = 9848, y = 13124, z = -4 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        -- infirmary
        { -- E67
            note = "militarycrate @ infirmary",
            coords = { x = 9845, y = 13123, z = -4 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E68
            note = "militarycrate @ infirmary",
            coords = { x = 9845, y = 13121, z = -4 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E69
            note = "medicine @ infirmary",
            coords = { x = 9845, y = 13121, z = -4 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E70
            note = "medicine @ infirmary",
            coords = { x = 9850, y = 13121, z = -4 },
            dist = { "LaboratoryLockers", },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E71
            note = "medicine @ infirmary",
            coords = { x = 9851, y = 13121, z = -4 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E72
            note = "militarycrate @ infirmary",
            coords = { x = 9851, y = 13123, z = -4 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        -- machine room
        { -- E73
            note = "cardboardbox @ garagestorage",
            coords = { x = 9845, y = 13120, z = -4 },
            dist = { "GasStoreEmergency", },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E74
            note = "metal_shelves @ garagestorage",
            coords = { x = 9845, y = 13118, z = -4 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E75
            note = "metal_shelves @ garagestorage",
            coords = { x = 9846, y = 13120, z = -4 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E76
            note = "metal_shelves @ garagestorage",
            coords = { x = 9847, y = 13120, z = -4 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E77
            note = "metal_shelves @ garagestorage",
            coords = { x = 9848, y = 13120, z = -4 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E78
            note = "metal_shelves @ garagestorage",
            coords = { x = 9849, y = 13120, z = -4 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E79
            note = "metal_shelves @ garagestorage",
            coords = { x = 9850, y = 13120, z = -4 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E80
            note = "metal_shelves @ garagestorage",
            coords = { x = 9851, y = 13120, z = -4 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        -- office
        { -- E81
            note = "desk @ office",
            coords = { x = 9839, y = 13117, z = -4 },
            dist = { "MusicStoreCDs" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E82
            note = "filingcabinet @ office",
            coords = { x = 9837, y = 13118, z = -4 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E83
            note = "shelves @ office",
            coords = { x = 9837, y = 13117, z = -4 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E84
            note = "militarycrate @ office",
            coords = { x = 9837, y = 13116, z = -4 },
            dist = { "CrateLiquor" },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E85
            note = "militarycrate @ office",
            coords = { x = 9837, y = 13116, z = -4 },
            stack = 2,
            dist = { "CrateLiquor" },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        -- bathrooms
        { -- E86
            note = "counter @ bathroom",
            coords = { x = 9842, y = 13114, z = -4 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E87
            note = "locker @ bathroom",
            coords = { x = 9840, y = 13115, z = -4 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E88
            note = "counter @ bathroom",
            coords = { x = 9845, y = 13114, z = -4 },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
    },
}

return MRSecret
