--- Notes, "gated" community in north part of Muldraugh. Smallish 2 story house
local wtc = { x = 10704, y = 9548, z = -1 } -- waterTankCoords
local pb1 = { x = 10703, y = 9549, z = -1 }
local MuldSafeHouse = {
    group = "Muldraugh",
    baseBuildings = {
        { x = 10710, y = 9549, z = 1 }, -- house
        { x = 10703, y = 9552, z = -1 }, -- house
    },
    spawn = { x = 10710, y=9549, z = 1 },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = { x = 10708, y = 9548, z = -1 } },
    },
    waterFixtures = {
        -- first floor
        { sprite = "fixtures_bathroom_01_26", x = 10703, y = 9550, z = 0, sourceType="tank", source = wtc, }, -- bathroom, bld 41,37#4
        { sprite = "fixtures_bathroom_01_1", x = 10703, y = 9551, z = 0, sourceType="tank", source = wtc, }, -- bathroom, bld 41,37#4
        { sprite = "fixtures_sinks_01_21", x = 10703, y = 9552, z = 0, sourceType="tank", source = wtc, }, -- bathroom, bld 41,37#4
        -- 2nd floor
        { sprite = "fixtures_bathroom_01_33", x = 10703, y = 9546, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 41,37#4
        { sprite = "fixtures_bathroom_01_1", x = 10703, y = 9547, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 41,37#4
        { sprite = "fixtures_sinks_01_23", x = 10705, y = 9546, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 41,37#4
        { sprite = "fixtures_sinks_01_23", x = 10705, y = 9547, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 41,37#4
        { sprite = "fixtures_sinks_01_21", x = 10709, y = 9546, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 41,37#4
        { sprite = "fixtures_sinks_01_21", x = 10709, y = 9547, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 41,37#4
        { sprite = "fixtures_bathroom_01_32", x = 10711, y = 9546, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 41,37#4
        { sprite = "fixtures_bathroom_01_2", x = 10711, y = 9547, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 41,37#4

        -- basement fixtures
        { sprite = "fixtures_sinks_01_17",    x = 10707, y = 9550, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_23",    x = 10708, y = 9559, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_6",  x = 10708, y = 9560, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_33", x = 10706, y = 9560, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
    },
    doorKeys = {
        name = "Muldraugh Safe House",
        doors = {
            { sprite = "fixtures_doors_01_45", x = 10707, y = 9554, z = 0, }, -- front door
            { sprite = "walls_garage_01_11",    x = 10713, y = 9552, z = 0, }, -- garage door
            { sprite = "fixtures_doors_01_29",  x = 10702, y = 9547, z = 0, }, -- basement door
        },
    },
    map = { name = "DWAPStashMap5", },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 10708, y = 9548, z = -1 },
            fuelTank = { sprite = "dwap_tiles_01_24", x= 10706, y= 9548, z= -1, },
            fakeGenerators = {
                { x = 10710, y = 9555, z = -1 },
            },
        },
    },
    objectSpawns = {
        { clearExisting = true, x = 10659, y = 9555, z = 0, disabled = "EnableWaterSystem", },
        { sprite = "industry_02_175", x = pb1.x, y = pb1.y, z = pb1.z, disabled = "EnableGenSystemSolar", clearExisting = true, },

        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_windows_01_9", x = 10704, y = 9553, z = 0, }, -- window N | bathroom, bld 41,37#4
        { barricade = "metalbar", enabled = "Barricade", target="fixtures_windows_01_9", x = 10705, y = 9546, z = 0, }, -- window N | livingroom, bld 41,37#4
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_doors_01_45", x = 10707, y = 9554, z = 0, }, -- door N | lobby, bld 41,37#4
        { barricade = "metalbar", enabled = "Barricade", target="fixtures_windows_01_9", x = 10709, y = 9546, z = 0, }, -- window N | kitchen, bld 41,37#4
        { barricade = "metalbar", enabled = "Barricade", target="fixtures_windows_01_9", x = 10710, y = 9553, z = 0, }, -- window N | lobby, bld 41,37#4
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_windows_01_8", x = 10717, y = 9549, z = 0, }, -- window W | garage, bld 41,37#4
    },
    loot = {
        -- new spawned bookshelves from ba_dwap_05_books map
        { -- E1
            coords = { x = 10707, y = 9552, z = 1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E2
            coords = { x = 10707, y = 9552, z = 1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        -- main floor
        { -- E3
            coords = { x = 10710, y = 9551, z = 0 },
            dist = { "GasStoreEmergency" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E4
            coords = { x = 10711, y = 9551, z = 0 },
            dist = { "ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal", "ToolFactoryIngots" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E5
            coords = { x = 10712, y = 9547, z = 0 },
            dist = { "LoggingFactoryTools", "CrateTools", "GarageTools", "BurglarTools", "CarpenterTools", "BarnTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        -- kitchen
        { -- E6
            slot = 'freezer',
            coords = { x = 10707, y = 9546, z = 0 },
            dist = { "FreezerRich", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E7
            coords = { x = 10707, y = 9546, z = 0 },
            dist = { "MotelFridge", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E8
            coords = { x = 10709, y = 9546, z = 0 },
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E9
            coords = { x = 10709, y = 9546, z = 0 },
            slot = "upper",
            dist = { "CrateToiletPaper", "KitchenDryFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E10
            coords = { x = 10711, y = 9546, z = 0 },
            dist = { "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E11
            coords = { x = 10711, y = 9546, z = 0 },
            slot = "upper",
            dist = { "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- tv stand
        { -- E12
            coords = { x = 10704, y = 9549, z = 0 },
            items = {
                { name = 'Base.Remote',     chance = 1, count = { 1, 3 } },
                { name = 'Base.VideoGame',  chance = 1, count = { 1, 1 } },
                { name = 'Base.VHS_Retail', chance = 1, count = { 30, 30 } },
            },
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E13
            coords = { x = 10703, y = 9551, z = 0 },
            slot = "upper",
            dist = { "MedicalClinicTools", "MedicalStorageDrugs" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        -- 2nd floor
        { -- E14
            coords = { x = 10703, y = 9549, z = 1 },
            dist = { "GymLaundry", "GymLockers" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- E15
            coords = { x = 10705, y = 9552, z = 1 },
            dist = { "SafehouseLighting", "SewingStoreTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- E16
            coords = { x = 10709, y = 9548, z = 1 },
            dist = { "CrateLiquor", "DishCabinetVIPLounge" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E17
            coords = { x = 10711, y = 9550, z = 1 },
            dist = { "SafehouseArmor", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E18
            coords = { x = 10703, y = 9550, z = 1 },
            dist = { "ArmyStorageOutfit", "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateLinens" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E19
            coords = { x = 10703, y = 9552, z = 0 },
            dist = { "BathroomCounter", "ArmyStorageMedical", "ArmyBunkerMedical" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E20
            coords = { x = 10711, y = 9551, z = 1 },
            dist = { "CampingLockers" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E21
            coords = { x = 10709, y = 9547, z = 1 },
            dist = { "ArmyStorageOutfit", "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "ToolStoreOutfit" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E22
            coords = { x = 10705, y = 9546, z = 1 },
            dist = { "SafehouseMedical", "CampingStoreBackpacks", "MeleeWeapons", "SafehouseBooze" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        -- entry way
        { -- E23
            coords = { x = 10703, y = 9546, z = 0 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E24
            coords = { x = 10705, y = 9547, z = 1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E25
            coords = { x = 10706, y = 9553, z = 0 },
            dist = { "CrateFishing", "FishermanTools", "HuntingLockers", "RangerTools" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E26
            coords = { x = 10709, y = 9546, z = 1 },
            dist = { "GasStoreToiletries" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E27 south west corner
            coords = { x = 10702, y = 9560, z = -1 },
            special = "essentials",
        },
        { -- E28
            coords = { x = 10702, y = 9559, z = -1 },
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E29
            coords = { x = 10702, y = 9558, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E30
            coords = { x = 10702, y = 9557, z = -1 },
            dist = { "SewingStoreTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- E31
            coords = { x = 10702, y = 9556, z = -1 },
            dist = { "CrateFishing", "FishermanTools" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E32
            coords = { x = 10702, y = 9555, z = -1 },
            dist = { "GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E33
            coords = { x = 10702, y = 9554, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E34
            coords = { x = 10702, y = 9553, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E35
            coords = { x = 10703, y = 9551, z = -1 },
            dist = { "WesternKitchenFreezer", "FreezerIceCream", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E36
            stack = 1,
            coords = { x = 10703, y = 9550, z = -1 },
            dist = { "GroceryBagGourmet", "GigamartDryGoods" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E37
            stack = 2,
            coords = { x = 10703, y = 9550, z = -1 },
            dist = { "StoreShelfDrinks", "CrateCannedFood", "CrateSodaBottles", "CandyStoreSnacks", "CrateTortillaChips" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E38
            coords = { x = 10705, y = 9550, z = -1 },
            dist = { "FridgeFarmStorage", "FridgeGeneric" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E39
            slot = 'freezer',
            coords = { x = 10705, y = 9550, z = -1 },
            dist = { "FreezerRich", "FreezerGeneric" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E40
            coords = { x = 10705, y = 9550, z = -1 },
            slot = "upper",
            dist = { "ButcherSpices", "GigamartSpices", "GroceryBagGourmet", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E41
            coords = { x = 10706, y = 9550, z = -1 },
            dist = { "GigamartBakingMisc", "CrateFlour", "CrateOilVegetable" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E42
            coords = { x = 10706, y = 9550, z = -1 },
            slot = "upper",
            dist = { "ButcherSpices", "GigamartSpices", "GroceryBagGourmet", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E43
            coords = { x = 10707, y = 9550, z = -1 },
            dist = { "GigamartBakingMisc", "CrateFlour", "CrateOilVegetable" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E44
            coords = { x = 10707, y = 9550, z = -1 },
            slot = "upper",
            dist = { "BakeryKitchenFreezer", "CrateCannedFood", "CafeKitchenCoffee" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E45
            coords = { x = 10708, y = 9550, z = -1 },
            slot = "upper",
            dist = { "GigamartCrisps", "SafehouseFireplace" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E46
            coords = { x = 10706, y = 9557, z = -1 },
            dist = { "RangerTools", "CrateFishing", "FishermanTools" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E47
            coords = { x = 10706, y = 9559, z = -1 },
            slot = "upper",
            dist = { "SafehouseMedical", "CrateLinens" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E48
            coords = { x = 10708, y = 9559, z = -1 },
            dist = { "BathroomCounter", "GasStoreToiletries", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E49
            coords = { x = 10706, y = 9556, z = -1 },
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = { 8, 10 } },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E50
            coords = { x = 10706, y = 9555, z = -1 },
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E51
            stack = 1,
            coords = { x = 10706, y = 9554, z = -1 },
            dist = { "ArmyStorageOutfit", "LockerArmyBedroom", "SafehouseArmor", "DerelictHouseCrime", "CrateBootsArmy", "SafehouseLighting" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E52
            stack = 2,
            coords = { x = 10706, y = 9554, z = -1 },
            dist = { "GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E53
            stack = 1,
            coords = { x = 10706, y = 9553, z = -1 },
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E54
            stack = 2,
            coords = { x = 10706, y = 9553, z = -1 },
            dist = { "MorgueTools", "ArmyStorageMedical", "ArmyBunkerMedical", "MedicalClinicDrugs", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E55
            stack = 1,
            coords = { x = 10706, y = 9552, z = -1 },
            dist = { "CrateLiquor", "LiquorStoreWhiskey" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E56
            stack = 1,
            coords = { x = 10706, y = 9552, z = -1 },
            dist = { "CrateLiquor", "LiquorStoreWhiskey" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E57
            coords = { x = 10708, y = 9556, z = -1 },
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E58
            coords = { x = 10704, y = 9560, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E59
            stack = 1,
            coords = { x = 10704, y = 9559, z = -1 },
            dist = { "LoggingFactoryTools", "CrateTools", "GarageTools", "BurglarTools", "CarpenterTools", "BarnTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E60
            stack = 2,
            coords = { x = 10704, y = 9559, z = -1 },
            dist = { "ArmyStorageAmmunition", "GunStoreKnives", "DerelictHouseCrime" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E61
            stack = 1,
            coords = { x = 10704, y = 9558, z = -1 },
            dist = { "PoliceStorageGuns", "PoliceStorageAmmunition", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E62
            stack = 2,
            coords = { x = 10704, y = 9558, z = -1 },
            dist = { "PoliceStorageGuns", "PoliceStorageAmmunition", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E63
            stack = 1,
            coords = { x = 10704, y = 9557, z = -1 },
            dist = { "ArmyStorageAmmunition", "GunStoreAmmunition", "RangerTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E64
            stack = 2,
            coords = { x = 10704, y = 9557, z = -1 },
            dist = { "ArmyStorageAmmunition", "GunStoreAmmunition", "RangerTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E65
            stack = 1,
            coords = { x = 10704, y = 9556, z = -1 },
            dist = { "CrateVHSTapes", "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction", "MusicStoreCDs" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E66
            stack = 2,
            coords = { x = 10704, y = 9556, z = -1 },
            dist = { "CrateVHSTapes", "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction", "MusicStoreCDs" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E67
            coords = { x = 10705, y = 9554, z = -1 },
            items = {
                { name = 'Base.Firewood', chance = 1, count = { 10, 10 } },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E68
            coords = { x = 10705, y = 9553, z = -1 },
            items = {
                { name = 'Base.Firewood', chance = 1, count = { 10, 10 } },
                { name = 'Base.Twigs',    chance = 1, count = { 10, 10 } },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
    },
}

return MuldSafeHouse
