local wtc = {x = 6957, y = 5565, z = -1} -- waterTankCoords
local pb1 = { x = 6952, y = 5566, z = -1 }
local RiverSafeHouse = {
    group = "Riverside",
    baseBuildings = {
        { x = 6965, y = 5584, z = 0 }, -- house
        { x = 6964, y = 5555, z = 0 }, -- barn/chicken coop
        { x = 7006, y = 5599, z = 0 }, -- barn/farm storage
    },
    spawn = { x = 6965, y = 5584, z = 0 },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc.x, y = wtc.y, z = wtc.z, sourceType="generator", source = {x = 6962, y = 5564, z = -1} },
    },
    waterFixtures = {
        { sprite = "fixtures_sinks_01_17", x = 6958, y = 5581, z = 0, sourceType="tank", source = wtc, }, -- kitchen, bld 27,21#0
        { sprite = "fixtures_sinks_01_17", x = 6964, y = 5589, z = 0, sourceType="tank", source = wtc, }, -- laundry, bld 27,21#0
        { sprite = "appliances_laundry_01_6", x = 6964, y = 5591, z = 0, sourceType="tank", source = wtc, }, -- laundry, bld 27,21#0
        { sprite = "fixtures_sinks_01_13", x = 6966, y = 5589, z = 0, sourceType="tank", source = wtc, }, -- bathroom, bld 27,21#0
        { sprite = "fixtures_bathroom_01_1", x = 6966, y = 5590, z = 0, sourceType="tank", source = wtc, }, -- bathroom, bld 27,21#0
        { sprite = "fixtures_bathroom_01_32", x = 6968, y = 5589, z = 0, sourceType="tank", source = wtc, }, -- bathroom, bld 27,21#0
        -- 2nd floor
        { sprite = "fixtures_bathroom_01_1", x = 6961, y = 5575, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 27,21#0
        { sprite = "fixtures_sinks_01_1", x = 6961, y = 5576, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 27,21#0
        { sprite = "fixtures_sinks_01_1", x = 6961, y = 5577, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 27,21#0
        { sprite = "fixtures_bathroom_01_25", x = 6963, y = 5575, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 27,21#0
        { sprite = "fixtures_bathroom_01_24", x = 6963, y = 5576, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 27,21#0
        -- basement fixtures
        { sprite = "appliances_laundry_01_3", x = 6960, y = 5564, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_6", x = 6960, y = 5565, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_1", x = 6958, y = 5565, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_33", x = 6958, y = 5564, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
    },
    doorKeys = {
        name = "Riverside Ivan Rd House",
        doors = {
        },
    },
    map = { name = "DWAPStashMap6", },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 6953, y = 5565, z = pb1.z },
            fuelTank = { sprite = "dwap_tiles_01_24", x= 6955, y= 5565, z= -1, },
            fakeGenerators = {
                -- { x = 6968, y = 5579, z = -1, createTile = false },
                { x = 6968, y = 5572, z = -1, createTile = false },
                { x = 7000, y = 5581, z = -1, createTile = false },
            },
        },
    },
    objectSpawns = {
        { sprite = "industry_02_175", x = pb1.x, y = pb1.y, z = pb1.z, disabled = "EnableGenSystemSolar", clearExisting = true, },

        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_windows_01_24", x = 6957, y = 5586, z = 0, }, -- window W | livingroom, bld 27,21#0
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_windows_01_24", x = 6957, y = 5587, z = 0, }, -- window W | livingroom, bld 27,21#0
        { barricade = "metalbar", enabled = "Barricade", target="fixtures_windows_01_25", x = 6958, y = 5581, z = 0, }, -- window N | kitchen, bld 27,21#0
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_doors_01_44", x = 6961, y = 5590, z = 0, }, -- door W | laundry, bld 27,21#0
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_windows_01_13", x = 6962, y = 5592, z = 0, }, -- window N | laundry, bld 27,21#0
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_windows_01_25", x = 6967, y = 5592, z = 0, }, -- window N | bathroom, bld 27,21#0
        { barricade = "metalbar", enabled = "Barricade", target="fixtures_windows_01_24", x = 6969, y = 5582, z = 0, }, -- window W | diningroom, bld 27,21#0
        { barricade = "metalbar", enabled = "Barricade", target="fixtures_windows_01_24", x = 6969, y = 5583, z = 0, }, -- window W | diningroom, bld 27,21#0
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_windows_01_24", x = 6969, y = 5590, z = 0, }, -- window W | bathroom, bld 27,21#0
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_windows_01_24", x = 6970, y = 5576, z = 0, }, -- window W | garagestorage, bld 27,21#0
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_windows_01_24", x = 6970, y = 5579, z = 0, }, -- window W | garagestorage, bld 27,21#0
        { barricade = "woodhalf", enabled = "Barricade", target="location_community_church_small_01_64", x = 6970, y = 5586, z = 0, }, -- door W | hall, bld 27,21#0
        { barricade = "woodhalf", enabled = "Barricade", target="location_community_church_small_01_68", x = 6970, y = 5587, z = 0, }, -- door W | hall, bld 27,21#0
    },
    loot = {
        -- basement
        { -- E1 liquor cabinet
            type = 'container',
            coords = {x=6955,y=5580,z=-1},
            dist = {"LiquorStoreBeer","LiquorStoreBeerFancy"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E2
            type = 'container',
            coords = {x=6955,y=5579,z=-1},
            dist = {"LiquorStoreWine"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E3 liquor cabinet
            type = 'container',
            coords = {x=6958,y=5572,z=-1},
            dist = {"CrateFishing", "FishermanTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E4
            type = 'container',
            coords = {x=6959,y=5572,z=-1},
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        -- crates by stairs
        { -- E5
            type = 'container',
            stack = 1,
            coords = {x=6960,y=5577,z=-1},
            dist = {"CrateGravelBags", "CrateSandBags", "CrateClayBags"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E5
            type = 'container',
            stack = 2,
            coords = {x=6960,y=5577,z=-1},
            dist = {"CrateGravelBags", "CrateSandBags", "CrateClayBags"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E6
            type = 'container',
            stack = 1,
            coords = {x=6960,y=5576,z=-1},
            dist = {"CrateLumber"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E6
            type = 'container',
            stack = 2,
            coords = {x=6960,y=5576,z=-1},
            dist = {"CrateLumber"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E7
            type = 'container',
            stack = 1,
            coords = {x=6960,y=5575,z=-1},
            dist = {"ToolFactoryBarStock", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E7
            type = 'container',
            stack = 2,
            coords = {x=6960,y=5575,z=-1},
            dist = {"ToolFactoryBarStock", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E8 foot locker
            type = 'container',
            coords = {x=6962,y=5577,z=-1},
            dist = {"SafehouseTraps","GunStoreKnives",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E9 cardboardbox
            type = 'container',
            coords = {x=6967,y=5576,z=-1},
            items = {
                { name = 'Base.Firewood', chance = 1, count = {10,10} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        -- basement rec room
        { -- E10
            type = 'container',
            coords = {x=6964,y=5568,z=-1},
            dist = {"CrateLiquor", "LiquorStoreBrandy"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E11
            type = 'container',
            coords = {x=6964,y=5567,z=-1},
            dist = {"SafehouseBooze"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E12 popcorn machine
            type = 'container',
            coords = {x=6964,y=5566,z=-1},
            dist = {"TheatreSnacks", "TheatrePopcorn"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- E13
        { --bookcase
            type = 'container',
            coords = {x=6964,y=5564,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E14 bookcase
            type = 'container',
            coords = {x=6965,y=5564,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E15 media stand
            type = 'container',
            coords = {x=6966,y=5564,z=-1},
            dist = {"CrateLiquor", "CrateVHSTapes",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E16 bookcase
            type = 'container',
            coords = {x=6967,y=5564,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        -- basement armory
        { -- E17
            type = 'container',
            coords = {x=6963,y=5570,z=-1},
            dist = {"FreezerIceCream", "WesternKitchenFreezer", "BakeryKitchenFreezer"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E18
            type = 'container',
            stack = 1,
            coords = {x=6963,y=5569,z=-1},
            dist = {"ArmySurplusMisc", "GunStoreGuns", "GunStoreMagsAmmo", "GunStoreAmmunition", "GunStoreAccessories", "DrugShackWeapons" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E18
            type = 'container',
            stack = 2,
            coords = {x=6963,y=5569,z=-1},
            dist = {"ArmySurplusMisc", "GunStoreGuns", "GunStoreMagsAmmo", "GunStoreAmmunition", "GunStoreAccessories", "DrugShackWeapons" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E19
            type = 'container',
            coords = {x=6963,y=5568,z=-1},
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E20
            type = 'container',
            coords = {x=6963,y=5567,z=-1},
            dist = {"GardenStoreTools", "Homesteading", "CrateLinens", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E21
            type = 'container',
            coords = {x=6963,y=5566,z=-1},
            dist = {"SushiKitchenFreezer", "WesternKitchenFreezer", "FreezerRich"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E22 mil locker
            type = 'container',
            coords = {x=6961,y=5565,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E23 mil locker
            type = 'container',
            coords = {x=6961,y=5566,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E24 mil locker
            type = 'container',
            coords = {x=6961,y=5567,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E25 mil locker
            type = 'container',
            coords = {x=6961,y=5568,z=-1},
            dist = {"SafehouseTraps","GunStoreKnives","CampingStoreBackpacks","CrateLiquor", "GasStorageMechanics", "DrugLabOutfit"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E26
            type = 'container',
            stack = 1,
            coords = {x=6961,y=5569,z=-1},
            dist = {"CrateRandomJunk","GunStoreMagsAmmo", "GunStoreAmmunition", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E26
            type = 'container',
            stack = 2,
            coords = {x=6961,y=5569,z=-1},
            dist = {"CrateRandomJunk","GunStoreMagsAmmo", "GunStoreAmmunition", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E27
            type = 'container',
            coords = {x=6961,y=5570,z=-1},
            dist = {"GasStoreEmergency","StoreCounterTobacco", "BurglarTools", "CarpenterTools", "BarnTools","SafehouseArmor", "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E28
            type = 'container',
            coords = {x=6961,y=5571,z=-1},
            special = "essentials",
        },
        -- infirmary/bathroom
        { -- E29
            type = 'container',
            coords = {x=6958,y=5571,z=-1},
            dist = {"LaboratoryLockers", "TestingLab","ArmyStorageMedical", "ArmyBunkerMedical"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E30
            type = 'container',
            coords = {x=6958,y=5570,z=-1},
            dist = {"MorgueTools", "MedicalCabinet","ArmyStorageMedical", "ArmyBunkerMedical" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E31
            type = 'container',
            coords = {x=6958,y=5569,z=-1},
            dist = {"BookstoreBiography", "MedicalOfficeBooks", "LibraryMedical", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E32
            type = 'container',
            coords = {x=6958,y=5568,z=-1},
            slot = "upper",
            dist = {"MedicalCabinet", "SafehouseMedical" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E33
            type = 'container',
            coords = {x=6960,y=5566,z=-1},
            dist = {"CrateToiletPaper" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E34
            type = 'container',
            coords = {x=6958,y=5565,z=-1},
            dist = {"BathroomCounter","ArmyStorageMedical", "ArmyBunkerMedical"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E35
            type = 'container',
            coords = {x=6958,y=5565,z=-1},
            slot = "upper",
            dist = {"BathroomCounter","CrateToiletPaper", "GasStoreToiletries", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        -- basement utility room/warehouse
        { -- E36
            type = 'container',
            stack = 1,
            coords = {x=6956,y=5571,z=-1},
            dist = {"GigamartCrisps","GigamartDryGoods"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E36
            type = 'container',
            stack = 2,
            coords = {x=6956,y=5571,z=-1},
            dist = {"GigamartCrisps","GigamartDryGoods"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E37
            type = 'container',
            coords = {x=6955,y=5571,z=-1},
            dist = {"GigamartCrisps","ArmyStorageElectronics", "RandomFiller" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E38
            type = 'container',
            coords = {x=6954,y=5571,z=-1},
            dist = {"ButcherSpices","GigamartSpices","GroceryBagGourmet",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E39
            type = 'container',
            coords = {x=6953,y=5571,z=-1},
            dist = {"CrateCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E40
            type = 'container',
            coords = {x=6952,y=5571,z=-1},
            dist = {"CafeKitchenSupplies", "CafeKitchenTea", "CrateSodaBottles"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E41
            type = 'container',
            stack = 1,
            coords = {x=6956,y=5569,z=-1},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E41
            type = 'container',
            stack = 2,
            coords = {x=6956,y=5569,z=-1},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E42
            type = 'container',
            coords = {x=6955,y=5569,z=-1},
            dist = {"SewingStoreTools", "CrateLeather", "SewingStoreFabric"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- E43
            type = 'container',
            coords = {x=6954,y=5569,z=-1},
            dist = {"CrateLumber", "CrateSheetMetal"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E44
            type = 'container',
            coords = {x=6953,y=5569,z=-1},
            dist = {"CrateLiquor", "MusicStoreCDs", "ComicStoreDisplayDice", "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E45
            type = 'container',
            coords = {x=6952,y=5569,z=-1},
            dist = {"CrateVHSTapes"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E46
            type = 'container',
            coords = {x=6956,y=5567,z=-1},
            dist = {"GunStoreGuns", "GunStoreMagsAmmo", "GunStoreAmmunition", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E47
            type = 'container',
            coords = {x=6955,y=5567,z=-1},
            dist = {"ArtStorePottery","CrateMasonry" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E48
            type = 'container',
            coords = {x=6954,y=5567,z=-1},
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = {9,12} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E49
            type = 'container',
            coords = {x=6953,y=5567,z=-1},
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = {8,10} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E50
            type = 'container',
            coords = {x=6952,y=5567,z=-1},
            dist = {"GigamartCrisps","GasStoreEmergency"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        -- first floor
        { -- E51
            type = 'container',
            coords = {x=6961,y=5579,z=1},
            dist = {"CampingLockers"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E52
            type = 'container',
            coords = {x=6965,y=5580,z=0},
            dist = { "GunStoreKnives", "PawnShopKnives",  },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E53
            type = 'container',
            coords = {x=6964,y=5580,z=0},
            dist = {"SafehouseArmor", "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E54
            type = 'container',
            stack = 1,
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E55
            type = 'container',
            stack = 2,
            dist = {"MeleeWeapons", "MeleeWeapons_Mid", "CampingStoreBackpacks"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E56
            type = 'container',
            coords = {x=6963,y=5555,z=0},
            slot = "upper", -- square carries only a High metal_shelves
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E57
            type = 'container',
            coords = {x=6963,y=5556,z=0},
            dist = {"HuntingLockers", "RangerTools", "CrateFishing", "FishermanTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E58
            type = 'container',
            coords = {x=6963,y=5583,z=0},
            dist = {"CrateLiquor", "DishCabinetVIPLounge"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- kitchen
        { -- E59
            type = 'container',
            slot = 'freezer',
            coords = {x=6957,y=5582,z=0},
            dist = {"FreezerRich", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E60
            type = 'container',
            coords = {x=6957,y=5582,z=0},
            dist = { "MotelFridge", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E61
            type = 'container',
            slot = 'upper',
            coords = {x=6957,y=5582,z=0},
            dist = {"ButcherSpices","GigamartSpices",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E62
            type = 'container',
            coords = {x=6957,y=5581,z=0},
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E63
            type = 'container',
            coords = {x=6957,y=5581,z=0},
            slot = "upper",
            dist = {"GroceryBagGourmet","CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E64
            type = 'container',
            coords = {x=6958,y=5581,z=0},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E65
            type = 'container',
            slot = 'upper',
            coords = {x=6958,y=5581,z=0},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E66
            type = 'container',
            coords = {x=6959,y=5581,z=0},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E67
            type = 'container',
            coords = {x=6961,y=5581,z=0},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E68
            type = 'container',
            slot = 'upper',
            coords = {x=6961,y=5581,z=0},
            dist = {"KitchenBottles", "KitchenBreakfast", "KitchenRandom"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E69
            type = 'container',
            coords = {x=6961,y=5578,z=1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        -- living area
        { -- E70
            type = 'container',
            coords = {x=6957,y=5586,z=0},
            dist = {"BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E71
            type = 'container',
            coords = {x=6964,y=5576,z=1},
            slot = "upper",
            dist = {"BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E72
            type = 'container',
            coords = {x=6964,y=5581,z=1},
            dist = {"ArmyStorageElectronics", "RandomFiller" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E73
            type = 'container',
            coords = {x=7002,y=5590,z=0},
            dist = {"ToolFactoryHandles", "ToolFactoryIngots" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        -- other bathrom/sink area
        { -- E74
            type = 'container',
            coords = {x=6966,y=5591,z=0},
            dist = {"BathroomCounter","ArmyStorageMedical", "ArmyBunkerMedical", "MedicalClinicTools", "MedicalStorageDrugs"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E75
            type = 'container',
            coords = {x=6963,y=5584,z=0},
            dist = {"CrateCannedFood", "ArmySurplusTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E76
            type = 'container',
            coords = {x=7002,y=5591,z=0},
            dist = {"CrateLumber", "CrateSheetMetal"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        -- nearby shed
        { -- E77
            type = 'container',
            coords = {x=7007,y=5590,z=0},
            dist = {"CarSupplyTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E78
            type = 'container',
            coords = {x=7004,y=5590,z=0},
            slot = "upper", -- square carries only a High metal_shelves
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E79
            type = 'container',
            coords = {x=6964,y=5589,z=0},
            dist = {"GigamartHousewares", "GigamartBedding" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(RiverSafeHouse.generators[1].fakeGenerators, { x = 6989, y = 5570, z = -1, createTile = false })
    table.insert(RiverSafeHouse.generators[1].fakeGenerators, { x = 7008, y = 5591, z = -1, createTile = false })

    table.insert(RiverSafeHouse.objectSpawns, { enabled = "EnableLadders", x = 6957, y = 5569, z = -1, removeWall = "west" })
    table.insert(RiverSafeHouse.objectSpawns, { enabled = "EnableLadders", sprite = "walls_exterior_wooden_01_34", x = 6957, y = 5569, z = -1 })
    table.insert(RiverSafeHouse.objectSpawns, { enabled = "EnableLadders", sprite = "fixtures_doors_01_12", x = 6957, y = 5569, z = -1, isDoor = true, doorN = false, })
    table.insert(RiverSafeHouse.objectSpawns, { enabled = "EnableLadders", sprite = "location_shop_bargNclothes_01_24", x = 7009, y = 5591, z = 0, removeFloor = true, })
    table.insert(RiverSafeHouse.objectSpawns, { enabled = "EnableLadders", sprite = "location_shop_bargNclothes_01_25", x = 7009, y = 5592, z = 0, })
end

return RiverSafeHouse