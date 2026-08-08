-- @TODO (2026-08-07 audit) unresolved - delete lines as they are fixed
--   * entry 68: square holds no container at all - coords are stale or the
--     object was removed
local wtc = {x = 12327, y = 1326, z = -1} -- waterTankCoords
local pb1 = { x = 12325, y = 1325, z = -1 }
local LVPawnshop = {
    group = "Louisville",
    baseBuildings = {
        { x = 12324, y = 1325, z = 0 }, -- pawnshop
        { x = 12324, y = 1325, z = -1 }, -- basement
    },
    spawn = { x = 12324, y = 1325, z = 0 },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc.x, y = wtc.y, z = wtc.z, sourceType="generator", source = {x = 12331, y = 1326, z = -1}},
    },
    waterFixtures = {
        -- pawnshop proper
        { sprite = "fixtures_bathroom_01_5", x = 12329, y = 1327, z = 0, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_15", x = 12329, y = 1328, z = 0, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },

        -- basement
        { sprite = "fixtures_sinks_01_8", x = 12324, y = 1333, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_8", x = 12317, y = 1334, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_3", x = 12317, y = 1336, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_33", x = 12315, y = 1336, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_17", x = 12315, y = 1334, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_32", x = 12310, y = 1334, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "appliances_laundry_01_1", x = 12310, y = 1336, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },

        -- upstairs apts
        { sprite = "fixtures_sinks_01_8", x = 12328, y = 1330, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_25", x = 12328, y = 1327, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_0", x = 12329, y = 1327, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_2", x = 12330, y = 1327, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },

        { sprite = "fixtures_sinks_01_8", x = 12322, y = 1330, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_25", x = 12322, y = 1327, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_0", x = 12323, y = 1327, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_2", x = 12324, y = 1327, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },

        { sprite = "fixtures_sinks_01_10", x = 12321, y = 1330, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_25", x = 12321, y = 1327, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_0", x = 12320, y = 1327, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_2", x = 12319, y = 1327, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },

        { sprite = "fixtures_sinks_01_8", x = 12310, y = 1328, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_25", x = 12310, y = 1325, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_0", x = 12311, y = 1325, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_2", x = 12312, y = 1325, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },

    },
    doorKeys = {
        name = "Pawnshop",
        doors = {
            { sprite = "fixtures_doors_02_5", x = 12318, y = 1335, z = 0, },
            { sprite = "fixtures_doors_01_33", x = 12332, y = 1331, z = 0, },
            { sprite = "fixtures_doors_02_5", x = 12332, y = 1327, z = 1, },
            { sprite = "fixtures_doors_01_33", x = 12322, y = 1334, z = -1, },
        },
    },
    map = { name = "DWAPStashMap13", },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 12331, y = 1326, z = pb1.z },
            fuelTank = { sprite = "dwap_tiles_01_24", x= 12329, y= 1326, z= -1, },
            fakeGenerators = {
                { x = 12326, y = 1337, z = -1, createTile = false },
            },
        },
    },
    objectSpawns = {
        { sprite = "industry_02_175", x = pb1.x, y = pb1.y, z = pb1.z, disabled = "EnableGenSystemSolar", clearExisting = true, },

        { barricade = "metal", enabled = "Barricade", target="walls_commercial_01_41", x = 12311, y = 1337, z = 0, },
        { barricade = "metal", enabled = "Barricade", target="walls_commercial_01_41", x = 12312, y = 1337, z = 0, },
        { barricade = "metal", enabled = "Barricade", target="walls_commercial_01_41", x = 12314, y = 1337, z = 0, },
        { barricade = "metal", enabled = "Barricade", target="walls_commercial_01_41", x = 12315, y = 1337, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_doors_01_49", x = 12318, y = 1336, z = 0, },
        { barricade = "metal", enabled = "Barricade", target="walls_commercial_01_41", x = 12321, y = 1337, z = 0, },
        { barricade = "metal", enabled = "Barricade", target="walls_commercial_01_41", x = 12322, y = 1337, z = 0, },
        { barricade = "metal", enabled = "Barricade", target="walls_commercial_01_41", x = 12324, y = 1337, z = 0, },
        { barricade = "metal", enabled = "Barricade", target="walls_commercial_01_41", x = 12325, y = 1337, z = 0, },
    },
    loot = {
        -- basement
        -- kitchen/rec room
        { -- E1 trash box by entry
            coords = {x=12330,y=1329,z=-1},
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E2
            coords = {x=12328,y=1329,z=-1},
            dist = {"CrateVHSTapes"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E3
            coords = {x=12327,y=1329,z=-1},
            items = {
                { name = 'Base.Firewood', chance = 1, count = {10,10} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E4
            coords = {x=12324,y=1331,z=-1},
            dist = {"Homesteading",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E5
            coords = {x=12324,y=1331,z=-1},
            slot = "upper",
            dist = {"GigamartCrisps", "SafehouseFireplace"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E6
            coords = {x=12324,y=1332,z=-1},
            dist = {"CrateCannedFood", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E7
            coords = {x=12324,y=1332,z=-1},
            slot = "upper",
            dist = {"GigamartBakingMisc","CrateFlour", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E8
            coords = {x=12324,y=1333,z=-1},
            dist = {"GigamartDryGoods"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E9
            coords = {x=12324,y=1333,z=-1},
            slot = "upper",
            dist = { "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E10
            coords = {x=12324,y=1334,z=-1},
            dist = {"ButcherSpices","GigamartSpices","GroceryBagGourmet","CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E11
            coords = {x=12324,y=1334,z=-1},
            slot = "upper",
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E12 fridge
            coords = {x=12324,y=1336,z=-1},
            dist = {"FridgeFarmStorage", "FridgeGeneric"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E13 bookcases
            coords = {x=12331,y=1335,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E14
            coords = {x=12331,y=1334,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E15
            coords = {x=12331,y=1333,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        -- armory
        { -- E16
            coords = {x=12323,y=1334,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E17
            coords = {x=12323,y=1335,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E18
            coords = {x=12323,y=1336,z=-1},
            dist = {"GunStoreGuns","GunStoreMagsAmmo", "GunStoreAmmunition", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        -- bunk room 1
        { -- E19
            coords = {x=12320,y=1336,z=-1},
            dist = { "GunStoreKnives", "CampingStoreBackpacks" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E20
            coords = {x=12319,y=1336,z=-1},
            dist = {"FishermanTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E21
            coords = {x=12318,y=1334,z=-1},
            dist = {"CrateLiquor", "DishCabinetVIPLounge", "MusicStoreCDs", "CrateVHSTapes", "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        -- bathroom
        { -- E22
            coords = {x=12315,y=1334,z=-1},
            dist = {"TestingLab","ArmyStorageMedical", "ArmyBunkerMedical"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E23
            coords = {x=12315,y=1334,z=-1},
            slot = "upper",
            dist = {"MedicalCabinet","BathroomCounter"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        -- bunk room
        { -- E24
            coords = {x=12312,y=1334,z=-1},
            dist = {"ArmyStorageOutfit", "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateLinens"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E25
            coords = {x=12314,y=1334,z=-1},
            slot = "upper",
            dist = {"MedicalCabinet", "SafehouseMedical" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E26
            coords = {x=12314,y=1336,z=-1},
            dist = {"ArmyStorageOutfit", "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateLinens"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        -- laundry room
        { -- E27
            coords = {x=12310,y=1335,z=-1},
            dist = {"SewingStoreTools", "LaundryCleaning", "GymLaundry", "GymLockers"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        -- warehouse
        { -- E28
            coords = {x=12323,y=1328,z=-1},
            special = "essentials",
        },
        { -- E29
            coords = {x=12323,y=1327,z=-1},
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E30 freezer
            coords = {x=12323,y=1325,z=-1},
            dist = {"WesternKitchenFreezer", "WesternKitchenFridge", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E31 freezer
            coords = {x=12322,y=1325,z=-1},
            dist = {"FreezerIceCream", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E32 freezer
            coords = {x=12321,y=1325,z=-1},
            dist = {"ArenaKitchenFreezer", "SushiKitchenFreezer",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E33
            coords = {x=12320,y=1325,z=-1},
            dist = {"GasStoreEmergency","StoreCounterTobacco", "BurglarTools", "CarpenterTools", "BarnTools","SafehouseArmor", "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E34
            coords = {x=12319,y=1325,z=-1},
            dist = {"BurglarTools", "CarpenterTools", "BarnTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E35 metal shelves
            coords = {x=12317,y=1326,z=-1},
            dist = {"CampingStoreTools", "ArmyHangarTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E36
            coords = {x=12316,y=1326,z=-1},
            dist = {"CrateTools", "GarageTools", "BarnTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E37
            coords = {x=12314,y=1326,z=-1},
            dist = {"GigamartTools", "JanitorTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E38
            coords = {x=12313,y=1326,z=-1},
            dist = {"MetalShopTools", "MetalWorkerTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E39 wood crates
            coords = {x=12320,y=1327,z=-1},
            dist = {"CarSupplyTools", "GasStorageMechanics",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E40
            coords = {x=12319,y=1327,z=-1},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E41 metal shelves
            coords = {x=12317,y=1328,z=-1},
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = {8,10} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E42
            coords = {x=12316,y=1328,z=-1},
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = {9,12} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E43
            coords = {x=12314,y=1328,z=-1},
            items = {
                { name = 'Base.Firewood', chance = 1, count = {10,10} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E44
            coords = {x=12313,y=1328,z=-1},
            dist = {"CrateGravelBags", "CrateSandBags", "CrateClayBags"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E45 cardboardboxes
            coords = {x=12320,y=1329,z=-1},
            dist = {"GigamartCrisps","ArmyStorageElectronics", "RandomFiller" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E46
            coords = {x=12319,y=1329,z=-1},
            dist = {"ToolFactoryHandles" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E47 cardboardboxes
            coords = {x=12320,y=1330,z=-1},
            dist = {"GigamartCrisps","GasStoreEmergency"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E48
            coords = {x=12319,y=1330,z=-1},
            dist = {"CrateToiletPaper" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E49 metal shelves
            coords = {x=12317,y=1330,z=-1},
            dist = {"CrateLumber"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E50
            coords = {x=12316,y=1330,z=-1},
            dist = {"CrateSheetMetal", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E51
            coords = {x=12314,y=1330,z=-1},
            dist = {"ToolFactoryBarStock", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E52
            coords = {x=12313,y=1330,z=-1},
            dist = {"ArtStorePottery","CrateMasonry" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E53 metal shelves
            coords = {x=12320,y=1332,z=-1},
            dist = {"StoreShelfDrinks", "CrateCannedFood", "CrateSodaBottles", "CandyStoreSnacks", "CrateTortillaChips"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E54
            coords = {x=12319,y=1332,z=-1},
            dist = {"GigamartBakingMisc", "CrateFlour", "CrateOilVegetable" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E55
            coords = {x=12317,y=1332,z=-1},
            dist = { "CrateOilOlive", "CrateOilVegetable", "BakeryKitchenFreezer", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E56
            coords = {x=12316,y=1332,z=-1},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E57
            coords = {x=12314,y=1332,z=-1},
            dist = {"CafeKitchenSupplies", "CafeKitchenTea", "CrateSodaBottles"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E58
            coords = {x=12313,y=1332,z=-1},
            dist = {"CrateLiquor", "DishCabinetVIPLounge"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- Pawnshop
        { -- E59
            coords = {x=12321,y=1327,z=0},
            dist = {"SafehouseArmor", "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E60
            coords = {x=12319,y=1327,z=0},
            dist = {"SafehouseArmor", "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E61 closet
            coords = {x=12330,y=1329,z=0},
            slot = "upper",
            dist = {"LaundryCleaning", "JanitorCleaning"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- pawnshop gun room
        { -- E62
            coords = {x=12328,y=1329,z=0},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E63
            coords = {x=12329,y=1329,z=0},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        -- pawnshop proper
        { -- E64
            coords = {x=12333,y=1332,z=0},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E65
            coords = {x=12321,y=1331,z=0},
            dist = {"BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E66
            coords = {x=12332,y=1332,z=0},
            dist = {"BathroomCounter","ArmyStorageMedical", "ArmyBunkerMedical"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E67
            coords = {x=12331,y=1332,z=0},
            dist = {"ArmyStorageAmmunition", "SafehouseTraps", "GunStoreKnives",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E68
            coords = {x=12330,y=1332,z=1},
            dist = {"ArmyStorageOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateLinens"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E69
            coords = {x=12310,y=1325,z=0},
            dist = {"ArmyStorageOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "ToolStoreOutfit"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E70
            coords = {x=12311,y=1325,z=0},
            dist = {"CrateLeather", "SewingStoreFabric", "SewingStoreTools"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- E71
            coords = {x=12312,y=1325,z=0},
            dist = {"ArmyStorageOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "ToolStoreOutfit"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E72
            coords = {x=12313,y=1325,z=0},
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = {8,10} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E73
            coords = {x=12329,y=1336,z=0},
            dist = {"FirearmWeapons_Late", "SafehouseTraps", "ArmyStorageAmmunition", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E74
            coords = {x=12316,y=1325,z=0},
            slot = "upper",
            dist = {"GasStoreEmergency"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = 2,
        },
        { -- E75
            coords = {x=12317,y=1325,z=0},
            slot = "upper",
            dist = {"StoreCounterTobacco"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = 1,
        },
        { -- E76
            coords = {x=12318,y=1325,z=0},
            slot = "upper",
            dist = {"CandyStoreSnacks"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E77
            coords = {x=12315,y=1325,z=0},
            dist = {"FirearmWeapons_Late", "ArmyStorageAmmunition", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        -- storage room
        { -- E78
            coords = {x=12322,y=1327,z=0},
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E79
            coords = {x=12322,y=1328,z=0},
            dist = {"ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E80
            coords = {x=12322,y=1330,z=0},
            dist = {"WeldingWorkshopMetal", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E81
            coords = {x=12322,y=1331,z=0},
            dist = {"CrateLumber"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E82
            coords = {x=12324,y=1327,z=0},
            dist = {"CrateLumber", "CrateSheetMetal"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E83
            coords = {x=12324,y=1328,z=0},
            dist = {"CrateLumber", "CrateSheetMetal"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E84
            coords = {x=12324,y=1330,z=0},
            dist = {"ToolFactoryIngots" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E85
            coords = {x=12324,y=1331,z=0},
            dist = {"ArmyStorageElectronics", "RandomFiller", "ToolFactoryHandles" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },

        -- apts
        { -- E86
            coords = {x=12330,y=1329,z=1},
            dist = {"CrateLiquor", "DishCabinetVIPLounge"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E87
            coords = {x=12329,y=1332,z=1},
            dist = {"HuntingLockers", "RangerTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E88
            coords = {x=12328,y=1331,z=1},
            dist = {"FreezerIceCream", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E89
            coords = {x=12322,y=1331,z=1},
            dist = {"FreezerRich", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E90
            coords = {x=12322,y=1336,z=1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E91
            coords = {x=12324,y=1329,z=1},
            dist = {"CrateFlour", "CrateOilVegetable"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(LVPawnshop.objectSpawns, { enabled = "EnableLadders", sprite = "industry_trucks_01_49", x = 12322, y = 1313, z = -1, clearExisting = true, replaceWall= true, })
    table.insert(LVPawnshop.objectSpawns, { enabled = "EnableLadders", x = 12323, y = 1313, z = -1, clearExisting = true, })
    table.insert(LVPawnshop.objectSpawns, { enabled = "EnableLadders", x = 12324, y = 1313, z = -1, clearExisting = true, })
    table.insert(LVPawnshop.objectSpawns, { enabled = "EnableLadders", removeFloor = true, x = 12321, y = 1313, z = 0, })
    table.insert(LVPawnshop.objectSpawns, { enabled = "EnableLadders", sprite = "floors_interior_tilesandwood_01_31", x = 12323, y = 1313, z = 0, })
    table.insert(LVPawnshop.objectSpawns, { enabled = "EnableLadders", sprite = "floors_interior_tilesandwood_01_31", x = 12324, y = 1313, z = 0, })
end

return LVPawnshop