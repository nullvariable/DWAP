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
                {367, 1561}, --shop/shed
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
        { sprite = "fixtures_bathroom_01_0", x = 2945, y = 12563, z = -1, sourceType="tank", source = {x = wtc2.x, y = wtc2.y, z = wtc2.z} },
        { sprite = "fixtures_sinks_01_12", x = 2946, y = 12563, z = -1, sourceType="tank", source = {x = wtc2.x, y = wtc2.y, z = wtc2.z} },
        { sprite = "fixtures_bathroom_01_22", x = 2945, y = 12567, z = -1, sourceType="tank", source = {x = wtc2.x, y = wtc2.y, z = wtc2.z} },
        { sprite = "fixtures_bathroom_01_22", x = 2946, y = 12567, z = -1, sourceType="tank", source = {x = wtc2.x, y = wtc2.y, z = wtc2.z} },
    },
    doorKeys = {
        name = "ScrapYard Safehouse",
        doors = {
            { sprite = "fixtures_doors_01_44", x = 2933, y = 12563, z = 0, },
            { sprite = "fixtures_doors_02_4", x = 2936, y = 12523, z = 0, },
            { sprite = "fixtures_doors_02_4", x = 2937, y = 12496, z = 0, },
            { sprite = "fixtures_doors_01_29", x = 2940, y = 12560, z = 0, },
            { sprite = "fixtures_doors_01_29", x = 2944, y = 12560, z = -1, },
        },
    },
    map = { name = "DWAPStashMap20", },
    objectSpawns = {
        -- some for loop spawns at bottom of file
        { x = 2939, y = 12518, z = 0, clearExisting = true, }, -- chair blocking new stairs
        { sprite = "crafted_01_11", x = wtc1.x, y = wtc1.y, z = wtc1.z, enabled = "EnableWaterSystem", }, -- invisible "tank" to simulate the well
        { sprite = "crafted_01_11", x = wtc2.x, y = wtc2.y, z = wtc2.z, enabled = "EnableWaterSystem", }, -- invisible "tank" to simulate the well


        -- exterior entrance
        { sprite = "walls_exterior_house_01_49", x = 2940, y = 12564, z = 0, },
        { sprite = "roofs_02_22", x = 2940, y = 12563, z = 1, },
        { sprite = "walls_exterior_house_01_48", x = 2941, y = 12563, z = 0, },
        { sprite = "roofs_02_22", x = 2940, y = 12562, z = 1, },
        { sprite = "walls_exterior_house_01_48", x = 2941, y = 12562, z = 0, },
        { sprite = "roofs_02_22", x = 2940, y = 12561, z = 1, },
        { sprite = "walls_exterior_house_01_48", x = 2941, y = 12561, z = 0, },
        { sprite = "roofs_02_22", x = 2940, y = 12560, z = 1, },
        { sprite = "walls_exterior_house_01_48", x = 2941, y = 12560, z = 0, },
        { sprite = "walls_exterior_wooden_01_39", x = 2940, y = 12560, z = 0, },
        { sprite = "fixtures_doors_01_29", x = 2940, y = 12560, z = 0, isDoor = true, doorN = true, },
        { sprite = "floors_exterior_street_01_17", x = 2940, y = 12560, z = 0, },

        { sprite = "fixtures_doors_01_29", x = 2946, y = 12527, z = -1, isDoor = true, doorN = true, },
        { sprite = "walls_exterior_wooden_01_39", x = 2946, y = 12527, z = -1, replaceWall = true, },
        { sprite = "lighting_indoor_02_80", x = 2946, y = 12529, z = 0, tunnelZ = -1, isLightSwitch = true, },
        { sprite = "lighting_indoor_02_80", x = 2946, y = 12535, z = 0, tunnelZ = -1, isLightSwitch = true, },
        { sprite = "lighting_indoor_02_80", x = 2946, y = 12542, z = 0, tunnelZ = -1, isLightSwitch = true, },
        { sprite = "lighting_indoor_02_80", x = 2946, y = 12549, z = 0, tunnelZ = -1, isLightSwitch = true, },
        { sprite = "lighting_indoor_02_80", x = 2946, y = 12557, z = 0, tunnelZ = -1, isLightSwitch = true, },

        { sprite = "location_sewer_01_2", x = 2943, y = 12559, z = 0, tunnelZ = -1, },
        { sprite = "location_sewer_01_2", x = 2943, y = 12558, z = 0, tunnelZ = -1, },
        { sprite = "location_sewer_01_2", x = 2944, y = 12558, z = 0, tunnelZ = -1, },
        { sprite = "floors_exterior_street_01_17", x = 2944, y = 12559, z = 0, tunnelZ = -1, --[[room = {x = 2944, y = 12560, z = -1},]] },
        { sprite = "location_sewer_01_2", x = 2944, y = 12559, z = 0, tunnelZ = -1, },
        { sprite = "fixtures_doors_01_29", x = 2944, y = 12560, z = -1, isDoor = true, doorN = true, },
        { sprite = "walls_exterior_wooden_01_39", x = 2944, y = 12560, z = -1, replaceWall = true, },
        { sprite = "location_sewer_01_1", x = 2945, y = 12559, z = 0, tunnelZ = -1, },
        { sprite = "floors_exterior_street_01_17", x = 2945, y = 12559, z = 0, tunnelZ = -1, --[[room = {x = 2944, y = 12560, z = -1},]] },
        { sprite = "floors_exterior_street_01_17", x = 2946, y = 12559, z = 0, tunnelZ = -1, --[[room = {x = 2944, y = 12560, z = -1},]] },
        { sprite = "floors_exterior_street_01_17", x = 2947, y = 12559, z = 0, tunnelZ = -1, --[[room = {x = 2944, y = 12560, z = -1},]] },
        { sprite = "walls_exterior_house_02_16", x = 2948, y = 12559, z = 0, tunnelZ = -1, },
        { sprite = "location_sewer_01_1", x = 2947, y = 12560, z = 0, tunnelZ = -1, },
    },
    loot = {
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
            dist = {"ArmyStorageOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "ToolStoreOutfit"},
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
            dist = {"SushiKitchenFreezer", "WesternKitchenFreezer", "BakeryKitchenFreezer"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=2936,y=12517,z=0},
            dist = {"StoreKitchenBaking",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=2934,y=12517,z=0},
            dist = {"StoreKitchenGlasses", "StoreKitchenPots", "StoreKitchenDishes", "StoreKitchenCutlery", },
            distIncludeJunk = true,
            randUntilFull = true,
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
            dist = {"PoliceStorageGuns"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=2944,y=12524,z=-1},
            dist = {"ArmyStorageGuns",},
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
            dist = { "GunStoreKnives", },
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
                { name = 'Base.NailsCarton', chance = 1, count = {1,4} },
            },
        },
        {
            type = 'container',
            coords = {x=2950,y=12568,z=0},
            items = {
                { name = 'Base.ScrewsCarton', chance = 1, count = {2,5} },
            },
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
            coords = {x=2939,y=12561,z=0},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        -- kitchen
        {
            type = 'container',
            coords = {x=2934,y=12560,z=0},
            dist = {"SushiKitchenFreezer", "WesternKitchenFreezer", "BakeryKitchenFreezer"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=2934,y=12559,z=0},
            dist = {"StoreKitchenGlasses", "StoreKitchenPots", "StoreKitchenDishes", "StoreKitchenCutlery", },
            distIncludeJunk = false,
            randUntilFull = true,
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
            dist = {"GroceryBagGourmet",},
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
            coords = {x=2939,y=12565,z=-1},
            dist = {"HuntingLockers", "RangerTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=2936,y=12565,z=-1},
            dist = {"SafehouseTraps", "ArmyStorageAmmunition"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=2936,y=12566,z=-1},
            dist = {"GunCache1.GunBox",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=2936,y=12569,z=-1},
            dist = {"CrateFlour", "CrateOilVegetable"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=2936,y=12570,z=-1},
            dist = {"CrateFlour", "CrateOilVegetable", "SeafoodKitchenSauce"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=2938,y=12569,z=-1},
            dist = {"CampingStoreTools", "ArmyHangarTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=2938,y=12570,z=-1},
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
        {
            type = 'container',
            coords = {x=2941,y=12570,z=-1},
            dist = {"ToolFactoryHandles" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=2942,y=12570,z=-1},
            dist = {"GunCache1.GunBox", "GunCache1.Bag_DuffelBagTINT"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        -- crate room
        {
            type = 'container',
            coords = {x=2941,y=12573,z=-1},
            dist = {"ToolFactoryBarStock"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=2941,y=12572,z=-1},
            dist = {"WeldingWorkshopMetal"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=2941,y=12571,z=-1},
            dist = {"CrateLumber", "CrateSheetMetal"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=2942,y=12573,z=-1},
            dist = {"GigamartDryGoods" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=2944,y=12573,z=-1},
            dist = {"GigamartDryGoods" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=2944,y=12572,z=-1},
            dist = {"StoreShelfDrinks", "FridgeSoda", "CrateSodaBottles", "ArtStorePottery", "ArtSupplies"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=2944,y=12571,z=-1},
            dist = {"GigamartDryGoods" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- bunkrooms
        {
            type = 'container',
            coords = {x=2946,y=12568,z=-1},
            dist = {"ArmyStorageOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateBootsArmy"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=2945,y=12561,z=-1},
            dist = {"ArmyStorageOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateBootsArmy"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        -- clean room
        {
            type = 'container',
            coords = {x=2945,y=12565,z=-1},
            dist = {"SewingStoreTools", "CrateLeather", "SewingStoreFabric"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        {
            type = 'container',
            coords = {x=2946,y=12565,z=-1},
            dist = {"ArmyStorageMedical", "ArmyBunkerMedical"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        -- tool chest
        {
            type = 'container',
            coords = {x=2941,y=12564,z=-1},
            dist = {"CarSupplyTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        -- freezers
        {
            type = 'container',
            coords = {x=2941,y=12563,z=-1},
            dist = {"FreezerRich", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=2941,y=12562,z=-1},
            dist = {"FreezerIceCream", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=2941,y=12560,z=-1},
            dist = {"SushiKitchenFreezer", "WesternKitchenFreezer", "BakeryKitchenFreezer"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=2942,y=12560,z=-1},
            dist = {"FridgeFarmStorage", "FridgeGeneric"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
    },
}
-- tunnel pipe
table.insert(ScrapYard.objectSpawns, { sprite = "industry_02_250", x = 2941, y = 12504, z = 0, tunnelZ = -1, })
for i = 12528, 12557 do
    table.insert(ScrapYard.objectSpawns, { sprite = "industry_02_224", x = 2946, y = i, z = 0, tunnelZ = -1, })
end
table.insert(ScrapYard.objectSpawns, { sprite = "industry_02_252", x = 2946, y = 12558, z = 0, tunnelZ = -1, })
-- tunnel
local rooms = {
    {x = 2946, y = 12526, z = -1},
    {x = 2944, y = 12560, z = -1},
}
for i = 12527, 12558 do
    table.insert(ScrapYard.objectSpawns, { sprite = "floors_exterior_street_01_17", x = 2948, y = i, z = 0, tunnelZ = -1, })
    table.insert(ScrapYard.objectSpawns, { sprite = "floors_exterior_street_01_17", x = 2947, y = i, z = 0, tunnelZ = -1, room = i < 12536 and rooms[1] or nil, })
    table.insert(ScrapYard.objectSpawns, { sprite = "floors_exterior_street_01_17", x = 2946, y = i, z = 0, tunnelZ = -1, room = i < 12536 and rooms[1] or nil, })
    table.insert(ScrapYard.objectSpawns, { sprite = "floors_exterior_street_01_17", x = 2944, y = i, z = 0, tunnelZ = -1, })
    table.insert(ScrapYard.objectSpawns, { sprite = "walls_exterior_house_02_16", x = 2946, y = i, z = 0, tunnelZ = -1, })
    table.insert(ScrapYard.objectSpawns, { sprite = "walls_exterior_house_02_16", x = 2948, y = i, z = 0, tunnelZ = -1, })
end
-- water pipe
table.insert(ScrapYard.objectSpawns, { sprite = "industry_02_250", x = 2941, y = 12504, z = 0, })
for i = 12505, 12516 do
    table.insert(ScrapYard.objectSpawns, { sprite = "industry_02_224", x = 2941, y = i, z = 0, })
end


return ScrapYard