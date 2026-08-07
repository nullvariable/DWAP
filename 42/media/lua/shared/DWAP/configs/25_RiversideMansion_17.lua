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
            type = 'container',
            coords = {x=6670,y=5524,z=-1},
            dist = {"ArmyStorageGuns","ArmyStorageAmmunition","FirearmWeapons_Late"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E2
            type = 'container',
            coords = {x=6670,y=5525,z=-1},
            dist = { "GunStoreKnives", "PawnShopKnives",  },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E3
            type = 'container',
            coords = {x=6670,y=5526,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E4
            type = 'container',
            coords = {x=6670,y=5527,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E5
            type = 'container',
            coords = {x=6670,y=5528,z=-1},
            dist = {"ArmyStorageAmmunition", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E6
            type = 'container',
            coords = {x=6670,y=5529,z=-1},
            dist = {"HuntingLockers", "RangerTools", "CrateFishing", "FishermanTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E7
            type = 'container',
            coords = {x=6670,y=5530,z=-1},
            dist = {"ArmyStorageElectronics", "ToolFactoryIngots" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E8
            type = 'container',
            coords = {x=6670,y=5532,z=-1},
            dist = {"ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E9
            type = 'container',
            coords = {x=6670,y=5533,z=-1},
            dist = {"CrateSheetMetal","CrateLumber" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E10
            type = 'container',
            coords = {x=6670,y=5534,z=-1},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E11
            type = 'container',
            coords = {x=6673,y=5527,z=-1},
            special = "essentials",
        },
        { -- E12
            type = 'container',
            coords = {x=6673,y=5528,z=-1},
            dist = { "CarSupplyTools", "GasStorageMechanics",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E13
            type = 'container',
            coords = {x=6673,y=5529,z=-1},
            dist = {"CampingStoreTools", "ArmyHangarTools", "CarSupplyTools", "BurglarTools", "CarpenterTools", "BarnTools", "GarageTools","GigamartTools", "JanitorTools", "LoggingFactoryTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E14
            type = 'container',
            coords = {x=6673,y=5530,z=-1},
            dist = {"GasStoreEmergency", "StoreCounterTobacco", "CandyStoreSnacks"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E15
            type = 'container',
            coords = {x=6673,y=5531,z=-1},
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = {9,12} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E16
            type = 'container',
            coords = {x=6673,y=5532,z=-1},
            dist = {"ArmyStorageOutfit", "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateBootsArmy", "RandomFiller"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E17
            type = 'container',
            coords = {x=6673,y=5533,z=-1},
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = {8,10} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E18
            type = 'container',
            coords = {x=6673,y=5534,z=-1},
            dist = {"ArtStorePottery",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        -- infirmary
        { -- E19
            type = 'container',
            coords = {x=6669,y=5516,z=-1},
            dist = {"LaboratoryLockers", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E20
            type = 'container',
            coords = {x=6669,y=5515,z=-1},
            dist = {"MorgueTools", "ArmyStorageMedical", "ArmyBunkerMedical" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E21
            type = 'container',
            coords = {x=6669,y=5514,z=-1},
            dist = {"MedicalClinicDrugs" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E22
            type = 'container',
            coords = {x=6669,y=5514,z=-1},
            slot = "upper",
            dist = {"MedicalCabinet" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E23
            type = 'container',
            coords = {x=6669,y=5512,z=-1},
            dist = {"MedicalCabinet", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E24
            type = 'container',
            coords = {x=6673,y=5515,z=-1},
            dist = {"ArmyStorageMedical", "ArmyBunkerMedical" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E25
            type = 'container',
            coords = {x=6673,y=5516,z=-1},
            dist = {"SafehouseMedical_Late", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        -- study
        { -- E26
            type = 'container',
            coords = {x=6668,y=5516,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E27
            type = 'container',
            coords = {x=6667,y=5516,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E28
            type = 'container',
            coords = {x=6668,y=5512,z=-1},
            dist = {"CrateLiquor", "LiquorStoreWhiskey"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E29
            type = 'container',
            coords = {x=6667,y=5512,z=-1},
            dist = {"CrateLiquor", "DishCabinetVIPLounge"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E30
            type = 'container',
            coords = {x=6664,y=5513,z=-1},
            items = {
                { name = 'Base.Firewood', chance = 1, count = {10,10} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E31
            type = 'container',
            coords = {x=6664,y=5514,z=-1},
            dist = {"BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E32
            type = 'container',
            coords = {x=6664,y=5515,z=-1},
            dist = {"BookstoreBiography", "BookstoreArt", "BookstoreGeneralReference", "BookstoreChilds", "BookstoreHistory", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        -- west storage
        { -- E33
            type = 'container',
            coords = {x=6661,y=5521,z=-1},
            dist = {"CrateTools", "GarageTools", "BarnTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E34
            type = 'container',
            coords = {x=6661,y=5522,z=-1},
            dist = {"BurglarTools", "CarpenterTools", "BarnTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E35
            type = 'container',
            coords = {x=6663,y=5519,z=-1},
            dist = {"CampingStoreTools", "ArmyHangarTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E36
            type = 'container',
            coords = {x=6660,y=5519,z=-1},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E37
            type = 'container',
            coords = {x=6659,y=5519,z=-1},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E38
            type = 'container',
            coords = {x=6659,y=5521,z=-1},
            dist = {"SewingStoreTools","SewingStoreFabric", "CrateLeather"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- E39
            type = 'container',
            coords = {x=6659,y=5522,z=-1},
            dist = {"GigamartBreakfast","GigamartCandy","Homesteading","CrateLiquor",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E40
            type = 'container',
            coords = {x=6659,y=5523,z=-1},
            dist = {"ArmyStorageAmmunition", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E41
            type = 'container',
            coords = {x=6663,y=5520,z=-1},
            items = {
                { name = 'Base.Shoes_ArmyBoots', chance = 1, count = {7,13} },
                { name = 'Base.Shoes_ArmyBootsDesert', chance = 1, count = {3,7} },
            },
        },
        { -- E42
            type = 'container',
            coords = {x=6663,y=5521,z=-1},
            dist = {"ArmyStorageOutfit", "DrugLabOutfit", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E43
            type = 'container',
            coords = {x=6663,y=5522,z=-1},
            dist = {"SafehouseArmor",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E44
            type = 'container',
            coords = {x=6663,y=5523,z=-1},
            dist = {"SafehouseArmor",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        -- workshop
        { -- E45
            type = 'container',
            coords = {x=6668,y=5523,z=-1},
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E46
            type = 'container',
            coords = {x=6668,y=5522,z=-1},
            dist = {"ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E47
            type = 'container',
            coords = {x=6665,y=5519,z=-1},
            dist = { "CrateTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E48
            type = 'container',
            coords = {x=6668,y=5520,z=-1},
            dist = { "ToolFactoryHandles", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        -- living room
        { -- E49
            type = 'container',
            coords = {x=6667,y=5531,z=-1},
            dist = {"CrateVHSTapes"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E50
            type = 'container',
            coords = {x=6665,y=5524,z=-1},
            dist = {"LiquorStoreBeer","LiquorStoreBeerFancy","LiquorStoreWine"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E51
            type = 'container',
            coords = {x=6666,y=5524,z=-1},
            dist = {"CrateLiquor", "LiquorStoreBrandy"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E52
            type = 'container',
            coords = {x=6667,y=5524,z=-1},
            dist = {"CrateLiquor", "LiquorStoreMix"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- kitchen
        { -- E53
            type = 'container',
            coords = {x=6663,y=5527,z=-1},
            dist = {"TheatrePopcorn"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E54
            type = 'container',
            coords = {x=6663,y=5528,z=-1},
            dist = {"TheatreSnacks"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E55
            type = 'container',
            coords = {x=6663,y=5529,z=-1},
            dist = {"BarCounterMisc"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E56
            type = 'container',
            coords = {x=6663,y=5530,z=-1},
            dist = {"CafeKitchenCoffee"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E57
            type = 'container',
            coords = {x=6663,y=5531,z=-1},
            dist = {"BakeryKitchenFreezer"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E58
            type = 'container',
            coords = {x=6662,y=5534,z=-1},
            dist = {"SushiKitchenFreezer"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E59
            type = 'container',
            coords = {x=6661,y=5534,z=-1},
            dist = {"FreezerIceCream", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E60
            type = 'container',
            coords = {x=6659,y=5534,z=-1},
            dist = {"PizzaKitchenFreezer", "PizzaKitchenFridge"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E61
            type = 'container',
            coords = {x=6659,y=5533,z=-1},
            dist = {"SpiffosKitchenFridge", "SpiffosKitchenFreezer"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E62
            type = 'container',
            coords = {x=6659,y=5527,z=-1},
            dist = {"FridgeFarmStorage", "FridgeGeneric", "SushiKitchenFridge"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E63
            type = 'container',
            coords = {x=6659,y=5532,z=-1},
            dist = {"GigamartBreakfast"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E64
            type = 'container',
            coords = {x=6659,y=5532,z=-1},
            slot = "upper",
            dist = {"StoreKitchenPotatoes"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E65
            type = 'container',
            coords = {x=6659,y=5531,z=-1},
            dist = {"CrateSodaBottles", "CrateSodaCans"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E66
            type = 'container',
            coords = {x=6659,y=5531,z=-1},
            slot = "upper",
            dist = {"ArenaKitchenSauce"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E67
            type = 'container',
            coords = {x=6659,y=5530,z=-1},
            dist = {"GigamartDryGoods", "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E68
            type = 'container',
            coords = {x=6659,y=5530,z=-1},
            slot = "upper",
            dist = {"CrateTortillaChips", "KitchenDryFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E69
            type = 'container',
            coords = {x=6659,y=5529,z=-1},
            dist = {"GigamartBakingMisc", "CrateFlour", "CrateOilVegetable" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E70
            type = 'container',
            coords = {x=6659,y=5529,z=-1},
            slot = "upper",
            dist = {"ButcherSpices","GigamartSpices","GroceryBagGourmet",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E71
            type = 'container',
            coords = {x=6662,y=5524,z=-1},
            dist = {"KitchenBook","GigamartSpices",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- E72
        { type = 'container', coords = {x=6680,y=5507,z=1}, }, -- desk @ kidsbedroom
        -- E73
        { type = 'container', coords = {x=6679,y=5507,z=1}, }, -- dresser @ kidsbedroom
        -- E74
        { type = 'container', coords = {x=6678,y=5509,z=1}, }, -- wardrobe @ kidsbedroom
        -- E75
        { type = 'container', coords = {x=6678,y=5510,z=1}, }, -- wardrobe @ kidsbedroom
        -- E76
        { type = 'container', coords = {x=6681,y=5514,z=1}, }, -- counter @ bathroom
        -- E77
        { type = 'container', coords = {x=6681,y=5515,z=1}, }, -- shelves @ kidsbedroom
        -- E78
        { type = 'container', coords = {x=6678,y=5518,z=1}, }, -- dresser @ kidsbedroom
        -- E79
        { type = 'container', coords = {x=6672,y=5511,z=1}, }, -- wardrobe @ hall
        -- E80
        { type = 'container', coords = {x=6673,y=5511,z=1}, }, -- wardrobe @ hall
        -- E81
        { type = 'container', coords = {x=6673,y=5517,z=1}, }, -- dresser @ hall
        -- E82
        { type = 'container', coords = {x=6669,y=5516,z=1}, }, -- counter @ bathroom
        -- E83
        { type = 'container', coords = {x=6667,y=5515,z=1}, }, -- wardrobe @ closet
        -- E84
        { type = 'container', coords = {x=6667,y=5516,z=1}, }, -- wardrobe @ closet
        -- E85
        { type = 'container', coords = {x=6667,y=5511,z=1}, }, -- dresser @ bedroom
        -- E86
        { type = 'container', coords = {x=6670,y=5511,z=1}, }, -- shelves @ bedroom
        -- E87
        { type = 'container', coords = {x=6667,y=5514,z=1}, }, -- dresser @ bedroom
        -- E88
        { type = 'container', coords = {x=6675,y=5507,z=1}, }, -- fireplace @ livingroom
        -- E89
        { type = 'container', coords = {x=6677,y=5508,z=1}, }, -- sidetable @ livingroom
        -- E90
        { type = 'container', coords = {x=6677,y=5509,z=1}, }, -- shelves @ livingroom
        -- E91
        { type = 'container', coords = {x=6677,y=5510,z=1}, }, -- shelves @ livingroom
        -- E92
        { type = 'container', coords = {x=6672,y=5515,z=0}, slot = "upper", }, -- medicine @ bathroom
        -- E93
        { type = 'container', coords = {x=6667,y=5511,z=0}, }, -- metal_shelves @ garagestorage
        -- E94
        { type = 'container', coords = {x=6671,y=5511,z=0}, }, -- barbecue @ garagestorage
        -- E95
        { type = 'container', coords = {x=6667,y=5512,z=0}, }, -- counter @ garagestorage
        -- E96
        { type = 'container', coords = {x=6667,y=5513,z=0}, }, -- counter @ garagestorage
        -- E97
        { type = 'container', coords = {x=6671,y=5514,z=0}, }, -- locker @ garagestorage
        -- E98
        { type = 'container', coords = {x=6671,y=5515,z=0}, }, -- cardboardbox @ garagestorage
        -- E99
        { type = 'container', coords = {x=6667,y=5516,z=0}, slot = "upper", }, -- metal_shelves @ garagestorage
        -- E100
        { type = 'container', coords = {x=6671,y=5516,z=0}, }, -- cardboardbox @ garagestorage
        -- E101
        { type = 'container', coords = {x=6667,y=5517,z=0}, slot = "upper", }, -- metal_shelves @ garagestorage
        -- E102
        { type = 'container', coords = {x=6671,y=5517,z=0}, }, -- cardboardbox @ garagestorage
        -- E103
        { type = 'container', coords = {x=6671,y=5517,z=0}, slot = "upper", }, -- cardboardbox @ garagestorage
        -- E104
        { type = 'container', coords = {x=6674,y=5511,z=0}, }, -- metal_shelves @ laundry
        -- E105
        { type = 'container', coords = {x=6672,y=5513,z=0}, }, -- counter @ laundry
        -- E106
        { type = 'container', coords = {x=6672,y=5513,z=0}, slot = "upper", }, -- overhead @ laundry
        -- E107
        { type = 'container', coords = {x=6672,y=5514,z=0}, slot = "upper", }, -- overhead @ laundry
        -- E108
        { type = 'container', coords = {x=6672,y=5507,z=0}, }, -- shelves @ livingroom
        -- E109
        { type = 'container', coords = {x=6675,y=5507,z=0}, }, -- fireplace @ livingroom
        -- E110
        { type = 'container', coords = {x=6681,y=5507,z=0}, }, -- counter @ kitchen
        -- E111
        { type = 'container', coords = {x=6681,y=5507,z=0}, slot = "upper", }, -- overhead @ kitchen
        -- E112
        { type = 'container', coords = {x=6681,y=5508,z=0}, }, -- counter @ kitchen
        -- E113
        { type = 'container', coords = {x=6681,y=5509,z=0}, }, -- counter @ kitchen
        -- E114
        { type = 'container', coords = {x=6678,y=5507,z=0}, }, -- fridge @ kitchen
        -- E115
        { type = 'container', coords = {x=6678,y=5507,z=0}, slot = "freezer", }, -- freezer @ kitchen
        -- E116
        { type = 'container', coords = {x=6678,y=5507,z=0}, slot = "upper", }, -- overhead @ kitchen
        -- E117
        { type = 'container', coords = {x=6679,y=5507,z=0}, }, -- counter @ kitchen
        -- E118
        { type = 'container', coords = {x=6679,y=5507,z=0}, slot = "upper", }, -- overhead @ kitchen
        -- E119
        { type = 'container', coords = {x=6678,y=5513,z=0}, }, -- dishescabinet @ kitchen
        -- E120
        { type = 'container', coords = {x=6678,y=5514,z=0}, }, -- dishescabinet @ kitchen
        -- E121
        { type = 'container', coords = {x=6677,y=5513,z=0}, }, -- dresser @ hall
        -- E122
        { type = 'container', coords = {x=6681,y=5515,z=0}, }, -- dresser @ office
        -- E123
        { type = 'container', coords = {x=6681,y=5519,z=0}, }, -- desk @ office
        -- E124
        { type = 'container', coords = {x=6678,y=5515,z=0}, }, -- dresser @ office
        -- E125
        { type = 'container', coords = {x=6678,y=5519,z=0}, }, -- filingcabinet @ office
    },
}

return RiversideMansion