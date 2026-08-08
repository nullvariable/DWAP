-- @TODO (2026-08-07 audit) unresolved - delete lines as they are fixed
--   * entry 26: square holds no container at all - coords are stale or the
--     object was removed
--   * entries 57,59: square not found (bad z or the area never spawns)
--   * systems: generator controls declare industry_02_67 but no such object
--     is on the square. 11 configs name that sprite and ALL 11 fail, while 32
--     configs use dwap_tiles_01_22 - the maps look to have moved on and these
--     configs did not. Confirm what is actually there before editing
local bunkerTopLeft = {x = 12828, y = 1604, z = -1}
local wtc = {x = 12835, y = 1614, z = 1}
local pb1 = { x = 12836, y = 1611, z = 1 }
local LouisvilleTownhouse = {
    group = "Louisville",
    baseBuildings = {
        { x = 12832, y = 1619, z = 0 }, -- townhouse
        { x = 12829, y = 1613, z = -1 }, -- bunker
    },
    spawn = { x = 12832, y = 1619, z = 0 },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc.x, y = wtc.y, z = wtc.z, sourceType="generator", source = 1 },
    },
    waterFixtures = {
        { sprite = "fixtures_bathroom_01_6", x = 12830, y = 1612, z = -1, sourceType="tank", source = 1 },
        { sprite = "fixtures_sinks_01_16", x = 12828, y = 1608, z = -1, sourceType="tank", source = 1 },

        { sprite = "fixtures_bathroom_01_0", x = 12831, y = 1614, z = 0, sourceType="tank", source = 1 },
        { sprite = "fixtures_sinks_01_2", x = 12832, y = 1614, z = 0, sourceType="tank", source = 1 },
        { sprite = "fixtures_sinks_01_9", x = 12835, y = 1610, z = 0, sourceType="tank", source = 1 },
    },
    generators = {
        {
            controls = { sprite = "industry_02_67", x = pb1.x-1, y = pb1.y, z = pb1.z },
            fakeGenerators = {
                { x = 12835, y = 1615, z = -1, },
            },
        },
    },
    doorKeys = {
        name = "Louisville Townhouse",
        doors = {
            { sprite = "fixtures_doors_01_53", x = 12830, y = 1612, z = 0, },
            { sprite = "fixtures_doors_01_53", x = 12831, y = 1612, z = 2, },
        },
    },
    map = { name = "DWAPStashMap42", },
    objectSpawns = {
        { barricade = "wood", enabled = "Barricade", target="fixtures_windows_01_16", x = 12830, y = 1617, z = 0, },
        { barricade = "wood", enabled = "Barricade", target="fixtures_windows_01_16", x = 12830, y = 1611, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_windows_01_17", x = 12835, y = 1610, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_doors_01_5", x = 12835, y = 1620, z = 0, },
        { barricade = "wood", enabled = "Barricade", target="fixtures_windows_01_17", x = 12832, y = 1621, z = 0, },
        { barricade = "wood", enabled = "Barricade", target="fixtures_windows_01_17", x = 12831, y = 1621, z = 0, },

    },
    loot = {
        { -- E1 cabinet next to bunk beds (9365)
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+2,z=bunkerTopLeft.z},
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E2 upper
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
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+4,z=bunkerTopLeft.z},
            slot = "upper",
            dist = {"CrateCannedFood", "KitchenCannedFood"},
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

        -- rest of the building
        -- kitchen 1st floor
        { -- E19 freezer
            coords = {x=12830,y=1611,z=0},
            dist = {"FridgeFarmStorage", "FridgeGeneric"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E20 freezer
            coords = {x=12830,y=1610,z=0},
            dist = {"FreezerIceCream", "PizzaKitchenFreezer", "PizzaKitchenFridge"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E21
            coords = {x=12833,y=1610,z=0},
            dist = {"GigamartBreakfast"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E22
            coords = {x=12835,y=1610,z=0},
            dist = {"JanitorCleaning", "CrateFlour", "CrateOilVegetable" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E23
            coords = {x=12836,y=1610,z=0},
            dist = {"GigamartDryGoods", "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- living room
        { -- E24
            coords = {x=12836,y=1617,z=0},
            dist = {"CrateLiquor", "DishCabinetVIPLounge"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E25
            coords = {x=12836,y=1618,z=0},
            dist = {"CrateLiquor", "LiquorStoreWhiskey"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E26
            coords = {x=12830,y=1617,z=0},
            dist = {"MusicStoreCDs"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E27
            coords = {x=12830,y=1618,z=0},
            dist = {"LivingRoomShelfClassy"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        -- bathroom
        { -- E28
            coords = {x=12832,y=1614,z=0},
            dist = {"BathroomCounter", "GasStoreToiletries"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        -- 2nd floor
        -- bedroom
        { -- E29
            coords = {x=12830,y=1620,z=1},
            dist = {"ArmyStorageOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateLinens"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E30
            coords = {x=12830,y=1617,z=1},
            dist = {"ArmyStorageOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateLinens"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        -- warehouse/utilities
        { -- E31 crate
            coords = {x=12831,y=1614,z=1},
            dist = {"SafehouseArmor", "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E32 crate
            coords = {x=12831,y=1613,z=1},
            dist = {"CrateLumber", "CrateSheetMetal", "ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E33 crate
            coords = {x=12834,y=1617,z=1},
            dist = {"MeleeWeapons", "MeleeWeapons_Mid", "CampingStoreBackpacks"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        -- shelving
        { -- E34
            coords = {x=12837,y=1612,z=1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E35
            coords = {x=12837,y=1613,z=1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E36
            coords = {x=12837,y=1614,z=1},
            dist = {"GunStoreMagsAmmo", "GunStoreAmmunition", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E37
            coords = {x=12837,y=1615,z=1},
            dist = {"MeleeWeapons", "MeleeWeapons_Mid", "CampingStoreBackpacks"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E38
            coords = {x=12837,y=1616,z=1},
            dist = {"GigamartCrisps","ControlRoomCounter" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E39
            coords = {x=12837,y=1617,z=1},
            dist = {"CrateLongStick"},
            items = {
                { name = 'Base.LongStick', chance = 1, count = {10,10} },
                { name = 'Base.Firewood', chance = 1, count = {10,10} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E40
            coords = {x=12840,y=1612,z=1},
            dist = {"ButcherSpices","GigamartSpices","GroceryBagGourmet","CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E41
            coords = {x=12840,y=1613,z=1},
            dist = { "CrateFlour", "CrateOilVegetable" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E42
            coords = {x=12840,y=1614,z=1},
            dist = {"GigamartDryGoods", "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E43
            coords = {x=12840,y=1615,z=1},
            dist = {"TheatrePopcorn", "FridgeSoda",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E44
            coords = {x=12840,y=1616,z=1},
            dist = {"CrateFlour", "CrateOilVegetable", "CafeKitchenSupplies", "CafeKitchenTea", "CrateSodaBottles"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E45
            coords = {x=12840,y=1617,z=1},
            dist = {"CrateToiletPaper", "CrateLinens"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E46
            coords = {x=12843,y=1612,z=1},
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = {8,10} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E47
            coords = {x=12843,y=1613,z=1},
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = {9,12} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E48
            coords = {x=12843,y=1614,z=1},
            dist = {"ArtStorePottery","CrateMasonry" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E49
            coords = {x=12843,y=1615,z=1},
            dist = {"CrateLumber", "CrateSheetMetal"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E50
            coords = {x=12843,y=1616,z=1},
            dist = {"BurglarTools", "CarpenterTools", "BarnTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E51
            coords = {x=12843,y=1617,z=1},
            dist = {"ToolStoreMetalwork","CrateBlacksmithing", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        -- back wall crates
        { -- E52
            coords = {x=12840,y=1610,z=1},
            dist = {"CrateTools", "GarageTools", "BarnTools",  },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E53
            coords = {x=12841,y=1610,z=1},
            dist = {"LiquorStoreBeer","ArmyStorageElectronics" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E54
            coords = {x=12842,y=1610,z=1},
            dist = {"ArmyBunkerMedical", "JanitorCleaning", "MedicalStorageDrugs"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E55
            coords = {x=12843,y=1610,z=1},
            dist = {"ArmyStorageOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "ToolStoreOutfit"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        -- library/sitting area
        { -- E56
            coords = {x=12840,y=1619,z=1},
            dist = {"BookstoreBiography", "BookstoreBusiness", "MusicStoreCDs", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E57
            coords = {x=12840,y=1602,z=1},
            dist = {"CrateVHSTapes"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E58
            coords = {x=12843,y=1619,z=1},
            dist = {"MusicStoreCDs", "LiquorStoreWhiskey"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E59
            coords = {x=12843,y=1602,z=1},
            dist = {"GunStoreKnives", "LivingRoomShelfClassy", "LiquorStoreWhiskey"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
    },
}

return LouisvilleTownhouse
