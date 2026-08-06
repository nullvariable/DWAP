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
        { sprite = "dwap_tiles_01_8", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = { x = 10149, y = 6620, z = -1 } },
    },
    waterFixtures = {
        { sprite = "appliances_laundry_01_3", x = 10157, y = 6622, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_6",     x = 10157, y = 6620, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_29",    x = 10155, y = 6626, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_2",  x = 10155, y = 6627, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_11",    x = 10162, y = 6631, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

        -- 2nd floor
        { sprite = "fixtures_bathroom_01_0",  x = 10152, y = 6625, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_2",     x = 10153, y = 6625, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_2",     x = 10154, y = 6625, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_26", x = 10152, y = 6627, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_13",    x = 10160, y = 6628, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_2",  x = 10163, y = 6629, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_55", x = 10163, y = 6630, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

        -- basement fixtures
        { sprite = "fixtures_sinks_01_35",    x = 10156, y = 6621, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_33", x = 10146, y = 6631, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_16",    x = 10146, y = 6635, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_6",  x = 10148, y = 6631, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
    },
    doorKeys = {
        name = "W West Point Safe House",
        doors = {
            { sprite = "fixtures_doors_02_5",         x = 10157, y = 6633, z = 0, },
            { sprite = "fixtures_doors_02_5",         x = 10157, y = 6632, z = 0, },
            { sprite = "fixtures_doors_fences_01_21", x = 10156, y = 6608, z = 0, },
        },
    },
    map = { name = "DWAPStashMap8", },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 10087, y = 7348, z = pb1.z },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 10085, y = 7348, z = -1, },
            solar = {
                powerbank = { sprite = "dwap_tiles_01_0", x = pb1.x, y = pb1.y, z = pb1.z },
                panels = {
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_9",
                        x = 10143,
                        y = 6626,
                        z = 0,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_9",
                        x = 10143,
                        y = 6627,
                        z = 0,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_9",
                        x = 10143,
                        y = 6628,
                        z = 0,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_9",
                        x = 10143,
                        y = 6629,
                        z = 0,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_9",
                        x = 10145,
                        y = 6626,
                        z = 0,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_9",
                        x = 10145,
                        y = 6627,
                        z = 0,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_9",
                        x = 10145,
                        y = 6628,
                        z = 0,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_9",
                        x = 10145,
                        y = 6629,
                        z = 0,
                        pb = 1,
                        spawn = false,
                    },
                },
            },
            fakeGenerators = {
                { x = 10087, y = 7366, z = -1, createTile = false },
            },
        },
    },
    objectSpawns = {
        { sprite = "industry_02_175", x = pb1.x,             y = pb1.y,                           z = pb1.z, disabled = "EnableGenSystemSolar", clearExisting = true, },

        { barricade = "woodhalf",     enabled = "Barricade", target = "fixtures_doors_02_5",      x = 10157, y = 6633,                          z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_exterior_house_02_9", x = 10160, y = 6632,                         z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_exterior_house_02_9", x = 10162, y = 6632,                         z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_interior_house_04_25", x = 10161, y = 6620,                        z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_interior_house_04_73", x = 10153, y = 6620,                        z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_interior_house_04_72", x = 10149, y = 6623,                        z = 0, },
    },
    loot = {
        { -- cabinet next to bunk beds
            type = 'container',
            coords = { x = 10084, y = 7365, z = -1 },
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- upper
            type = 'container',
            sprite = 'location_trailer_02_23',
            coords = { x = 10084, y = 7364, z = -1 },
            slot = "upper",
            dist = { "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- lower (66)
            type = 'container',
            coords = { x = 10084, y = 7364, z = -1 },
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- upper
            type = 'container',
            sprite = 'location_trailer_02_23',
            coords = { x = 10084, y = 7363, z = -1 },
            slot = "upper",
            dist = { "ButcherSpices", "GigamartSpices", "GroceryBagGourmet", "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- lower (67)
            type = 'container',
            sprite = 'location_trailer_02_19',
            coords = { x = 10084, y = 7363, z = -1 },
            dist = { "TestingLab", "MedicalCabinet", "ArmyStorageMedical", "ArmyBunkerMedical", "JanitorCleaning" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- upper
            type = 'container',
            sprite = 'location_trailer_02_23',
            coords = { x = 10084, y = 7362, z = -1 },
            slot = "upper",
            dist = { "CrateFishing", "FishermanTools" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- lower (68)
            type = 'container',
            sprite = 'location_trailer_02_19',
            coords = { x = 10084, y = 7362, z = -1 },
            dist = { "CafeKitchenSupplies", "CafeKitchenTea", "CrateSodaBottles" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { --crates by shower
            type = 'container',
            coords = { x = 10084, y = 7361, z = -1 },
            dist = { "GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { --crates by shower
            type = 'container',
            coords = { x = 10084, y = 7360, z = -1 },
            dist = { "GasStoreEmergency", "StoreCounterTobacco", "BurglarTools", "CarpenterTools", "BarnTools", "SafehouseArmor", "SafehouseLighting" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = { x = 10086, y = 7360, z = -1 },
            dist = { "SafehouseTraps", "GunStoreKnives", "CampingStoreBackpacks", "CrateLiquor", "GasStorageMechanics", "DrugLabOutfit" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = { x = 10086, y = 7361, z = -1 },
            dist = { "CrateLiquor", "DishCabinetVIPLounge", "MusicStoreCDs", "CrateVHSTapes", "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        {
            type = 'container',
            coords = { x = 10086, y = 7362, z = -1 },
            dist = { "GardenStoreTools", "Homesteading", "CrateLinens", "CrateFarming" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- mil locker
            type = 'container',
            coords = { x = 10086, y = 7366, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- mil locker
            type = 'container',
            coords = { x = 10086, y = 7367, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        -- "bunker" entryway
        {
            type = 'container',
            coords = { x = 10086, y = 7355, z = -1 },
            special = "essentials",
        },
        {
            type = 'container',
            coords = { x = 10086, y = 7356, z = -1 },
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        {
            type = 'container',
            coords = { x = 10086, y = 7357, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        {
            type = 'container',
            coords = { x = 10086, y = 7358, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        {
            type = 'container',
            coords = { x = 10084, y = 7357, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        {
            type = 'container',
            coords = { x = 10084, y = 7358, z = -1 },
            dist = { "SewingStoreTools", "CrateLeather", "SewingStoreFabric" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },

        -- main basement
        {
            type = 'container',
            coords = { x = 10096, y = 7350, z = -1 },
            dist = { "FreezerRich", },
            distIncludeJunk = true,
            randUntilFull = true,
            frozen = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = { x = 10094, y = 7350, z = -1 },
            dist = { "FridgeFarmStorage", "FridgeGeneric", "SushiKitchenFridge" },
            distIncludeJunk = true,
            randUntilFull = true,
            frozen = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = { x = 10094, y = 7351, z = -1 },
            dist = { "FreezerIceCream", },
            distIncludeJunk = true,
            randUntilFull = true,
            frozen = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = { x = 10094, y = 7352, z = -1 },
            dist = { "SpiffosKitchenFridge", "SpiffosKitchenFreezer" },
            distIncludeJunk = true,
            randUntilFull = true,
            frozen = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = { x = 10088, y = 7354, z = -1 },
            dist = { "ArtStorePottery", "CrateMasonry" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = { x = 10089, y = 7354, z = -1 },
            dist = { "GigamartCrisps", "ArmyStorageElectronics", "RandomFiller" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = { x = 10090, y = 7354, z = -1 },
            dist = { "CampingStoreTools", "ArmyHangarTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = { x = 10091, y = 7354, z = -1 },
            dist = { "BurglarTools", "CarpenterTools", "BarnTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = { x = 10094, y = 7347, z = -1 },
            dist = { "CrateTools", "GarageTools", "BarnTools", "WeldingWorkshopTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = { x = 10095, y = 7347, z = -1 },
            dist = { "GigamartTools", "JanitorTools", "WeldingWorkshopTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = { x = 10097, y = 7350, z = -1 },
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        -- house and shed
        { type = 'container', coords = { x = 8090, y = 11554, z = 2 }, }, -- shelves @ livingroom
        { type = 'container', coords = { x = 8093, y = 11559, z = 2 }, }, -- sidetable @ livingroom
        { type = 'container', coords = { x = 8090, y = 11560, z = 2 }, }, -- sidetable @ livingroom
        { type = 'container', coords = { x = 8090, y = 11552, z = 2 }, }, -- counter @ kitchen
        { type = 'container', coords = { x = 8091, y = 11552, z = 2 }, }, -- shelves @ kitchen
        { type = 'container', coords = { x = 8091, y = 11552, z = 2 }, }, -- counter @ kitchen
        { type = 'container', coords = { x = 8092, y = 11552, z = 2 }, }, -- counter @ kitchen
        { type = 'container', coords = { x = 8094, y = 11552, z = 2 }, }, -- counter @ kitchen
        { type = 'container', coords = { x = 8090, y = 11553, z = 2 }, }, -- fridge @ kitchen
        { type = 'container', coords = { x = 8090, y = 11553, z = 2 }, }, -- freezer @ kitchen
        { type = 'container', coords = { x = 8083, y = 11552, z = 2 }, }, -- wardrobe @ livingroom
        { type = 'container', coords = { x = 8084, y = 11552, z = 2 }, }, -- wardrobe @ livingroom
        { type = 'container', coords = { x = 8082, y = 11555, z = 2 }, }, -- dresser @ livingroom
        { type = 'container', coords = { x = 8089, y = 11554, z = 2 }, }, -- shelves @ livingroom
        { type = 'container', coords = { x = 8088, y = 11552, z = 2 }, }, -- cardboardbox @ closet
        { type = 'container', coords = { x = 8088, y = 11552, z = 2 }, slot = "upper", }, -- cardboardbox @ closet
        { type = 'container', coords = { x = 8089, y = 11552, z = 2 }, }, -- metal_shelves @ closet
        { type = 'container', coords = { x = 8085, y = 11552, z = 2 }, }, -- counter @ bathroom
        { type = 'container', coords = { x = 8085, y = 11552, z = 2 }, }, -- medicine @ bathroom
        { type = 'container', coords = { x = 8086, y = 11556, z = 2 }, }, -- wardrobe @ bedroom
        { type = 'container', coords = { x = 8086, y = 11557, z = 2 }, }, -- wardrobe @ bedroom
        { type = 'container', coords = { x = 8086, y = 11559, z = 2 }, }, -- shelves @ bedroom
        { type = 'container', coords = { x = 8088, y = 11556, z = 2 }, }, -- sidetable @ bedroom
        { type = 'container', coords = { x = 8089, y = 11560, z = 2 }, }, -- dresser @ bedroom
        { type = 'container', coords = { x = 8082, y = 11556, z = 2 }, }, -- wardrobe @ bedroom
        { type = 'container', coords = { x = 8082, y = 11557, z = 2 }, }, -- wardrobe @ bedroom
        { type = 'container', coords = { x = 8080, y = 11552, z = 1 }, }, -- cardboardbox @ livingroom
        { type = 'container', coords = { x = 8081, y = 11552, z = 1 }, }, -- cardboardbox @ livingroom
        { type = 'container', coords = { x = 8081, y = 11552, z = 1 }, slot = "upper", }, -- cardboardbox @ livingroom
        { type = 'container', coords = { x = 8081, y = 11553, z = 1 }, }, -- smallbox @ livingroom
        { type = 'container', coords = { x = 8078, y = 11557, z = -1 }, }, -- shelves @ hall
        { type = 'container', coords = { x = 8079, y = 11558, z = -1 }, }, -- smallbox @ hall
        { type = 'container', coords = { x = 8081, y = 11552, z = -1 }, }, -- metal_shelves @ storage
        { type = 'container', coords = { x = 8090, y = 11552, z = -1 }, }, -- smallbox @ storageunit
        { type = 'container', coords = { x = 8087, y = 11549, z = -1 }, }, -- metal_shelves @ storageunit
        { type = 'container', coords = { x = 8087, y = 11550, z = -1 }, }, -- cardboardbox @ storageunit
        { type = 'container', coords = { x = 8087, y = 11550, z = -1 }, slot = "upper", }, -- cardboardbox @ storageunit
        { type = 'container', coords = { x = 8087, y = 11551, z = -1 }, }, -- cardboardbox @ storageunit
        { type = 'container', coords = { x = 8089, y = 11549, z = -1 }, }, -- desk @ storageunit
        { type = 'container', coords = { x = 8092, y = 11549, z = -1 }, }, -- shelves @ storageunit
        { type = 'container', coords = { x = 8092, y = 11551, z = -1 }, }, -- cardboardbox @ storageunit
        { type = 'container', coords = { x = 8090, y = 11557, z = -1 }, }, -- cardboardbox @ storageunit
        { type = 'container', coords = { x = 8090, y = 11560, z = -1 }, }, -- locker @ storageunit
        { type = 'container', coords = { x = 8093, y = 11560, z = -1 }, }, -- smallbox @ storageunit
        { type = 'container', coords = { x = 8086, y = 11557, z = -1 }, }, -- toolcabinet @ storageunit
        { type = 'container', coords = { x = 8086, y = 11560, z = -1 }, }, -- metal_shelves @ storageunit
        { type = 'container', coords = { x = 8087, y = 11560, z = -1 }, }, -- metal_shelves @ storageunit
        { type = 'container', coords = { x = 10080, y = 7372, z = 0 }, }, -- counter @ kitchen
        { type = 'container', coords = { x = 10077, y = 7372, z = 0 }, }, -- counter @ kitchen
        { type = 'container', coords = { x = 10078, y = 7372, z = 0 }, }, -- fridge @ kitchen
        { type = 'container', coords = { x = 10078, y = 7372, z = 0 }, }, -- freezer @ kitchen
        { type = 'container', coords = { x = 10079, y = 7372, z = 0 }, }, -- counter @ kitchen
        { type = 'container', coords = { x = 10077, y = 7373, z = 0 }, }, -- counter @ kitchen
        { type = 'container', coords = { x = 10077, y = 7374, z = 0 }, }, -- counter @ kitchen
        { type = 'container', coords = { x = 10079, y = 7374, z = 0 }, }, -- counter @ kitchen
        { type = 'container', coords = { x = 10077, y = 7369, z = 0 }, }, -- dresser @ bedroom
        { type = 'container', coords = { x = 10080, y = 7370, z = 0 }, }, -- wardrobe @ livingroom
        { type = 'container', coords = { x = 10081, y = 7370, z = 0 }, }, -- wardrobe @ livingroom
        { type = 'container', coords = { x = 10081, y = 7374, z = 0 }, }, -- sidetable @ livingroom
        { type = 'container', coords = { x = 10083, y = 7367, z = 0 }, }, -- shelves @ livingroom
        { type = 'container', coords = { x = 10085, y = 7367, z = 0 }, }, -- sidetable @ livingroom
        { type = 'container', coords = { x = 10080, y = 7368, z = 0 }, }, -- dresser @ kidsbedroom
        { type = 'container', coords = { x = 10093, y = 7352, z = 0 }, }, -- cardboardbox @ garagestorage
        { type = 'container', coords = { x = 10090, y = 7350, z = 0 }, }, -- metal_shelves @ garagestorage
        { type = 'container', coords = { x = 10091, y = 7350, z = 0 }, }, -- metal_shelves @ garagestorage
        { type = 'container', coords = { x = 10092, y = 7350, z = 0 }, }, -- cardboardbox @ garagestorage
        { type = 'container', coords = { x = 10093, y = 7350, z = 0 }, }, -- locker @ garagestorage
        { type = 'container', coords = { x = 10094, y = 7350, z = 0 }, }, -- metal_shelves @ garagestorage
        { type = 'container', coords = { x = 10091, y = 7351, z = 0 }, }, -- cardboardbox @ garagestorage
        { type = 'container', coords = { x = 10092, y = 7351, z = 0 }, }, -- cardboardbox @ garagestorage


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
