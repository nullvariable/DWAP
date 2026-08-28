local wtc = { x = 10116, y = 8239, z = -1 }
local pb1 = { x = 10112, y = 8240, z = -1 }
local McCoyEstate = {
    group = "McCoy Estate",              -- Perhaps muldraugh, but kinda half way between there and west point, east of Dixie but really not close to anything
    baseBuildings = {
        { x = 10081, y = 8259, z = 1 },  -- estate house
        { x = 10093, y = 8290, z = 0 },  -- dock house/fishing
        { x = 10112, y = 8239, z = 0 },  -- workshop
        { x = 10112, y = 8239, z = -1 }, -- generator basement
    },
    spawn = { x = 10081, y = 8259, z = 1 },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = 10116, y = 8239,  z = -1,    sourceType = "generator", source = { x = 10120, y = 8239, z = -1 } },
    },
    waterFixtures = {
        -- fishing
        { sprite = "fixtures_sinks_01_33",    x = 10092, y = 8279, z = 0, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_17",    x = 10095, y = 8279, z = 0, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

        -- butchering
        { sprite = "fixtures_sinks_01_33",    x = 10092, y = 8252, z = 0, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_17",    x = 10093, y = 8252, z = 0, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

        { sprite = "fixtures_bathroom_01_3",  x = 10094, y = 8258, z = 0, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- laundry
        { sprite = "fixtures_sinks_01_13",    x = 10093, y = 8260, z = 0, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "appliances_laundry_01_5", x = 10093, y = 8261, z = 0, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "appliances_laundry_01_1", x = 10093, y = 8262, z = 0, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- kitchen
        { sprite = "fixtures_sinks_01_16",    x = 10084, y = 8261, z = 1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

        -- master bath
        { sprite = "fixtures_bathroom_01_1",  x = 10080, y = 8256, z = 1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_26", x = 10080, y = 8255, z = 1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_1",     x = 10080, y = 8254, z = 1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_4",  x = 10083, y = 8254, z = 1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

        -- 3rd floor
        { sprite = "fixtures_sinks_01_13",    x = 10080, y = 8257, z = 2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_13",    x = 10080, y = 8261, z = 2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_13",    x = 10088, y = 8261, z = 2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_33", x = 10088, y = 8260, z = 2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "appliances_laundry_01_2", x = 10090, y = 8261, z = 2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_3",  x = 10091, y = 8261, z = 2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_22",    x = 10092, y = 8255, z = 2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_22",    x = 10093, y = 8255, z = 2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_0",  x = 10094, y = 8255, z = 2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_25", x = 10095, y = 8255, z = 2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
    },
    doorKeys = {
        name = "McCoy Estate",
        doors = {
            { sprite = "walls_logs_41", x = 10091, y = 8279, z = 0, },
        },
    },
    map = { name = "DWAPStashMap18", },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 10120, y = 8239, z = pb1.z },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 10118, y = 8239, z = -1, },
            fakeGenerators = {
                { x = 10095, y = 8282, z = -1, },
                { x = 10087, y = 8268, z = -1, },
                { x = 10112, y = 8241, z = -1, },
            },
        },
    },
    objectSpawns = {
        { sprite = "crafted_01_11",            x = 10094,             y = 8259,                  z = 3,     enabled = "EnableWaterSystem", }, -- invisible "tank" to simulate the well
        { sprite = "industry_02_175",          x = pb1.x,             y = pb1.y,                 z = pb1.z, disabled = "EnableGenSystemSolar", clearExisting = true, },

        { sprite = "constructedobjects_01_45", x = 10058,             y = 8236,                  z = 0,     clearExisting = true,              isContainer = true, },
        { sprite = "carpentry_01_16",          x = 10095,             y = 8262,                  z = 0,     clearExisting = true,              isContainer = true, },

        { barricade = "metalbar",              enabled = "Barricade", target = "walls_logs_105", x = 10088, y = 8254,                          z = 0, },
        { barricade = "metalbar",              enabled = "Barricade", target = "walls_logs_105", x = 10082, y = 8254,                          z = 0, },
        { barricade = "metalbar",              enabled = "Barricade", target = "walls_logs_105", x = 10081, y = 8254,                          z = 0, },
        { barricade = "metalbar",              enabled = "Barricade", target = "walls_logs_8",   x = 10101, y = 8260,                          z = 0, },
    },
    loot = {
        { -- E1
            note = "crate @ lobby",
            coords = { x = 10095, y = 8262, z = 0 },
            special = "essentials",
        },

        -- first floor
        -- office
        { -- E2
            note = "desk @ livingroom",
            coords = { x = 10093, y = 8256, z = 1 },
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E3
            note = "shelves @ livingroom",
            coords = { x = 10097, y = 8254, z = 1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E4
            note = "shelves @ livingroom",
            coords = { x = 10098, y = 8254, z = 1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E5
            note = "shelves @ livingroom",
            coords = { x = 10093, y = 8257, z = 1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        -- sitting area
        { -- E6
            note = "shelves @ livingroom",
            coords = { x = 10095, y = 8257, z = 1 },
            slot = "upper",
            dist = { "MusicStoreCDs" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E7
            note = "shelves @ livingroom",
            coords = { x = 10099, y = 8257, z = 1 },
            slot = "upper",
            dist = { "BookstoreMilitaryHistory" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E8
            note = "counter @ livingroom",
            coords = { x = 10100, y = 8261, z = 1 },
            items = {
                { name = 'TvWideScreen',    chance = 1, count = { 1, 1 } },
                { name = 'Base.Remote',     chance = 1, count = { 1, 3 } },
                { name = 'Base.VideoGame',  chance = 1, count = { 3, 3 } },
                { name = 'Base.VHS_Retail', chance = 1, count = { 3, 3 } },
            },
        },
        { -- E9
            note = "cardboardbox @ garage",
            coords = { x = 10099, y = 8261, z = 2 },
            dist = { "CrateVHSTapes" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E10
            note = "counter @ livingroom",
            coords = { x = 10100, y = 8260, z = 1 },
            dist = { "MovieRentalShelves" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E11
            note = "counter @ livingroom",
            coords = { x = 10093, y = 8260, z = 1 },
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E12
            note = "counter @ livingroom",
            coords = { x = 10093, y = 8261, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E13
            note = "counter @ livingroom",
            coords = { x = 10092, y = 8262, z = 1 },
            dist = { "CrateInstruments" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E14
            note = "counter @ livingroom",
            coords = { x = 10091, y = 8262, z = 1 },
            dist = { "CrateLiquor" },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E15
            note = "counter @ lobby",
            coords = { x = 10088, y = 8254, z = 1 },
            dist = { "CrateLiquor" },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E16
            note = "counter @ lobby",
            coords = { x = 10089, y = 8254, z = 1 },
            dist = { "CrateLiquor" },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        -- near stairs
        { -- E17
            note = "shelves @ lobby",
            coords = { x = 10092, y = 8254, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E18
            note = "shelves @ lobby",
            coords = { x = 10092, y = 8255, z = 1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E19
            note = "dresser @ lobby",
            coords = { x = 10089, y = 8258, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E20
            note = "dishescabinet @ lobby",
            coords = { x = 10089, y = 8259, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E21
            note = "dishescabinet @ lobby",
            coords = { x = 10089, y = 8260, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        -- kitchen
        { -- E22
            note = "shelves @ kitchen",
            coords = { x = 10088, y = 8260, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E23
            note = "counter @ kitchen",
            coords = { x = 10085, y = 8260, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E24
            note = "counter @ kitchen",
            coords = { x = 10085, y = 8260, z = 1 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E25
            note = "counter @ kitchen",
            coords = { x = 10084, y = 8260, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E26
            note = "counter @ kitchen",
            coords = { x = 10084, y = 8261, z = 1 },
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E27
            note = "counter @ kitchen",
            coords = { x = 10084, y = 8262, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E28
            note = "overhead @ kitchen",
            coords = { x = 10084, y = 8262, z = 1 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E29
            note = "fridge @ kitchen",
            coords = { x = 10084, y = 8263, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E30
            note = "fridge @ kitchen",
            coords = { x = 10084, y = 8263, z = 1 },
            slot = "freezer",
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E31
            note = "overhead @ kitchen",
            coords = { x = 10084, y = 8263, z = 1 },
            slot = "upper",
            dist = { "StoreKitchenBaking", },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E32
            note = "fridge @ kitchen",
            coords = { x = 10084, y = 8264, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E33
            note = "fridge @ kitchen",
            coords = { x = 10084, y = 8264, z = 1 },
            slot = "freezer",
            dist = { "WesternKitchenFreezer", },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        -- master bedroom
        { -- E34
            note = "dresser @ bedroom",
            coords = { x = 10080, y = 8263, z = 1 },
            dist = { "FirearmWeapons_Late" },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E35
            note = "dresser @ bedroom",
            coords = { x = 10080, y = 8260, z = 1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E36
            note = "wardrobe @ bedroom",
            coords = { x = 10080, y = 8257, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E37
            note = "wardrobe @ bedroom",
            coords = { x = 10081, y = 8257, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -- mb closet
        { -- E38
            note = "shelves @ lobby",
            coords = { x = 10088, y = 8257, z = 1 },
            dist = { "SewingStoreTools" },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E39
            note = "shelves @ lobby",
            coords = { x = 10087, y = 8257, z = 1 },
            dist = { "CrateLeather" },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E40
            note = "clothingrack @ lobby",
            coords = { x = 10086, y = 8257, z = 1 },
            dist = { "SewingStoreFabric" },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E41
            note = "clothingrack @ lobby",
            coords = { x = 10085, y = 8257, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E42
            note = "clothingrack @ lobby",
            coords = { x = 10084, y = 8257, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E43
            note = "clothingrack @ lobby",
            coords = { x = 10088, y = 8259, z = 1 },
            dist = { "CampingStoreBackpacks" },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E44
            note = "clothingrack @ lobby",
            coords = { x = 10087, y = 8259, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E45
            note = "clothingrack @ lobby",
            coords = { x = 10086, y = 8259, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E46
            note = "clothingrack @ lobby",
            coords = { x = 10085, y = 8259, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -- mb bath
        { -- E47
            note = "counter @ bathroom",
            coords = { x = 10080, y = 8254, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        -- top floor
        { -- E48
            note = "locker @ bedroom",
            coords = { x = 10083, y = 8258, z = 2 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E49
            note = "locker @ bedroom",
            coords = { x = 10083, y = 8259, z = 2 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E50
            note = "dresser @ bedroom",
            coords = { x = 10083, y = 8261, z = 2 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E51
            note = "desk @ bedroom",
            coords = { x = 10087, y = 8262, z = 2 },
            items = {
                { name = 'Base.Pencil',                          chance = 1, count = { 2, 5 } },
                { name = 'Base.Notebook',                        chance = 1, count = { 1, 1 } },
                { name = 'Base.Notebook',                        chance = 1, count = { 1, 1 } },
                { name = 'Base.WristWatch_Left_DigitalBlack',    chance = 1, count = { 1, 1 } },
                { name = 'Base.WristWatch_Left_ClassicMilitary', chance = 1, count = { 1, 1 } },
            },
        },
        { -- E52
            note = "counter @ bedroom",
            coords = { x = 10084, y = 8260, z = 2 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E53
            note = "cardboardbox @ bedroom",
            coords = { x = 10084, y = 8263, z = 2 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E54
            note = "dishescabinet @ lobby",
            coords = { x = 10090, y = 8257, z = 2 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E55
            note = "dishescabinet @ lobby",
            coords = { x = 10091, y = 8257, z = 2 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E56
            note = "medicine @ garage",
            coords = { x = 10090, y = 8260, z = 2 },
            slot = "upper",
            dist = { "MedicalCabinet" },
            distIncludeJunk = false,
            tag = "DWAPMed",
        },
        { -- E57
            note = "counter @ bathroom",
            coords = { x = 10093, y = 8255, z = 2 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E58
            note = "counter @ bathroom",
            coords = { x = 10092, y = 8255, z = 2 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        -- first floor
        -- butcher room
        { -- E59
            note = "counter @ butcher",
            coords = { x = 10090, y = 8252, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E60
            note = "counter @ butcher",
            coords = { x = 10091, y = 8252, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E61
            note = "counter @ butcher",
            coords = { x = 10093, y = 8252, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E62
            note = "freezer @ butcher",
            coords = { x = 10090, y = 8254, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        { -- E63
            note = "freezer @ butcher",
            coords = { x = 10090, y = 8255, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        -- hallway
        { -- E64
            note = "metal_shelves @ lobby",
            coords = { x = 10092, y = 8256, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E65
            note = "metal_shelves @ lobby",
            coords = { x = 10093, y = 8256, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E66
            note = "counter @ lobby",
            coords = { x = 10091, y = 8258, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E67
            note = "counter @ lobby",
            coords = { x = 10090, y = 8258, z = 0 },
            dist = { "CrateToiletPaper" },
            distIncludeJunk = true,
            level = 1,
        },
        -- storage room with generator
        { -- E68
            note = "metal_shelves @ lobby",
            coords = { x = 10089, y = 8261, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E69
            note = "metal_shelves @ lobby",
            coords = { x = 10089, y = 8262, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E70
            note = "counter @ lobby",
            coords = { x = 10085, y = 8258, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E71
            note = "counter @ lobby",
            coords = { x = 10085, y = 8259, z = 0 },
            dist = { "LoggingFactoryTools" },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E72
            note = "counter @ lobby",
            coords = { x = 10085, y = 8263, z = 0 },
            dist = { "StoreCounterTobacco" },
            distIncludeJunk = true,
            level = 1,
        },
        { -- E73
            note = "counter @ lobby",
            coords = { x = 10085, y = 8264, z = 0 },
            dist = { "CandyStoreSnacks" },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E74
            note = "counter @ lobby",
            coords = { x = 10086, y = 8264, z = 0 },
            dist = { "CrateTortillaChips" },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        -- garage area
        { -- E75
            note = "toolcabinet @ garage",
            coords = { x = 10082, y = 8257, z = 0 },
            dist = { "GasStoreEmergency" },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E76
            note = "metal_shelves @ garage",
            coords = { x = 10081, y = 8257, z = 0 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E77
            note = "metal_shelves @ garage",
            coords = { x = 10084, y = 8257, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E78
            note = "metal_shelves @ garage",
            coords = { x = 10084, y = 8258, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        -- more hallway
        { -- E79
            note = "counter @ lobby",
            coords = { x = 10078, y = 8255, z = 0 },
            dist = { "ToolFactoryHandles" },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E80
            note = "counter @ lobby",
            coords = { x = 10078, y = 8256, z = 0 },
            dist = { "ToolFactoryIngots" },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E81
            note = "counter @ lobby",
            coords = { x = 10081, y = 8254, z = 0 },
            dist = { "WeldingWorkshopMetal" },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E82
            note = "counter @ lobby",
            coords = { x = 10082, y = 8254, z = 0 },
            dist = { "WeldingWorkshopMetal" },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        -- more hallway other side of stairs
        { -- E83
            note = "counter @ lobby",
            coords = { x = 10099, y = 8263, z = 0 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E84
            note = "counter @ lobby",
            coords = { x = 10099, y = 8264, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E85
            note = "counter @ lobby",
            coords = { x = 10099, y = 8265, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },

        { -- E86
            note = "metal_shelves @ lobby",
            coords = { x = 10095, y = 8261, z = 0 },
            items = {
                { name = 'Base.NailsCarton', },
            },
            level = "Loot_BuildMatsLevel",
        },
        { -- E87
            note = "metal_shelves @ lobby",
            coords = { x = 10095, y = 8260, z = 0 },
            items = {
                { name = 'Base.ScrewsCarton', chance = 1, count = { 2, 5 } },
            },
            level = "Loot_BuildMatsLevel",
        },
        { -- E88
            note = "metal_shelves @ lobby",
            coords = { x = 10095, y = 8258, z = 0 },
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            level = "Loot_BuildMatsLevel",
        },
        { -- E89
            note = "metal_shelves @ lobby",
            coords = { x = 10095, y = 8257, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E90
            note = "crate @ outside",
            coords = { x = 10100, y = 8262, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E91
            note = "crate @ outside",
            coords = { x = 10100, y = 8262, z = 0 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E92
            note = "metal_shelves @ lobby",
            coords = { x = 10098, y = 8257, z = 0 },
            dist = { "ToolFactoryBarStock" },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E93
            note = "locker @ lobby",
            coords = { x = 10099, y = 8257, z = 0 },
            dist = { "CrateSheetMetal" },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        -- food storage area
        { -- E94
            note = "freezer @ empty",
            coords = { x = 10099, y = 8254, z = 0 },
            dist = { "FreezerGarage" },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E95
            note = "freezer @ empty",
            coords = { x = 10098, y = 8254, z = 0 },
            dist = { "FreezerGarage" },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E96
            note = "freezer @ empty",
            coords = { x = 10099, y = 8256, z = 0 },
            dist = {"CafeteriaKitchenFreezer", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E97
            note = "metal_shelves @ empty",
            coords = { x = 10096, y = 8254, z = 0 },
            slot = "upper",
            dist = { "GigamartDryGoods" },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E98
            note = "freezer @ empty",
            coords = { x = 10097, y = 8254, z = 0 },
            dist = {"FreezerIceCream", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E99
            note = "fridge @ empty",
            coords = { x = 10094, y = 8256, z = 0 },
            dist = {"UniversityFridge"},
            distIncludeJunk = true,
            tag = "DWAPFridge",
        },
        { -- E100
            note = "freezer @ empty",
            coords = { x = 10094, y = 8256, z = 0 },
            slot = "freezer",
            dist = {"BurgerKitchenFreezer", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E101
            note = "freezer @ empty",
            coords = { x = 10094, y = 8254, z = 0 },
            stack = 1,
            dist = {"ButcherFreezer", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E102
            note = "metal_shelves @ empty",
            coords = { x = 10095, y = 8254, z = 0 },
            slot = "upper",
            dist = { "GigamartDryGoods" },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E103
            note = "fridge @ empty",
            coords = { x = 10094, y = 8255, z = 0 },
            dist = {"PizzaKitchenFridge"},
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E104
            note = "freezer @ empty",
            coords = { x = 10094, y = 8255, z = 0 },
            slot = "freezer",
            dist = {"PizzaKitchenFreezer",},
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E105
            note = "metal_shelves @ empty",
            coords = { x = 10097, y = 8256, z = 0 },
            dist = { "GigamartDryGoods" },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E106
            note = "metal_shelves @ empty",
            coords = { x = 10098, y = 8256, z = 0 },
            dist = { "GigamartDryGoods" },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },

        -- shop building
        { -- E107
            note = "toolcabinet @ garage",
            coords = { x = 10108, y = 8248, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPTools",
        },
        { -- E108
            note = "metal_shelves @ garage",
            coords = { x = 10117, y = 8243, z = 0 },
            sandboxEnable = 'SeedLibrary',
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = { 8, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E109
            note = "metal_shelves @ garage",
            coords = { x = 10117, y = 8242, z = 0 },
            sandboxEnable = 'SeedLibrary',
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E110
            note = "toolcabinet @ garage",
            coords = { x = 10117, y = 8239, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPTools",
        },
        { -- E111
            note = "metal_shelves @ garage",
            coords = { x = 10114, y = 8239, z = 0 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPTools",
        },
        -- fishing building
        { -- E112
            note = "metal_shelves @ empty",
            coords = { x = 10092, y = 8282, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E113
            note = "metal_shelves @ empty",
            coords = { x = 10093, y = 8282, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E114
            note = "counter @ empty",
            coords = { x = 10093, y = 8279, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E115
            note = "counter @ empty",
            coords = { x = 10094, y = 8279, z = 0 },
            dist = { "SurvivalGear", },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E116
            note = "counter @ empty",
            coords = { x = 10095, y = 8279, z = 0 },
            dist = { "SushiKitchenBaking" },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E117
            note = "freezer @ empty",
            coords = { x = 10090, y = 8280, z = 0 },
            dist = { "SushiKitchenFreezer" },
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        { -- E118
            note = "cardboardbox @ empty",
            coords = { x = 10099, y = 8279, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E119
            note = "cardboardbox @ empty",
            coords = { x = 10099, y = 8280, z = 0 },
            dist = { "ArtStorePottery" },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E120
            note = "crate @ empty",
            coords = { x = 10099, y = 8282, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPFish",
        },

        -- crate near chicken pen
        { -- E121
            note = "crate @ outside",
            coords = { x = 10056, y = 8236, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPFarm",
        },
        { -- E122
            note = "crate @ outside",
            coords = { x = 10058, y = 8236, z = 0 },
            dist = { "CrateGravelBags", },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        -- woodpile
        { -- E123
            note = "logs @ outside",
            coords = { x = 10115, y = 8260, z = 0 },
            items = {
                { name = 'Base.Firewood', chance = 1, count = { 10, 10 } },
            },
            level = "Loot_FarmLevel",
        },
    },
}

return McCoyEstate

-- ArtStorePottery ArtSupplies
-- CrateBlacksmithing CrateCarpentry CrateMechanics CrateMetalwork
