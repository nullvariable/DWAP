-- @TODO (2026-08-07 audit) unresolved - delete lines as they are fixed
--   * 54 skeleton entries carry coords but no loot yet - entries 72-125
--   * systems: 9 components at 6663-6676,5499-5509 z=-1,1 report "square not
--     loaded" - those chunks never stream when travelling to this base, which
--     is what a pre-move or otherwise wrong coordinate looks like
--   * systems: 11 components at 6662-6680,5504-5518 z=-1,0,1 name a sprite
--     that is not on the square, though the square itself loads - config
--     drifted from the map
local wtc1 = {x = 6663, y = 5503, z = -1,}
local pb1 = { x = 6659, y = 5514, z = -1 }
local RiversideMansion = {
    group = "Riverside",
    baseBuildings = {
        { x = 6680, y = 5509, z = 1 }, -- mansion
        { x = 6669, y = 5519, z = -1 }, -- basement
    },
    spawn = { x = 6680, y = 5509, z = 1 },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 6663, y = 5513, z = pb1.z },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 6661, y = 5513, z= -1, },
            fakeGenerators = {
                { x = 6671, y = 5523, z = -2, },
            },
        },
    },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc1.x, y = wtc1.y, z = wtc1.z, sourceType="generator", source = {x = 6666, y = 5500, z = -1} },
    },
    waterFixtures = {
        -- 2nd floor
        { sprite = "fixtures_bathroom_01_25", x = 6674, y = 5504, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_2", x = 6676, y = 5504, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_3", x = 6676, y = 5505, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_3", x = 6676, y = 5506, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_32", x = 6678, y = 5511, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_25", x = 6680, y = 5511, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_3", x = 6680, y = 5514, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_3", x = 6680, y = 5515, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_2", x = 6680, y = 5516, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        -- 1st floor
        { sprite = "fixtures_bathroom_01_0", x = 6669, y = 5504, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_12", x = 6670, y = 5504, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "appliances_laundry_01_0", x = 6671, y = 5507, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_9", x = 6677, y = 5504, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        -- basement
        { sprite = "fixtures_sinks_01_12", x = 6676, y = 5499, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_24", x = 6667, y = 5504, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_34", x = 6671, y = 5508, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_16", x = 6662, y = 5518, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_28", x = 6676, y = 5509, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_3", x = 6675, y = 5509, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },

    },
    doorKeys = {
        name = "Riverside Mansion",
        doors = {
            { sprite = "fixtures_doors_02_5", x = 6674, y = 5516, z = 0, },
            { sprite = "fixtures_doors_02_4", x = 6676, y = 5506, z = -1, },
            { sprite = "fixtures_doors_01_32", x = 6668, y = 5503, z = -1, },
        },
    },
    map = { name = "DWAPStashMap25", },
    objectSpawns = {
        -- { sprite = "camping_01_64", x = 6674, y = 5497, z = 0, enabled = "EnableWaterSystem", }, -- fountain
        { sprite = "industry_02_175", x = pb1.x, y = pb1.y, z = pb1.z, disabled = "EnableGenSystemSolar", clearExisting = true, },

        { barricade = "metalbar", enabled = "Barricade", target="walls_interior_house_04_29", x = 6677, y = 5504, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_doors_02_5", x = 6679, y = 5504, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target="walls_exterior_house_02_24", x = 6681, y = 5508, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target="walls_exterior_house_02_25", x = 6679, y = 5517, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target="walls_exterior_house_02_25", x = 6677, y = 5517, z = 0, },
        { barricade = "metal", enabled = "Barricade", target="walls_interior_house_04_40", x = 6669, y = 5505, z = 0, },
    },
    loot = {

        -- basement
        -- armory
        { -- E1
            coords = {x=6670,y=5524,z=-1},
            dist = {"ArmyStorageGuns","ArmyStorageAmmunition","FirearmWeapons_Late"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E2
            coords = {x=6670,y=5525,z=-1},
            dist = { "GunStoreKnives", "PawnShopKnives",  },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E3
            coords = {x=6670,y=5526,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E4
            coords = {x=6670,y=5527,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E5
            coords = {x=6670,y=5528,z=-1},
            dist = {"ArmyStorageAmmunition", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E6
            coords = {x=6670,y=5529,z=-1},
            dist = {"HuntingLockers", "RangerTools", "CrateFishing", "FishermanTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E7
            coords = {x=6670,y=5530,z=-1},
            dist = {"ArmyStorageElectronics", "ToolFactoryIngots" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E8
            coords = {x=6670,y=5532,z=-1},
            dist = {"ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E9
            coords = {x=6670,y=5533,z=-1},
            dist = {"CrateSheetMetal","CrateLumber" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E10
            coords = {x=6670,y=5534,z=-1},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E11
            coords = {x=6673,y=5527,z=-1},
            special = "essentials",
        },
        { -- E12
            coords = {x=6673,y=5528,z=-1},
            dist = { "CarSupplyTools", "GasStorageMechanics",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E13
            coords = {x=6673,y=5529,z=-1},
            dist = {"CampingStoreTools", "ArmyHangarTools", "CarSupplyTools", "BurglarTools", "CarpenterTools", "BarnTools", "GarageTools","GigamartTools", "JanitorTools", "LoggingFactoryTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E14
            coords = {x=6673,y=5530,z=-1},
            dist = {"GasStoreEmergency", "StoreCounterTobacco", "CandyStoreSnacks"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E15
            coords = {x=6673,y=5531,z=-1},
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = {9,12} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E16
            coords = {x=6673,y=5532,z=-1},
            dist = {"ArmyStorageOutfit", "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateBootsArmy", "RandomFiller"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E17
            coords = {x=6673,y=5533,z=-1},
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = {8,10} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E18
            coords = {x=6673,y=5534,z=-1},
            dist = {"ArtStorePottery",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        -- infirmary
        { -- E19
            coords = {x=6669,y=5516,z=-1},
            dist = {"LaboratoryLockers", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E20
            coords = {x=6669,y=5515,z=-1},
            dist = {"MorgueTools", "ArmyStorageMedical", "ArmyBunkerMedical" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E21
            coords = {x=6669,y=5514,z=-1},
            dist = {"MedicalClinicDrugs" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E22
            coords = {x=6669,y=5514,z=-1},
            slot = "upper",
            dist = {"MedicalCabinet" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E23
            coords = {x=6669,y=5512,z=-1},
            dist = {"MedicalCabinet", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E24
            coords = {x=6673,y=5515,z=-1},
            dist = {"ArmyStorageMedical", "ArmyBunkerMedical" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E25
            coords = {x=6673,y=5516,z=-1},
            dist = {"SafehouseMedical_Late", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        -- study
        { -- E26
            coords = {x=6668,y=5516,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E27
            coords = {x=6667,y=5516,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E28
            coords = {x=6668,y=5512,z=-1},
            dist = {"CrateLiquor", "LiquorStoreWhiskey"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E29
            coords = {x=6667,y=5512,z=-1},
            dist = {"CrateLiquor", "DishCabinetVIPLounge"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E30
            coords = {x=6664,y=5513,z=-1},
            items = {
                { name = 'Base.Firewood', chance = 1, count = {10,10} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E31
            coords = {x=6664,y=5514,z=-1},
            dist = {"BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E32
            coords = {x=6664,y=5515,z=-1},
            dist = {"BookstoreBiography", "BookstoreArt", "BookstoreGeneralReference", "BookstoreChilds", "BookstoreHistory", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        -- west storage
        { -- E33
            coords = {x=6661,y=5521,z=-1},
            dist = {"CrateTools", "GarageTools", "BarnTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E34
            coords = {x=6661,y=5522,z=-1},
            dist = {"BurglarTools", "CarpenterTools", "BarnTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E35
            coords = {x=6663,y=5519,z=-1},
            dist = {"CampingStoreTools", "ArmyHangarTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E36
            coords = {x=6660,y=5519,z=-1},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E37
            coords = {x=6659,y=5519,z=-1},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E38
            coords = {x=6659,y=5521,z=-1},
            dist = {"SewingStoreTools","SewingStoreFabric", "CrateLeather"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- E39
            coords = {x=6659,y=5522,z=-1},
            dist = {"GigamartBreakfast","GigamartCandy","Homesteading","CrateLiquor",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E40
            coords = {x=6659,y=5523,z=-1},
            dist = {"ArmyStorageAmmunition", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E41
            coords = {x=6663,y=5520,z=-1},
            items = {
                { name = 'Base.Shoes_ArmyBoots', chance = 1, count = {7,13} },
                { name = 'Base.Shoes_ArmyBootsDesert', chance = 1, count = {3,7} },
            },
        },
        { -- E42
            coords = {x=6663,y=5521,z=-1},
            dist = {"ArmyStorageOutfit", "DrugLabOutfit", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E43
            coords = {x=6663,y=5522,z=-1},
            dist = {"SafehouseArmor",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E44
            coords = {x=6663,y=5523,z=-1},
            dist = {"SafehouseArmor",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        -- workshop
        { -- E45
            coords = {x=6668,y=5523,z=-1},
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E46
            coords = {x=6668,y=5522,z=-1},
            dist = {"ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E47
            coords = {x=6665,y=5519,z=-1},
            dist = { "CrateTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E48
            coords = {x=6668,y=5520,z=-1},
            dist = { "ToolFactoryHandles", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        -- living room
        { -- E49
            coords = {x=6667,y=5531,z=-1},
            dist = {"CrateVHSTapes"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E50
            coords = {x=6665,y=5524,z=-1},
            dist = {"LiquorStoreBeer","LiquorStoreBeerFancy","LiquorStoreWine"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E51
            coords = {x=6666,y=5524,z=-1},
            dist = {"CrateLiquor", "LiquorStoreBrandy"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E52
            coords = {x=6667,y=5524,z=-1},
            dist = {"CrateLiquor", "LiquorStoreMix"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- kitchen
        { -- E53
            coords = {x=6663,y=5527,z=-1},
            dist = {"TheatrePopcorn"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E54
            coords = {x=6663,y=5528,z=-1},
            dist = {"TheatreSnacks"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E55
            coords = {x=6663,y=5529,z=-1},
            dist = {"BarCounterMisc"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E56
            coords = {x=6663,y=5530,z=-1},
            dist = {"CafeKitchenCoffee"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E57
            coords = {x=6663,y=5531,z=-1},
            dist = {"BakeryKitchenFreezer"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E58
            coords = {x=6662,y=5534,z=-1},
            dist = {"SushiKitchenFreezer"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E59
            coords = {x=6661,y=5534,z=-1},
            dist = {"FreezerIceCream", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E60
            coords = {x=6659,y=5534,z=-1},
            dist = {"PizzaKitchenFreezer", "PizzaKitchenFridge"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E61
            coords = {x=6659,y=5533,z=-1},
            dist = {"SpiffosKitchenFridge", "SpiffosKitchenFreezer"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E62
            coords = {x=6659,y=5527,z=-1},
            dist = {"FridgeFarmStorage", "FridgeGeneric", "SushiKitchenFridge"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E63
            coords = {x=6659,y=5532,z=-1},
            dist = {"GigamartBreakfast"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E64
            coords = {x=6659,y=5532,z=-1},
            slot = "upper",
            dist = {"StoreKitchenPotatoes"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E65
            coords = {x=6659,y=5531,z=-1},
            dist = {"CrateSodaBottles", "CrateSodaCans"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E66
            coords = {x=6659,y=5531,z=-1},
            slot = "upper",
            dist = {"ArenaKitchenSauce"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E67
            coords = {x=6659,y=5530,z=-1},
            dist = {"GigamartDryGoods", "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E68
            coords = {x=6659,y=5530,z=-1},
            slot = "upper",
            dist = {"CrateTortillaChips", "KitchenDryFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E69
            coords = {x=6659,y=5529,z=-1},
            dist = {"GigamartBakingMisc", "CrateFlour", "CrateOilVegetable" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E70
            coords = {x=6659,y=5529,z=-1},
            slot = "upper",
            dist = {"ButcherSpices","GigamartSpices","GroceryBagGourmet",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E71
            coords = {x=6662,y=5524,z=-1},
            dist = {"KitchenBook","GigamartSpices",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E72
            note = "desk @ kidsbedroom",
            coords = {x=6680,y=5507,z=1},
        },
        { -- E73
            note = "dresser @ kidsbedroom",
            coords = {x=6679,y=5507,z=1},
        },
        { -- E74
            note = "wardrobe @ kidsbedroom",
            coords = {x=6678,y=5509,z=1},
        },
        { -- E75
            note = "wardrobe @ kidsbedroom",
            coords = {x=6678,y=5510,z=1},
        },
        { -- E76
            note = "counter @ bathroom",
            coords = {x=6681,y=5514,z=1},
        },
        { -- E77
            note = "shelves @ kidsbedroom",
            coords = {x=6681,y=5515,z=1},
        },
        { -- E78
            note = "dresser @ kidsbedroom",
            coords = {x=6678,y=5518,z=1},
        },
        { -- E79
            note = "wardrobe @ hall",
            coords = {x=6672,y=5511,z=1},
        },
        { -- E80
            note = "wardrobe @ hall",
            coords = {x=6673,y=5511,z=1},
        },
        { -- E81
            note = "dresser @ hall",
            coords = {x=6673,y=5517,z=1},
        },
        { -- E82
            note = "counter @ bathroom",
            coords = {x=6669,y=5516,z=1},
        },
        { -- E83
            note = "wardrobe @ closet",
            coords = {x=6667,y=5515,z=1},
        },
        { -- E84
            note = "wardrobe @ closet",
            coords = {x=6667,y=5516,z=1},
        },
        { -- E85
            note = "dresser @ bedroom",
            coords = {x=6667,y=5511,z=1},
        },
        { -- E86
            note = "shelves @ bedroom",
            coords = {x=6670,y=5511,z=1},
        },
        { -- E87
            note = "dresser @ bedroom",
            coords = {x=6667,y=5514,z=1},
        },
        { -- E88
            note = "fireplace @ livingroom",
            coords = {x=6675,y=5507,z=1},
        },
        { -- E89
            note = "sidetable @ livingroom",
            coords = {x=6677,y=5508,z=1},
        },
        { -- E90
            note = "shelves @ livingroom",
            coords = {x=6677,y=5509,z=1},
        },
        { -- E91
            note = "shelves @ livingroom",
            coords = {x=6677,y=5510,z=1},
        },
        { -- E92
            note = "medicine @ bathroom",
            coords = {x=6672,y=5515,z=0},
            slot = "upper",
        },
        { -- E93
            note = "metal_shelves @ garagestorage",
            coords = {x=6667,y=5511,z=0},
        },
        { -- E94
            note = "barbecue @ garagestorage",
            coords = {x=6671,y=5511,z=0},
        },
        { -- E95
            note = "counter @ garagestorage",
            coords = {x=6667,y=5512,z=0},
        },
        { -- E96
            note = "counter @ garagestorage",
            coords = {x=6667,y=5513,z=0},
        },
        { -- E97
            note = "locker @ garagestorage",
            coords = {x=6671,y=5514,z=0},
        },
        { -- E98
            note = "cardboardbox @ garagestorage",
            coords = {x=6671,y=5515,z=0},
        },
        { -- E99
            note = "metal_shelves @ garagestorage",
            coords = {x=6667,y=5516,z=0},
            slot = "upper",
        },
        { -- E100
            note = "cardboardbox @ garagestorage",
            coords = {x=6671,y=5516,z=0},
        },
        { -- E101
            note = "metal_shelves @ garagestorage",
            coords = {x=6667,y=5517,z=0},
            slot = "upper",
        },
        { -- E102
            note = "cardboardbox @ garagestorage",
            coords = {x=6671,y=5517,z=0},
        },
        { -- E103
            note = "cardboardbox @ garagestorage",
            coords = {x=6671,y=5517,z=0},
            slot = "upper",
        },
        { -- E104
            note = "metal_shelves @ laundry",
            coords = {x=6674,y=5511,z=0},
        },
        { -- E105
            note = "counter @ laundry",
            coords = {x=6672,y=5513,z=0},
        },
        { -- E106
            note = "overhead @ laundry",
            coords = {x=6672,y=5513,z=0},
            slot = "upper",
        },
        { -- E107
            note = "overhead @ laundry",
            coords = {x=6672,y=5514,z=0},
            slot = "upper",
        },
        { -- E108
            note = "shelves @ livingroom",
            coords = {x=6672,y=5507,z=0},
        },
        { -- E109
            note = "fireplace @ livingroom",
            coords = {x=6675,y=5507,z=0},
        },
        { -- E110
            note = "counter @ kitchen",
            coords = {x=6681,y=5507,z=0},
        },
        { -- E111
            note = "overhead @ kitchen",
            coords = {x=6681,y=5507,z=0},
            slot = "upper",
        },
        { -- E112
            note = "counter @ kitchen",
            coords = {x=6681,y=5508,z=0},
        },
        { -- E113
            note = "counter @ kitchen",
            coords = {x=6681,y=5509,z=0},
        },
        { -- E114
            note = "fridge @ kitchen",
            coords = {x=6678,y=5507,z=0},
        },
        { -- E115
            note = "freezer @ kitchen",
            coords = {x=6678,y=5507,z=0},
            slot = "freezer",
        },
        { -- E116
            note = "overhead @ kitchen",
            coords = {x=6678,y=5507,z=0},
            slot = "upper",
        },
        { -- E117
            note = "counter @ kitchen",
            coords = {x=6679,y=5507,z=0},
        },
        { -- E118
            note = "overhead @ kitchen",
            coords = {x=6679,y=5507,z=0},
            slot = "upper",
        },
        { -- E119
            note = "dishescabinet @ kitchen",
            coords = {x=6678,y=5513,z=0},
        },
        { -- E120
            note = "dishescabinet @ kitchen",
            coords = {x=6678,y=5514,z=0},
        },
        { -- E121
            note = "dresser @ hall",
            coords = {x=6677,y=5513,z=0},
        },
        { -- E122
            note = "dresser @ office",
            coords = {x=6681,y=5515,z=0},
        },
        { -- E123
            note = "desk @ office",
            coords = {x=6681,y=5519,z=0},
        },
        { -- E124
            note = "dresser @ office",
            coords = {x=6678,y=5515,z=0},
        },
        { -- E125
            note = "filingcabinet @ office",
            coords = {x=6678,y=5519,z=0},
        },    },
}

return RiversideMansion