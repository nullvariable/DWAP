-- @TODO (2026-08-07 audit) unresolved - delete lines as they are fixed
--   * entry 20: duplicate coordinates with an earlier entry - one of each
--     pair needs slot or stack addressing, or is redundant
local wtc1 = {x = 594, y = 9371, z = 0,}
local pb1 = { x = 589, y = 9378, z = -1 }
local bunkerTopLeft = {x = 591, y = 9366, z = -1}
local EkronFactory = {
    group = "Ekron",
    baseBuildings = {
        { x = 565, y = 9374, z = 1 }, -- factory
        { x = 581, y = 9376, z = -1 }, -- factory basement
        { x = 592, y = 9375, z = -1 }, -- bunker
    },
    spawn = { x = 565, y = 9374, z = 1 },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 583, y = 9374, z = pb1.z },
            fuelTank = { sprite = "dwap_tiles_01_24", x= 581, y= 9374, z= -1, },
            fakeGenerators = {
                { x = 587, y = 9377, z = -1, },
                { x = 568, y = 9381, z = -1, },
            },
        },
    },
    waterTanks = {
        { sprite = "industry_02_73", x = wtc1.x, y = wtc1.y, z = wtc1.z, sourceType="generator", source = {x = 583, y = 9374, z = -1} },
    },
    waterFixtures = {
        { sprite = "fixtures_sinks_01_13", x = 564, y = 9375, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_13", x = 564, y = 9376, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_29", x = 576, y = 9376, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_29", x = 576, y = 9377, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_6", x = 593, y = 9374, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_16", x = 591, y = 9370, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
    },
    doorKeys = {
        name = "Ekron Factory",
        doors = {
            { sprite = "fixtures_doors_01_44", x = 576, y = 9379, z = 0, },
        },
    },
    map = { name = "DWAPStashMap21", },
    objectSpawns = {
        { sprite = "industry_02_175", x = pb1.x, y = pb1.y, z = pb1.z, disabled = "EnableGenSystemSolar", clearExisting = true, },

        -- { sprite = "lighting_outdoor_01_33", x = 579, y = 9375, z = -1, isLightSwitch = true, },
        -- { sprite = "lighting_outdoor_01_32", x = 578, y = 9378, z = -1, isLightSwitch = true, },
        -- { sprite = "lighting_outdoor_01_32", x = 573, y = 9378, z = -1, isLightSwitch = true, },
        -- { sprite = "lighting_outdoor_01_49", x = 581, y = 9378, z = -1, isLightSwitch = true, },

        { barricade = "metalbar", target="walls_commercial_01_84", x = 577, y = 9378, z = 0, },
        { barricade = "metal", target="walls_commercial_01_84", x = 577, y = 9380, z = 0, },
    },
    loot = {
        { -- E1
            coords = {x = 567, y = 9380, z = 1},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- basement
        { -- E2
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+2,z=bunkerTopLeft.z},
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E3
            sprite = 'location_trailer_02_23',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+3,z=bunkerTopLeft.z},
            slot = "upper",
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E4
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+3,z=bunkerTopLeft.z},
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E5
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+4,z=bunkerTopLeft.z},
            slot = "upper",
            dist = {"ButcherSpices","GigamartSpices","GroceryBagGourmet","CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E6
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+4,z=bunkerTopLeft.z},
            dist = {"TestingLab","MedicalCabinet","ArmyStorageMedical", "ArmyBunkerMedical"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E7
            sprite = 'location_trailer_02_23',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+5,z=bunkerTopLeft.z},
            slot = "upper",
            dist = {"CrateFishing", "FishermanTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E8
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+5,z=bunkerTopLeft.z},
            dist = {"GigamartCrisps","ArmyStorageElectronics", "RandomFiller" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E9
            sprite = 'location_trailer_02_23',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+7,z=bunkerTopLeft.z},
            dist = {"GardenStoreTools", "Homesteading", "CrateLinens", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E10
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+8,z=bunkerTopLeft.z},
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E11
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+9,z=bunkerTopLeft.z},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E12
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+10,z=bunkerTopLeft.z},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E13
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+11,z=bunkerTopLeft.z},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E14
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+12,z=bunkerTopLeft.z},
            special = "essentials",
        },
        { -- E15
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y+5,z=bunkerTopLeft.z},
            dist = {"CrateLiquor", "DishCabinetVIPLounge", "MusicStoreCDs", "CrateVHSTapes", "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E16
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y+6,z=bunkerTopLeft.z},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E17
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y+7,z=bunkerTopLeft.z},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E18
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y,z=bunkerTopLeft.z},
            dist = {"GasStoreEmergency","StoreCounterTobacco", "BurglarTools", "CarpenterTools", "BarnTools","SafehouseArmor", "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E19
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y+1,z=bunkerTopLeft.z},
            dist = {"SafehouseTraps","GunStoreKnives","CampingStoreBackpacks","CrateLiquor", "CarSupplyTools","DrugLabOutfit"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E20
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y+1,z=bunkerTopLeft.z},
            dist = {"GunStoreKnives","CrateLiquor", "GasStorageMechanics","DrugLabOutfit"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E21
            coords = {x=597,y=9375,z=-1},
            dist = {"CrateCannedFood", "KitchenCannedFood", "ArmyBunkerKitchen"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E22
            coords = {x=596,y=9375,z=-1},
            dist = {"FirearmWeapons_Late", "DrugLabGuns","ArmyStorageGuns","PoliceStorageGuns", "PoliceStorageAmmunition",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E23
            coords = {x=595,y=9375,z=-1},
            dist = {"GunStoreKnives","SafehouseTraps", "ArmyStorageAmmunition", "ArmySurplusMisc"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E24
            coords = {x=594,y=9375,z=-1},
            dist = {"BurglarTools", "CarpenterTools", "BarnTools", "CrateTools", "GarageTools", "GigamartTools", "JanitorTools", "LoggingFactoryTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E25
            coords = {x=593,y=9375,z=-1},
            dist = {"BurglarTools", "CarpenterTools", "BarnTools", "CrateTools", "GarageTools", "GigamartTools", "JanitorTools", "LoggingFactoryTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E26
            coords = {x=597,y=9377,z=-1},
            dist = {"FreezerIceCream", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E27
            coords = {x=597,y=9378,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E28
            coords = {x=595,y=9377,z=-1},
            dist = {"ArtStorePottery","CrateMasonry" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E29
            coords = {x=595,y=9378,z=-1},
            dist = {"KitchenDryFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E30
            coords = {x=593,y=9377,z=-1},
            dist = {"SafehouseMedical_Late", "StoreShelfMedical", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E31
            coords = {x=593,y=9378,z=-1},
            dist = {"SewingStoreTools", "CrateTailoring", "CrateFabric_Cotton", "CrateFabric_DenimBlack", "CrateLeather","SewingStoreFabric"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },

        -- 2nd floor
        { -- E32
            coords = {x=575,y=9371,z=1},
            dist = {"CrateLiquor", "DishCabinetVIPLounge", "CrateVHSTapes", "LivingRoomShelfClassy",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E33
            coords = {x=572,y=9371,z=1},
            dist = {"CrateBlacksmithing", "CrateMechanics", "CrateMetalwork" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E34
            coords = {x=569,y=9371,z=1},
            dist = {"CrateFishing", "FishermanTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E35
            coords = {x=566,y=9371,z=1},
            dist = {"HuntingLockers", "RangerTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E36
            coords = {x=575,y=9377,z=1},
            dist = {"CrateLiquor", "DishCabinetVIPLounge"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E37
            coords = {x=572,y=9377,z=1},
            dist = {"CrateLiquor", "DishCabinetVIPLounge"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E38
            coords = {x=569,y=9377,z=1},
            dist = {"BookstoreMilitaryHistory","MovieRentalShelves"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E39
            coords = {x=573,y=9378,z=1},
            dist = {"ArmyStorageOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateBootsArmy"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E40
            coords = {x=574,y=9378,z=1},
            dist = { "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateBootsArmy"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E41
            coords = {x=575,y=9378,z=1},
            dist = {"ArmyStorageOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateLinens"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E42
            coords = {x=576,y=9378,z=1},
            dist = {"SafehouseArmor", "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        -- first floor
        { -- E43
            coords = {x=564,y=9378,z=0},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E44
            coords = {x=564,y=9380,z=0},
            dist = {"CrateFlour", "CrateOilVegetable"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E45
            coords = {x=575,y=9371,z=0},
            dist = {"SewingStoreTools", "CrateLeather", "SewingStoreFabric"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- E46
            coords = {x=572,y=9371,z=0},
            dist = {"ArmyStorageMedical", "ArmyBunkerMedical"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E47
            coords = {x=569,y=9371,z=0},
            dist = {"CrateTortillaChips"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E48
            coords = {x=566,y=9371,z=0},
            dist = {"CarSupplyTools", "GasStorageMechanics",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E49
            coords = {x=566,y=9377,z=0},
            dist = {"GigamartDryGoods" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E50
            coords = {x=569,y=9377,z=0},
            dist = {"StoreShelfDrinks", "FridgeSoda", "CrateSodaBottles", "ArtStorePottery", "ArtSupplies"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E51
            coords = {x=572,y=9377,z=0},
            dist = {"CampingStoreTools", "ArmyHangarTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },

        { -- E52
            coords = {x=557,y=9379,z=1},
            items = {
                { name = 'Base.Firewood', chance = 1, count = { 30, 30 } },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E53
            coords = {x=558,y=9379,z=1},
            items = {
                { name = 'Base.Firewood', chance = 1, count = { 30, 30 } },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        -- hallway kitchen
        { -- E54
            coords = {x=564,y=9380,z=1},
            dist = {"SafehouseFireplace", "GigamartSpices", "CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E55
            coords = {x=564,y=9378,z=1},
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },

        -- exterior near water tank
        { -- E56
            coords = {x=593,y=9374,z=0},
            dist = {"CrateLumber", "CrateSheetMetal"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E57
            coords = {x=593,y=9375,z=0},
            dist = {"CrateLumber", "WoodcraftDudeCounter"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E58
            coords = {x=594,y=9375,z=0},
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
    },
}
if getActivatedMods():contains("\\Ladders") then
    table.insert(EkronFactory.objectSpawns, { enabled = "EnableLadders", x = 598, y = 9379, z = -1, removeWall = "north", })
    table.insert(EkronFactory.objectSpawns, { enabled = "EnableLadders", x = 598, y = 9376, z = 0, removeFloor = true, })
    table.insert(EkronFactory.objectSpawns, { enabled = "EnableLadders", x = 598, y = 9375, z = 0, clearExisting = true, })
end

return EkronFactory