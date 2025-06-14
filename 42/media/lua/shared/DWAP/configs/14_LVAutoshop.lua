-- @TODO custom basement connecting to apt just to the south. The one I always like to put a rope down from.
local wtc = {x = 13144, y = 3019, z = 0} -- waterTankCoords
local bunkerTopLeft = {x = 13135, y = 3019, z = -1}
local LVAutoshop = {
    spawn = { x = 13139, y = 3025, z = 0 },
    waterTanks = {
        { sprite = "industry_02_73", x = wtc.x, y = wtc.y, z = wtc.z, isProp = true, sourceType="generator", source = {x = 13141, y = 3032, z = 0} },
    },
    waterFixtures = {
        { sprite = "fixtures_bathroom_01_4", x = 13137, y = 3018, z = 0, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_14", x = 13138, y = 3018, z = 0, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },

        { sprite = "fixtures_bathroom_01_6", x = 13137, y = 3027, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_16", x = 13135, y = 3023, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
    },
    doorKeys = {
        name = "Autoshop",
        doors = {
            { sprite = "fixtures_doors_fences_01_64", x = 13151, y = 3034, z = 0, },
            { sprite = "fixtures_doors_fences_01_21", x = 13150, y = 3024, z = 0, },
            { sprite = "fixtures_doors_01_52", x = 13142, y = 3030, z = 0, },
            { sprite = "fixtures_doors_01_53", x = 13136, y = 3027, z = -1, },
            { sprite = "walls_garage_02_52", x = 13146, y = 3018, z = 0, },
        },
    },
    map = { name = "DWAPStashMap14", },
    generators = {
        {
            controls = { sprite = "industry_02_67", x = 13141, y = 3032, z = 0, isProp = true, },
            chunks = {
                {1642, 376},
                {1642, 377},
                {1642, 378},
                {1643, 377},
                {1643, 378},
                {1642, 379},
                {1641, 377},
                {1641, 378},
            },
        },
    },
    objectSpawns = {
        { sprite = "camping_01_16", x = 13144, y = 3036, z = 0, enabled = "EnableWaterSystem", }, -- fountain

        { sprite = "industry_02_72", x = 13143, y = 3019, z = 0, enabled = "EnableWaterSystem", clearExisting = true, }, -- tank left
        { sprite = "industry_02_73", x = 13144, y = 3019, z = 0, enabled = "EnableWaterSystem", clearExisting = true, }, --tank right
        { sprite = "industry_02_74", x = 13143, y = 3018, z = 0, enabled = "EnableWaterSystem", clearExisting = true, }, -- tank back left
        { sprite = "industry_02_75", x = 13144, y = 3018, z = 0, enabled = "EnableWaterSystem", clearExisting = true, }, -- tank back right

        { sprite = "industry_02_64", x = 13138, y = 3032, z = 0, enabled = "EnableGenSystem", clearExisting = true, }, -- generator
        { sprite = "industry_02_68", x = 13138, y = 3031, z = 0, enabled = "EnableGenSystem", clearExisting = false, },
        { sprite = "industry_02_65", x = 13139, y = 3032, z = 0, enabled = "EnableGenSystem", clearExisting = true, },
        { sprite = "industry_02_69", x = 13139, y = 3031, z = 0, enabled = "EnableGenSystem", clearExisting = false, },
        { sprite = "industry_02_66", x = 13140, y = 3032, z = 0, enabled = "EnableGenSystem", clearExisting = true, },
        { sprite = "industry_02_70", x = 13140, y = 3031, z = 0, enabled = "EnableGenSystem", clearExisting = false, },
        { sprite = "industry_02_67", x = 13141, y = 3032, z = 0, enabled = "EnableGenSystem", clearExisting = true, },
        { sprite = "industry_02_71", x = 13141, y = 3031, z = 0, enabled = "EnableGenSystem", clearExisting = false, },

        { x = 13137, y = 3030, z = 0, clearExisting = true, },
        { x = 13137, y = 3029, z = 0, clearExisting = true, },
        { x = 13137, y = 3028, z = 0, clearExisting = true, },
        { sprite = "fixtures_railings_01_36", x = 13138, y = 3030, z = 0, clearExisting = true, },
        { sprite = "fixtures_railings_01_36", x = 13138, y = 3029, z = 0, clearExisting = true, },
        { sprite = "fixtures_railings_01_36", x = 13138, y = 3028, z = 0, clearExisting = true, },
        { x = 13137, y = 3027, z = 0, clearExisting = true, },
        { x = 13138, y = 3027, z = 0, clearExisting = true, },

        { sprite = "constructedobjects_01_45", x = 13138, y = 3030, z = 0, clearExisting = false, isContainer = true, },
        { sprite = "appliances_cooking_01_16", x = 13143, y = 3021, z = 0, isFireplace = true, },
        { sprite = "constructedobjects_01_45", x = 13142, y = 3014, z = 0, clearExisting = false, isContainer = true, },
        { sprite = "location_military_generic_01_0", x = 13139, y = 3024, z = 0, enabled = "Loot", clearExisting = false, isContainer = true, },
        { sprite = "location_military_generic_01_0", x = 13139, y = 3024, z = 0, renderYOffset = 32, enabled = "Loot", clearExisting = false, isContainer = true, },
        { sprite = "location_military_generic_01_0", x = 13140, y = 3024, z = 0, enabled = "Loot", clearExisting = false, isContainer = true, },
        { sprite = "location_military_generic_01_0", x = 13140, y = 3024, z = 0, renderYOffset = 32, enabled = "Loot", clearExisting = false, isContainer = true, },

        -- shelf replacements
        { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+7, z = bunkerTopLeft.z, renderYOffset = 0, enabled = "Loot", clearExisting = true, isContainer = true, },
        { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+7, z = bunkerTopLeft.z, renderYOffset = 32, enabled = "Loot", clearExisting = false, isContainer = true, },
        { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+6, z = bunkerTopLeft.z, renderYOffset = 0, enabled = "Loot", clearExisting = true, isContainer = true, },
        { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+6, z = bunkerTopLeft.z, renderYOffset = 32, enabled = "Loot", clearExisting = false, isContainer = true, },
        { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+5, z = bunkerTopLeft.z, renderYOffset = 0, enabled = "Loot", clearExisting = true, isContainer = true, },
        { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+5, z = bunkerTopLeft.z, renderYOffset = 32, enabled = "Loot", clearExisting = false, isContainer = true, },
        { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y, z = bunkerTopLeft.z, renderYOffset = 0, enabled = "Loot", clearExisting = true, isContainer = true, },
        { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y, z = bunkerTopLeft.z, renderYOffset = 32, enabled = "Loot", clearExisting = false, isContainer = true, },
        { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+1, z = bunkerTopLeft.z, renderYOffset = 0, enabled = "Loot", clearExisting = true, isContainer = true, },
        { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+1, z = bunkerTopLeft.z, renderYOffset = 32, enabled = "Loot", clearExisting = false, isContainer = true, },

        { sprite = "furniture_tables_high_01_16", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+2, z = bunkerTopLeft.z, clearExisting = true },
        { sprite = "appliances_com_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+2, z = bunkerTopLeft.z,  IsoType = "IsoRadio" }, -- renderYOffset = 34,

        { barricade = "wood", enabled = "Barricade", target="walls_commercial_01_41", x = 13138, y = 3012, z = 0, },
        { barricade = "wood", enabled = "Barricade", target="walls_commercial_01_41", x = 13139, y = 3012, z = 0, },
        { barricade = "wood", enabled = "Barricade", target="walls_commercial_01_41", x = 13140, y = 3012, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_commercial_01_41", x = 13141, y = 3012, z = 0, },
        { barricade = "wood", enabled = "Barricade", target="fixtures_doors_02_40", x = 13143, y = 3012, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_doors_02_44", x = 13143, y = 3013, z = 0, },
        { barricade = "wood", enabled = "Barricade", target="walls_commercial_01_40", x = 13143, y = 3014, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_commercial_01_40", x = 13143, y = 3015, z = 0, },
        { barricade = "wood", enabled = "Barricade", target="walls_commercial_01_40", x = 13143, y = 3016, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="industry_trucks_01_56", x = 13143, y = 3029, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_interior_house_02_56", x = 13137, y = 3019, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_interior_house_02_56", x = 13137, y = 3022, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_interior_house_02_56", x = 13137, y = 3025, z = 0, },
    },
    loot = {
        { -- cabinet next to bunk beds (9365)
            type = 'container',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+2,z=bunkerTopLeft.z},
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- upper
            type = 'container',
            sprite = 'location_trailer_02_23',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+3,z=bunkerTopLeft.z+0.5},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- lower (66)
            type = 'container',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+3,z=bunkerTopLeft.z},
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- upper
            type = 'container',
            sprite = 'location_trailer_02_23',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+4,z=bunkerTopLeft.z+0.5},
            dist = {"ButcherSpices","GigamartSpices","GroceryBagGourmet","CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- lower (67)
            type = 'container',
            sprite = 'location_trailer_02_19',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+4,z=bunkerTopLeft.z},
            dist = {"TestingLab","MedicalCabinet","ArmyStorageMedical", "ArmyBunkerMedical"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- upper
            type = 'container',
            sprite = 'location_trailer_02_23',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+5,z=bunkerTopLeft.z+0.5},
            dist = {"CrateFishing", "FishermanTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- lower (68)
            type = 'container',
            sprite = 'location_trailer_02_19',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+5,z=bunkerTopLeft.z},
            dist = {"SewingStoreTools"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- metal shelves (70)
            type = 'container',
            sprite = 'location_trailer_02_23',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+7,z=bunkerTopLeft.z},
            dist = {"GardenStoreTools", "Homesteading", "CrateLinens", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- metal shelves (71)
            type = 'container',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+8,z=bunkerTopLeft.z},
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- next to inner door (9372)
            type = 'container',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+9,z=bunkerTopLeft.z},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- (73)
            type = 'container',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+10,z=bunkerTopLeft.z},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- (9374)
            type = 'container',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+11,z=bunkerTopLeft.z},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- far end next to stairs (9375)
            type = 'container',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+12,z=bunkerTopLeft.z},
            sandboxEnable = 'Loot',
            special = "essentials",
        },
        { -- metal wall shelves
            type = 'container',
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y+5,z=bunkerTopLeft.z},
            dist = {"CrateLiquor", "DishCabinetVIPLounge", "MusicStoreCDs", "CrateVHSTapes", "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- metal wall shelves
            type = 'container',
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y+6,z=bunkerTopLeft.z},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- metal wall shelves
            type = 'container',
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y+7,z=bunkerTopLeft.z},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },

        -- extra spawns
        {
            type = 'container',
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y,z=bunkerTopLeft.z},
            dist = {"GasStoreEmergency","StoreCounterTobacco", "BurglarTools", "CarpenterTools", "BarnTools","SafehouseArmor", "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y+1,z=bunkerTopLeft.z},
            dist = {"SafehouseTraps","GunStoreKnives","CampingStoreBackpacks","CrateLiquor", "CarSupplyTools","DrugLabOutfit"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },

        -- auto shop
        {
            type = 'container',
            coords = {x=13150,y=3018,z=0.5},
            dist = {"CarSupplyTools", "GasStorageMechanics",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=13143,y=3024,z=0},
            dist = {"CampingStoreTools", "ArmyHangarTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=13143,y=3025,z=0},
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=13143,y=3026,z=0},
            dist = {"ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        -- offices
        {
            type = 'container',
            coords = {x=13141,y=3026,z=0},
            dist = {"BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        {
            type = 'container',
            coords = {x=13142,y=3026,z=0},
            dist = {"CrateToiletPaper"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = 1,
        },
        {
            type = 'container',
            coords = {x=13137,y=3026,z=0},
            items = {
                { name = 'TvWideScreen', chance = 1, count = {1,1} },
                { name = 'Base.Remote', chance = 1, count = {1,3} },
                { name = 'Base.VideoGame', chance = 1, count = {3,3} },
                { name = 'Base.Headphones', chance = 1, count = {3,3} },
                { name = 'Base.CDplayer', chance = 1, count = {3,3} },
                { name = 'Base.Bullhorn', chance = 0.5, count = {1,1} },
                { name = 'Base.Mov_Cot', chance = 1, count = {1,2} },
            },
        },
        {
            type = 'container',
            coords = {x=13139,y=3020,z=0},
            dist = {"CrateVHSTapes"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        {
            type = 'container',
            coords = {x=13140,y=3020,z=0},
            dist = {"MusicStoreCDs"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        -- lobby
        {
            type = 'container',
            coords = {x=13138,y=3016,z=0},
            dist = {"CrateLiquor", "DishCabinetVIPLounge"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=13138,y=3015,z=0},
            dist = {"CrateCannedFood", "ArmySurplusTools", "BedroomDresser" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=13138,y=3014,z=0},
            dist = {"CandyStoreSnacks","CrateTortillaChips"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=13138,y=3013,z=0},
            dist = {"CrateFlour", "CrateOilVegetable"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x = 13142, y = 3014, z = 0},
            dist = {"ToolFactoryHandles", "ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        -- back storage room
        {
            type = 'container',
            coords = {x=13140,y=3030,z=0},
            dist = {"GasStoreEmergency","StoreCounterTobacco"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=13139,y=3030,z=0},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=13139,y=3027,z=0},
            dist = {"WeldingWorkshopMetal", "MetalShopTools", "MetalWorkerTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=13140,y=3027,z=0},
            dist = {"CampingStoreTools", "ArmyHangarTools", "CarSupplyTools", "BurglarTools", "CarpenterTools", "BarnTools", "CrateTools", "GarageTools","GigamartTools", "JanitorTools", "LoggingFactoryTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=13141,y=3027,z=0},
            dist = {"ArmyStorageElectronics", "RandomFiller" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=13142,y=3027,z=0},
            dist = {"CrateBlacksmithing", "CrateMechanics", "CrateMetalwork" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x = 13138, y = 3030, z = 0},
            dist = {"CrateLumber", "CrateSheetMetal"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x = 13139, y = 3024, z = 0},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x = 13140, y = 3024, z = 0},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    -- table.insert(EkronCC.objectSpawns, { sprite = "walls_garage_01_46", x = 13610, y = 1269, z = -4, removeWall = "west" })
    table.insert(LVAutoshop.objectSpawns, { sprite = "industry_trucks_01_15", x = 13136, y = 3032, z = -1, removeWall = "north", })
    table.insert(LVAutoshop.objectSpawns, { --[[sprite = "walls_garage_01_47",]] x = 13136, y = 3033, z = -1, removeWall = "north", })
    table.insert(LVAutoshop.objectSpawns, { sprite = "fixtures_doors_01_53", x = 13136, y = 3032, z = -1, isDoor = true, doorN = true, })
    table.insert(LVAutoshop.objectSpawns, { sprite = "floors_exterior_street_01_16", x = 13136, y = 3032, z = -1, isFloor = true, })
    table.insert(LVAutoshop.objectSpawns, { sprite = "industry_trucks_01_4", x = 13136, y = 3032, z = -1, })
    table.insert(LVAutoshop.objectSpawns, { sprite = "industry_02_194", x = 13136, y = 3032, z = -1, })
    table.insert(LVAutoshop.objectSpawns, { sprite = "industry_trucks_01_4", x = 13137, y = 3032, z = -1, })

    table.insert(LVAutoshop.objectSpawns, { sprite = "walls_interior_house_02_48", x = 13143, y = 3051, z = 0, removeFloor = true, clearExisting = true, })
end

return LVAutoshop