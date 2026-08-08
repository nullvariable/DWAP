local wtc = { x = 8084, y = 11550, z = -1 }
local pb1 = { x = 8079, y = 11551, z = -1 }
local RosewoodZippee = {
    group = "Rosewood",
    baseBuildings = {
        { x = 8087, y = 11558, z = 2 }, -- apartments
    },
    spawn = { x = 8087, y = 11558, z = 2 },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 8082, y = 11550, z = pb1.z },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 8080, y = 11550, z = -1, },
            fakeGenerators = {
                { x = 8082, y = 11548, z = -1, createTile = false },
            },
        },
    },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = { x = 8082, y = 11550, z = -1 } },
    },
    waterFixtures = {
        -- 3rd floor apts
        { sprite = "fixtures_sinks_01_1",        x = 8085, y = 11552, z = 2, sourceType = "tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_bathroom_01_1",     x = 8085, y = 11553, z = 2, sourceType = "tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_bathroom_01_25",    x = 8087, y = 11552, z = 2, sourceType = "tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_bathroom_01_24",    x = 8087, y = 11553, z = 2, sourceType = "tank", source = wtc, }, -- bathroom, bld 31,45#6
        -- 2nd floor apts
        { sprite = "fixtures_sinks_01_5",        x = 8074, y = 11552, z = 1, sourceType = "tank", source = wtc, }, -- kitchen, bld 31,45#6
        { sprite = "fixtures_bathroom_01_26",    x = 8077, y = 11560, z = 1, sourceType = "tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_sinks_01_11",       x = 8078, y = 11551, z = 1, sourceType = "tank", source = wtc, }, -- kitchen, bld 31,45#6
        { sprite = "fixtures_bathroom_01_2",     x = 8078, y = 11558, z = 1, sourceType = "tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_sinks_01_29",       x = 8078, y = 11559, z = 1, sourceType = "tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_bathroom_01_27",    x = 8078, y = 11560, z = 1, sourceType = "tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_bathroom_01_25",    x = 8087, y = 11552, z = 1, sourceType = "tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_sinks_01_4",        x = 8085, y = 11552, z = 1, sourceType = "tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_bathroom_01_1",     x = 8085, y = 11553, z = 1, sourceType = "tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_sinks_01_5",        x = 8092, y = 11552, z = 1, sourceType = "tank", source = wtc, }, -- kitchen, bld 31,45#6
        -- 1st floor businesses
        { sprite = "fixtures_sinks_01_8",        x = 8076, y = 11557, z = 0, sourceType = "tank", source = wtc, }, -- breakroom, bld 31,45#6
        { sprite = "fixtures_sinks_01_12",       x = 8078, y = 11552, z = 0, sourceType = "tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_bathroom_01_0",     x = 8079, y = 11552, z = 0, sourceType = "tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "location_shop_zippee_01_60", x = 8093, y = 11560, z = 0, sourceType = "tank", source = wtc, }, -- zippeestore, bld 31,45#6
    },
    doorKeys = {
        name = "Rosewood Zippee Apts Key",
        doors = {
        },
    },
    map = { name = "DWAPStashMap7", },
    objectSpawns = {
        { sprite = "industry_02_175", x = pb1.x,             y = pb1.y,                            z = pb1.z, disabled = "EnableGenSystemSolar", clearExisting = true, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "fixtures_windows_metal_16", x = 8096,  y = 11555,                         z = 2, }, -- window W | livingroom, bld 31,45#6
        { barricade = "woodhalf",     enabled = "Barricade", target = "fixtures_windows_metal_16", x = 8096,  y = 11557,                         z = 2, }, -- window W | livingroom, bld 31,45#6
        { barricade = "woodhalf",     enabled = "Barricade", target = "fixtures_windows_metal_16", x = 8096,  y = 11559,                         z = 2, }, -- window W | livingroom, bld 31,45#6
    },
    loot = {
        { -- E1
            note = "dresser @ bedroom",
            coords = { x = 8089, y = 11560, z = 2 },
            dist = { "ClothingStorageWinter", "GymLaundry" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E2
            note = "sidetable @ bedroom",
            coords = { x = 8088, y = 11556, z = 2 },
            dist = { "CrateLiquor", "DishCabinetVIPLounge" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E3
            note = "wardrobe @ bedroom",
            coords = { x = 8086, y = 11556, z = 2 },
            dist = { "ArmyStorageOutfit", "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateBootsArmy" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E4
            note = "wardrobe @ bedroom",
            coords = { x = 8086, y = 11557, z = 2 },
            dist = { "ArmyStorageOutfit", "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateBootsArmy" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E5
            note = "shelves @ bedroom",
            coords = { x = 8086, y = 11559, z = 2 },
            dist = { "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E6
            note = "wardrobe @ bedroom",
            coords = { x = 8082, y = 11556, z = 2 },
            dist = { "ArmyHangarOutfit", "ArmyStorageOutfit", "ArmySurplusOutfit", "LaundryLoad4", "LaundryLoad5", "LaundryLoad6", "LaundryLoad7", "LaundryLoad8" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E7
            note = "wardrobe @ bedroom",
            coords = { x = 8082, y = 11557, z = 2 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E8
            note = "dresser @ bedroom",
            coords = { x = 8085, y = 11558, z = 2 },
            dist = { "ArtStorePottery", "CrateMasonry" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E9
            note = "shelves @ bedroom",
            coords = { x = 8085, y = 11559, z = 2 },
            slot = "upper",
            dist = { "CrateTailoring", "CrateFabric_Cotton", "CrateFabric_DenimBlack", "CrateLeather", "SewingStoreFabric" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- E10
            note = "sidetable @ bedroom",
            coords = { x = 8082, y = 11560, z = 2 },
            dist = { "LivingRoomShelfClassy" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E11
            note = "shelves @ livingroom",
            coords = { x = 8089, y = 11554, z = 2 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E12
            note = "shelves @ livingroom",
            coords = { x = 8090, y = 11554, z = 2 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E13
            note = "wardrobe @ livingroom",
            coords = { x = 8083, y = 11552, z = 2 },
            special = "essentials",
        },
        { -- E14
            note = "wardrobe @ livingroom",
            coords = { x = 8084, y = 11552, z = 2 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E15
            note = "dresser @ livingroom",
            coords = { x = 8082, y = 11555, z = 2 },
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E16
            note = "counter @ bathroom",
            coords = { x = 8085, y = 11552, z = 2 },
            dist = { "BathroomCounter", "MedicalStorageDrugs" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E17
            note = "medicine @ bathroom",
            coords = { x = 8085, y = 11552, z = 2 },
            slot = "upper",
            dist = { "BathroomCounter", "GasStoreToiletries" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E18
            note = "cardboardbox @ closet",
            coords = { x = 8088, y = 11552, z = 2 },
            dist = { "GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E19
            note = "cardboardbox @ closet",
            coords = { x = 8088, y = 11552, z = 2 },
            slot = "upper",
            dist = { "GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E20
            note = "metal_shelves @ closet",
            coords = { x = 8089, y = 11552, z = 2 },
            slot = "upper",
            sandboxEnable = 'SeedLibrary',
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = { 8, 10 } },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E21
            note = "counter @ kitchen",
            coords = { x = 8090, y = 11552, z = 2 },
            dist = { "ButcherSpices", "GigamartSpices", "GigamartDryGoods", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E22
            note = "shelves @ kitchen",
            coords = { x = 8091, y = 11552, z = 2 },
            slot = "upper",
            dist = { "CrateLiquor", "DishCabinetVIPLounge" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E23
            note = "counter @ kitchen",
            coords = { x = 8091, y = 11552, z = 2 },
            dist = { "GigamartBakingMisc", "CrateFlour", "CrateOilVegetable" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E24
            note = "counter @ kitchen",
            coords = { x = 8092, y = 11552, z = 2 },
            dist = { "KitchenDryFood", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E25
            note = "counter @ kitchen",
            coords = { x = 8094, y = 11552, z = 2 },
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E26
            note = "fridge @ kitchen",
            coords = { x = 8090, y = 11553, z = 2 },
            dist = { "BakeryKitchenFridge", "BurgerKitchenFridge", "CafeteriaKitchenFridge" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E27
            note = "freezer @ kitchen",
            coords = { x = 8090, y = 11553, z = 2 },
            slot = "freezer",
            dist = { "SushiKitchenFreezer", "WesternKitchenFreezer", "BakeryKitchenFreezer" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E28
            note = "sidetable @ livingroom",
            coords = { x = 8090, y = 11560, z = 2 },
            dist = { "CrateLiquor", "DishCabinetVIPLounge", "MusicStoreCDs", "CrateVHSTapes", "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E29
            note = "sidetable @ livingroom",
            coords = { x = 8093, y = 11559, z = 2 },
            dist = { "CrateVHSTapes" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E30
            note = "cardboardbox @ livingroom",
            coords = { x = 8080, y = 11552, z = 1 },
            dist = { "GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E31
            note = "cardboardbox @ livingroom",
            coords = { x = 8081, y = 11552, z = 1 },
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
                { name = 'Base.Fertilizer',    chance = 1, count = { 8, 10 } },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E32
            note = "cardboardbox @ livingroom",
            coords = { x = 8081, y = 11552, z = 1 },
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
                { name = 'Base.Fertilizer',    chance = 1, count = { 8, 10 } },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
            slot = "upper",
        },
        { -- E33
            note = "smallbox @ livingroom",
            coords = { x = 8081, y = 11553, z = 1 },
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E34
            note = "shelves @ hall",
            coords = { x = 8078, y = 11557, z = -1 },
            dist = { "CrateVHSTapes", "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction", "MusicStoreCDs" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E35
            note = "smallbox @ hall",
            coords = { x = 8079, y = 11558, z = -1 },
            items = {
                { name = 'Base.Firewood', chance = 1, count = { 10, 10 } },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E36
            note = "metal_shelves @ storage",
            coords = { x = 8081, y = 11552, z = -1 },
            slot = "upper",
            dist = { "BurglarTools", "CarpenterTools", "BarnTools", "SafehouseArmor", "SafehouseLighting" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E37
            note = "smallbox @ storageunit",
            coords = { x = 8090, y = 11552, z = -1 },
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.Sheet', },
                { name = 'Base.WoodAxe', },
                { name = 'Base.Machete', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E38
            note = "desk @ storageunit",
            coords = { x = 8089, y = 11549, z = -1 },
            dist = { "MusicStoreCDs" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E39
            note = "shelves @ storageunit",
            coords = { x = 8092, y = 11549, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E40
            note = "cardboardbox @ storageunit",
            coords = { x = 8092, y = 11551, z = -1 },
            dist = { "ArmyStorageElectronics", "RandomFiller" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E41
            note = "metal_shelves @ storageunit",
            coords = { x = 8087, y = 11549, z = -1 },
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E42
            note = "cardboardbox @ storageunit",
            coords = { x = 8087, y = 11550, z = -1 },
            dist = { "HuntingLockers", "RangerTools", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E43
            note = "cardboardbox @ storageunit",
            coords = { x = 8087, y = 11550, z = -1 },
            slot = "upper",
            dist = { "CrateFishing", "FishermanTools" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E44
            note = "cardboardbox @ storageunit",
            coords = { x = 8087, y = 11551, z = -1 },
            dist = { "CrateLumber", "CrateSheetMetal", "ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal", "ToolFactoryIngots" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E45
            note = "locker @ storageunit",
            coords = { x = 8090, y = 11560, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E46
            note = "smallbox @ storageunit",
            coords = { x = 8093, y = 11560, z = -1 },
            dist = { "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E47
            note = "cardboardbox @ storageunit",
            coords = { x = 8090, y = 11557, z = -1 },
            dist = { "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E48
            note = "metal_shelves @ storageunit",
            coords = { x = 8086, y = 11560, z = -1 },
            dist = { "BurglarTools", "CarpenterTools", "BarnTools", "SafehouseArmor", "SafehouseLighting" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E49
            note = "metal_shelves @ storageunit",
            coords = { x = 8087, y = 11560, z = -1 },
            dist = { "CrateLumber", "CrateSheetMetal", "CrateMasonry", "ArtStorePottery" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E50
            note = "toolcabinet @ storageunit",
            coords = { x = 8086, y = 11557, z = -1 },
            dist = { "GasStoreEmergency", "StoreCounterTobacco" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E51
            note = "counter @ breakroom",
            coords = { x = 8076, y = 11556, z = 0 },
            dist = { "BreakRoomCounter" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E52
            note = "counter @ breakroom",
            coords = { x = 8076, y = 11557, z = 0 },
            dist = { "GigamartDryGoods", "GigamartBreakfast" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E53
            note = "counter @ breakroom",
            coords = { x = 8076, y = 11558, z = 0 },
            dist = { "StoreKitchenCleaning" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E54
            note = "cardboardbox @ zippeestorage",
            coords = { x = 8073, y = 11552, z = 0 },
            dist = { "CrateBlacksmithing", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E55
            note = "cardboardbox @ zippeestorage",
            coords = { x = 8073, y = 11552, z = 0 },
            slot = "upper",
            dist = { "CrateCarpentry", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E56
            note = "metal_shelves @ zippeestorage",
            coords = { x = 8074, y = 11552, z = 0 },
            dist = { "CrateMechanics", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E57
            note = "metal_shelves @ zippeestorage",
            coords = { x = 8075, y = 11552, z = 0 },
            dist = { "CrateMetalwork" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E58
            note = "metal_shelves @ zippeestorage",
            coords = { x = 8076, y = 11552, z = 0 },
            dist = { "StoreKitchenButcher", "CrateFlour", "CrateOilVegetable", "StoreKitchenSauce", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E59
            note = "metal_shelves @ zippeestorage",
            coords = { x = 8077, y = 11552, z = 0 },
            dist = { "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E60
            note = "cardboardbox @ zippeestorage",
            coords = { x = 8073, y = 11553, z = 0 },
            dist = { "CarvingWorkshopMaterials", "CarvingWorkshopTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E61
            note = "smallbox @ zippeestorage",
            coords = { x = 8077, y = 11553, z = 0 },
            dist = { "CrateLiquor" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E62
            note = "medicine @ bathroom",
            coords = { x = 8079, y = 11552, z = 0 },
            slot = "upper",
            dist = { "BathroomCounter", "MedicalStorageDrugs" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    -- @TODO this needs to be remapped and updated for the new location
    -- table.insert(RosewoodZippee.objectSpawns, { enabled = "EnableLadders", x = 8174, y = 11255, z = -1, removeWall = "north" })
    -- table.insert(RosewoodZippee.objectSpawns, { enabled = "EnableLadders", x = 8174, y = 11215, z = 0, removeFloor = true, })
    -- table.insert(RosewoodZippee.objectSpawns, { enabled = "EnableLadders", sprite = "fencing_01_59", x = 8175, y = 11215, z = 0 })
    -- table.insert(RosewoodZippee.doorKeys.doors, { sprite = "fixtures_doors_fences_01_25", x = 8175, y = 11213, z = 0, })
    -- table.insert(RosewoodZippee.doorKeys.doors, { sprite = "fixtures_doors_01_57", x = 8175, y = 11214, z = 0, })

    -- table.insert(RosewoodZippee.generators[1].fakeGenerators, { x = 8173, y = 11234, z = -1, createTile = false })
end

return RosewoodZippee
