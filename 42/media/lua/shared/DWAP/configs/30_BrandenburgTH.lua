local bunkerTopLeft = {x = 2607, y = 14436, z = -1}
local wtc = {x = 2609, y = 14446, z = -1}
local BrandenburgTH = {
    spawn = { x = 2609, y = 14458, z = 1 },
    waterTanks = {
        { sprite = "industry_02_72", x = wtc.x, y = wtc.y, z = wtc.z, isProp = true, sourceType="generator", source = {x = 2614, y = 14446, z = -1} },
    },
    waterFixtures = {
        { sprite = "fixtures_bathroom_01_6", x = 2609, y = 14444, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_16", x = 2607, y = 14440, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "appliances_laundry_01_7", x = 2612, y = 14465, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_11", x = 2611, y = 14465, z = 0, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_0", x = 2606, y = 14465, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_3", x = 2607, y = 14465, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_33", x = 2606, y = 14463, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
    },
    generators = {
        {
            controls = { sprite = "industry_02_67", x = 2614, y = 14446, z = -1, },
            chunks = {
                {325, 1805},
                {325, 1806},
                {326, 1805},
                {326, 1806},
                {325, 1804},
                {326, 1804},
                {325, 1807},
                {326, 1807},
                {326, 1807},
                {326, 1808},
            },
        },
    },
    doorKeys = {
        name = "Brandenburg Townhome",
        doors = {
            { sprite = "fixtures_doors_01_45", x = 2611, y = 14456, z = 0, },
            { sprite = "fixtures_doors_01_53", x = 2608, y = 14449, z = -1, },
        },
    },
    map = { name = "DWAPStashMap30", },
    objectSpawns = {
        { sprite = "camping_01_64", x = 2607, y = 14451, z = 0, enabled = "EnableWaterSystem", }, -- fountain

        { sprite = "walls_garage_01_35", x = 2608, y = 14456, z = -1, removeWall = "north" },
        { sprite = "industry_trucks_01_4", x = 2608, y = 14455, z = -1, },
        { sprite = "floors_exterior_street_01_16", x = 2608, y = 14455, z = -1, },
        { sprite = "industry_trucks_01_6", x = 2609, y = 14455, z = -1, replaceWall = true, clearExisting = true, },

        { barricade = "woodhalf", enabled = "Barricade", target="walls_commercial_01_41", x = 2608, y = 14456, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_commercial_01_41", x = 2609, y = 14456, z = 0, },
        { barricade = "metal", enabled = "Barricade", target="walls_exterior_house_01_25", x = 2611, y = 14466, z = 0, },
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
            dist = {"ArmyStorageAmmunition", "GunStoreKnives", "PawnShopKnives", "Homesteading", "CrateFarming"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
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
            dist = {"ToolCabinetMechanics","CrateMechanics", "CarSupplyTools",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=2609,y=14448,z=-1},
            items = {
                { name = 'Base.Firewood', chance = 1, count = {30,30} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        {
            type = 'container',
            coords = {x=2610,y=14448,z=-1},
            dist = {"CrateLumber", "CrateSheetMetal", "ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(BrandenburgTH.objectSpawns, { x = 2559, y = 14454, z = 0, removeFloor = true, clearExisting = true, })
else
    table.insert(BrandenburgTH.objectSpawns, { sprite = "industry_trucks_01_4", x = 2607, y = 14453, z = -1, replaceWall = true, })
end
return BrandenburgTH