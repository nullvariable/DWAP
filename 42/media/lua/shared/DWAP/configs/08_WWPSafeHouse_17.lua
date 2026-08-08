local wtc = { x = 10096, y = 7348, z = -1 } -- waterTankCoords
local pb1 = { x = 10088, y = 7347, z = -1 }
local WWestPointSafeHouse = {
    group = "West Point",
    baseBuildings = {
        { x = 10091, y = 7352, z = 0 }, -- shed w/basement
        { x = 10083, y = 7371, z = 0 }, -- house
    },
    spawn = { x = 10083, y = 7371, z = 0 },
    waterTanks = {
        -- source as a generators index rather than a literal coord: it resolves
        -- to generators[1].controls at load, so a site move can never strand it
        -- the way the old hardcoded 10149,6620 was
        { sprite = "dwap_tiles_01_8", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = 1 },
    },
    waterFixtures = {
        { sprite = "fixtures_bathroom_01_32", x = 10077, y = 7370, z = 0,  sourceType = "tank", source = wtc, }, -- bathroom, bld 39,28#2
        { sprite = "fixtures_bathroom_01_1",  x = 10077, y = 7371, z = 0,  sourceType = "tank", source = wtc, }, -- bathroom, bld 39,28#2
        { sprite = "fixtures_sinks_01_8",     x = 10077, y = 7373, z = 0,  sourceType = "tank", source = wtc, }, -- kitchen, bld 39,28#2
        { sprite = "fixtures_sinks_01_12",    x = 10078, y = 7370, z = 0,  sourceType = "tank", source = wtc, }, -- bathroom, bld 39,28#2

        -- basement fixtures
        { sprite = "fixtures_sinks_01_35",    x = 10094, y = 7349, z = -1, sourceType = "tank", source = wtc, }, -- warehouse, bld 39,28#4
        { sprite = "fixtures_bathroom_01_33", x = 10084, y = 7359, z = -1, sourceType = "tank", source = wtc, }, -- warehouse, bld 39,28#4
        { sprite = "fixtures_bathroom_01_6",  x = 10086, y = 7359, z = -1, sourceType = "tank", source = wtc, }, -- warehouse, bld 39,28#4
        { sprite = "fixtures_sinks_01_16",    x = 10084, y = 7363, z = -1, sourceType = "tank", source = wtc, }, -- warehouse, bld 39,28#4
    },
    doorKeys = {
        name = "W West Point Safe House",
        doors = {
        },
    },
    map = { name = "DWAPStashMap8", },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 10087, y = 7348, z = pb1.z },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 10085, y = 7348, z = -1, },
            fakeGenerators = {
                { x = 10087, y = 7366, z = -1, createTile = false },
            },
        },
    },
    objectSpawns = {
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_0", x = 10077, y = 7371, z = 0, }, -- window W | bathroom, bld 39,28#2
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_0", x = 10077, y = 7373, z = 0, }, -- window W | kitchen, bld 39,28#2
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_1", x = 10078, y = 7367, z = 0, }, -- window N | bedroom, bld 39,28#2
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_1", x = 10080, y = 7375, z = 0, }, -- window N | kitchen, bld 39,28#2
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_1", x = 10081, y = 7367, z = 0, }, -- window N | kidsbedroom, bld 39,28#2
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_1", x = 10083, y = 7376, z = 0, }, -- window N | livingroom, bld 39,28#2
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_doors_02_5",   x = 10084, y = 7376, z = 0, }, -- door N | livingroom, bld 39,28#2
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_1", x = 10085, y = 7367, z = 0, }, -- window N | livingroom, bld 39,28#2
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_0", x = 10087, y = 7369, z = 0, }, -- window W | livingroom, bld 39,28#2
        -- shed
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_0", x = 10090, y = 7352, z = 0, }, -- window W | garagestorage, bld 39,28#0
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_1", x = 10094, y = 7354, z = 0, }, -- window N | garagestorage, bld 39,28#0
    },
    loot = {

        { -- E1 cabinet next to bunk beds
            note = "dresser @ warehouse",
            coords = { x = 10084, y = 7365, z = -1 },
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E2 upper
            sprite = 'location_trailer_02_23',
            note = "overhead @ warehouse",
            coords = { x = 10084, y = 7364, z = -1 },
            slot = "upper",
            dist = { "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E3 lower (66)
            note = "counter @ warehouse",
            coords = { x = 10084, y = 7364, z = -1 },
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E4 upper
            sprite = 'location_trailer_02_23',
            note = "overhead @ warehouse",
            coords = { x = 10084, y = 7363, z = -1 },
            slot = "upper",
            dist = { "ButcherSpices", "GigamartSpices", "GroceryBagGourmet", "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E5 lower (67)
            sprite = 'location_trailer_02_19',
            note = "counter @ warehouse",
            coords = { x = 10084, y = 7363, z = -1 },
            dist = { "TestingLab", "MedicalCabinet", "ArmyStorageMedical", "ArmyBunkerMedical", "JanitorCleaning" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E6 upper
            sprite = 'location_trailer_02_23',
            note = "overhead @ warehouse",
            coords = { x = 10084, y = 7362, z = -1 },
            slot = "upper",
            dist = { "CrateFishing", "FishermanTools" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E7 lower (68)
            sprite = 'location_trailer_02_19',
            note = "counter @ warehouse",
            coords = { x = 10084, y = 7362, z = -1 },
            dist = { "CafeKitchenSupplies", "CafeKitchenTea", "CrateSodaBottles" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E8
            note = "militarycrate @ warehouse",
            coords = { x = 10084, y = 7361, z = -1 },
            dist = { "GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E9
            note = "militarycrate @ warehouse",
            coords = { x = 10084, y = 7361, z = -1 },
            stack = 2,
            dist = { "GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E10
            note = "militarycrate @ warehouse",
            coords = { x = 10084, y = 7360, z = -1 },
            dist = { "GasStoreEmergency", "StoreCounterTobacco", "BurglarTools", "CarpenterTools", "BarnTools", "SafehouseArmor", "SafehouseLighting" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E11
            note = "militarycrate @ warehouse",
            coords = { x = 10084, y = 7360, z = -1 },
            stack = 2,
            dist = { "GasStoreEmergency", "StoreCounterTobacco", "BurglarTools", "CarpenterTools", "BarnTools", "SafehouseArmor", "SafehouseLighting" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E12
            note = "crate @ warehouse",
            coords = { x = 10086, y = 7360, z = -1 },
            dist = { "SafehouseTraps", "GunStoreKnives", "CampingStoreBackpacks", "CrateLiquor", "GasStorageMechanics", "DrugLabOutfit" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E13
            note = "crate @ warehouse",
            coords = { x = 10086, y = 7360, z = -1 },
            stack = 2,
            dist = { "SafehouseTraps", "GunStoreKnives", "CampingStoreBackpacks", "CrateLiquor", "GasStorageMechanics", "DrugLabOutfit" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E14
            note = "crate @ warehouse",
            coords = { x = 10086, y = 7361, z = -1 },
            dist = { "CrateLiquor", "DishCabinetVIPLounge", "MusicStoreCDs", "CrateVHSTapes", "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E15
            note = "crate @ warehouse",
            coords = { x = 10086, y = 7361, z = -1 },
            stack = 2,
            dist = { "CrateLiquor", "DishCabinetVIPLounge", "MusicStoreCDs", "CrateVHSTapes", "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E16
            note = "crate @ warehouse",
            coords = { x = 10086, y = 7362, z = -1 },
            dist = { "GardenStoreTools", "Homesteading", "CrateLinens", "CrateFarming" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E17
            note = "crate @ warehouse",
            coords = { x = 10086, y = 7362, z = -1 },
            stack = 2,
            dist = { "GardenStoreTools", "Homesteading", "CrateLinens", "CrateFarming" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E18 mil locker
            note = "militarylocker @ warehouse",
            coords = { x = 10086, y = 7366, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E19 mil locker
            note = "militarylocker @ warehouse",
            coords = { x = 10086, y = 7367, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        -- "bunker" entryway
        { -- E20
            note = "metal_shelves @ warehouse",
            coords = { x = 10086, y = 7355, z = -1 },
            special = "essentials",
        },
        { -- E21
            note = "metal_shelves @ warehouse",
            coords = { x = 10086, y = 7356, z = -1 },
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E22
            note = "metal_shelves @ warehouse",
            coords = { x = 10086, y = 7357, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E23
            note = "metal_shelves @ warehouse",
            coords = { x = 10086, y = 7358, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E24
            note = "metal_shelves @ warehouse",
            coords = { x = 10084, y = 7357, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E25
            note = "metal_shelves @ warehouse",
            coords = { x = 10084, y = 7358, z = -1 },
            dist = { "SewingStoreTools", "CrateLeather", "SewingStoreFabric" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },

        -- main basement
        { -- E26
            note = "freezer @ storage",
            coords = { x = 10096, y = 7350, z = -1 },
            dist = { "FreezerRich", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E27
            note = "freezer @ storage",
            coords = { x = 10094, y = 7350, z = -1 },
            dist = { "FridgeFarmStorage", "FridgeGeneric", "SushiKitchenFridge" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E28
            note = "freezer @ storage",
            coords = { x = 10094, y = 7351, z = -1 },
            dist = { "FreezerIceCream", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E29
            note = "freezer @ storage",
            coords = { x = 10096, y = 7351, z = -1 },
            dist = { "FreezerIceCream", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E30
            note = "freezer @ storage",
            coords = { x = 10094, y = 7352, z = -1 },
            dist = { "SpiffosKitchenFridge", "SpiffosKitchenFreezer" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E31
            note = "freezer @ storage",
            coords = { x = 10096, y = 7352, z = -1 },
            dist = { "SpiffosKitchenFridge", "SpiffosKitchenFreezer" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E32
            note = "metal_shelves @ warehouse",
            coords = { x = 10088, y = 7354, z = -1 },
            dist = { "ArtStorePottery", "CrateMasonry" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E33
            note = "metal_shelves @ warehouse",
            coords = { x = 10089, y = 7354, z = -1 },
            dist = { "GigamartCrisps", "ArmyStorageElectronics", "RandomFiller" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E34
            note = "metal_shelves @ warehouse",
            coords = { x = 10090, y = 7354, z = -1 },
            dist = { "CampingStoreTools", "ArmyHangarTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E35
            note = "metal_shelves @ warehouse",
            coords = { x = 10091, y = 7354, z = -1 },
            dist = { "BurglarTools", "CarpenterTools", "BarnTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E36
            note = "metal_shelves @ warehouse",
            coords = { x = 10094, y = 7347, z = -1 },
            dist = { "CrateTools", "GarageTools", "BarnTools", "WeldingWorkshopTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E37
            note = "metal_shelves @ warehouse",
            coords = { x = 10095, y = 7347, z = -1 },
            dist = { "GigamartTools", "JanitorTools", "WeldingWorkshopTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E38
            note = "bin @ warehouse",
            coords = { x = 10097, y = 7350, z = -1 },
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E39
            note = "wardrobe @ livingroom",
            coords = { x = 10080, y = 7370, z = 0 },
            dist = { "CrateLiquor", "LiquorStoreWhiskey" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E40
            note = "wardrobe @ livingroom",
            coords = { x = 10081, y = 7370, z = 0 },
            dist = { "MeleeWeapons", "MeleeWeapons_Mid" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E41
            note = "sidetable @ livingroom",
            coords = { x = 10081, y = 7374, z = 0 },
            dist = { "SafehouseTraps", "GunStoreKnives", "CampingStoreBackpacks", "CrateLiquor", "CarSupplyTools", "DrugLabOutfit" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E42
            note = "shelves @ livingroom",
            coords = { x = 10083, y = 7367, z = 0 },
            dist = { "CrateVHSTapes" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E43
            note = "sidetable @ livingroom",
            coords = { x = 10085, y = 7367, z = 0 },
            dist = { "LivingRoomShelfClassy" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E44
            note = "counter @ kitchen",
            coords = { x = 10080, y = 7372, z = 0 },
            dist = { "CafeKitchenSupplies", "CafeKitchenTea", "CrateSodaBottles" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E45
            note = "counter @ kitchen",
            coords = { x = 10077, y = 7372, z = 0 },
            dist = { "StoreKitchenBaking", "WesternKitchenBaking" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E46
            note = "metal_shelves @ closet",
            coords = { x = 10086, y = 7373, z = 0 },
            slot = "upper",
            dist = { "SafehouseTraps", "GunStoreKnives", "CampingStoreBackpacks", "CrateLiquor", "CarSupplyTools", "DrugLabOutfit" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E47
            note = "fridge @ kitchen",
            coords = { x = 10078, y = 7372, z = 0 },
            dist = { "WesternKitchenFridge" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E48
            note = "freezer @ kitchen",
            coords = { x = 10078, y = 7372, z = 0 },
            slot = "freezer",
            dist = { "FreezerRich", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E49
            note = "counter @ kitchen",
            coords = { x = 10079, y = 7372, z = 0 },
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E50
            note = "counter @ kitchen",
            coords = { x = 10077, y = 7373, z = 0 },
            dist = { "ButcherSpices", "GigamartSpices", "GroceryBagGourmet", "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E51
            note = "counter @ kitchen",
            coords = { x = 10077, y = 7374, z = 0 },
            dist = { "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E52
            note = "counter @ kitchen",
            coords = { x = 10079, y = 7374, z = 0 },
            dist = { "TheatrePopcorn", "TheatreSnacks" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E53
            note = "dresser @ bedroom",
            coords = { x = 10077, y = 7369, z = 0 },
            dist = { "DrugLabOutfit", "MechanicOutfit", "WildWestClothing" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E54
            note = "dresser @ kidsbedroom",
            coords = { x = 10080, y = 7368, z = 0 },
            dist = { "ArmyHangarOutfit", "ArmyStorageOutfit", "ArmySurplusOutfit", "LaundryLoad4", "LaundryLoad5", "LaundryLoad6", "LaundryLoad7", "LaundryLoad8" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E55
            note = "cardboardbox @ garagestorage",
            coords = { x = 10093, y = 7352, z = 0 },
            dist = { "HuntingLockers", "RangerTools", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E56
            note = "metal_shelves @ garagestorage",
            coords = { x = 10090, y = 7350, z = 0 },
            slot = "upper",
            dist = { "GasStoreEmergency", "StoreCounterTobacco" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E57
            note = "metal_shelves @ garagestorage",
            coords = { x = 10091, y = 7350, z = 0 },
            slot = "upper",
            dist = { "CarSupplyTools", "GasStorageMechanics", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E58
            note = "cardboardbox @ garagestorage",
            coords = { x = 10092, y = 7350, z = 0 },
            dist = { "GigamartDryGoods", "GigamartBreakfast" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E59
            note = "locker @ garagestorage",
            coords = { x = 10093, y = 7350, z = 0 },
            dist = { "ArmyStorageGuns", "ArmyStorageAmmunition", "FirearmWeapons_Late" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E60
            note = "metal_shelves @ garagestorage",
            coords = { x = 10094, y = 7350, z = 0 },
            dist = {"GardenStoreTools", "Homesteading", "CrateLinens", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E61
            note = "cardboardbox @ garagestorage",
            coords = { x = 10091, y = 7351, z = 0 },
            dist = { "GigamartDryGoods", "GigamartBreakfast" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E62
            note = "cardboardbox @ garagestorage",
            coords = { x = 10092, y = 7351, z = 0 },
            dist = { "CrateFishing", "FishermanTools" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(WWestPointSafeHouse.objectSpawns,
        { enabled = "EnableLadders", sprite = "industry_trucks_01_14", x = 10146, y = 6628, z = -1, removeWall = "west" })
    table.insert(WWestPointSafeHouse.objectSpawns,
        { enabled = "EnableLadders", sprite = "fixtures_doors_frames_01_4", x = 10146, y = 6628, z = -1, })
    table.insert(WWestPointSafeHouse.objectSpawns,
        { enabled = "EnableLadders", sprite = "fixtures_doors_01_56", x = 10146, y = 6628, z = -1, isDoor = true, doorN = false, })
    table.insert(WWestPointSafeHouse.objectSpawns,
        { enabled = "EnableLadders", x = 10143, y = 6679, z = 0, removeFloor = true, })
    -- table.insert(WWestPointSafeHouse.generators[1].chunks, { 1267, 828 })
    -- table.insert(WWestPointSafeHouse.generators[1].chunks, { 1267, 829 })
    -- table.insert(WWestPointSafeHouse.generators[1].chunks, { 1267, 830 })
    -- table.insert(WWestPointSafeHouse.generators[1].chunks, { 1267, 831 })
    -- table.insert(WWestPointSafeHouse.generators[1].chunks, { 1268, 828 })
end

return WWestPointSafeHouse
