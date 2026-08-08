-- @TODO (2026-08-07 audit) unresolved - delete lines as they are fixed
--   * entry 19: duplicate coordinates with an earlier entry - one of each
--     pair needs slot or stack addressing, or is redundant
local wtc1 = {x = 108, y = 8945, z = -1,}
local pb1 = { x = 113, y = 8945, z = -1 }
local bunkerTopLeft = {x = 103, y = 8944, z = -1}
local EkronPigFarm = {
    group = "Ekron",
    baseBuildings = {
        { x = 104, y = 8955, z = 1 }, -- farmhouse
        { x = 104, y = 8953, z = -1 }, -- basement
    },
    spawn = { x = 104, y = 8955, z = 1 },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 112, y = 8945, z = pb1.z },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 110, y = 8945, z= -1, },
            fakeGenerators = {
                { x = 110, y = 8959, z = -1, createTile = true },
            },
        },
    },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc1.x, y = wtc1.y, z = wtc1.z, sourceType="generator", source = {x = 112, y = 8945, z = -1} },
    },
    waterFixtures = {
        -- barn
        { sprite = "fixtures_sinks_01_32", x = 95, y = 8911, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        -- 2nd floor apts
        { sprite = "fixtures_bathroom_01_0", x = 104, y = 8954, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_1", x = 103, y = 8955, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_26", x = 103, y = 8956, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        -- 1st floor
        { sprite = "appliances_laundry_01_3", x = 99, y = 8954, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_1", x = 100, y = 8956, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_2", x = 102, y = 8956, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_9", x = 98, y = 8959, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        -- basement
        { sprite = "fixtures_sinks_01_16", x = 103, y = 8948, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_6", x = 105, y = 8952, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },

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
        { sprite = "industry_02_175", x = pb1.x, y = pb1.y, z = pb1.z, disabled = "EnableGenSystemSolar", clearExisting = true, },

        -- { sprite = "fixtures_railings_01_96", x = 98, y = 8958, z = 0, },
        -- { sprite = "fixtures_railings_01_89", x = 99, y = 8958, z = 0, },
        -- { sprite = "fixtures_railings_01_89", x = 100, y = 8958, z = 0, },
        -- { sprite = "fixtures_railings_01_88", x = 101, y = 8958, z = 0, },
        -- { sprite = "fixtures_railings_01_91", x = 101, y = 8959, z = 0, },

        { barricade = "woodhalf", enabled = "Barricade", target="walls_exterior_house_02_9", x = 97, y = 8965, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_exterior_house_02_9", x = 99, y = 8965, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_doors_01_44", x = 101, y = 8964, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_exterior_house_02_9", x = 103, y = 8963, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_exterior_house_02_8", x = 106, y = 8959, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_exterior_house_02_8", x = 106, y = 8956, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_exterior_house_02_8", x = 106, y = 8954, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_exterior_house_02_8", x = 106, y = 8951, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_exterior_wooden_01_37", x = 103, y = 8948, z = 0, },
    },
    loot = {
        { -- E1
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+2,z=bunkerTopLeft.z},
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E2
            sprite = 'location_trailer_02_23',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+3,z=bunkerTopLeft.z},
            slot = "upper",
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E3
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+3,z=bunkerTopLeft.z},
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E4
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+4,z=bunkerTopLeft.z},
            slot = "upper",
            dist = {"ButcherSpices","GigamartSpices","GroceryBagGourmet","CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E5
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+4,z=bunkerTopLeft.z},
            dist = {"TestingLab","MedicalCabinet","ArmyStorageMedical", "ArmyBunkerMedical"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E6
            sprite = 'location_trailer_02_23',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+5,z=bunkerTopLeft.z},
            slot = "upper",
            dist = {"CrateFishing", "FishermanTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E7
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+5,z=bunkerTopLeft.z},
            dist = {"GigamartCrisps","ArmyStorageElectronics", "RandomFiller" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E8
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+7,z=bunkerTopLeft.z},
            dist = {"GardenStoreTools", "Homesteading", "CrateLinens", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E9
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+8,z=bunkerTopLeft.z},
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E10
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+9,z=bunkerTopLeft.z},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E11
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+10,z=bunkerTopLeft.z},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E12
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+11,z=bunkerTopLeft.z},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E13
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+12,z=bunkerTopLeft.z},
            special = "essentials",
        },
        { -- E14
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y+5,z=bunkerTopLeft.z},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E15
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y+6,z=bunkerTopLeft.z},
            dist = {"CrateLiquor", "DishCabinetVIPLounge", "MusicStoreCDs", "CrateVHSTapes", "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E16
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y+7,z=bunkerTopLeft.z},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E17
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y,z=bunkerTopLeft.z},
            dist = {"GasStoreEmergency","StoreCounterTobacco", "BurglarTools", "CarpenterTools", "BarnTools","SafehouseArmor", "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E18
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y+1,z=bunkerTopLeft.z},
            dist = {"SafehouseTraps","GunStoreKnives","CampingStoreBackpacks","CrateLiquor", "CarSupplyTools","DrugLabOutfit"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E19
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y+1,z=bunkerTopLeft.z},
            dist = {"GunStoreKnives","CrateLiquor", "GasStorageMechanics","DrugLabOutfit"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E20
            coords = {x=105,y=8953,z=-1},
            dist = {"CrateTailoring", "CrateFabric_Cotton", "CrateFabric_DenimBlack", "CrateLeather","SewingStoreFabric"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- E21
            coords = {x=105,y=8954,z=-1},
            dist = {"CampingStoreTools", "ArmyHangarTools", "CarSupplyTools", "BurglarTools", "CarpenterTools", "BarnTools", "GarageTools","GigamartTools", "JanitorTools", "LoggingFactoryTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E22
            coords = {x=105,y=8955,z=-1},
            dist = {"GigamartBreakfast","GigamartCandy","Homesteading","CrateLiquor",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E23
            coords = {x=105,y=8956,z=-1},
            dist = {"SafehouseTraps","GunStoreKnives","CampingStoreBackpacks","CrateLiquor", "CarSupplyTools","DrugLabOutfit"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        -- warehouse room
        { -- E24
            coords = {x=107,y=8954,z=-1},
            dist = {"ArtStorePottery","CrateMasonry" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E25
            coords = {x=107,y=8953,z=-1},
            dist = { "GunStoreKnives", "PawnShopKnives",  },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E26
            coords = {x=107,y=8952,z=-1},
            dist = {"CrateLumber", "CrateSheetMetal", "ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        -- E27
        { --cardboard box
            
            coords = {x=109,y=8955,z=-1},
            dist = {"CrateLumber", "CrateSheetMetal", "ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        -- E28
        { --cardboard box
            
            coords = {x=109,y=8954,z=-1},
            dist = {"CrateLumber", "CrateSheetMetal", "ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        -- E29
        { --cardboard box
            
            coords = {x=110,y=8954,z=-1},
            dist = {"CrateLumber", "CrateSheetMetal", "ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E30
            coords = {x=109,y=8951,z=-1},
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = {9,12} },
                { name = 'Base.Fertilizer', chance = 1, count = {8,10} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E31
            coords = {x=109,y=8950,z=-1},
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = {9,12} },
                { name = 'Base.Fertilizer', chance = 1, count = {8,10} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E32
            coords = {x=109,y=8949,z=-1},
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E33
            coords = {x=109,y=8948,z=-1},
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.Plank', },
                { name = 'Base.LongStick', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E34
            coords = {x=111,y=8951,z=-1},
            dist = {"GigamartDryGoods", "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E35
            coords = {x=111,y=8950,z=-1},
            dist = {"GigamartDryGoods", "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E36
            coords = {x=111,y=8949,z=-1},
            dist = {"HuntingLockers", "RangerTools", "CrateFishing", "FishermanTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E37
            coords = {x=111,y=8948,z=-1},
            dist = {"ArmyStorageAmmunition", "SafehouseTraps", "GunStoreKnives",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E38
            coords = {x=113,y=8951,z=-1},
            dist = {"SewingStoreTools","SewingStoreFabric", "CrateLeather"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- E39
            coords = {x=113,y=8950,z=-1},
            dist = {"CrateBlacksmithing", "CrateCarpentry", "CrateMechanics", "CrateMetalwork" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E40
            coords = {x=113,y=8949,z=-1},
            dist = {"CrateFlour", "CrateOilVegetable"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E41
            coords = {x=113,y=8948,z=-1},
            dist = {"CrateGravelBags", "CrateSandBags", "CrateClayBags"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E42
            coords = {x=115,y=8953,z=-1},
            dist = {"MedicalStorageDrugs", "SafehouseMedical" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E43
            coords = {x=115,y=8952,z=-1},
            dist = {"CrateLiquor", "DishCabinetVIPLounge", "MusicStoreCDs", "CrateVHSTapes", "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E44
            coords = {x=115,y=8951,z=-1},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E45
            coords = {x=115,y=8950,z=-1},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E46
            coords = {x=115,y=8949,z=-1},
            dist = {"ToolCabinetMechanics","CrateMechanics"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E47
            coords = {x=115,y=8948,z=-1},
            dist = {"CrateCarpentry","LoggingFactoryTools"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        -- crates in the corner
        { -- E48
            coords = {x=114,y=8956,z=-1},
            dist = {"SafehouseBooze"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E49
            coords = {x=115,y=8956,z=-1},
            dist = {"CrateRandomJunk","GunStoreMagsAmmo", "GunStoreAmmunition", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E50
            coords = {x=116,y=8956,z=-1},
            dist = {"GasStoreEmergency","StoreCounterTobacco", "BurglarTools", "CarpenterTools", "BarnTools","SafehouseArmor", "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E51
            coords = {x=116,y=8955,z=-1},
            dist = {"SafehouseFireplace", "SafehouseLighting", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        -- freezer
        { -- E52
            coords = {x=115,y=8944,z=-1},
            dist = {"BurgerKitchenFreezer", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E53
            coords = {x=116,y=8944,z=-1},
            dist = {"ButcherFreezer", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        ------------------
        --- Main house ---
        ------------------
        -- kitchen
        { -- E54
            coords = {x=97,y=8959,z=0},
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E55
            coords = {x=96,y=8962,z=0},
            items = {
                { name = 'Base.Firewood', chance = 1, count = {30,30} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E56
            coords = {x=99,y=8959,z=0},
            dist = {"FreezerIceCream", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- office
        { -- E57
            coords = {x=103,y=8962,z=0},
            dist = {"MusicStoreCDs"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E58
            coords = {x=103,y=8960,z=0},
            dist = {"LivingRoomShelfClassy"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E59
            coords = {x=103,y=8959,z=0},
            dist = {"CrateVHSTapes"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E60
            coords = {x=103,y=8957,z=0},
            dist = {"ArmyStorageElectronics" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        -- hallway
        { -- E61
            coords = {x=98,y=8952,z=0},
            dist = {"LiquorStoreBeer","LiquorStoreBeerFancy"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E62
            coords = {x=99,y=8952,z=0},
            dist = {"CrateLiquor", "LiquorStoreWhiskey"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- 2nd floor
        -- bathroom
        { -- E63
            coords = {x=103,y=8955,z=1},
            dist = {"CrateToiletPaper", "CrateLinens","GasStoreToiletries"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        -- master bedroom
        { -- E64
            coords = {x=102,y=8962,z=1},
            dist = {"ArmyStorageOutfit", "DrugLabOutfit", "LockerArmyBedroom", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E65
            coords = {x=99,y=8962,z=1},
            dist = { "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateBootsArmy"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E66
            coords = {x=99,y=8959,z=1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(EkronPigFarm.objectSpawns, { enabled = "EnableLadders", sprite = "industry_trucks_01_7", x = 117, y = 8957, z = -1, removeWall = "north", })

    table.insert(EkronPigFarm.objectSpawns, { enabled = "EnableLadders", sprite = "walls_exterior_wooden_01_28", x = 117, y = 8925, z = 0, removeFloor = true, clearExisting = true, })
    table.insert(EkronPigFarm.objectSpawns, { enabled = "EnableLadders", sprite = "walls_exterior_wooden_01_29", x = 117, y = 8926, z = 0, })
end

return EkronPigFarm