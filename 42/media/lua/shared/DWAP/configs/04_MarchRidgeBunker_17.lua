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
            
            note = "filingcabinet @ empty",
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
            
            note = "filingcabinet @ empty",
            coords = {x=9959,y=12628,z=-4},
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        -- kitchen
        { -- E3
            note = "counter @ oldarmy",
            coords = {x=9967,y=12610,z=-4},
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E4
            note = "counter @ oldarmy",
            coords = {x=9966,y=12610,z=-4},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E5
            note = "counter @ oldarmy",
            coords = {x=9963,y=12610,z=-4},
            dist = {"CrateCannedFood",},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E6
            note = "counter @ oldarmy",
            coords = {x=9963,y=12612,z=-4},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E7
            note = "counter @ oldarmy",
            coords = {x=9962,y=12610,z=-4},
            dist = {"CrateCannedFood",},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E8
            note = "counter @ oldarmy",
            coords = {x=9964,y=12612,z=-4},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E9
            note = "counter @ oldarmy",
            coords = {x=9965,y=12612,z=-4},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E10
            note = "counter @ oldarmy",
            coords = {x=9966,y=12612,z=-4},
            dist = {"StoreKitchenBaking",},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        -- Armory
        { -- E11
            note = "locker @ empty",
            coords = {x=9974,y=12614,z=-4},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E12
            note = "locker @ empty",
            coords = {x=9975,y=12614,z=-4},
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E13
            note = "locker @ empty",
            coords = {x=9976,y=12614,z=-4},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E14
            note = "locker @ empty",
            coords = {x=9977,y=12614,z=-4},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E15
            note = "locker @ empty",
            coords = {x=9974,y=12617,z=-4},
            dist = {"FirearmWeapons_Late",},
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E16
            note = "locker @ empty",
            coords = {x=9975,y=12617,z=-4},
            dist = {"DrugLabGuns"},
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E17
            note = "locker @ empty",
            coords = {x=9976,y=12617,z=-4},
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E18
            note = "locker @ empty",
            coords = {x=9977,y=12617,z=-4},
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        -- medical
        { -- E19
            note = "medicine @ oldmedical",
            coords = {x=9969,y=12625,z=-4},
            slot = "upper",
            dist = {"MedicalCabinet"},
            distIncludeJunk = false,
            tag = "DWAPMed",
        },
        { -- E20
            note = "metal_shelves @ oldmedical",
            coords = {x=9969,y=12626,z=-4},
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E21
            note = "metal_shelves @ oldmedical",
            coords = {x=9970,y=12626,z=-4},
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        -- book shelves
        { -- E22
            note = "shelves @ empty",
            coords = {x=9980,y=12632,z=-4},
            dist = {"BookstoreNonFiction", "BookstoreMilitaryHistory"},
            distIncludeJunk = false,
            level = 1,
        },
        -- media storage
        { -- E23
            note = "metal_shelves @ empty",
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
            note = "metal_shelves @ empty",
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
            note = "metal_shelves @ empty",
            coords = {x=9975,y=12633,z=-4},
            special = 'skillmags',
            sandboxEnable = 'Loot_EnableBooks',
        },
        { -- E26
            note = "metal_shelves @ empty",
            coords = {x=9976,y=12633,z=-4},
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E27
            note = "metal_shelves @ empty",
            coords = {x=9977,y=12633,z=-4},
            dist = {"CrateVHSTapes"},
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E28
            note = "metal_shelves @ empty",
            coords = {x=9978,y=12633,z=-4},
            dist = {"MovieRentalShelves"},
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E29
            note = "metal_shelves @ empty",
            coords = {x=9975,y=12636,z=-4},
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E30
            note = "metal_shelves @ empty",
            coords = {x=9976,y=12636,z=-4},
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E31
            note = "metal_shelves @ empty",
            coords = {x=9977,y=12636,z=-4},
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E32
            note = "metal_shelves @ empty",
            coords = {x=9978,y=12636,z=-4},
            dist = {"MusicStoreCDs"},
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        -- cleaning
        { -- E33
            note = "metal_shelves @ empty",
            coords = {x=9969,y=12633,z=-4},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E34
            note = "metal_shelves @ empty",
            coords = {x=9970,y=12633,z=-4},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        -- seed/farm library
        { -- E35
            note = "metal_shelves @ oldarmy",
            coords = {x=9970,y=12631,z=-4},
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E36
            note = "metal_shelves @ oldarmy",
            coords = {x=9970,y=12632,z=-4},
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E37
            note = "metal_shelves @ oldarmy",
            coords = {x=9968,y=12631,z=-4},
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E38
            note = "metal_shelves @ oldarmy",
            coords = {x=9968,y=12632,z=-4},
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E39
            note = "metal_shelves @ oldarmy",
            coords = {x=9966,y=12631,z=-4},
            sandboxEnable = 'SeedLibrary',
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = {8,10} },
            },
            level = "Loot_FarmLevel",
        },
        { -- E40
            note = "metal_shelves @ oldarmy",
            coords = {x=9966,y=12632,z=-4},
            sandboxEnable = 'SeedLibrary',
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = {9,12} },
            },
            level = "Loot_FarmLevel",
        },
        -- fishing
        { -- E41
            note = "metal_shelves @ oldarmy",
            coords = {x=9970,y=12628,z=-4},
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E42 hunting
            note = "metal_shelves @ oldarmy",
            coords = {x=9969,y=12628,z=-4},
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E43
            note = "metal_shelves @ oldarmy",
            coords = {x=9968,y=12628,z=-4},
            dist = {"CrateInstruments"},
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E44
            note = "metal_shelves @ oldarmy",
            coords = {x=9967,y=12628,z=-4},
            dist = {"CrateLiquor"},
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E45
            note = "metal_shelves @ oldarmy",
            coords = {x=9966,y=12628,z=-4},
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E46
            note = "metal_shelves @ oldarmy",
            coords = {x=9965,y=12628,z=-4},
            dist = {"DishCabinetLiquor"},
            distIncludeJunk = true,
            tag = "DWAPBooze",
        },
        -- tailoring
        { -- E47
            note = "counter @ empty",
            coords = {x=9969,y=12637,z=-4},
            dist = {"SewingStoreTools"},
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E48
            note = "counter @ empty",
            coords = {x=9970,y=12637,z=-4},
            dist = {"SewingStoreFabric"},
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E49
            note = "counter @ empty",
            coords = {x=9970,y=12638,z=-4},
            dist = {"CrateLeather"},
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E50
            note = "metal_shelves @ empty",
            coords = {x=9966,y=12637,z=-4},
            dist = {"CrateToiletPaper"},
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E51
            note = "metal_shelves @ empty",
            coords = {x=9966,y=12638,z=-4},
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E52
            note = "bin @ empty",
            coords = {x=9970,y=12640,z=-4},
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        -- laundry room
        { -- E53
            note = "metal_shelves @ empty",
            coords = {x=9959,y=12643,z=-4},
            slot = "upper",
            dist = {"LaundryLoad1", "LaundryLoad2", "LaundryLoad3", "LaundryLoad4", "LaundryLoad5", "LaundryLoad6", "LaundryLoad7", "LaundryLoad8"},
            distIncludeJunk = true,
            level = 1,
        },
        { -- E54
            note = "metal_shelves @ empty",
            coords = {x=9959,y=12607,z=-4},
            slot = "upper",
            dist = {"LaundryLoad1", "LaundryLoad2", "LaundryLoad3", "LaundryLoad4", "LaundryLoad5", "LaundryLoad6", "LaundryLoad7", "LaundryLoad8"},
            distIncludeJunk = true,
            level = 1,
        },
        -- lockers
        -- SafehouseArmor
        -- SafehouseLighting
        -- ArmyStorageOutfit
        -- LockerArmyBedroom, LockerArmyBedroomHome, ArmySurplusOutfit, ToolStoreOutfit
        -- womens
        { -- E55
            note = "locker @ oldarmy",
            coords = {x=9944,y=12609,z=-4},
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E56
            note = "locker @ oldarmy",
            coords = {x=9944,y=12610,z=-4},
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E57
            note = "locker @ oldarmy",
            coords = {x=9944,y=12611,z=-4},
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E58
            note = "locker @ oldarmy",
            coords = {x=9944,y=12612,z=-4},
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E59
            note = "locker @ oldarmy",
            coords = {x=9944,y=12613,z=-4},
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -- mens
        { -- E60
            note = "locker @ oldarmy",
            coords = {x=9944,y=12637,z=-4},
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E61
            note = "locker @ oldarmy",
            coords = {x=9944,y=12638,z=-4},
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E62
            note = "locker @ oldarmy",
            coords = {x=9944,y=12639,z=-4},
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E63
            note = "locker @ oldarmy",
            coords = {x=9944,y=12640,z=-4},
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E64
            note = "locker @ oldarmy",
            coords = {x=9944,y=12641,z=-4},
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -- entry storage 1
        { -- E65
            note = "metal_shelves @ oldarmy",
            coords = {x=9950,y=12627,z=-4},
            dist = {"CampingLockers"},
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E66
            note = "metal_shelves @ oldarmy",
            coords = {x=9950,y=12628,z=-4},
            dist = {"CampingStoreBackpacks"},
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E67
            note = "metal_shelves @ oldarmy",
            coords = {x=9950,y=12629,z=-4},
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E68
            note = "metal_shelves @ oldarmy",
            coords = {x=9950,y=12630,z=-4},
            dist = {"SafehouseTraps", },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E69
            note = "metal_shelves @ oldarmy",
            coords = {x=9950,y=12631,z=-4},
            special = "essentials",
        },
        { -- E70
            note = "metal_shelves @ oldarmy",
            coords = {x=9950,y=12632,z=-4},
            dist = {"ArmyStorageAmmunition", },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        -- tools
        { -- E71
            note = "metal_shelves @ oldarmy",
            coords = {x=9953,y=12630,z=-4},
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E72
            note = "metal_shelves @ oldarmy",
            coords = {x=9953,y=12631,z=-4},
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E73
            note = "metal_shelves @ oldarmy",
            coords = {x=9953,y=12632,z=-4},
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E74
            note = "metal_shelves @ oldarmy",
            coords = {x=9953,y=12633,z=-4},
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E75
            note = "metal_shelves @ oldarmy",
            coords = {x=9953,y=12634,z=-4},
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E76
            note = "metal_shelves @ oldarmy",
            coords = {x=9953,y=12635,z=-4},
            dist = {"LoggingFactoryTools" },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        -- random junk
        { -- E77
            note = "metal_shelves @ oldarmy",
            coords = {x=9956,y=12628,z=-4},
            dist = {"CrateRandomJunk", "RandomFiller", "ArmySurplusMisc" },
            distIncludeJunk = true,
            level = 3,
        },
        { -- E78
            note = "metal_shelves @ oldarmy",
            coords = {x=9956,y=12629,z=-4},
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E79
            note = "metal_shelves @ oldarmy",
            coords = {x=9956,y=12630,z=-4},
            dist = {"CrateRandomJunk", "RandomFiller" },
            distIncludeJunk = true,
            level = 3,
        },
        { -- E80
            note = "metal_shelves @ oldarmy",
            coords = {x=9956,y=12631,z=-4},
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        -- mats
        { -- E81
            note = "metal_shelves @ oldarmy",
            coords = {x=9956,y=12632,z=-4},
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E82
            note = "metal_shelves @ oldarmy",
            coords = {x=9956,y=12633,z=-4},
            dist = {"ToolFactoryHandles" },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E83
            note = "metal_shelves @ oldarmy",
            coords = {x=9956,y=12635,z=-4},
            dist = {"ToolFactoryIngots" },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E84
            note = "metal_shelves @ oldarmy",
            coords = {x=9956,y=12634,z=-4},
            dist = {"CrateSheetMetal" },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        -- entry storage 2
        { -- E85
            note = "metal_shelves @ oldmedical",
            coords = {x=9944,y=12629,z=-4},
            dist = {"ToolFactoryBarStock"},
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E86
            note = "metal_shelves @ oldmedical",
            coords = {x=9945,y=12629,z=-4},
            dist = {"CrateLumber"},
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E87
            note = "metal_shelves @ oldmedical",
            coords = {x=9946,y=12629,z=-4},
            dist = {"CrateLumber"},
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E88
            note = "metal_shelves @ oldmedical",
            coords = {x=9947,y=12629,z=-4},
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E89
            note = "metal_shelves @ oldmedical",
            coords = {x=9948,y=12629,z=-4},
            dist = {"WeldingWorkshopMetal"},
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E90
            note = "metal_shelves @ oldmedical",
            coords = {x=9949,y=12629,z=-4},
            dist = {"WeldingWorkshopMetal"},
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E91
            note = "metal_shelves @ oldmedical",
            coords = {x=9947,y=12632,z=-4},
            items = {
                { name = 'Base.NailsCarton', },
            },
            level = "Loot_BuildMatsLevel",
        },
        { -- E92
            note = "metal_shelves @ oldmedical",
            coords = {x=9946,y=12632,z=-4},
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            level = "Loot_BuildMatsLevel",
        },
        { -- E93
            note = "metal_shelves @ oldmedical",
            coords = {x=9945,y=12632,z=-4},
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E94
            note = "metal_shelves @ oldmedical",
            coords = {x=9944,y=12632,z=-4},
            dist = {"StoreCounterTobacco"},
            distIncludeJunk = true,
            level = 1,
        },
        { -- E95
            note = "metal_shelves @ oldmedical",
            coords = {x=9949,y=12635,z=-4},
            dist = {"GasStoreEmergency"},
            distIncludeJunk = true,
            level = 2,
        },
        { -- E96
            note = "metal_shelves @ oldmedical",
            coords = {x=9948,y=12635,z=-4},
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E97
            note = "metal_shelves @ oldmedical",
            coords = {x=9947,y=12635,z=-4},
            dist = {"CandyStoreSnacks"},
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E98
            note = "metal_shelves @ oldmedical",
            coords = {x=9946,y=12635,z=-4},
            dist = {"CrateTortillaChips"},
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E99
            note = "metal_shelves @ oldmedical",
            coords = {x=9945,y=12635,z=-4},
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E100
            note = "metal_shelves @ oldmedical",
            coords = {x=9944,y=12635,z=-4},
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(MarchRidgeConfig.doorKeys.doors, { sprite = "industry_trucks_01_33", x = 9881, y = 12618, z = 0, })
    table.insert(MarchRidgeConfig.objectSpawns, { enabled = "EnableLadders", x = 9883, y = 12619, z = 0, removeFloor = true, clearExisting = true, })
    -- table.insert(MarchRidgeConfig.objectSpawns, { enabled = "EnableLadders", x = 9921, y = 12623, z = -4, removeWall = "west", })
end

return MarchRidgeConfig