local wtc1 = {x = 2938, y = 12520, z = 2,}
local wtc2 = {x = 2937, y = 12562, z = 2,}
local ScrapYard = {
    spawn = { x = 2937, y = 12523, z = 1 },
    generators = {
        {
            controls = { sprite = "industry_02_67", x = 2964, y = 12560, z = 0, },
            chunks = {
                {370, 1570}, -- generator
                {366, 1564},
                {366, 1565},
                {367, 1564},
                {367, 1565},
                {368, 1564},
                {368, 1565},
                {368, 1566},
                {368, 1567},
                {368, 1568},
                {368, 1569},
                {366, 1570},
                {366, 1571},
                {367, 1570},
                {367, 1571},
                {368, 1570},
                {368, 1571},
                {366, 1561}, --garage
                {366, 1562}, --garage
                {367, 1562}, --shop/shed
                {367, 1561}, --shop/sheda
            },
        },
    },
    waterTanks = {
        { sprite = "crafted_01_11", x = wtc1.x, y = wtc1.y, z = wtc1.z, isProp = true, sourceType="generator", source = {x = 2964, y = 12560, z = 0} },
        { sprite = "crafted_01_11", x = wtc2.x, y = wtc2.y, z = wtc2.z, isProp = true, sourceType="generator", source = {x = 2964, y = 12560, z = 0} },
    },
    waterFixtures = {
        -- house 1
        { sprite = "fixtures_sinks_01_9", x = 2936, y = 12517, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "appliances_laundry_01_7", x = 2942, y = 12524, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_9", x = 2943, y = 12525, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_0", x = 2944, y = 12523, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        -- 2nd floor
        { sprite = "fixtures_bathroom_01_1", x = 2933, y = 12517, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_25", x = 2935, y = 12517, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_1", x = 2933, y = 12519, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_33", x = 2941, y = 12522, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_3", x = 2942, y = 12523, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_2", x = 2942, y = 12525, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        -- house 2
        { sprite = "fixtures_sinks_01_9", x = 2936, y = 12559, z = 0, sourceType="tank", source = {x = wtc2.x, y = wtc2.y, z = wtc2.z} },
        { sprite = "fixtures_bathroom_01_32", x = 2938, y = 12559, z = 0, sourceType="tank", source = {x = wtc2.x, y = wtc2.y, z = wtc2.z} },
        { sprite = "fixtures_sinks_01_2", x = 2939, y = 12559, z = 0, sourceType="tank", source = {x = wtc2.x, y = wtc2.y, z = wtc2.z} },
        { sprite = "fixtures_bathroom_01_2", x = 2939, y = 12560, z = 0, sourceType="tank", source = {x = wtc2.x, y = wtc2.y, z = wtc2.z} },
        -- basement
        { sprite = "fixtures_sinks_01_17", x = 2944, y = 12556, z = -1, sourceType="tank", source = {x = wtc2.x, y = wtc2.y, z = wtc2.z} },
        { sprite = "appliances_laundry_01_1", x = 2947, y = 12563, z = -1, sourceType="tank", source = {x = wtc2.x, y = wtc2.y, z = wtc2.z} },
        { sprite = "fixtures_bathroom_01_5", x = 2947, y = 12561, z = -1, sourceType="tank", source = {x = wtc2.x, y = wtc2.y, z = wtc2.z} },
        { sprite = "fixtures_bathroom_01_32", x = 2948, y = 12560, z = -1, sourceType="tank", source = {x = wtc2.x, y = wtc2.y, z = wtc2.z} },
    },
    doorKeys = {
        name = "ScrapYard Safehouse",
        doors = {
            { sprite = "fixtures_doors_01_44", x = 2933, y = 12563, z = 0, },
            { sprite = "fixtures_doors_02_4", x = 2936, y = 12523, z = 0, },
            { sprite = "fixtures_doors_02_4", x = 2937, y = 12496, z = 0, },
            { sprite = "fixtures_doors_01_29", x = 2940, y = 12561, z = 0, },
            { sprite = "fixtures_doors_01_29", x = 2947, y = 12564, z = -1, },
        },
    },
    map = { name = "DWAPStashMap20", },
    objectSpawns = {
        -- some for loop spawns at bottom of file
        { x = 2939, y = 12518, z = 0, clearExisting = true, }, -- chair blocking new stairs
        { sprite = "crafted_01_11", x = wtc1.x, y = wtc1.y, z = wtc1.z, enabled = "EnableWaterSystem", }, -- invisible "tank" to simulate the well
        { sprite = "crafted_01_11", x = wtc2.x, y = wtc2.y, z = wtc2.z, enabled = "EnableWaterSystem", }, -- invisible "tank" to simulate the well

        { sprite = "carpentry_01_16", x = 2947, y = 12522, z = -1, isContainer = true, },


        { sprite = "fixtures_doors_01_29", x = 2946, y = 12527, z = -1, isDoor = true, doorN = true, },
        { sprite = "walls_exterior_wooden_01_39", x = 2946, y = 12527, z = -1, replaceWall = true, },
        { sprite = "walls_logs_96", x = 2946, y = 12527, z = -1, },
        { sprite = "walls_logs_98", x = 2947, y = 12527, z = -1, },

        { barricade = "wood", enabled = "Barricade", target="walls_interior_house_01_24", x = 2933, y = 12518, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_interior_house_01_24", x = 2933, y = 12520, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_doors_02_4", x = 2936, y = 12523, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target="walls_interior_house_02_57", x = 2943, y = 12517, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target="walls_exterior_house_01_60", x = 2945, y = 12520, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target="walls_exterior_house_01_60", x = 2945, y = 12524, z = 0, },
        { barricade = "wood", enabled = "Barricade", target="walls_exterior_house_01_61", x = 2938, y = 12526, z = 0, },

        { barricade = "woodhalf", enabled = "Barricade", target="walls_interior_house_04_45", x = 2936, y = 12559, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_interior_house_02_60", x = 2933, y = 12562, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_exterior_house_01_57", x = 2935, y = 12566, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_exterior_house_01_57", x = 2938, y = 12566, z = 0, },
    },
    loot = {
        {
            type = 'container',
            coords = {x=2947, y=12522,z=-1},
            special = "essentials",
        },
        -- house 1
        {
            type = 'container',
            coords = {x=2940,y=12519,z=1},
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        {
            type = 'container',
            coords = {x=2943,y=12517,z=1},
            items = {
                { name = 'Base.Pencil', chance = 1, count = {2,5} },
                { name = 'Base.Notebook', chance = 1, count = {1,1} },
                { name = 'Base.Notebook', chance = 1, count = {1,1} },
                { name = 'Base.WristWatch_Left_DigitalBlack', chance = 1, count = {1,1} },
                { name = 'Base.WristWatch_Left_ClassicMilitary', chance = 1, count = {1,1} },
            },
        },
        {
            type = 'container',
            coords = {x=2933,y=12519,z=1},
            dist = {"MedicalCabinet"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        {
            type = 'container',
            coords = {x=2937,y=12525,z=1},
            dist = {"LaundryLoad1", "LaundryLoad2", "LaundryLoad3", "LaundryLoad4", "LaundryLoad5", "LaundryLoad6", "LaundryLoad7", "LaundryLoad8"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=2938,y=12525,z=1},
            dist = {"SafehouseArmor", "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=2938,y=12522,z=1},
            dist = {"ArmyStorageOutfit", "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateLinens"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=2942,y=12523,z=1},
            dist = {"LaundryCleaning", "JanitorCleaning"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=2942,y=12524,z=1},
            dist = {"MedicalClinicTools", "MedicalStorageDrugs"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        {
            type = 'container',
            coords = {x=2943,y=12524,z=1},
            dist = {"HuntingLockers", "RangerTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        -- 1st floor bookcases
        {
            type = 'container',
            coords = {x=2941,y=12518,z=0},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        {
            type = 'container',
            coords = {x=2936,y=12525,z=0},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        {
            type = 'container',
            coords = {x=2938,y=12518,z=0},
            dist = {"CrateVHSTapes"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        -- laundry
        {
            type = 'container',
            coords = {x=2941,y=12525,z=0.5},
            dist = {"SewingStoreTools"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        -- closet
        {
            type = 'container',
            coords = {x=2940,y=12525,z=0},
            dist = {"MusicStoreCDs"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        -- kitchen
        {
            type = 'container',
            coords = {x=2937,y=12517,z=0},
            dist = {"ArenaKitchenFreezer", "WesternKitchenFreezer", "BakeryKitchenFreezer"},
            distIncludeJunk = false,
            randUntilFull = true,
            frozen = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=2936,y=12517,z=0},
            dist = {"KitchenDryFood",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=2934,y=12517,z=0},
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=2933,y=12517,z=0},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- shed/garage
        {
            type = 'container',
            coords = {x=2940,y=12493,z=0},
            dist = {"CrateBlacksmithing", "CrateCarpentry", "CrateMechanics", "CrateMetalwork" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=2939,y=12493,z=0},
            dist = {"GasStoreEmergency"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=2941,y=12496,z=0},
            sandboxEnable = 'SeedLibrary',
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = {8,10} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        {
            type = 'container',
            coords = {x=2937,y=12494,z=0},
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        {
            type = 'container',
            coords = {x=2937,y=12493,z=0.5},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        {
            type = 'container',
            coords = {x=2936,y=12493,z=0.5},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        {
            type = 'container',
            coords = {x=2930,y=12494,z=0.5},
            dist = {"CrateBlacksmithing", "CrateCarpentry", "CrateMechanics", "CrateMetalwork" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=2929,y=12494,z=0},
            dist = {"WeldingWorkshopMetal"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        -- basement 1
        {
            type = 'container',
            coords = {x=2945,y=12517,z=-1},
            dist = {"CrateFishing", "FishermanTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        {
            type = 'container',
            coords = {x=2944,y=12522,z=-1},
            dist = {"HuntingLockers", "RangerTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        {
            type = 'container',
            coords = {x=2945,y=12522,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=2944,y=12524,z=-1},
            dist = {"PoliceStorageGuns", "PoliceStorageAmmunition","ArmyStorageGuns",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=2945,y=12524,z=-1},
            dist = {"FirearmWeapons_Late"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=2944,y=12526,z=-1},
            dist = {"SafehouseTraps", "ArmyStorageAmmunition"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=2945,y=12526,z=-1},
            dist = { "GunStoreKnives", "PawnShopKnives",  },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=2947,y=12524,z=-1},
            dist = {"CrateLiquor", "DishCabinetVIPLounge"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=2948,y=12524,z=-1},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=2947,y=12526,z=-1},
            dist = {"CrateLiquor", "DishCabinetVIPLounge"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=2948,y=12526,z=-1},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- house 2
        -- exterior crates
        {
            type = 'container',
            coords = {x=2948,y=12568,z=0},
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=2950,y=12568,z=0},
            dist = {"ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=2948,y=12567,z=0},
            dist = {"CrateLumber", "CrateSheetMetal"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=2949,y=12567,z=0},
            dist = {"CrateLumber", "CrateSheetMetal"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=2948,y=12566,z=0},
            dist = {"CrateLumber", "CrateSheetMetal"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        -- living area
        {
            type = 'container',
            coords = {x=2934,y=12565,z=0.5},
            dist = {"BookstoreMilitaryHistory"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        {
            type = 'container',
            coords = {x=2933,y=12564,z=0},
            dist = {"MovieRentalShelves"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        {
            type = 'container',
            coords = {x=2945,y=12561,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        -- kitchen
        {
            type = 'container',
            coords = {x=2934,y=12560,z=0},
            dist = {"ArenaKitchenFreezer", "WesternKitchenFreezer", "BakeryKitchenFreezer"},
            distIncludeJunk = false,
            randUntilFull = true,
            frozen = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=2934,y=12559,z=0},
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=2935,y=12559,z=0},
            dist = {"StoreKitchenBaking",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=2936,y=12559,z=0},
            dist = {"ButcherSpices","GigamartSpices","GroceryBagGourmet",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=2937,y=12559,z=0},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- bathroom
        {
            type = 'container',
            coords = {x=2939,y=12559,z=0},
            dist = {"ArmyStorageMedical", "ArmyBunkerMedical", "JanitorCleaning"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        -- bedroom
        {
            type = 'container',
            coords = {x=2939,y=12564,z=0},
            dist = {"DrugLabGuns"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=2939,y=12565,z=0},
            dist = {"ArmyStorageOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateBootsArmy"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        -- basement 2
        {
            type = 'container',
            coords = {x=2939,y=12566,z=-1},
            dist = {"HuntingLockers", "RangerTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=2938,y=12566,z=-1},
            dist = {"SafehouseTraps", "ArmyStorageAmmunition"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=2937,y=12566,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=2937,y=12567,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=2935,y=12566,z=-1},
            dist = {"GigamartDryGoods", "CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=2935,y=12567,z=-1},
            dist = {"GigamartDryGoods", "GigamartCrisps", "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=2935,y=12569,z=-1},
            dist = {"CrateFlour", "CrateOilVegetable"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=2935,y=12570,z=-1},
            dist = {"CrateFlour", "CrateOilVegetable", "SeafoodKitchenSauce"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=2937,y=12569,z=-1},
            dist = {"CampingStoreTools", "ArmyHangarTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=2937,y=12570,z=-1},
            dist = {"CampingStoreBackpacks"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        -- lockers
        {
            type = 'container',
            coords = {x=2939,y=12570,z=-1},
            dist = {"BurglarTools", "CarpenterTools", "BarnTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=2940,y=12570,z=-1},
            dist = {"BurglarTools", "CarpenterTools", "BarnTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        -- crate room
        {
            type = 'container',
            coords = {x=2943,y=12571,z=-1},
            dist = {"ToolFactoryBarStock", "CrateLumber", "CrateSheetMetal", "WeldingWorkshopMetal", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=2943,y=12572,z=-1},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        {
            type = 'container',
            coords = {x=2943,y=12573,z=-1},
            dist = {"CampingStoreTools", "ArmyHangarTools", "CarSupplyTools","GasStorageMechanics", "BurglarTools", "CarpenterTools", "BarnTools", "CrateTools", "GarageTools","GigamartTools", "JanitorTools", "LoggingFactoryTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=2943,y=12574,z=-1},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        {
            type = 'container',
            coords = {x=2939,y=12571,z=-1},
            dist = {"GigamartDryGoods","StoreShelfDrinks", "FridgeSoda", "CrateSodaBottles", "ArtStorePottery", "ArtSupplies" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=2939,y=12572,z=-1},
            dist = {"GigamartDryGoods","KitchenDryFood", "FridgeSoda", "CrateSodaBottles", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=2939,y=12573,z=-1},
            dist = {"SewingStoreTools", "CrateLeather", "SewingStoreFabric"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        {
            type = 'container',
            coords = {x=2939,y=12574,z=-1},
            dist = {"ArmyStorageAmmunition", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        -- bunkrooms
        {
            type = 'container',
            coords = {x=2948,y=12570,z=-1},
            dist = {"ArmyStorageOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateBootsArmy"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=2948,y=12567,z=-1},
            dist = {"ArmyStorageOutfit", "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateBootsArmy"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        -- medical room
        {
            type = 'container',
            coords = {x=2943,y=12560,z=-1},
            dist = {"MedicalClinicTools", "MedicalStorageDrugs"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        {
            type = 'container',
            coords = {x=2943,y=12559,z=-1},
            dist = {"LaboratoryLockers", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        {
            type = 'container',
            coords = {x=2944,y=12556,z=-1},
            dist = {"BathroomCounter", "BookstoreBiography", "MedicalOfficeBooks", "LibraryMedical", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        -- tool chest
        {
            type = 'container',
            coords = {x=2941,y=12565,z=-1},
            dist = {"GasStoreEmergency", "StoreCounterTobacco", "CandyStoreSnacks"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- freezers
        {
            type = 'container',
            coords = {x=2941,y=12563,z=-1},
            dist = {"FreezerRich", },
            distIncludeJunk = true,
            randUntilFull = true,
            frozen = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=2941,y=12564,z=-1},
            dist = {"FreezerIceCream", },
            distIncludeJunk = true,
            randUntilFull = true,
            frozen = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=2941,y=12561,z=-1},
            dist = {"SushiKitchenFreezer", "WesternKitchenFreezer", "BakeryKitchenFreezer"},
            distIncludeJunk = true,
            randUntilFull = true,
            frozen = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=2942,y=12561,z=-1},
            dist = {"FridgeFarmStorage", "FridgeGeneric"},
            distIncludeJunk = true,
            randUntilFull = true,
            frozen = true,
            level = "Loot_FoodLevel",
        },
    },
}

-- water pipe
table.insert(ScrapYard.objectSpawns, { sprite = "industry_02_250", x = 2941, y = 12504, z = 0, })
for i = 12505, 12516 do
    table.insert(ScrapYard.objectSpawns, { sprite = "industry_02_224", x = 2941, y = i, z = 0, })
end

if getActivatedMods():contains("\\Ladders") then
    table.insert(ScrapYard.objectSpawns, { x = 2940, y = 12561, z = -1, removeWall = "west" })
    table.insert(ScrapYard.objectSpawns, { x = 2939, y = 12561, z = 0, removeFloor = true, clearExisting = true, })
    --------- TEMP FIX UNTIL LADDERS MOD IS FIXED. It breaks for west facing ladders if they have a wall on the north
    table.insert(ScrapYard.objectSpawns, { x = 2939, y = 12561, z = 0, removeWall = "north" })
    ---------
    table.insert(ScrapYard.objectSpawns, { sprite = "fixtures_railings_01_23", delete = true, x = 2941, y = 12564, z = -1 })
    table.insert(ScrapYard.objectSpawns, { sprite = "fixtures_railings_01_22", delete = true, x = 2941, y = 12563, z = -1 })
    table.insert(ScrapYard.objectSpawns, { sprite = "fixtures_railings_01_21", delete = true, x = 2941, y = 12562, z = -1 })
    table.insert(ScrapYard.objectSpawns, { sprite = "fixtures_stairs_01_11", delete = true, x = 2940, y = 12564, z = -1 })
    table.insert(ScrapYard.objectSpawns, { sprite = "fixtures_stairs_01_12", delete = true, x = 2940, y = 12563, z = -1 })
    table.insert(ScrapYard.objectSpawns, { sprite = "fixtures_stairs_01_13", delete = true, x = 2940, y = 12562, z = -1 })
    table.insert(ScrapYard.objectSpawns, { sprite = "blends_natural_01_22", isFloor = true, x = 2940, y = 12564, z = 0 })
    table.insert(ScrapYard.objectSpawns, { sprite = "blends_natural_01_22", isFloor = true, x = 2940, y = 12563, z = 0 })
    table.insert(ScrapYard.objectSpawns, { sprite = "blends_natural_01_22", isFloor = true, x = 2940, y = 12562, z = 0 })
else
    -- exterior entrance
    table.insert(ScrapYard.objectSpawns, { sprite = "walls_exterior_house_01_51", x = 2941, y = 12565, z = 0, })
    table.insert(ScrapYard.objectSpawns, { sprite = "walls_exterior_house_01_49", x = 2940, y = 12565, z = 0, })
    table.insert(ScrapYard.objectSpawns, { sprite = "roofs_02_22", x = 2940, y = 12564, z = 1, })
    table.insert(ScrapYard.objectSpawns, { sprite = "walls_exterior_house_01_48", x = 2941, y = 12564, z = 0, })
    table.insert(ScrapYard.objectSpawns, { sprite = "roofs_02_22", x = 2940, y = 12563, z = 1, })
    table.insert(ScrapYard.objectSpawns, { sprite = "walls_exterior_house_01_48", x = 2941, y = 12563, z = 0, })
    table.insert(ScrapYard.objectSpawns, { sprite = "roofs_02_22", x = 2940, y = 12562, z = 1, })
    table.insert(ScrapYard.objectSpawns, { sprite = "walls_exterior_house_01_48", x = 2941, y = 12562, z = 0, })
    table.insert(ScrapYard.objectSpawns, { sprite = "roofs_02_22", x = 2940, y = 12561, z = 1, })
    table.insert(ScrapYard.objectSpawns, { sprite = "walls_exterior_house_01_48", x = 2941, y = 12561, z = 0, })
    table.insert(ScrapYard.objectSpawns, { sprite = "walls_exterior_wooden_01_39", x = 2940, y = 12561, z = 0, })
    table.insert(ScrapYard.objectSpawns, { sprite = "fixtures_doors_01_29", x = 2940, y = 12561, z = 0, isDoor = true, doorN = true, })
    table.insert(ScrapYard.objectSpawns, { sprite = "floors_exterior_natural_01_10", x = 2940, y = 12561, z = 0, })
end

return ScrapYard