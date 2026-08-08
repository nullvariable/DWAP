-- @TODO (2026-08-07 audit) unresolved - delete lines as they are fixed
--   * systems: generator controls declare industry_02_67 but no such object
--     is on the square. 11 configs name that sprite and ALL 11 fail, while 32
--     configs use dwap_tiles_01_22 - the maps look to have moved on and these
--     configs did not. Confirm what is actually there before editing
local wtc = {x = 8711, y = 15303, z = -1}
local bunkerTopLeft = {x = 8709, y = 15293, z = -1}
local pb1 = { x = 8716, y = 15303, z = -1 }
local DarkWallow = {
    group = "Dark Wallow",
    baseBuildings = {
        { x = 8718, y = 15311, z = 1 }, -- lake house
        { x = 8710, y = 15306, z = -1 }, -- bunker
    },
    spawn = { x = 8718, y = 15311, z = 1 },
    waterTanks = {
        { sprite = "dwap_tiles_01_8", x = wtc.x, y = wtc.y, z = wtc.z, sourceType="generator", source = {x = pb1.x-1, y = pb1.y, z = pb1.z} },
    },
    waterFixtures = {
        -- basement
        { sprite = "fixtures_sinks_01_16", x = 8709, y = 15297, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_6", x = 8711, y = 15301, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- 1st floor
        { sprite = "fixtures_sinks_01_9", x = 8712, y = 15305, z = 0, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_9", x = 8713, y = 15305, z = 0, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "appliances_laundry_01_4", x = 8717, y = 15305, z = 0, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "appliances_laundry_01_0", x = 8718, y = 15305, z = 0, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- 2nd floor
        { sprite = "fixtures_bathroom_01_32", x = 8707, y = 15305, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_2", x = 8709, y = 15305, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_2", x = 8710, y = 15305, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_3", x = 8710, y = 15307, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_7", x = 8709, y = 15307, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_1", x = 8717, y = 15307, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_5", x = 8717, y = 15306, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_26", x = 8717, y = 15305, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_2", x = 8720, y = 15305, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_2", x = 8721, y = 15305, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
    },
    generators = {
        {
            controls = { sprite = "industry_02_67", x = pb1.x-1, y = pb1.y, z = pb1.z, },
            fakeGenerators = {
                { x = 8712, y = 15310, z = -1, createTile = true },
            },
        },
    },
    doorKeys = {
        name = "Dark Wallow Lake House Key",
        doors = {
            { sprite = "location_community_church_small_01_65", x = 8712, y = 15314, z = 0, },
        },
    },
    map = { name = "DWAPStashMap33", },
    objectSpawns = {
        { sprite = "industry_02_175", x = pb1.x, y = pb1.y, z = pb1.z, disabled = "EnableGenSystemSolar", clearExisting = true, },

        -- { x = 8709, y = 15310, z = 0, clearExisting = true, },
        -- { x = 8709, y = 15309, z = 0, clearExisting = true, },
        -- { x = 8709, y = 15308, z = 0, clearExisting = true, },
        -- { x = 8709, y = 15307, z = 0, clearExisting = true, },

        { barricade = "metal", enabled = "Barricade", target="walls_exterior_wooden_01_37", x = 8706, y = 15314, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_exterior_wooden_01_37", x = 8710, y = 15315, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_exterior_wooden_01_37", x = 8715, y = 15315, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_exterior_wooden_01_37", x = 8719, y = 15314, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target="fixtures_windows_01_9", x = 8711, y = 15305, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target="fixtures_windows_01_9", x = 8714, y = 15305, z = 0, },
    },
    loot = {
        { -- E1 cabinet next to bunk beds (9365)
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+2,z=bunkerTopLeft.z},
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E2 upper
            sprite = 'location_trailer_02_23',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+3,z=bunkerTopLeft.z},
            slot = "upper",
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E3 lower (66)
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+3,z=bunkerTopLeft.z},
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E4 upper
            sprite = 'location_trailer_02_23',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+4,z=bunkerTopLeft.z},
            slot = "upper",
            dist = {"ButcherSpices","GigamartSpices","GroceryBagGourmet","CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E5 lower (67)
            sprite = 'location_trailer_02_19',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+4,z=bunkerTopLeft.z},
            dist = {"TestingLab","MedicalCabinet","ArmyStorageMedical", "ArmyBunkerMedical"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E6 upper
            sprite = 'location_trailer_02_23',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+5,z=bunkerTopLeft.z},
            slot = "upper",
            dist = {"CrateFishing", "FishermanTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E7 lower (68)
            sprite = 'location_trailer_02_19',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+5,z=bunkerTopLeft.z},
            dist = {"SewingStoreTools"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- E8 metal shelves (70)
            sprite = 'location_trailer_02_23',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+7,z=bunkerTopLeft.z},
            dist = {"GardenStoreTools", "Homesteading", "CrateLinens", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E9 metal shelves (71)
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+8,z=bunkerTopLeft.z},
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E10 next to inner door (9372)
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+9,z=bunkerTopLeft.z},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E11 (73)
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+10,z=bunkerTopLeft.z},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E12 (9374)
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+11,z=bunkerTopLeft.z},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E13 far end next to stairs (9375)
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+12,z=bunkerTopLeft.z},
            special = "essentials",
        },
        { -- E14 metal wall shelves
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y+5,z=bunkerTopLeft.z},
            dist = {"CrateLiquor", "DishCabinetVIPLounge", "MusicStoreCDs", "CrateVHSTapes", "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E15 metal wall shelves
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y+6,z=bunkerTopLeft.z},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E16 metal wall shelves
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
            coords = {x=8711,y=15310,z=-1},
            items = {
                { name = 'Base.Firewood', chance = 1, count = {30,30} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E20
            coords = {x=8711,y=15305,z=-1},
            dist = {"SafehouseTraps", "ArmyStorageAmmunition"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E21
            coords = {x=8712,y=15305,z=-1},
            dist = {"GardenStoreTools", "Homesteading", "CrateLinens", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        ---------------------
        ---- First Floor ----
        ---------------------
        { -- E22
            coords = {x=8707,y=15311,z=0},
            dist = {"LiquorStoreMix", "DishCabinetVIPLounge"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E23
            coords = {x=8707,y=15310,z=0},
            dist = {"CrateLiquor", "LiquorStoreWhiskey"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E24
            coords = {x=8707,y=15305,z=0},
            dist = {"GardenStoreTools", "Homesteading", "CrateLinens", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E25
            coords = {x=8708,y=15305,z=0},
            dist = {"CafeKitchenSupplies", "CafeKitchenTea", "CrateSodaBottles"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E26
            coords = {x=8704,y=15305,z=0},
            dist = {"CrateToiletPaper"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E27
            coords = {x=8704,y=15310,z=0},
            dist = {"CrateVHSTapes"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E28
            coords = {x=8710,y=15305,z=0},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E29
            coords = {x=8710,y=15305,z=0},
            slot = "upper",
            dist = {"ButcherSpices","GigamartSpices","GroceryBagGourmet",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E30
            coords = {x=8712,y=15305,z=0},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E31
            coords = {x=8712,y=15305,z=0},
            slot = "upper",
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E32
            coords = {x=8713,y=15305,z=0},
            dist = {"GroceryBagGourmet","CrateFlour","CrateOilVegetable",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E33
            coords = {x=8713,y=15305,z=0},
            slot = "upper",
            dist = {"StoreCounterTobacco", "CandyStoreSnacks"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E34
            coords = {x=8714,y=15305,z=0},
            dist = {"StoreKitchenBaking", "WesternKitchenBaking"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E35
            coords = {x=8714,y=15305,z=0},
            slot = "upper",
            dist = {"TheatrePopcorn", "TheatreSnacks"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E36
            coords = {x=8716,y=15307,z=0},
            dist = {"WesternKitchenFreezer", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E37
            coords = {x=8716,y=15308,z=0},
            dist = {"FreezerIceCream", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E38
            coords = {x=8716,y=15309,z=0},
            dist = {"CatfishKitchenFreezer", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E39
            coords = {x=8717,y=15308,z=0},
            dist = {"CrateLiquor", "DishCabinetVIPLounge", "MusicStoreCDs", "CrateVHSTapes", "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E40
            coords = {x=8719,y=15305,z=0},
            dist = {"CatfishKitchenFreezer", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E41
            coords = {x=8720,y=15305,z=0},
            dist = {"CrateLiquor", "DishCabinetVIPLounge", "MusicStoreCDs", "CrateVHSTapes", "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E42
            coords = {x=8721,y=15305,z=0},
            dist = {"GigamartDryGoods", "GigamartBreakfast"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E43
            coords = {x=8717,y=15307,z=0},
            dist = {"CrateLiquor", "DishCabinetVIPLounge", "MusicStoreCDs", "CrateVHSTapes", "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        -----------------------
        ---- Second Floor -----
        -----------------------
        { -- E44
            coords = {x=8704,y=15310,z=1},
            dist = {"ArmyStorageOutfit", "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateBootsArmy"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E45
            coords = {x=8704,y=15307,z=1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E46
            coords = {x=8704,y=15306,z=1},
            dist = {"ArmyStorageOutfit", "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateBootsArmy"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E47
            coords = {x=8704,y=15305,z=1},
            dist = {"LaundryLoad1", "LaundryLoad2", "LaundryLoad3", "LaundryLoad4", "LaundryLoad5", "LaundryLoad6", "LaundryLoad7", "LaundryLoad8"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E48
            coords = {x=8708,y=15309,z=1},
            dist = {"CrateTailoring", "CrateFabric_Cotton", "CrateFabric_DenimBlack", "CrateLeather","SewingStoreFabric"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- E49
            coords = {x=8709,y=15309,z=1},
            dist = {"ArtStorePottery","CrateMasonry" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E50
            coords = {x=8709,y=15305,z=1},
            dist = {"JanitorCleaning","MedicalCabinet","MedicalClinicDrugs", "CrateLinens"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E51
            coords = {x=8710,y=15305,z=1},
            dist = {"BathroomCounter", "GasStoreToiletries"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E52
            coords = {x=8719,y=15305,z=1},
            dist = {"MedicalCabinet","BathroomCounter", "GasStoreToiletries"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E53
            coords = {x=8721,y=15308,z=1},
            dist = {"CampingStoreBackpacks"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E54
            coords = {x=8721,y=15310,z=1},
            dist = {"HuntingLockers", "RangerTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E55
            coords = {x=8721,y=15313,z=1},
            dist = {"LivingRoomShelfClassy"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E56
            coords = {x=8709,y=15312,z=1},
            dist = {"ArmyStorageAmmunition", "SafehouseTraps", "GunStoreKnives",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E57
            coords = {x=8709,y=15311,z=1},
            dist = {"ArmyStorageGuns","ArmyStorageAmmunition","FirearmWeapons_Late"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E58
            coords = {x=8715,y=15308,z=1},
            dist = {"CrateBlacksmithing", "CrateCarpentry", "CrateMechanics", "CrateMetalwork" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E59
            coords = {x=8716,y=15308,z=1},
            dist = {"ToolCabinetMechanics","CrateMechanics"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        ----------------
        ---- Attic -----
        ----------------
        { -- E60
            coords = {x=8704,y=15309,z=2},
            items = {
                { name = 'Base.NailsBox', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E61
            coords = {x=8704,y=15308,z=2},
            dist = {"CrateLumber", "CrateSheetMetal", "ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E62
            coords = {x=8717,y=15308,z=2},
            dist = {"CrateLumber", "CrateSheetMetal", "ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E63
            coords = {x=8718,y=15308,z=2},
            dist = {"CrateLumber", "CrateSheetMetal", "ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E64
            coords = {x=8719,y=15308,z=2},
            dist = {"CrateLumber", "CrateSheetMetal", "ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E65
            coords = {x=8720,y=15308,z=2},
            dist = {"CrateLumber", "CrateSheetMetal", "ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E66
            coords = {x=8721,y=15308,z=2},
            dist = {"CrateLumber", "CrateSheetMetal", "ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(DarkWallow.objectSpawns, { enabled = "EnableLadders", x = 8712, y = 15311, z = -1, removeWall = "west" })
    table.insert(DarkWallow.objectSpawns, { enabled = "EnableLadders", sprite = "walls_exterior_wooden_01_26", x = 8716, y = 15314, z = 0, removeFloor = true, clearExisting = true, })
    table.insert(DarkWallow.objectSpawns, { enabled = "EnableLadders", sprite = "location_sewer_01_33", x = 8716, y = 15314, z = 0, })
    table.insert(DarkWallow.objectSpawns, { enabled = "EnableLadders", x = 8716, y = 15314, z = 1, removeFloor = true, clearExisting = true, })
else
    -- table.insert(DarkWallow.objectSpawns, { sprite = "industry_trucks_01_4", x = 2607, y = 14453, z = -1, replaceWall = true, })
end
return DarkWallow