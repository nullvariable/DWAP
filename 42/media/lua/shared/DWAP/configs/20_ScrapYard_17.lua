-- @TODO (2026-08-07 audit) unresolved - delete lines as they are fixed
--   * systems: waterTank 1 at 2938,12520,2, waterTank 2 at 2937,12562,2
--     present but carrying no fluid container - the conversion started and
--     did not finish, so this one is a bug rather than bad coords
local wtc1 = { x = 2938, y = 12520, z = 2, }
local wtc2 = { x = 2937, y = 12562, z = 2, }
local pb1 = { x = 2947, y = 12558, z = -1 }
local ScrapYard = {
    group = "Echo Creek",                -- cluster of houses about half way between Irvington and Echo Creek
    baseBuildings = {
        { x = 2937, y = 12523, z = 1 },  -- north house
        { x = 2945, y = 12519, z = -1 }, -- north basement
        { x = 2931, y = 12495, z = 0 },  -- north garage
        { x = 2938, y = 12495, z = 0 },  -- north barn/shed
        { x = 2942, y = 12562, z = -1 }, -- south basement
        { x = 2936, y = 12562, z = 0 },  -- south house
    },
    spawn = { x = 2937, y = 12523, z = 1 },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_18", x = 2962, y = 12560, z = 0 },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 2964, y = 12560, z = 0, },
            fakeGenerators = {
                { x = 2949, y = 12561, z = -1, createTile = true },
                { x = 2947, y = 12527, z = -1, createTile = true },
            },
        },
    },
    waterTanks = {
        { sprite = "crafted_01_11", x = wtc1.x, y = wtc1.y, z = wtc1.z, isProp = true, sourceType = "generator", source = { x = 2964, y = 12560, z = 0 } },
        { sprite = "crafted_01_11", x = wtc2.x, y = wtc2.y, z = wtc2.z, isProp = true, sourceType = "generator", source = { x = 2964, y = 12560, z = 0 } },
    },
    waterFixtures = {
        -- house 1
        { sprite = "fixtures_sinks_01_9",     x = 2936, y = 12517, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "appliances_laundry_01_7", x = 2942, y = 12524, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_13",    x = 2943, y = 12525, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_0",  x = 2944, y = 12523, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        -- 2nd floor
        { sprite = "fixtures_bathroom_01_1",  x = 2933, y = 12517, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_25", x = 2935, y = 12517, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_1",     x = 2933, y = 12519, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_33", x = 2941, y = 12522, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_3",     x = 2942, y = 12523, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_2",  x = 2942, y = 12525, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        -- house 2
        { sprite = "fixtures_sinks_01_9",     x = 2936, y = 12559, z = 0,  sourceType = "tank", source = { x = wtc2.x, y = wtc2.y, z = wtc2.z } },
        { sprite = "fixtures_bathroom_01_32", x = 2938, y = 12559, z = 0,  sourceType = "tank", source = { x = wtc2.x, y = wtc2.y, z = wtc2.z } },
        { sprite = "fixtures_sinks_01_2",     x = 2939, y = 12559, z = 0,  sourceType = "tank", source = { x = wtc2.x, y = wtc2.y, z = wtc2.z } },
        { sprite = "fixtures_bathroom_01_2",  x = 2939, y = 12560, z = 0,  sourceType = "tank", source = { x = wtc2.x, y = wtc2.y, z = wtc2.z } },
        -- basement
        { sprite = "fixtures_sinks_01_17",    x = 2944, y = 12556, z = -1, sourceType = "tank", source = { x = wtc2.x, y = wtc2.y, z = wtc2.z } },
        { sprite = "appliances_laundry_01_5", x = 2947, y = 12562, z = -1, sourceType = "tank", source = { x = wtc2.x, y = wtc2.y, z = wtc2.z } },
        { sprite = "appliances_laundry_01_1", x = 2947, y = 12563, z = -1, sourceType = "tank", source = { x = wtc2.x, y = wtc2.y, z = wtc2.z } },
        { sprite = "fixtures_bathroom_01_5",  x = 2947, y = 12561, z = -1, sourceType = "tank", source = { x = wtc2.x, y = wtc2.y, z = wtc2.z } },
        { sprite = "fixtures_bathroom_01_32", x = 2948, y = 12560, z = -1, sourceType = "tank", source = { x = wtc2.x, y = wtc2.y, z = wtc2.z } },
    },
    doorKeys = {
        name = "ScrapYard Safehouse",
        doors = {
            { sprite = "fixtures_doors_01_44", x = 2933, y = 12563, z = 0, },
            { sprite = "fixtures_doors_02_4",  x = 2936, y = 12523, z = 0, },
            { sprite = "fixtures_doors_02_4",  x = 2937, y = 12496, z = 0, },
            { sprite = "fixtures_doors_01_29", x = 2940, y = 12561, z = 0, },
            { sprite = "fixtures_doors_01_29", x = 2947, y = 12564, z = -1, },
        },
    },
    map = { name = "DWAPStashMap20", },
    objectSpawns = {

        -- some for loop spawns at bottom of file
        -- { x = 2939, y = 12518, z = 0, clearExisting = true, }, -- chair blocking new stairs
        { sprite = "crafted_01_11",   x = wtc1.x,            y = wtc1.y,                            z = wtc1.z, enabled = "EnableWaterSystem", }, -- invisible "tank" to simulate the well
        { sprite = "crafted_01_11",   x = wtc2.x,            y = wtc2.y,                            z = wtc2.z, enabled = "EnableWaterSystem", }, -- invisible "tank" to simulate the well

        { sprite = "carpentry_01_16", x = 2947,              y = 12522,                             z = -1,     isContainer = true, },


        -- { sprite = "fixtures_doors_01_29", x = 2946, y = 12527, z = -1, isDoor = true, doorN = true, },
        -- { sprite = "walls_exterior_wooden_01_39", x = 2946, y = 12527, z = -1, replaceWall = true, },
        -- { sprite = "walls_logs_96", x = 2946, y = 12527, z = -1, },
        -- { sprite = "walls_logs_98", x = 2947, y = 12527, z = -1, },

        { barricade = "wood",         enabled = "Barricade", target = "walls_interior_house_01_24", x = 2933,   y = 12518,                     z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_interior_house_01_24", x = 2933,   y = 12520,                     z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "fixtures_doors_02_4",        x = 2936,   y = 12523,                     z = 0, },
        { barricade = "metalbar",     enabled = "Barricade", target = "walls_interior_house_02_57", x = 2943,   y = 12517,                     z = 0, },
        { barricade = "metalbar",     enabled = "Barricade", target = "walls_exterior_house_01_60", x = 2945,   y = 12520,                     z = 0, },
        { barricade = "metalbar",     enabled = "Barricade", target = "walls_exterior_house_01_60", x = 2945,   y = 12524,                     z = 0, },
        { barricade = "wood",         enabled = "Barricade", target = "walls_exterior_house_01_61", x = 2938,   y = 12526,                     z = 0, },

        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_interior_house_04_45", x = 2936,   y = 12559,                     z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_interior_house_02_60", x = 2933,   y = 12562,                     z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_exterior_house_01_57", x = 2935,   y = 12566,                     z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_exterior_house_01_57", x = 2938,   y = 12566,                     z = 0, },
    },
    loot = {
        { -- E1
            note = "crate @ storage",
            coords = { x = 2947, y = 12522, z = -1 },
            special = "essentials",
        },
        -- house 1
        { -- E2
            note = "desk @ bedroom",
            coords = { x = 2940, y = 12519, z = 1 },
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E3
            note = "filingcabinet @ bedroom",
            coords = { x = 2943, y = 12517, z = 1 },
            items = {
                { name = 'Base.Pencil',                          chance = 1, count = { 2, 5 } },
                { name = 'Base.Notebook',                        chance = 1, count = { 1, 1 } },
                { name = 'Base.Notebook',                        chance = 1, count = { 1, 1 } },
                { name = 'Base.WristWatch_Left_DigitalBlack',    chance = 1, count = { 1, 1 } },
                { name = 'Base.WristWatch_Left_ClassicMilitary', chance = 1, count = { 1, 1 } },
            },
        },
        { -- E4
            note = "counter @ bathroom",
            coords = { x = 2933, y = 12519, z = 1 },
            dist = { "MedicalCabinet" },
            distIncludeJunk = false,
            tag = "DWAPMed",
        },
        { -- E5
            note = "wardrobe @ bedroom",
            coords = { x = 2937, y = 12525, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E6
            note = "wardrobe @ bedroom",
            coords = { x = 2938, y = 12525, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E7
            note = "dresser @ bedroom",
            coords = { x = 2938, y = 12522, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E8
            note = "counter @ bathroom",
            coords = { x = 2942, y = 12523, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E9
            note = "counter @ bathroom",
            coords = { x = 2942, y = 12524, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E10
            note = "dresser @ bedroom",
            coords = { x = 2943, y = 12524, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        -- 1st floor bookcases
        { -- E11
            note = "shelves @ livingroom",
            coords = { x = 2941, y = 12518, z = 0 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E12
            note = "shelves @ hall",
            coords = { x = 2936, y = 12525, z = 0 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E13
            note = "shelves @ livingroom",
            coords = { x = 2942, y = 12518, z = 0 },
            dist = { "CrateVHSTapes" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        -- laundry
        { -- E14
            note = "metal_shelves @ laundry",
            coords = { x = 2941, y = 12525, z = 0 },
            slot = "upper",
            dist = { "SewingStoreTools" },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        -- closet
        { -- E15
            note = "smallbox @ closet",
            coords = { x = 2940, y = 12525, z = 0 },
            dist = { "MusicStoreCDs" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        -- kitchen
        { -- E16
            note = "fridge @ kitchen",
            coords = { x = 2937, y = 12517, z = 0 },
            dist = { "SafehouseFridge" },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E17
            note = "freezer @ kitchen",
            coords = { x = 2937, y = 12517, z = 0 },
            slot = "freezer",
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E18
            note = "counter @ kitchen",
            coords = { x = 2936, y = 12517, z = 0 },
            dist = { "KitchenDryFood", },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E19
            note = "counter @ kitchen",
            coords = { x = 2934, y = 12517, z = 0 },
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E20
            note = "counter @ kitchen",
            coords = { x = 2933, y = 12517, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        -- shed/garage
        { -- E21
            note = "metal_shelves @ garagestorage",
            coords = { x = 2940, y = 12493, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPTools",
        },
        { -- E22
            note = "toolcabinet @ garagestorage",
            coords = { x = 2939, y = 12493, z = 0 },
            dist = { "GasStoreEmergency" },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E23
            note = "crate @ garagestorage",
            coords = { x = 2941, y = 12496, z = 0 },
            sandboxEnable = 'SeedLibrary',
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = { 8, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E24
            note = "crate @ garagestorage",
            coords = { x = 2937, y = 12494, z = 0 },
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E25
            note = "metal_shelves @ garagestorage",
            coords = { x = 2937, y = 12493, z = 0 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E26
            note = "metal_shelves @ garagestorage",
            coords = { x = 2936, y = 12493, z = 0 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E27
            note = "metal_shelves @ garagestorage",
            coords = { x = 2930, y = 12494, z = 0 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPTools",
        },
        { -- E28
            note = "metal_shelves @ garagestorage",
            coords = { x = 2929, y = 12494, z = 0 },
            dist = { "WeldingWorkshopMetal" },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        -- basement 1
        { -- E29
            note = "toolcabinet @ storage",
            coords = { x = 2945, y = 12517, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E30
            note = "metal_shelves @ storage",
            coords = { x = 2944, y = 12522, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E31
            note = "metal_shelves @ storage",
            coords = { x = 2945, y = 12522, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E32
            note = "metal_shelves @ storage",
            coords = { x = 2944, y = 12524, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E33
            note = "metal_shelves @ storage",
            coords = { x = 2945, y = 12524, z = -1 },
            dist = { "FirearmWeapons_Late" },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E34
            note = "metal_shelves @ storage",
            coords = { x = 2944, y = 12526, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E35
            note = "metal_shelves @ storage",
            coords = { x = 2945, y = 12526, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E36
            note = "metal_shelves @ storage",
            coords = { x = 2947, y = 12524, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E37
            note = "metal_shelves @ storage",
            coords = { x = 2948, y = 12524, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E38
            note = "metal_shelves @ storage",
            coords = { x = 2947, y = 12526, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E39
            note = "metal_shelves @ storage",
            coords = { x = 2948, y = 12526, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        -- house 2
        -- exterior crates
        { -- E40
            note = "crate @ outside",
            coords = { x = 2948, y = 12568, z = 0 },
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            level = "Loot_BuildMatsLevel",
        },
        { -- E41
            note = "crate @ outside",
            coords = { x = 2950, y = 12568, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E42
            note = "crate @ outside",
            coords = { x = 2948, y = 12567, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E43
            note = "crate @ outside",
            coords = { x = 2948, y = 12567, z = 0 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E44
            note = "crate @ outside",
            coords = { x = 2949, y = 12567, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E45
            note = "crate @ outside",
            coords = { x = 2948, y = 12566, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        -- living area
        { -- E46
            note = "shelves @ hall",
            coords = { x = 2934, y = 12565, z = 0 },
            slot = "upper",
            dist = { "BookstoreMilitaryHistory" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E47
            note = "cardboardbox @ hall",
            coords = { x = 2933, y = 12564, z = 0 },
            dist = { "MovieRentalShelves" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E48
            note = "shelves @ warehouse",
            coords = { x = 2945, y = 12561, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        -- kitchen
        { -- E49
            note = "fridge @ kitchen",
            coords = { x = 2934, y = 12560, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E50
            note = "freezer @ kitchen",
            coords = { x = 2934, y = 12560, z = 0 },
            slot = "freezer",
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E51
            note = "counter @ kitchen",
            coords = { x = 2934, y = 12559, z = 0 },
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E52
            note = "counter @ kitchen",
            coords = { x = 2935, y = 12559, z = 0 },
            dist = { "StoreKitchenBaking", },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E53
            note = "counter @ kitchen",
            coords = { x = 2936, y = 12559, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E54
            note = "counter @ kitchen",
            coords = { x = 2937, y = 12559, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        -- bathroom
        { -- E55
            note = "counter @ bathroom",
            coords = { x = 2939, y = 12559, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        -- bedroom
        { -- E56
            note = "wardrobe @ bedroom",
            coords = { x = 2939, y = 12564, z = 0 },
            dist = { "DrugLabGuns" },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E57
            note = "wardrobe @ bedroom",
            coords = { x = 2939, y = 12565, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -- basement 2
        { -- E58
            note = "locker @ warehouse",
            coords = { x = 2939, y = 12566, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E59
            note = "locker @ warehouse",
            coords = { x = 2938, y = 12566, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E60
            note = "metal_shelves @ warehouse",
            coords = { x = 2937, y = 12566, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E61
            note = "metal_shelves @ warehouse",
            coords = { x = 2937, y = 12567, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E62
            note = "metal_shelves @ warehouse",
            coords = { x = 2935, y = 12566, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E63
            note = "metal_shelves @ warehouse",
            coords = { x = 2935, y = 12567, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E64
            note = "metal_shelves @ warehouse",
            coords = { x = 2935, y = 12569, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E65
            note = "metal_shelves @ warehouse",
            coords = { x = 2935, y = 12570, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E66
            note = "metal_shelves @ warehouse",
            coords = { x = 2937, y = 12569, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E67
            note = "metal_shelves @ warehouse",
            coords = { x = 2937, y = 12570, z = -1 },
            dist = { "CampingStoreBackpacks" },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -- lockers
        { -- E68
            note = "locker @ warehouse",
            coords = { x = 2939, y = 12570, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E69
            note = "locker @ warehouse",
            coords = { x = 2940, y = 12570, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        -- crate room
        { -- E70
            note = "militarycrate @ security",
            coords = { x = 2943, y = 12571, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E71
            note = "militarycrate @ security",
            coords = { x = 2943, y = 12571, z = -1 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E72
            note = "militarycrate @ security",
            coords = { x = 2943, y = 12572, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E73
            note = "militarycrate @ security",
            coords = { x = 2943, y = 12572, z = -1 },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E74
            note = "militarycrate @ security",
            coords = { x = 2943, y = 12573, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E75
            note = "militarycrate @ security",
            coords = { x = 2943, y = 12573, z = -1 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E76
            note = "militarycrate @ security",
            coords = { x = 2943, y = 12574, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E77
            note = "militarycrate @ security",
            coords = { x = 2943, y = 12574, z = -1 },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E78
            note = "militarycrate @ security",
            coords = { x = 2939, y = 12571, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E79
            note = "militarycrate @ security",
            coords = { x = 2939, y = 12571, z = -1 },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E80
            note = "militarycrate @ security",
            coords = { x = 2939, y = 12571, z = -1 },
            stack = 3,
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E81
            note = "militarycrate @ security",
            coords = { x = 2939, y = 12572, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E82
            note = "militarycrate @ security",
            coords = { x = 2939, y = 12572, z = -1 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E83
            note = "militarycrate @ security",
            coords = { x = 2939, y = 12572, z = -1 },
            stack = 3,
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E84
            note = "militarylocker @ security",
            coords = { x = 2939, y = 12573, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E85
            note = "militarylocker @ security",
            coords = { x = 2939, y = 12574, z = -1 },
            dist = { "ArmyStorageAmmunition", },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        -- bunkrooms
        { -- E86
            note = "locker @ bedroom",
            coords = { x = 2948, y = 12570, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E87
            note = "locker @ bedroom",
            coords = { x = 2948, y = 12567, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -- medical room
        { -- E88
            note = "medicine @ medclinic",
            coords = { x = 2943, y = 12560, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E89
            note = "medicine @ medclinic",
            coords = { x = 2943, y = 12559, z = -1 },
            dist = { "LaboratoryLockers", },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E90
            note = "counter @ medclinic",
            coords = { x = 2944, y = 12556, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        -- tool chest
        { -- E91
            note = "toolcabinet @ warehouse",
            coords = { x = 2941, y = 12565, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        -- freezers
        { -- E92
            note = "freezer @ warehouse",
            coords = { x = 2941, y = 12563, z = -1 },
            dist = { "FreezerRich", },
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        { -- E93
            note = "freezer @ warehouse",
            coords = { x = 2941, y = 12564, z = -1 },
            dist = { "FreezerIceCream", },
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        { -- E94
            note = "fridge @ warehouse",
            coords = { x = 2941, y = 12561, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFridge",
        },
        { -- E95
            note = "freezer @ warehouse",
            coords = { x = 2941, y = 12561, z = -1 },
            slot = "freezer",
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        { -- E96
            note = "fridge @ warehouse",
            coords = { x = 2942, y = 12561, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFridge",
        },
        { -- E97
            note = "freezer @ warehouse",
            coords = { x = 2942, y = 12561, z = -1 },
            slot = "freezer",
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(ScrapYard.objectSpawns,
        { enabled = "EnableLadders", x = 2960, y = 12561, z = 0, removeFloor = true, clearExisting = true, })
    table.insert(ScrapYard.objectSpawns, { enabled = "EnableLadders", x = 2949, y = 12556, z = -1, removeWall = "west" })
    table.insert(ScrapYard.objectSpawns,
        { enabled = "EnableLadders", sprite = "fencing_01_25", x = 2960, y = 12562, z = 0 })
    table.insert(ScrapYard.objectSpawns,
        { enabled = "EnableLadders", sprite = "fencing_01_29", x = 2961, y = 12562, z = 0 })
    table.insert(ScrapYard.objectSpawns,
        { enabled = "EnableLadders", sprite = "fencing_01_27", x = 2961, y = 12561, z = 0 })
end

return ScrapYard
