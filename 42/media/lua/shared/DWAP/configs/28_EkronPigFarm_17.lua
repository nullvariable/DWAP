-- @TODO (2026-08-07 audit) unresolved - delete lines as they are fixed
--   * entry 19: duplicate coordinates with an earlier entry - one of each
--     pair needs slot or stack addressing, or is redundant
local wtc1 = { x = 108, y = 8945, z = -1, }
local pb1 = { x = 113, y = 8945, z = -1 }
local bunkerTopLeft = { x = 103, y = 8944, z = -1 }
local EkronPigFarm = {
    group = "Ekron",
    baseBuildings = {
        { x = 104, y = 8955, z = 1 },  -- farmhouse
        { x = 104, y = 8953, z = -1 }, -- basement
    },
    spawn = { x = 104, y = 8955, z = 1 },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 112, y = 8945, z = pb1.z },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 110, y = 8945, z = -1, },
            fakeGenerators = {
                { x = 110, y = 8959, z = -1, createTile = true },
            },
        },
    },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc1.x, y = wtc1.y, z = wtc1.z, sourceType = "generator", source = { x = 112, y = 8945, z = -1 } },
    },
    waterFixtures = {
        -- barn
        { sprite = "fixtures_sinks_01_32",    x = 95,  y = 8911, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        -- 2nd floor apts
        { sprite = "fixtures_bathroom_01_0",  x = 104, y = 8954, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_1",     x = 103, y = 8955, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_26", x = 103, y = 8956, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        -- 1st floor
        { sprite = "appliances_laundry_01_3", x = 99,  y = 8954, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_1",     x = 100, y = 8956, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_2",  x = 102, y = 8956, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_9",     x = 98,  y = 8959, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        -- basement
        { sprite = "fixtures_sinks_01_16",    x = 103, y = 8948, z = -1, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_6",  x = 105, y = 8952, z = -1, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },

    },
    doorKeys = {
        name = "Pig Farm",
        doors = {
            { sprite = "fixtures_doors_01_44", x = 105, y = 8955, z = 0, },
            { sprite = "fixtures_doors_01_53", x = 104, y = 8957, z = -1, },
            { sprite = "fixtures_doors_01_44", x = 113, y = 8978, z = 0, },
            { sprite = "fixtures_doors_01_28", x = 117, y = 8927, z = 0, },
        },
    },
    map = { name = "DWAPStashMap28", },
    objectSpawns = {
        { sprite = "industry_02_175", x = pb1.x,             y = pb1.y,                              z = pb1.z, disabled = "EnableGenSystemSolar", clearExisting = true, },

        -- { sprite = "fixtures_railings_01_96", x = 98, y = 8958, z = 0, },
        -- { sprite = "fixtures_railings_01_89", x = 99, y = 8958, z = 0, },
        -- { sprite = "fixtures_railings_01_89", x = 100, y = 8958, z = 0, },
        -- { sprite = "fixtures_railings_01_88", x = 101, y = 8958, z = 0, },
        -- { sprite = "fixtures_railings_01_91", x = 101, y = 8959, z = 0, },

        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_exterior_house_02_9",   x = 97,    y = 8965,                          z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_exterior_house_02_9",   x = 99,    y = 8965,                          z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "fixtures_doors_01_44",        x = 101,   y = 8964,                          z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_exterior_house_02_9",   x = 103,   y = 8963,                          z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_exterior_house_02_8",   x = 106,   y = 8959,                          z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_exterior_house_02_8",   x = 106,   y = 8956,                          z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_exterior_house_02_8",   x = 106,   y = 8954,                          z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_exterior_house_02_8",   x = 106,   y = 8951,                          z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_exterior_wooden_01_37", x = 103,   y = 8948,                          z = 0, },
    },
    loot = {
        { -- E1
            note = "filingcabinet @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 2, z = bunkerTopLeft.z },
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E2
            sprite = 'location_trailer_02_23',
            note = "overhead @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 3, z = bunkerTopLeft.z },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E3
            note = "counter @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 3, z = bunkerTopLeft.z },
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E4
            note = "overhead @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 4, z = bunkerTopLeft.z },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E5
            note = "counter @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 4, z = bunkerTopLeft.z },
            distIncludeJunk = false,
            tag = "DWAPMed",
        },
        { -- E6
            sprite = 'location_trailer_02_23',
            note = "overhead @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 5, z = bunkerTopLeft.z },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E7
            note = "counter @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 5, z = bunkerTopLeft.z },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E8
            note = "metal_shelves @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 7, z = bunkerTopLeft.z },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E9
            note = "metal_shelves @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 8, z = bunkerTopLeft.z },
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E10
            note = "metal_shelves @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 9, z = bunkerTopLeft.z },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E11
            note = "metal_shelves @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 10, z = bunkerTopLeft.z },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E12
            note = "metal_shelves @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 11, z = bunkerTopLeft.z },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E13
            note = "metal_shelves @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 12, z = bunkerTopLeft.z },
            special = "essentials",
        },
        { -- E14
            note = "militarycrate @ bunker",
            coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y + 5, z = bunkerTopLeft.z },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E15
            note = "militarycrate @ bunker",
            coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y + 5, z = bunkerTopLeft.z },
            stack = 2,
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E16
            note = "militarycrate @ bunker",
            coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y + 6, z = bunkerTopLeft.z },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E17
            note = "militarycrate @ bunker",
            coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y + 6, z = bunkerTopLeft.z },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E18
            note = "militarycrate @ bunker",
            coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y + 7, z = bunkerTopLeft.z },
            distIncludeJunk = true,
            tag = "DWAPFarm",
        },
        { -- E19
            note = "militarycrate @ bunker",
            coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y + 7, z = bunkerTopLeft.z },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPFarm",
        },
        { -- E20
            note = "militarycrate @ bunker",
            coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y, z = bunkerTopLeft.z },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E21
            note = "militarycrate @ bunker",
            coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y, z = bunkerTopLeft.z },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E22
            note = "militarycrate @ bunker",
            coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y + 1, z = bunkerTopLeft.z },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E23
            note = "militarycrate @ bunker",
            coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y + 1, z = bunkerTopLeft.z },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E24
            note = "metal_shelves @ bunker",
            coords = { x = 105, y = 8953, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E25
            note = "metal_shelves @ bunker",
            coords = { x = 105, y = 8954, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E26
            note = "metal_shelves @ bunker",
            coords = { x = 105, y = 8955, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E27
            note = "metal_shelves @ bunker",
            coords = { x = 105, y = 8956, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -- warehouse room
        { -- E28
            note = "crate @ warehouse",
            coords = { x = 107, y = 8954, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E29
            note = "crate @ warehouse",
            coords = { x = 107, y = 8954, z = -1 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E30
            note = "metal_shelves @ warehouse",
            coords = { x = 107, y = 8953, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E31
            note = "crate @ warehouse",
            coords = { x = 107, y = 8952, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E32
            note = "crate @ warehouse",
            coords = { x = 107, y = 8952, z = -1 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        -- E27
        { -- E33 cardboard box

            note = "cardboardbox @ warehouse",
            coords = { x = 109, y = 8955, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        -- E28
        { -- E34 cardboard box

            note = "cardboardbox @ warehouse",
            coords = { x = 109, y = 8954, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E35 cardboard box

            note = "cardboardbox @ warehouse",
            coords = { x = 109, y = 8954, z = -1 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        -- E29
        { -- E36 cardboard box

            note = "cardboardbox @ warehouse",
            coords = { x = 110, y = 8954, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E37
            note = "metal_shelves @ warehouse",
            coords = { x = 109, y = 8951, z = -1 },
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
                { name = 'Base.Fertilizer',    chance = 1, count = { 8, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E38
            note = "metal_shelves @ warehouse",
            coords = { x = 109, y = 8950, z = -1 },
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
                { name = 'Base.Fertilizer',    chance = 1, count = { 8, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E39
            note = "metal_shelves @ warehouse",
            coords = { x = 109, y = 8949, z = -1 },
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            level = "Loot_BuildMatsLevel",
        },
        { -- E40
            note = "metal_shelves @ warehouse",
            coords = { x = 109, y = 8948, z = -1 },
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.Plank', },
                { name = 'Base.LongStick', },
            },
            level = "Loot_BuildMatsLevel",
        },
        { -- E41
            note = "metal_shelves @ warehouse",
            coords = { x = 111, y = 8951, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E42
            note = "metal_shelves @ warehouse",
            coords = { x = 111, y = 8950, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E43
            note = "metal_shelves @ warehouse",
            coords = { x = 111, y = 8949, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E44
            note = "metal_shelves @ warehouse",
            coords = { x = 111, y = 8948, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E45
            note = "metal_shelves @ warehouse",
            coords = { x = 113, y = 8951, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E46
            note = "metal_shelves @ warehouse",
            coords = { x = 113, y = 8950, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPTools",
        },
        { -- E47
            note = "metal_shelves @ warehouse",
            coords = { x = 113, y = 8949, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E48
            note = "metal_shelves @ warehouse",
            coords = { x = 113, y = 8948, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E49
            note = "metal_shelves @ warehouse",
            coords = { x = 115, y = 8953, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E50
            note = "metal_shelves @ warehouse",
            coords = { x = 115, y = 8952, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E51
            note = "metal_shelves @ warehouse",
            coords = { x = 115, y = 8951, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E52
            note = "metal_shelves @ warehouse",
            coords = { x = 115, y = 8950, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E53
            note = "metal_shelves @ warehouse",
            coords = { x = 115, y = 8949, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E54
            note = "metal_shelves @ warehouse",
            coords = { x = 115, y = 8948, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        -- crates in the corner
        { -- E55
            note = "crate @ warehouse",
            coords = { x = 114, y = 8956, z = -1 },
            dist = { "SafehouseBooze" },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E56
            note = "crate @ warehouse",
            coords = { x = 115, y = 8956, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E57
            note = "crate @ warehouse",
            coords = { x = 115, y = 8956, z = -1 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E58
            note = "crate @ warehouse",
            coords = { x = 116, y = 8956, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E59
            note = "crate @ warehouse",
            coords = { x = 116, y = 8956, z = -1 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E60
            note = "crate @ warehouse",
            coords = { x = 116, y = 8955, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        -- freezer
        { -- E61
            note = "freezer @ warehouse",
            coords = { x = 115, y = 8944, z = -1 },
            dist = { "BurgerKitchenFreezer", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E62
            note = "freezer @ warehouse",
            coords = { x = 116, y = 8944, z = -1 },
            dist = { "ButcherFreezer", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        ------------------
        --- Main house ---
        ------------------
        -- kitchen
        { -- E63
            note = "counter @ kitchen",
            coords = { x = 97, y = 8959, z = 0 },
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E64
            note = "overhead @ kitchen",
            coords = { x = 97, y = 8959, z = 0 },
            slot = "upper",
            dist = { "SafehouseFood" },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E65
            note = "fridge @ kitchen",
            coords = { x = 96, y = 8959, z = 0 },
            dist = { "SafehouseFridge" },
            distIncludeJunk = true,
            tag = "DWAPFridge",
        },
        { -- E66
            note = "freezer @ kitchen",
            coords = { x = 96, y = 8959, z = 0 },
            slot = "freezer",
            dist = { "SafehouseFreezer" },
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        { -- E67
            note = "overhead @ kitchen",
            coords = { x = 96, y = 8962, z = 0 },
            slot = "upper",
            dist = { "KitchenCannedFood" },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E68
            note = "overhead @ kitchen",
            coords = { x = 99, y = 8959, z = 0 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E69
            note = "fridge @ kitchen",
            coords = { x = 99, y = 8959, z = 0 },
            dist = { "FridgeGeneric", },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E70
            note = "freezer @ kitchen",
            coords = { x = 99, y = 8959, z = 0 },
            slot = "freezer",
            dist = { "FreezerIceCream", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E71
            note = "counter @ kitchen",
            coords = { x = 96, y = 8962, z = 0 },
            items = {
                { name = 'Base.Firewood', chance = 1, count = { 30, 30 } },
            },
            level = "Loot_FarmLevel",
        },
        -- office
        { -- E72
            note = "sidetable @ office",
            coords = { x = 103, y = 8962, z = 0 },
            dist = { "MusicStoreCDs" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E73
            note = "shelves @ office",
            coords = { x = 103, y = 8960, z = 0 },
            dist = { "LivingRoomShelfClassy" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E74
            note = "shelves @ office",
            coords = { x = 103, y = 8959, z = 0 },
            dist = { "CrateVHSTapes" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E75
            note = "desk @ office",
            coords = { x = 103, y = 8957, z = 0 },
            dist = { "ArmyStorageElectronics" },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        -- hallway
        { -- E76
            note = "dishescabinet @ lobby",
            coords = { x = 98, y = 8952, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E77
            note = "dishescabinet @ lobby",
            coords = { x = 99, y = 8952, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        -- 2nd floor
        -- bathroom
        { -- E78
            note = "counter @ bathroom",
            coords = { x = 103, y = 8955, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -- master bedroom
        { -- E79
            note = "sidetable @ bedroom",
            coords = { x = 102, y = 8962, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E80
            note = "sidetable @ bedroom",
            coords = { x = 99, y = 8962, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E81
            note = "desk @ bedroom",
            coords = { x = 99, y = 8959, z = 1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(EkronPigFarm.objectSpawns,
        { enabled = "EnableLadders", sprite = "industry_trucks_01_7", x = 117, y = 8957, z = -1, removeWall = "north", })

    table.insert(EkronPigFarm.objectSpawns,
        { enabled = "EnableLadders", sprite = "walls_exterior_wooden_01_28", x = 117, y = 8925, z = 0, removeFloor = true, clearExisting = true, })
    table.insert(EkronPigFarm.objectSpawns,
        { enabled = "EnableLadders", sprite = "walls_exterior_wooden_01_29", x = 117, y = 8926, z = 0, })
end

return EkronPigFarm
