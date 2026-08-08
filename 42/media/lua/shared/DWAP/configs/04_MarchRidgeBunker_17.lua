-- @TODO (2026-08-07 audit) unresolved - delete lines as they are fixed
--   * stash has no buildingX/buildingY (DWAPStashDesc.lua "March Ridge Bunker
--     Map") - the map item will not highlight a building
local wtc = { x = 9955, y = 12620, z = -4, }
local MarchRidgeConfig = {
    group = "March Ridge",
    baseBuildings = {
        { x = 9960, y = 12624, z = -4 }, -- bunker
    },
    spawn = { x = 9960, y = 12624, z = -4, },
    doorKeys = {
        name = "Bunker",
        doors = {
            { x = 9925, y = 12625, z = 0, },
            { x = 9950, y = 12625, z = -4, },
            { sprite = "walls_garage_02_0", x = 9924, y = 12626, z = -4, },
            { sprite = "walls_garage_02_0", x = 9934, y = 12626, z = -4, },
            { sprite = "walls_garage_02_0", x = 9944, y = 12626, z = -4, },
        },
    },
    map = { name = "DWAPStashMap4", },
    objectSpawns = {
        { clearExisting = true, x = 9931, y = 12616, z = 0, disabled = "EnableWaterSystem", }, -- fountain
    },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 9947, y = 12616, z = -4, },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 9945, y = 12616, z = -4, },
            fakeGenerators = {
                { x = 9920, y = 12625, z = -4, createTile = false },
                { x = 9943, y = 12628, z = -4, createTile = false },
                { x = 9948, y = 12652, z = -4, createTile = false },
                { x = 9974, y = 12638, z = -4, createTile = false },
                { x = 9963, y = 12606, z = -4, createTile = false },
                { x = 9929, y = 12627, z = -1, createTile = false },
            },
        }
    },
    waterTanks = {
        { sprite = "industry_02_72", x = wtc.x, y = wtc.y, z = wtc.z, sourceType="generator", source = {x = 9947, y = 12616, z = -4} },
    },
    waterFixtures = {
        -- wash room sinks
        { sprite = "fixtures_sinks_01_6", x = 9956, y = 12604, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_6", x = 9956, y = 12605, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_6", x = 9956, y = 12606, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_6", x = 9956, y = 12607, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- wash room toilets
        { sprite = "fixtures_bathroom_01_5", x = 9952, y = 12603, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_5", x = 9952, y = 12604, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_5", x = 9952, y = 12605, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_5", x = 9952, y = 12606, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_5", x = 9952, y = 12607, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- washroom showers
        { sprite = "fixtures_bathroom_01_31", x = 9948, y = 12607, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_31", x = 9948, y = 12605, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_31", x = 9948, y = 12603, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_23", x = 9951, y = 12607, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_23", x = 9951, y = 12605, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_23", x = 9951, y = 12603, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },

        -- laundry room washers
        { sprite = "appliances_laundry_01_6", x = 9960, y = 12607, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "appliances_laundry_01_6", x = 9961, y = 12607, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- kitchen sink
        { sprite = "fixtures_sinks_01_17", x = 9967, y = 12610, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- utility sink
        { sprite = "fixtures_sinks_01_34", x = 9970, y = 12639, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- gym fountain
        { sprite = "fixtures_sinks_01_24", x = 9962, y = 12636, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- laundry room washers
        { sprite = "appliances_laundry_01_4", x = 9960, y = 12643, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "appliances_laundry_01_4", x = 9961, y = 12643, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- wash room sinks
        { sprite = "fixtures_sinks_01_6", x = 9956, y = 12646, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_6", x = 9956, y = 12645, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_6", x = 9956, y = 12644, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_6", x = 9956, y = 12643, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- wash room toilets
        { sprite = "fixtures_bathroom_01_5", x = 9952, y = 12643, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_5", x = 9952, y = 12644, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- {x = 9952, y = 12645, z = -4, sprite = "fixtures_bathroom_01_9",}, -- These are the urinals and PZ doesn't use them currently. Unsure if mods like Lifestyle do
        -- {x = 9952, y = 12646, z = -4, sprite = "fixtures_bathroom_01_9",},
        -- {x = 9952, y = 12647, z = -4, sprite = "fixtures_bathroom_01_9",},
        -- washroom showers
        { sprite = "fixtures_bathroom_01_31", x = 9948, y = 12647, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_31", x = 9948, y = 12645, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_31", x = 9948, y = 12643, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_23", x = 9951, y = 12647, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_23", x = 9951, y = 12645, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_23", x = 9951, y = 12643, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },

        -- decon showers
        { sprite = "fixtures_bathroom_01_22", x = 9944, y = 12628, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_22", x = 9945, y = 12628, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_22", x = 9946, y = 12628, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_22", x = 9947, y = 12628, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_22", x = 9948, y = 12628, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_22", x = 9949, y = 12628, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_30", x = 9946, y = 12626, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_30", x = 9947, y = 12626, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_22", x = 9946, y = 12624, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_22", x = 9947, y = 12624, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_30", x = 9944, y = 12622, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_30", x = 9945, y = 12622, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_30", x = 9946, y = 12622, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_30", x = 9947, y = 12622, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_30", x = 9948, y = 12622, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_30", x = 9949, y = 12622, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
    },
    loot = {
        { -- E1
            -- filingcabinet next to spawn in operations room
            
            coords = {x=9959,y=12627,z=-4},
            items = {
                { name = 'Base.Pencil', chance = 1, count = {2,5} },
                { name = 'Base.Notebook', chance = 1, count = {1,1} },
                { name = 'Base.Notebook', chance = 1, count = {1,1} },
                { name = 'Base.WristWatch_Left_DigitalBlack', chance = 1, count = {1,1} },
                { name = 'Base.WristWatch_Left_ClassicMilitary', chance = 1, count = {1,1} },
            },
        },
        { -- E2
            -- 2nd filingcabinet next to spawn in operations room
            
            coords = {x=9959,y=12628,z=-4},
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        -- kitchen
        { -- E3
            coords = {x=9967,y=12610,z=-4},
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E4
            coords = {x=9966,y=12610,z=-4},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E5
            coords = {x=9963,y=12610,z=-4},
            dist = {"CrateCannedFood",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E6
            coords = {x=9963,y=12612,z=-4},
            dist = {"GroceryBagGourmet",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E7
            coords = {x=9962,y=12610,z=-4},
            dist = {"CrateCannedFood",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E8
            coords = {x=9964,y=12612,z=-4},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E9
            coords = {x=9965,y=12612,z=-4},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E10
            coords = {x=9966,y=12612,z=-4},
            dist = {"StoreKitchenBaking",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- Armory
        { -- E11
            coords = {x=9974,y=12614,z=-4},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E12
            coords = {x=9975,y=12614,z=-4},
            dist = {"GunStoreGuns", "GunStoreMagsAmmo", "GunStoreAmmunition", "GunStoreAccessories", "DrugShackWeapons" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E13
            coords = {x=9976,y=12614,z=-4},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E14
            coords = {x=9977,y=12614,z=-4},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E15
            coords = {x=9974,y=12617,z=-4},
            dist = {"FirearmWeapons_Late",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E16
            coords = {x=9975,y=12617,z=-4},
            dist = {"DrugLabGuns"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E17
            coords = {x=9976,y=12617,z=-4},
            dist = {"ArmyStorageGuns","ArmyStorageAmmunition"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E18
            coords = {x=9977,y=12617,z=-4},
            dist = {"PoliceStorageGuns", "PoliceStorageAmmunition"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        -- medical
        { -- E19
            coords = {x=9969,y=12625,z=-4},
            slot = "upper",
            dist = {"MedicalCabinet"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E20
            coords = {x=9969,y=12626,z=-4},
            dist = {"MedicalClinicTools", "MedicalStorageDrugs"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E21
            coords = {x=9970,y=12626,z=-4},
            dist = {"ArmyStorageMedical", "ArmyBunkerMedical"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        -- book shelves
        { -- E22
            coords = {x=9980,y=12632,z=-4},
            dist = {"BookstoreNonFiction", "BookstoreMilitaryHistory"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = 1,
        },
        -- media storage
        { -- E23
            coords = {x=9973,y=12633,z=-4},
            sandboxEnable = 'Loot_EnableBooks',
            items = {
                { name = 'Base.BookAimingSet', chance = 1, count = {1,1} },
                { name = 'Base.BookHusbandrySet', chance = 1, count = {1,1} },
                { name = 'Base.BookButcheringSet', chance = 1, count = {1,1} },
                { name = 'Base.BookCarpentrySet', chance = 1, count = {1,1} },
                { name = 'Base.BookCarvingSet', chance = 1, count = {1,1} },
                { name = 'Base.BookCookingSet', chance = 1, count = {1,1} },
                { name = 'Base.BookElectricianSet', chance = 1, count = {1,1} },
                { name = 'Base.BookFarmingSet', chance = 1, count = {1,1} },
                { name = 'Base.BookFirstAidSet', chance = 1, count = {1,1} },
                { name = 'Base.BookFishingSet', chance = 1, count = {1,1} },
                { name = 'Base.BookForagingSet', chance = 1, count = {1,1} },
                { name = 'Base.BookGlassmakingSet', chance = 1, count = {1,1} },
            },
        },
        { -- E24
            coords = {x=9974,y=12633,z=-4},
            sandboxEnable = 'Loot_EnableBooks',
            items = {
                { name = 'Base.BookFlintKnappingSet', chance = 1, count = {1,1} },
                { name = 'Base.BookLongBladeSet', chance = 1, count = {1,1} },
                { name = 'Base.BookMaintenanceSet', chance = 1, count = {1,1} },
                { name = 'Base.BookMechanicsSet', chance = 1, count = {1,1} },
                { name = 'Base.BookBlacksmithSet', chance = 1, count = {1,1} },
                { name = 'Base.BookPotterySet', chance = 1, count = {1,1} },
                { name = 'Base.BookReloadingSet', chance = 1, count = {1,1} },
                { name = 'Base.BookTailoringSet', chance = 1, count = {1,1} },
                { name = 'Base.BookTrackingSet', chance = 1, count = {1,1} },
                { name = 'Base.BookTrappingSet', chance = 1, count = {1,1} },
                { name = 'Base.BookMetalWeldingSet', chance = 1, count = {1,1} },
            },
        },
        { -- E25
            coords = {x=9975,y=12633,z=-4},
            special = 'skillmags',
            sandboxEnable = 'Loot_EnableBooks',
        },
        { -- E26
            coords = {x=9976,y=12633,z=-4},
            dist = {"CrateTVWide", "CrateVHSTapes"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E27
            coords = {x=9977,y=12633,z=-4},
            dist = {"CrateVHSTapes"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E28
            coords = {x=9978,y=12633,z=-4},
            dist = {"MovieRentalShelves"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E29
            coords = {x=9975,y=12636,z=-4},
            dist = {"BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E30
            coords = {x=9976,y=12636,z=-4},
            dist = {"BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E31
            coords = {x=9977,y=12636,z=-4},
            dist = {"BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E32
            coords = {x=9978,y=12636,z=-4},
            dist = {"MusicStoreCDs"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        -- cleaning
        { -- E33
            coords = {x=9969,y=12633,z=-4},
            dist = {"LaundryCleaning", "JanitorCleaning"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E34
            coords = {x=9970,y=12633,z=-4},
            dist = {"LaundryCleaning", "JanitorCleaning"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- seed/farm library
        { -- E35
            coords = {x=9970,y=12631,z=-4},
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E36
            coords = {x=9970,y=12632,z=-4},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E37
            coords = {x=9968,y=12631,z=-4},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E38
            coords = {x=9968,y=12632,z=-4},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E39
            coords = {x=9966,y=12631,z=-4},
            sandboxEnable = 'SeedLibrary',
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = {8,10} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E40
            coords = {x=9966,y=12632,z=-4},
            sandboxEnable = 'SeedLibrary',
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = {9,12} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        -- fishing
        { -- E41
            coords = {x=9970,y=12628,z=-4},
            dist = {"CrateFishing", "FishermanTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E42 hunting
            coords = {x=9969,y=12628,z=-4},
            dist = {"HuntingLockers", "RangerTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E43
            coords = {x=9968,y=12628,z=-4},
            dist = {"CrateInstruments"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E44
            coords = {x=9967,y=12628,z=-4},
            dist = {"CrateLiquor"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E45
            coords = {x=9966,y=12628,z=-4},
            dist = {"CrateLiquor", "DishCabinetVIPLounge"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E46
            coords = {x=9965,y=12628,z=-4},
            dist = {"DishCabinetLiquor"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- tailoring
        { -- E47
            coords = {x=9969,y=12637,z=-4},
            dist = {"SewingStoreTools"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- E48
            coords = {x=9970,y=12637,z=-4},
            dist = {"SewingStoreFabric"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- E49
            coords = {x=9970,y=12638,z=-4},
            dist = {"CrateLeather"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- E50
            coords = {x=9966,y=12637,z=-4},
            dist = {"CrateToiletPaper"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E51
            coords = {x=9966,y=12638,z=-4},
            dist = {"BathroomCounter","LaundryCleaning", "JanitorCleaning"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E52
            coords = {x=9970,y=12640,z=-4},
            dist = {"ArmyStorageOutfit", "DrugLabOutfit"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        -- laundry room
        { -- E53
            coords = {x=9959,y=12643,z=-4},
            slot = "upper",
            dist = {"LaundryLoad1", "LaundryLoad2", "LaundryLoad3", "LaundryLoad4", "LaundryLoad5", "LaundryLoad6", "LaundryLoad7", "LaundryLoad8"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = 1,
        },
        { -- E54
            coords = {x=9959,y=12607,z=-4},
            slot = "upper",
            dist = {"LaundryLoad1", "LaundryLoad2", "LaundryLoad3", "LaundryLoad4", "LaundryLoad5", "LaundryLoad6", "LaundryLoad7", "LaundryLoad8"},
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
        { -- E55
            coords = {x=9944,y=12609,z=-4},
            dist = {"LaundryLoad1", "LaundryLoad2", "LaundryLoad3", "LaundryLoad4", "LaundryLoad5", "LaundryLoad6", "LaundryLoad7", "LaundryLoad8"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E56
            coords = {x=9944,y=12610,z=-4},
            dist = {"SafehouseArmor", "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E57
            coords = {x=9944,y=12611,z=-4},
            dist = {"ArmyStorageOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateLinens"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E58
            coords = {x=9944,y=12612,z=-4},
            dist = {"ArmyStorageOutfit", "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "ToolStoreOutfit"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E59
            coords = {x=9944,y=12613,z=-4},
            dist = {"ArmyStorageOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateBootsArmy"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        -- mens
        { -- E60
            coords = {x=9944,y=12637,z=-4},
            dist = {"LaundryLoad1", "LaundryLoad2", "LaundryLoad3", "LaundryLoad4", "LaundryLoad5", "LaundryLoad6", "LaundryLoad7", "LaundryLoad8"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E61
            coords = {x=9944,y=12638,z=-4},
            dist = {"SafehouseArmor", "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E62
            coords = {x=9944,y=12639,z=-4},
            dist = {"ArmyStorageOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateLinens"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E63
            coords = {x=9944,y=12640,z=-4},
            dist = {"ArmyStorageOutfit", "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "ToolStoreOutfit"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E64
            coords = {x=9944,y=12641,z=-4},
            dist = {"ArmyStorageOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateBootsArmy"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        -- entry storage 1
        { -- E65
            coords = {x=9950,y=12627,z=-4},
            dist = {"CampingLockers"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E66
            coords = {x=9950,y=12628,z=-4},
            dist = {"CampingStoreBackpacks"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E67
            coords = {x=9950,y=12629,z=-4},
            dist = { "GunStoreKnives", "PawnShopKnives",  },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E68
            coords = {x=9950,y=12630,z=-4},
            dist = {"SafehouseTraps", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E69
            coords = {x=9950,y=12631,z=-4},
            special = "essentials",
        },
        { -- E70
            coords = {x=9950,y=12632,z=-4},
            dist = {"ArmyStorageAmmunition", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        -- tools
        { -- E71
            coords = {x=9953,y=12630,z=-4},
            dist = {"CarSupplyTools", "GasStorageMechanics",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E72
            coords = {x=9953,y=12631,z=-4},
            dist = {"CampingStoreTools", "ArmyHangarTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E73
            coords = {x=9953,y=12632,z=-4},
            dist = {"BurglarTools", "CarpenterTools", "BarnTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E74
            coords = {x=9953,y=12633,z=-4},
            dist = {"CrateTools", "GarageTools", "BarnTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E75
            coords = {x=9953,y=12634,z=-4},
            dist = {"GigamartTools", "JanitorTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E76
            coords = {x=9953,y=12635,z=-4},
            dist = {"LoggingFactoryTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        -- random junk
        { -- E77
            coords = {x=9956,y=12628,z=-4},
            dist = {"CrateRandomJunk", "RandomFiller", "ArmySurplusMisc" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = 3,
        },
        { -- E78
            coords = {x=9956,y=12629,z=-4},
            dist = {"CrateCannedFood", "ArmySurplusTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E79
            coords = {x=9956,y=12630,z=-4},
            dist = {"CrateRandomJunk", "RandomFiller" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = 3,
        },
        { -- E80
            coords = {x=9956,y=12631,z=-4},
            dist = {"CrateCannedFood", "RandomFiller" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- mats
        { -- E81
            coords = {x=9956,y=12632,z=-4},
            dist = {"ArmyStorageElectronics", "RandomFiller" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E82
            coords = {x=9956,y=12633,z=-4},
            dist = {"ToolFactoryHandles" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E83
            coords = {x=9956,y=12635,z=-4},
            dist = {"ToolFactoryIngots" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E84
            coords = {x=9956,y=12634,z=-4},
            dist = {"CrateSheetMetal" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        -- entry storage 2
        { -- E85
            coords = {x=9944,y=12629,z=-4},
            dist = {"ToolFactoryBarStock"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E86
            coords = {x=9945,y=12629,z=-4},
            dist = {"CrateLumber"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E87
            coords = {x=9946,y=12629,z=-4},
            dist = {"CrateLumber"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E88
            coords = {x=9947,y=12629,z=-4},
            dist = {"CrateLumber", "CrateSheetMetal"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E89
            coords = {x=9948,y=12629,z=-4},
            dist = {"WeldingWorkshopMetal"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E90
            coords = {x=9949,y=12629,z=-4},
            dist = {"WeldingWorkshopMetal"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E91
            coords = {x=9947,y=12632,z=-4},
            items = {
                { name = 'Base.NailsCarton', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E92
            coords = {x=9946,y=12632,z=-4},
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E93
            coords = {x=9945,y=12632,z=-4},
            dist = {"ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E94
            coords = {x=9944,y=12632,z=-4},
            dist = {"StoreCounterTobacco"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = 1,
        },
        { -- E95
            coords = {x=9949,y=12635,z=-4},
            dist = {"GasStoreEmergency"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = 2,
        },
        { -- E96
            coords = {x=9948,y=12635,z=-4},
            dist = {"CrateFlour", "CrateOilVegetable"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E97
            coords = {x=9947,y=12635,z=-4},
            dist = {"CandyStoreSnacks"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E98
            coords = {x=9946,y=12635,z=-4},
            dist = {"CrateTortillaChips"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E99
            coords = {x=9945,y=12635,z=-4},
            dist = {"StoreShelfDrinks", "FridgeSoda", "CrateSodaBottles"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E100
            coords = {x=9944,y=12635,z=-4},
            dist = {"StoreShelfDrinks", "FridgeSoda", "CrateSodaBottles"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(MarchRidgeConfig.doorKeys.doors, { sprite = "industry_trucks_01_33", x = 9881, y = 12618, z = 0, })
    table.insert(MarchRidgeConfig.objectSpawns, { enabled = "EnableLadders", x = 9883, y = 12619, z = 0, removeFloor = true, clearExisting = true, })
    -- table.insert(MarchRidgeConfig.objectSpawns, { enabled = "EnableLadders", x = 9921, y = 12623, z = -4, removeWall = "west", })
end

return MarchRidgeConfig