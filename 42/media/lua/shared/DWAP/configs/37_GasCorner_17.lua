-- @TODO (2026-08-07 audit) unresolved - delete lines as they are fixed
--   * 2 skeleton entries carry coords but no loot yet - entries 26-27
--   * systems: generator controls declare industry_02_67 but no such object
--     is on the square. 11 configs name that sprite and ALL 11 fail, while 32
--     configs use dwap_tiles_01_22 - the maps look to have moved on and these
--     configs did not. Confirm what is actually there before editing
--   * systems: 1 component at 1659,5747 z=0 names a sprite that is not on the
--     square, though the square itself loads - config drifted from the map
local wtc1 = {x = 1662, y = 5746, z = -2,}
local pb1 = { x = 1666, y = 5746, z = -4 }
local GasCorner = {
    group = "Brandenburg",
    baseBuildings = {
        { x = 1664, y = 5746, z = 1 }, -- gas station
        { x = 1664, y = 5746, z = -1 }, -- basement 1
        { x = 1664, y = 5746, z = -4 }, -- basement 2
    },
    spawn = { x = 1664, y = 5746, z = 1 },
    generators = {
        {
            controls = { sprite = "industry_02_67", x = pb1.x-1, y = pb1.y, z = pb1.z },
            fakeGenerators = {
                { x = 1659, y = 5749, z = -1, createTile = true },
            },
        },
    },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc1.x, y = wtc1.y, z = wtc1.z, sourceType="generator", source = {x = 1666, y = 5746, z = -4} },
    },
    waterFixtures = {
        { sprite = "fixtures_bathroom_01_1", x = 1661, y = 5749, z = -4, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_9", x = 1663, y = 5749, z = -4, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_30", x = 1658, y = 5750, z = -4, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_32", x = 1665, y = 5749, z = -3, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "appliances_laundry_01_7", x = 1659, y = 5746, z = -2, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },

        { sprite = "fixtures_bathroom_01_4", x = 1658, y = 5747, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_9", x = 1659, y = 5747, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },

        { sprite = "fixtures_sinks_01_9", x = 1661, y = 5744, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_33", x = 1657, y = 5748, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_2", x = 1659, y = 5748, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_23", x = 1659, y = 5747, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
    },
    doorKeys = {
        name = "Brandenburg Gas Corner",
        doors = {
            { sprite = "fixtures_doors_02_5", x = 1661, y = 5752, z = 0, },
            { sprite = "fixtures_doors_02_5", x = 1657, y = 5748, z = 0, },
            { sprite = "fixtures_doors_02_5", x = 1657, y = 5749, z = -1, },
        },
    },
    map = { name = "DWAPStashMap37", },
    objectSpawns = {
        -- { sprite = "camping_01_16", x = 1652, y = 5746, z = 0, enabled = "EnableWaterSystem", }, -- well
        { sprite = "industry_02_175", x = pb1.x, y = pb1.y, z = pb1.z, disabled = "EnableGenSystemSolar", clearExisting = true, },

        -- { x = 1657, y = 5744, z = -1, clearExisting = true, },
        -- { x = 1657, y = 5745, z = -1, removeWall = "north", },

        { barricade = "metal", enabled = "Barricade", target="walls_commercial_01_113", x = 1663, y = 5753, z = 0, },
        { barricade = "metal", enabled = "Barricade", target="walls_commercial_01_113", x = 1664, y = 5753, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_doors_02_5", x = 1661, y = 5753, z = 0, },
        { barricade = "metal", enabled = "Barricade", target="fixtures_windows_01_56", x = 1673, y = 5747, z = 0, },

    },
    loot = {
        -- lowest level
        { -- E1
            coords = {x=1664,y=5749,z=-4},
            dist = { "CrateFlour", "CrateOilVegetable" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E2
            coords = {x=1664,y=5749,z=-4},
            slot = "upper",
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E3
            coords = {x=1663,y=5749,z=-4},
            dist = {"ButcherSpices","GigamartSpices","GroceryBagGourmet","CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E4
            coords = {x=1663,y=5749,z=-4},
            slot = "upper",
            dist = {"GigamartCrisps","ControlRoomCounter" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E5
            coords = {x=1661,y=5749,z=-4},
            slot = "upper",
            dist = {"BathroomCounter", "GasStoreToiletries",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E6
            coords = {x=1660,y=5750,z=-4},
            slot = "upper",
            items = {
                { name = 'Base.Hat_GasMask', },
                { name = 'Base.GasmaskFilter', },
            },
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E7
            coords = {x=1659,y=5750,z=-4},
            slot = "upper",
            dist = {"SafehouseMedical" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E8
            coords = {x=1658,y=5749,z=-4},
            dist = {"MeleeWeapons", "MeleeWeapons_Mid", "CampingStoreBackpacks"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E9
            coords = {x=1660,y=5745,z=-4},
            dist = { "SafehouseTraps", "SafehouseArmor", "SafehouseArmor_Late", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E10
            coords = {x=1661,y=5745,z=-4},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E11
            coords = {x=1662,y=5745,z=-4},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E12
            coords = {x=1667,y=5745,z=-4},
            dist = {"CrateOilVegetable","GunStoreMagsAmmo", "GunStoreAmmunition", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        -- -3, books and crafting room
        { -- E13
            coords = {x=1659,y=5744,z=-3},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E14
            coords = {x=1659,y=5745,z=-3},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E15
            coords = {x=1659,y=5746,z=-3},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E16
            coords = {x=1659,y=5747,z=-3},
            dist = {"BookstoreBiography", "BookstoreBusiness", "MusicStoreCDs", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        -- small back room
        { -- E17
            coords = {x=1665,y=5750,z=-3},
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E18
            coords = {x=1665,y=5748,z=-3},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E19
            coords = {x=1667,y=5750,z=-3},
            special = "essentials",
        },
        -- main work room
        { -- E20
            coords = {x=1661,y=5750,z=-3},
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = {8,10} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E21
            coords = {x=1661,y=5749,z=-3},
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = {9,12} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E22
            coords = {x=1661,y=5747,z=-3},
            dist = {"GasStoreEmergency","CarSupplyTools","GasStorageMechanics",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E23
            coords = {x=1661,y=5746,z=-3},
            dist = {"ToolStoreMetalwork","CrateBlacksmithing", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E24
            coords = {x=1661,y=5745,z=-3},
            dist = {"CrateTools", "GarageTools", "BarnTools",  },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E25
            coords = {x=1663,y=5745,z=-3},
            dist = {"BurglarTools", "CarpenterTools", "BarnTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E26
            coords = {x=1665,y=5745,z=-3},
        },
        { -- E27
            coords = {x=1665,y=5746,z=-3},
        },
        { -- E28
            coords = {x=1667,y=5745,z=-3},
            dist = {"CrateTailoring", "CrateFabric_Cotton", "CrateFabric_DenimBlack", "CrateLeather","SewingStoreFabric"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- E29
            coords = {x=1667,y=5746,z=-3},
            dist = {"ArtStorePottery","CrateMasonry" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        -- -2 level, laundry, main storage
        { -- E30
            coords = {x=1659,y=5744,z=-2},
            dist = {"LaundryLoad1", "LaundryLoad2", "LaundryLoad3", "LaundryLoad4", "LaundryLoad5", "LaundryLoad6", "LaundryLoad7", "CrateBootsArmy"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E31
            coords = {x=1659,y=5744,z=-2},
            slot = "upper",
            dist = {"LaundryCleaning", "JanitorCleaning"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E32
            coords = {x=1661,y=5750,z=-2},
            dist = {"FreezerIceCream", "WesternKitchenFreezer", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E33
            coords = {x=1661,y=5749,z=-2},
            dist = {"FridgeFarmStorage", "FreezerIceCream"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E34
            coords = {x=1662,y=5750,z=-2},
            items = {
                { name = 'Base.Firewood', chance = 1, count = {10,10} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E35
            coords = {x=1663,y=5750,z=-2},
            dist = {"SafehouseFireplace", "SafehouseLighting", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E36
            coords = {x=1664,y=5750,z=-2},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E37
            coords = {x=1665,y=5750,z=-2},
            dist = {"CrateTortillaChips", "KitchenDryFood"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E38
            coords = {x=1666,y=5750,z=-2},
            dist = {"GigamartDryGoods", "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E39
            coords = {x=1667,y=5750,z=-2},
            dist = {"CrateFlour", "CrateOilVegetable"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E40
            coords = {x=1663,y=5747,z=-2},
            dist = {"SafehouseMedical_Late", "StoreShelfMedical", "ArmyStorageMedical", "ArmyBunkerMedical" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E41
            coords = {x=1663,y=5746,z=-2},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E42
            coords = {x=1663,y=5745,z=-2},
            dist = {"LiquorStoreBeer", "JanitorCleaning", "DrugLabGuns", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E43
            coords = {x=1665,y=5748,z=-2},
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.Sheet', },
                { name = 'Base.WoodAxe', },
                { name = 'Base.Machete', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E44
            coords = {x=1665,y=5747,z=-2},
            dist = {"ClothingStorageWinter",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E45
            coords = {x=1665,y=5746,z=-2},
            dist = {"HuntingLockers", "RangerTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E46
            coords = {x=1665,y=5745,z=-2},
            dist = {"TheatrePopcorn", "FridgeSoda",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E47
            coords = {x=1667,y=5748,z=-2},
            dist = {"CrateFishing",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E48
            coords = {x=1667,y=5747,z=-2},
            dist = {"CrateLumber", "CrateSheetMetal"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E49
            coords = {x=1667,y=5746,z=-2},
            dist = {"ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E50
            coords = {x=1667,y=5745,z=-2},
            dist = {"CrateGravelBags", "CrateSandBags", "CrateClayBags"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        -- store basement
        { -- E51
            coords = {x=1658,y=5747,z=-1},
            slot = "upper",
            dist = {"CrateToiletPaper", "CrateLinens"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E52
            coords = {x=1658,y=5746,z=-1},
            dist = {"BurglarTools", "CarpenterTools", "BarnTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E53
            coords = {x=1658,y=5745,z=-1},
            dist = {"CrateBlacksmithing" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E54
            coords = {x=1664,y=5744,z=-1},
            slot = "upper",
            dist = {"ArmyStorageOutfit",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E55
            coords = {x=1665,y=5744,z=-1},
            slot = "upper",
            dist = {"DrugLabOutfit",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E56
            coords = {x=1662,y=5746,z=-1},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E57
            coords = {x=1663,y=5746,z=-1},
            dist = {"CrateFlour", "CrateOilVegetable", "CafeKitchenSupplies", "CafeKitchenTea", "CrateSodaBottles"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E58
            coords = {x=1664,y=5746,z=-1},
            dist = {"SafehouseMedical", "LiquorStoreWhiskey" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E59
            coords = {x=1663,y=5747,z=-1},
            dist = {"LiquorStoreBeer","LiquorStoreBeerFancy"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E60
            coords = {x=1664,y=5747,z=-1},
            dist = {"CrateVHSTapes"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E61
            coords = {x=1664,y=5748,z=-1},
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E62
            coords = {x=1663,y=5751,z=-1},
            dist = {"CrateLiquor", "LiquorStoreWhiskey"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- store area
        { -- E63
            coords = {x=1661,y=5746,z=0},
            dist = {"CrateToiletPaper", "GasStoreToiletries"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E64
            coords = {x=1662,y=5746,z=0},
            dist = {"CrateBootsArmy",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E65
            coords = {x=1663,y=5746,z=0},
            dist = {"SafehouseTraps","GunStoreKnives","CampingStoreBackpacks","CrateLiquor",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E66
            coords = {x=1664,y=5746,z=0},
            dist = {"SafehouseTraps","GunStoreKnives","CrateLiquor", "CarSupplyTools",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E67
            coords = {x=1660,y=5751,z=0},
            dist = {"LivingRoomShelfClassy"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E68
            coords = {x=1660,y=5752,z=0},
            dist = {"MusicStoreCDs"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E69
            coords = {x=1664,y=5750,z=0},
            dist = { "GasStoreEmergency", "StoreCounterTobacco" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- upper house level
        { -- E70
            coords = {x=1659,y=5744,z=1},
            dist = {"SushiKitchenFreezer", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E71
            coords = {x=1660,y=5744,z=1},
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E72
            coords = {x=1661,y=5744,z=1},
            dist = {"LaundryCleaning", "JanitorCleaning", "MedicalStorageDrugs"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E73
            coords = {x=1662,y=5744,z=1},
            dist = {"ButcherSpices","GigamartSpices","GroceryBagGourmet",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E74
            coords = {x=1664,y=5744,z=1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E75
            coords = {x=1665,y=5747,z=1},
            dist = {"LaundryLoad1", "ArmySurplusOutfit", "ToolStoreOutfit"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E76
            coords = {x=1659,y=5747,z=1},
            dist = {"MedicalClinicDrugs", "MedicalCabinet" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E77
            coords = {x=1665,y=5749,z=1},
            items = {
                { name = 'Base.Sledgehammer', chance = 1, count = {1,1}, },
                { name = 'Base.Machete', chance = 1, count = {1,1}, },
            },
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(GasCorner.objectSpawns, { enabled = "EnableLadders", sprite = "fencing_01_27", x = 1628, y = 5760, z = 0, removeFloor = true, clearExisting = true, })
end

return GasCorner