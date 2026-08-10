local genCoords = { x = 751, y = 9812, z = -5, }
local wtc = { x = genCoords.x + 8, y = genCoords.y + 4, z = genCoords.z, }
local EkronCC = {
    group = "Ekron",
    baseBuildings = {
        { x = 764, y = 9821, z = -5 }, -- community college
    },
    baseRooms = {
        { x = 760, y = 9816, z = -5 }, -- empty
        { x = 760, y = 9808, z = -5 }, -- oldarmy
        { x = 760, y = 9800, z = -5 }, -- empty
        { x = 752, y = 9800, z = -5 }, -- empty
        { x = 761, y = 9816, z = -5 }, -- empty
        { x = 763, y = 9801, z = -5 }, -- empty
        { x = 763, y = 9816, z = -5 }, -- oldarmy
        { x = 777, y = 9810, z = -5 }, -- empty
        { x = 777, y = 9816, z = -5 }, -- empty
        { x = 769, y = 9817, z = -5 }, -- oldmedical
        { x = 772, y = 9822, z = -5 }, -- oldmedical
        { x = 769, y = 9824, z = -5 }, -- oldarmy
        { x = 777, y = 9829, z = -5 }, -- empty
        { x = 770, y = 9829, z = -5 }, -- empty
        { x = 770, y = 9833, z = -5 }, -- empty
        { x = 763, y = 9832, z = -5 }, -- empty
        { x = 763, y = 9827, z = -5 }, -- empty
        { x = 763, y = 9817, z = -5 }, -- empty
        { x = 760, y = 9823, z = -5 }, -- oldarmy
        { x = 752, y = 9825, z = -5 }, -- oldmedical
        { x = 760, y = 9832, z = -5 }, -- oldarmy
        { x = 760, y = 9839, z = -5 }, -- empty
        { x = 752, y = 9839, z = -5 }, -- empty
        { x = 752, y = 9818, z = -5 }, -- empty
        { x = 744, y = 9820, z = -5 }, -- empty
        { x = 725, y = 9819, z = -5 }, -- empty
        { x = 725, y = 9819, z = -4 }, -- empty
        { x = 725, y = 9819, z = -3 }, -- empty
        { x = 725, y = 9819, z = -2 }, -- empty
        { x = 728, y = 9816, z = -1 }, -- storage
    },
    spawn = { x = 764, y = 9821, z = -5, },
    doorKeys = {
        name = "Ekron Community College",
        doors = {
            { sprite = "fixtures_doors_01_56", x = 733, y = 9818, z = -1, }, -- storage room door
            { sprite = "fixtures_doors_02_41", x = 747, y = 9816, z = 0, },
        },
    },
    map = { name = "DWAPStashMap12", },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = genCoords.x, y = genCoords.y, z = genCoords.z, },
            fuelTank = { sprite = "dwap_tiles_01_24", x = genCoords.x - 2, y = genCoords.y, z = genCoords.z, },
            fakeGenerators = {
                { x = genCoords.x - 22, y = genCoords.y + 12, z = -5, createTile = false },
                { x = genCoords.x - 5, y = genCoords.y + 12, z = -5, createTile = false },
                { x = genCoords.x + 1, y = genCoords.y + 36, z = -5, createTile = false },
                { x = genCoords.x + 30, y = genCoords.y + 22, z = -5, createTile = false },
                { x = genCoords.x + 15, y = genCoords.y - 12, z = -5, createTile = false },
            },
        }
    },
    waterTanks = {
        { sprite = "industry_02_72", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = { x = genCoords.x, y = genCoords.y, z = genCoords.z } },
    },
    waterFixtures = {
        -- wash room sinks
        { sprite = "fixtures_sinks_01_6",     x = genCoords.x + 9, y = genCoords.y - 12, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_6",     x = genCoords.x + 9, y = genCoords.y - 13, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_6",     x = genCoords.x + 9, y = genCoords.y - 14, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_6",     x = genCoords.x + 9, y = genCoords.y - 15, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- wash room toilets
        { sprite = "fixtures_bathroom_01_5",  x = genCoords.x + 5, y = genCoords.y - 11, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_5",  x = genCoords.x + 5, y = genCoords.y - 12, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_5",  x = genCoords.x + 5, y = genCoords.y - 13, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_5",  x = genCoords.x + 5, y = genCoords.y - 14, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_5",  x = genCoords.x + 5, y = genCoords.y - 15, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- washroom showers
        { sprite = "fixtures_bathroom_01_31", x = genCoords.x + 1, y = genCoords.y - 11, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_31", x = genCoords.x + 1, y = genCoords.y - 9, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_31", x = genCoords.x + 1, y = genCoords.y - 7, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_23", x = genCoords.x + 4, y = genCoords.y - 11, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_23", x = genCoords.x + 4, y = genCoords.y - 9, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_23", x = genCoords.x + 4, y = genCoords.y - 7, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- laundry room washers
        { sprite = "appliances_laundry_01_6", x = genCoords.x + 13, y = genCoords.y - 9, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "appliances_laundry_01_6", x = genCoords.x + 14, y = genCoords.y - 9, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- kitchen sink
        { sprite = "fixtures_sinks_01_17",    x = genCoords.x + 20, y = genCoords.y - 6, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- utility sink
        { sprite = "fixtures_sinks_01_34",    x = genCoords.x + 23, y = genCoords.y + 23, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- gym fountain
        { sprite = "fixtures_sinks_01_24",    x = genCoords.x + 15, y = genCoords.y + 20, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- laundry room washers
        { sprite = "appliances_laundry_01_4", x = genCoords.x + 13, y = genCoords.y + 27, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "appliances_laundry_01_4", x = genCoords.x + 14, y = genCoords.y + 27, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- wash room sinks
        { sprite = "fixtures_sinks_01_6",     x = genCoords.x + 9, y = genCoords.y + 27, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_6",     x = genCoords.x + 9, y = genCoords.y + 28, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_6",     x = genCoords.x + 9, y = genCoords.y + 29, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_6",     x = genCoords.x + 9, y = genCoords.y + 30, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- wash room toilets
        { sprite = "fixtures_bathroom_01_5",  x = genCoords.x + 5, y = genCoords.y + 27, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_5",  x = genCoords.x + 5, y = genCoords.y + 26, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- washroom showers
        { sprite = "fixtures_bathroom_01_31", x = genCoords.x + 1, y = genCoords.y + 31, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_31", x = genCoords.x + 1, y = genCoords.y - 29, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_31", x = genCoords.x + 1, y = genCoords.y - 27, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_23", x = genCoords.x + 4, y = genCoords.y + 31, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_23", x = genCoords.x + 4, y = genCoords.y - 29, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_23", x = genCoords.x + 4, y = genCoords.y - 27, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

        -- decon showers
        { sprite = "fixtures_bathroom_01_22", x = genCoords.x - 3, y = genCoords.y + 12, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_22", x = genCoords.x - 2, y = genCoords.y + 12, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_22", x = genCoords.x - 1, y = genCoords.y + 12, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_22", x = genCoords.x,    y = genCoords.y + 12, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_22", x = genCoords.x + 1, y = genCoords.y + 12, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_22", x = genCoords.x + 2, y = genCoords.y + 12, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_30", x = genCoords.x - 1, y = genCoords.y + 10, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_30", x = genCoords.x,    y = genCoords.y + 10, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_22", x = genCoords.x - 1, y = genCoords.y + 8, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_22", x = genCoords.x,    y = genCoords.y + 8, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_30", x = genCoords.x - 3, y = genCoords.y + 6, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_30", x = genCoords.x - 2, y = genCoords.y + 6, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_30", x = genCoords.x - 1, y = genCoords.y + 6, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_30", x = genCoords.x,    y = genCoords.y + 6, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_30", x = genCoords.x + 1, y = genCoords.y + 6, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_30", x = genCoords.x + 2, y = genCoords.y + 6, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
    },
    objectSpawns = {
        { sprite = "industry_02_52", x = 754, y = 9811, z = -5, clearExisting = false, enabled = "EnableWaterSystem", },

        -- { sprite = "fixtures_railings_01_36", x = 726, y = 9820, z = -1, clearExisting = false, },
        -- { sprite = "fixtures_railings_01_36", x = 726, y = 9821, z = -1, clearExisting = false, },
        -- { sprite = "fixtures_railings_01_36", x = 726, y = 9822, z = -1, clearExisting = false, },
        -- { x = 725, y = 9819, z = -1, clearExisting = true, },
        -- { x = 725, y = 9820, z = -1, clearExisting = true, },
        -- { x = 725, y = 9821, z = -1, clearExisting = true, },
        -- { x = 725, y = 9822, z = -1, clearExisting = true, },

        -- { sprite = "constructedobjects_01_45", x = 12994, y = 1908, z = 2, clearExisting = false, isContainer = true, },
        -- { sprite = "appliances_cooking_01_16", x = 12989, y = 1915, z = 2, },
    },
    loot = {
        { -- E1
            -- filingcabinet next to spawn in operations room

            note = "filingcabinet @ empty",
            coords = { x = genCoords.x + 12, y = genCoords.y + 11, z = genCoords.z },
            items = {
                { name = 'Base.Pencil',                          chance = 1, count = { 2, 5 } },
                { name = 'Base.Notebook',                        chance = 1, count = { 1, 1 } },
                { name = 'Base.Notebook',                        chance = 1, count = { 1, 1 } },
                { name = 'Base.WristWatch_Left_DigitalBlack',    chance = 1, count = { 1, 1 } },
                { name = 'Base.WristWatch_Left_ClassicMilitary', chance = 1, count = { 1, 1 } },
            },
        },
        { -- E2
            -- 2nd filingcabinet next to spawn in operations room

            note = "filingcabinet @ empty",
            coords = { x = genCoords.x + 12, y = genCoords.y + 12, z = genCoords.z },
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        -- kitchen
        { -- E3
            note = "counter @ oldarmy",
            coords = { x = genCoords.x + 20, y = genCoords.y - 6, z = genCoords.z },
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E4
            note = "counter @ oldarmy",
            coords = { x = genCoords.x + 19, y = genCoords.y - 6, z = genCoords.z },
            dist = { "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E5
            note = "counter @ oldarmy",
            coords = { x = genCoords.x + 16, y = genCoords.y - 6, z = genCoords.z },
            dist = { "CrateCannedFood", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E6
            note = "counter @ oldarmy",
            coords = { x = genCoords.x + 16, y = genCoords.y - 4, z = genCoords.z },
            dist = { "ButcherSpices", "GigamartSpices", "GroceryBagGourmet", "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E7
            note = "counter @ oldarmy",
            coords = { x = genCoords.x + 15, y = genCoords.y - 6, z = genCoords.z },
            dist = { "CrateCannedFood", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E8
            note = "counter @ oldarmy",
            coords = { x = genCoords.x + 17, y = genCoords.y - 4, z = genCoords.z },
            dist = { "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E9
            note = "counter @ oldarmy",
            coords = { x = genCoords.x + 18, y = genCoords.y - 4, z = genCoords.z },
            dist = { "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E10
            note = "counter @ oldarmy",
            coords = { x = genCoords.x + 19, y = genCoords.y - 4, z = genCoords.z },
            dist = { "StoreKitchenBaking", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- Armory
        { -- E11
            note = "locker @ empty",
            coords = { x = genCoords.x + 27, y = genCoords.y - 2, z = genCoords.z },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E12
            note = "locker @ empty",
            coords = { x = genCoords.x + 28, y = genCoords.y - 2, z = genCoords.z },
            dist = { "GunStoreGuns", "GunStoreMagsAmmo", "GunStoreAmmunition", "GunStoreAccessories", "DrugShackWeapons" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E13
            note = "locker @ empty",
            coords = { x = genCoords.x + 29, y = genCoords.y - 2, z = genCoords.z },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E14
            note = "locker @ empty",
            coords = { x = genCoords.x + 30, y = genCoords.y - 2, z = genCoords.z },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E15
            note = "locker @ empty",
            coords = { x = genCoords.x + 27, y = genCoords.y + 1, z = genCoords.z },
            dist = { "FirearmWeapons_Late", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E16
            note = "locker @ empty",
            coords = { x = genCoords.x + 28, y = genCoords.y + 1, z = genCoords.z },
            dist = { "DrugLabGuns" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E17
            note = "locker @ empty",
            coords = { x = genCoords.x + 29, y = genCoords.y + 1, z = genCoords.z },
            dist = { "ArmyStorageGuns", "ArmyStorageAmmunition" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E18
            note = "locker @ empty",
            coords = { x = genCoords.x + 30, y = genCoords.y + 1, z = genCoords.z },
            dist = { "PoliceStorageGuns", "PoliceStorageAmmunition" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        -- medical
        { -- E19
            note = "medicine @ oldmedical",
            coords = { x = genCoords.x + 22, y = genCoords.y + 9, z = genCoords.z },
            slot = "upper",
            dist = { "MedicalCabinet" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E20
            note = "metal_shelves @ oldmedical",
            coords = { x = genCoords.x + 22, y = genCoords.y + 10, z = genCoords.z },
            dist = { "MedicalClinicTools", "MedicalStorageDrugs" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E21
            note = "metal_shelves @ oldmedical",
            coords = { x = genCoords.x + 23, y = genCoords.y + 10, z = genCoords.z },
            dist = { "ArmyStorageMedical", "ArmyBunkerMedical" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        -- book shelves
        { -- E22
            note = "shelves @ empty",
            coords = { x = genCoords.x + 33, y = genCoords.y + 16, z = genCoords.z },
            dist = { "BookstoreNonFiction" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = 1,
        },
        { -- E23
            note = "shelves @ empty",
            coords = { x = genCoords.x + 33, y = genCoords.y + 15, z = genCoords.z },
            dist = { "BookstoreMilitaryHistory" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = 1,
        },
        -- media storage
        { -- E24
            note = "metal_shelves @ empty",
            coords = { x = genCoords.x + 26, y = genCoords.y + 17, z = genCoords.z },
            sandboxEnable = 'Loot_EnableBooks',
            special = 'skillbooks1',
        },
        { -- E25
            note = "metal_shelves @ empty",
            coords = { x = genCoords.x + 27, y = genCoords.y + 17, z = genCoords.z },
            sandboxEnable = 'Loot_EnableBooks',
            special = 'skillbooks2',
        },
        { -- E26
            note = "metal_shelves @ empty",
            coords = { x = genCoords.x + 28, y = genCoords.y + 17, z = genCoords.z },
            sandboxEnable = 'Loot_EnableBooks',
            special = 'skillmags',
        },
        { -- E27
            note = "metal_shelves @ empty",
            coords = { x = genCoords.x + 29, y = genCoords.y + 17, z = genCoords.z },
            dist = { "CrateTVWide", "CrateVHSTapes" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E28
            note = "metal_shelves @ empty",
            coords = { x = genCoords.x + 30, y = genCoords.y + 17, z = genCoords.z },
            dist = { "CrateVHSTapes" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E29
            note = "metal_shelves @ empty",
            coords = { x = genCoords.x + 31, y = genCoords.y + 17, z = genCoords.z },
            dist = { "MovieRentalShelves" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E30
            note = "metal_shelves @ empty",
            coords = { x = genCoords.x + 28, y = genCoords.y + 20, z = genCoords.z },
            dist = { "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E31
            note = "metal_shelves @ empty",
            coords = { x = genCoords.x + 29, y = genCoords.y + 20, z = genCoords.z },
            dist = { "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E32
            note = "metal_shelves @ empty",
            coords = { x = genCoords.x + 30, y = genCoords.y + 20, z = genCoords.z },
            dist = { "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E33
            note = "metal_shelves @ empty",
            coords = { x = genCoords.x + 31, y = genCoords.y + 20, z = genCoords.z },
            dist = { "MusicStoreCDs" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        -- cleaning
        { -- E34
            note = "metal_shelves @ empty",
            coords = { x = genCoords.x + 22, y = genCoords.y + 17, z = genCoords.z },
            dist = { "LaundryCleaning", "JanitorCleaning" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E35
            note = "metal_shelves @ empty",
            coords = { x = genCoords.x + 23, y = genCoords.y + 17, z = genCoords.z },
            dist = { "LaundryCleaning", "JanitorCleaning" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- seed/farm library
        { -- E36
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 23, y = genCoords.y + 15, z = genCoords.z },
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E37
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 23, y = genCoords.y + 16, z = genCoords.z },
            dist = { "GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E38
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 21, y = genCoords.y + 15, z = genCoords.z },
            dist = { "GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E39
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 21, y = genCoords.y + 16, z = genCoords.z },
            dist = { "GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E40
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 19, y = genCoords.y + 15, z = genCoords.z },
            sandboxEnable = 'SeedLibrary',
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = { 8, 10 } },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E41
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 19, y = genCoords.y + 16, z = genCoords.z },
            sandboxEnable = 'SeedLibrary',
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        -- fishing
        { -- E42
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 23, y = genCoords.y + 12, z = genCoords.z },
            dist = { "CrateFishing", "FishermanTools" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E43 hunting
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 22, y = genCoords.y + 12, z = genCoords.z },
            dist = { "HuntingLockers", "RangerTools" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E44
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 21, y = genCoords.y + 12, z = genCoords.z },
            dist = { "CrateInstruments" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E45
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 20, y = genCoords.y + 12, z = genCoords.z },
            dist = { "CrateLiquor" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E46
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 19, y = genCoords.y + 12, z = genCoords.z },
            dist = { "CrateLiquor", "DishCabinetVIPLounge" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E47
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 18, y = genCoords.y + 12, z = genCoords.z },
            dist = { "DishCabinetLiquor" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- tailoring
        { -- E48
            note = "counter @ empty",
            coords = { x = genCoords.x + 22, y = genCoords.y + 21, z = genCoords.z },
            dist = { "SewingStoreTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- E49
            note = "counter @ empty",
            coords = { x = genCoords.x + 23, y = genCoords.y + 21, z = genCoords.z },
            dist = { "SewingStoreFabric" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- E50
            note = "counter @ empty",
            coords = { x = genCoords.x + 23, y = genCoords.y + 22, z = genCoords.z },
            dist = { "CrateLeather" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- E51
            note = "metal_shelves @ empty",
            coords = { x = genCoords.x + 19, y = genCoords.y + 21, z = genCoords.z },
            dist = { "CrateToiletPaper" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E52
            note = "metal_shelves @ empty",
            coords = { x = genCoords.x + 19, y = genCoords.y + 22, z = genCoords.z },
            dist = { "BathroomCounter", "LaundryCleaning", "JanitorCleaning" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E53
            coords = { x = genCoords.x + 19, y = genCoords.y + 23, z = genCoords.z },
            dist = { "GymLaundry", "GymLockers" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- E54
            note = "bin @ empty",
            coords = { x = genCoords.x + 19, y = genCoords.y + 24, z = genCoords.z },
            dist = { "ArmyStorageOutfit" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        -- laundry room
        { -- E55
            note = "metal_shelves @ empty",
            coords = { x = genCoords.x + 12, y = genCoords.y + 27, z = genCoords.z },
            slot = "upper",
            dist = { "LaundryLoad1", "LaundryLoad2", "LaundryLoad3", "LaundryLoad4", "LaundryLoad5", "LaundryLoad6", "LaundryLoad7", "LaundryLoad8" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = 1,
        },
        { -- E56
            note = "metal_shelves @ empty",
            coords = { x = genCoords.x + 12, y = genCoords.y - 9, z = genCoords.z },
            slot = "upper",
            dist = { "LaundryLoad1", "LaundryLoad2", "LaundryLoad3", "LaundryLoad4", "LaundryLoad5", "LaundryLoad6", "LaundryLoad7", "LaundryLoad8" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = 1,
        },
        -- lockers
        -- SafehouseArmor
        -- SafehouseLighting
        -- ArmyStorageOutfit
        -- LockerArmyBedroom, LockerArmyBedroomHome, ArmySurplusOutfit, ToolStoreOutfit
        -- womens
        { -- E57
            note = "locker @ oldarmy",
            coords = { x = genCoords.x - 3, y = genCoords.y - 7, z = genCoords.z },
            dist = { "LaundryLoad1", "LaundryLoad2", "LaundryLoad3", "LaundryLoad4", "LaundryLoad5", "LaundryLoad6", "LaundryLoad7", "LaundryLoad8" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E58
            note = "locker @ oldarmy",
            coords = { x = genCoords.x - 3, y = genCoords.y - 6, z = genCoords.z },
            dist = { "SafehouseArmor", "SafehouseLighting" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E59
            note = "locker @ oldarmy",
            coords = { x = genCoords.x - 3, y = genCoords.y - 5, z = genCoords.z },
            dist = { "ArmyStorageOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateLinens" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E60
            note = "locker @ oldarmy",
            coords = { x = genCoords.x - 3, y = genCoords.y - 4, z = genCoords.z },
            dist = { "ArmyStorageOutfit", "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "ToolStoreOutfit" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E61
            note = "locker @ oldarmy",
            coords = { x = genCoords.x - 3, y = genCoords.y - 3, z = genCoords.z },
            dist = { "ArmyStorageOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateBootsArmy" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        -- mens
        { -- E62
            note = "locker @ oldarmy",
            coords = { x = genCoords.x - 3, y = genCoords.y + 21, z = genCoords.z },
            dist = { "LaundryLoad1", "LaundryLoad2", "LaundryLoad3", "LaundryLoad4", "LaundryLoad5", "LaundryLoad6", "LaundryLoad7", "LaundryLoad8" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E63
            note = "locker @ oldarmy",
            coords = { x = genCoords.x - 3, y = genCoords.y + 22, z = genCoords.z },
            dist = { "SafehouseArmor", "SafehouseLighting" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E64
            note = "locker @ oldarmy",
            coords = { x = genCoords.x - 3, y = genCoords.y + 23, z = genCoords.z },
            dist = { "ArmyStorageOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateLinens" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E65
            note = "locker @ oldarmy",
            coords = { x = genCoords.x - 3, y = genCoords.y + 24, z = genCoords.z },
            dist = { "ArmyStorageOutfit", "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "ToolStoreOutfit" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E66
            note = "locker @ oldarmy",
            coords = { x = genCoords.x - 3, y = genCoords.y + 25, z = genCoords.z },
            dist = { "ArmyStorageOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateBootsArmy" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        -- entry storage 1
        { -- E67
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 3, y = genCoords.y + 11, z = genCoords.z },
            dist = { "CampingLockers" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E68
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 3, y = genCoords.y + 12, z = genCoords.z },
            dist = { "CampingStoreBackpacks" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E69
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 3, y = genCoords.y + 13, z = genCoords.z },
            dist = { "GunStoreKnives", "PawnShopKnives", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E70
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 3, y = genCoords.y + 14, z = genCoords.z },
            dist = { "SafehouseTraps", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E71
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 3, y = genCoords.y + 15, z = genCoords.z },
            dist = { "ArmyStorageAmmunition", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E72
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 3, y = genCoords.y + 16, z = genCoords.z },
            dist = { "ArmyStorageAmmunition", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        -- tools
        { -- E73
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 6, y = genCoords.y + 14, z = genCoords.z },
            dist = { "CarSupplyTools", "GasStorageMechanics", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E74
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 6, y = genCoords.y + 15, z = genCoords.z },
            dist = { "CampingStoreTools", "ArmyHangarTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E75
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 6, y = genCoords.y + 16, z = genCoords.z },
            special = "essentials",
        },
        { -- E76
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 6, y = genCoords.y + 17, z = genCoords.z },
            dist = { "CrateTools", "GarageTools", "BarnTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E77
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 6, y = genCoords.y + 18, z = genCoords.z },
            dist = { "GigamartTools", "JanitorTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E78
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 6, y = genCoords.y + 19, z = genCoords.z },
            dist = { "LoggingFactoryTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        -- random junk
        { -- E79
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 9, y = genCoords.y + 12, z = genCoords.z },
            dist = { "CrateRandomJunk", "RandomFiller", "ArmySurplusMisc" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = 3,
        },
        { -- E80
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 9, y = genCoords.y + 13, z = genCoords.z },
            dist = { "CrateCannedFood", "ArmySurplusTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E81
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 9, y = genCoords.y + 14, z = genCoords.z },
            dist = { "CrateRandomJunk", "RandomFiller" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = 3,
        },
        { -- E82
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 9, y = genCoords.y + 15, z = genCoords.z },
            dist = { "CrateCannedFood", "RandomFiller" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- mats
        { -- E83
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 9, y = genCoords.y + 16, z = genCoords.z },
            dist = { "ArmyStorageElectronics", "RandomFiller" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E84
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 9, y = genCoords.y + 17, z = genCoords.z },
            dist = { "ToolFactoryHandles" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E85
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 9, y = genCoords.y + 19, z = genCoords.z },
            dist = { "ToolFactoryIngots" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E86
            note = "metal_shelves @ oldarmy",
            coords = { x = genCoords.x + 9, y = genCoords.y + 18, z = genCoords.z },
            dist = { "CrateSheetMetal" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        -- entry storage 2
        { -- E87
            note = "metal_shelves @ oldmedical",
            coords = { x = genCoords.x - 3, y = genCoords.y + 13, z = genCoords.z },
            dist = { "ToolFactoryBarStock" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E88
            note = "metal_shelves @ oldmedical",
            coords = { x = genCoords.x - 2, y = genCoords.y + 13, z = genCoords.z },
            dist = { "CrateLumber" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E89
            note = "metal_shelves @ oldmedical",
            coords = { x = genCoords.x - 1, y = genCoords.y + 13, z = genCoords.z },
            dist = { "CrateLumber" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E90
            note = "metal_shelves @ oldmedical",
            coords = { x = genCoords.x, y = genCoords.y + 13, z = genCoords.z },
            dist = { "CrateLumber", "CrateSheetMetal" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E91
            note = "metal_shelves @ oldmedical",
            coords = { x = genCoords.x + 1, y = genCoords.y + 13, z = genCoords.z },
            dist = { "WeldingWorkshopMetal" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E92
            note = "metal_shelves @ oldmedical",
            coords = { x = genCoords.x + 2, y = genCoords.y + 13, z = genCoords.z },
            dist = { "WeldingWorkshopMetal" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E93
            note = "metal_shelves @ oldmedical",
            coords = { x = genCoords.x, y = genCoords.y + 16, z = genCoords.z },
            items = {
                { name = 'Base.NailsCarton', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E94
            note = "metal_shelves @ oldmedical",
            coords = { x = genCoords.x - 1, y = genCoords.y + 16, z = genCoords.z },
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E95
            note = "metal_shelves @ oldmedical",
            coords = { x = genCoords.x - 2, y = genCoords.y + 16, z = genCoords.z },
            dist = { "ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal", "ToolFactoryIngots" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E96
            note = "metal_shelves @ oldmedical",
            coords = { x = genCoords.x - 3, y = genCoords.y + 16, z = genCoords.z },
            dist = { "StoreCounterTobacco" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = 1,
        },
        { -- E97
            note = "metal_shelves @ oldmedical",
            coords = { x = genCoords.x + 2, y = genCoords.y + 19, z = genCoords.z },
            dist = { "GasStoreEmergency" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = 2,
        },
        { -- E98
            note = "metal_shelves @ oldmedical",
            coords = { x = genCoords.x + 1, y = genCoords.y + 19, z = genCoords.z },
            dist = { "CrateFlour", "CrateOilVegetable" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E99
            note = "metal_shelves @ oldmedical",
            coords = { x = genCoords.x, y = genCoords.y + 19, z = genCoords.z },
            dist = { "CandyStoreSnacks" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E100
            note = "metal_shelves @ oldmedical",
            coords = { x = genCoords.x - 1, y = genCoords.y + 19, z = genCoords.z },
            dist = { "CrateTortillaChips" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E101
            note = "metal_shelves @ oldmedical",
            coords = { x = genCoords.x - 2, y = genCoords.y + 19, z = genCoords.z },
            dist = { "StoreShelfDrinks", "FridgeSoda", "CrateSodaBottles" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E102
            note = "metal_shelves @ oldmedical",
            coords = { x = genCoords.x - 3, y = genCoords.y + 19, z = genCoords.z },
            dist = { "StoreShelfDrinks", "FridgeSoda", "CrateSodaBottles" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
    },
}
if getActivatedMods():contains("\\Ladders") then
    -- table.insert(EkronCC.objectSpawns, { sprite = "walls_garage_01_46", x = 13610, y = 1269, z = -4, removeWall = "west" })
    -- table.insert(EkronCC.objectSpawns, { sprite = "walls_garage_01_47", x = 754, y = 9796, z = -5, removeWall = "north", clearExisting = true, })
    -- table.insert(EkronCC.objectSpawns, { sprite = "fixtures_doors_01_53", x = 754, y = 9796, z = -5, isDoor = true, doorN = true, })
    -- table.insert(EkronCC.objectSpawns, { sprite = "floors_exterior_natural_01_10", x = 754, y = 9795, z = -5, isFloor = true, })
    -- table.insert(EkronCC.objectSpawns, { sprite = "walls_garage_01_32", x = 754, y = 9795, z = -5, })
    -- table.insert(EkronCC.objectSpawns, { sprite = "walls_garage_01_32", x = 755, y = 9795, z = -5, })

    table.insert(EkronCC.objectSpawns,
        { enabled = "EnableLadders", sprite = "walls_garage_02_16", x = 755, y = 9780, z = 0, })
    table.insert(EkronCC.objectSpawns, { enabled = "EnableLadders", x = 754, y = 9780, z = 0, removeFloor = true, })
end
return EkronCC
