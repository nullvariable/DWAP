local wtcBasement = {x = 1248, y = 7366, z = -10}
local wtcMainFloor = {x = 1242, y = 7386, z = 2}
local generator = {x = 1251, y = 7373, z = -10}

local QuillManor = {
    spawn = { x = 1221, y = 7384, z = 1 },
    waterTanks = {
        { sprite = "industry_02_72", x = wtcBasement.x, y = wtcBasement.y, z = wtcBasement.z, sourceType="generator", source = {x = generator.x, y = generator.y, z = generator.z} },
        { sprite = "crafted_01_11", x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z, isProp = true, sourceType="generator", source = {x = generator.x, y = generator.y, z = generator.z} },
    },
    waterFixtures = {
        -- basement - kitchen
        { sprite = "fixtures_sinks_01_18", x = 1232, y = 7359, z = -10, sourceType="tank", source = {x = wtcBasement.x, y = wtcBasement.y, z = wtcBasement.z} },
        { sprite = "fixtures_sinks_01_34", x = 1236, y = 7359, z = -10, sourceType="tank", source = {x = wtcBasement.x, y = wtcBasement.y, z = wtcBasement.z} },
        -- basement - bedroom north
        { sprite = "fixtures_bathroom_01_1", x = 1237, y = 7360, z = -10, sourceType="tank", source = {x = wtcBasement.x, y = wtcBasement.y, z = wtcBasement.z} },
        { sprite = "fixtures_bathroom_01_32", x = 1237, y = 7358, z = -10, sourceType="tank", source = {x = wtcBasement.x, y = wtcBasement.y, z = wtcBasement.z} },
        { sprite = "fixtures_sinks_01_2", x = 1239, y = 7358, z = -10, sourceType="tank", source = {x = wtcBasement.x, y = wtcBasement.y, z = wtcBasement.z} },
        -- basement - gym
        { sprite = "fixtures_sinks_01_24", x = 1241, y = 7371, z = -10, sourceType="tank", source = {x = wtcBasement.x, y = wtcBasement.y, z = wtcBasement.z} },
        { sprite = "appliances_laundry_01_0", x = 1237, y = 7371, z = -10, sourceType="tank", source = {x = wtcBasement.x, y = wtcBasement.y, z = wtcBasement.z} },
        -- basement - bedroom south
        { sprite = "fixtures_sinks_01_1", x = 1228, y = 7373, z = -10, sourceType="tank", source = {x = wtcBasement.x, y = wtcBasement.y, z = wtcBasement.z} },
        { sprite = "fixtures_bathroom_01_25", x = 1228, y = 7371, z = -10, sourceType="tank", source = {x = wtcBasement.x, y = wtcBasement.y, z = wtcBasement.z} },
        { sprite = "fixtures_bathroom_01_0", x = 1230, y = 7371, z = -10, sourceType="tank", source = {x = wtcBasement.x, y = wtcBasement.y, z = wtcBasement.z} },
        -- basement - security bunkroom
        { sprite = "fixtures_sinks_01_17", x = 1217, y = 7370, z = -10, sourceType="tank", source = {x = wtcBasement.x, y = wtcBasement.y, z = wtcBasement.z} },
        -- main floors --
        -- bathroom behind elevator
        { sprite = "fixtures_bathroom_01_0", x = 1226, y = 7364, z = 0, sourceType="tank", source = {x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z} },
        { sprite = "fixtures_sinks_01_6", x = 1227, y = 7366, z = 0, sourceType="tank", source = {x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z} },
        -- bathroom next to kitchen
        { sprite = "fixtures_bathroom_01_3", x = 1226, y = 7395, z = 0, sourceType="tank", source = {x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z} },
        { sprite = "fixtures_sinks_01_4", x = 1225, y = 7393, z = 0, sourceType="tank", source = {x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z} },
        -- kitchen
        { sprite = "fixtures_sinks_01_33", x = 1223, y = 7395, z = 0, sourceType="tank", source = {x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z} },
        { sprite = "appliances_laundry_01_6", x = 1217, y = 7398, z = 0, sourceType="tank", source = {x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z} },
        { sprite = "fixtures_sinks_01_16", x = 1216, y = 7392, z = 0, sourceType="tank", source = {x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z} },
        -- 2nd floor --
        -- north bathroom
        { sprite = "fixtures_sinks_01_4", x = 1233, y = 7366, z = 1, sourceType="tank", source = {x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z} },
        { sprite = "fixtures_bathroom_01_25", x = 1233, y = 7364, z = 1, sourceType="tank", source = {x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z} },
        { sprite = "fixtures_bathroom_01_0", x = 1236, y = 7364, z = 1, sourceType="tank", source = {x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z} },
        -- south bathroom
        { sprite = "fixtures_sinks_01_4", x = 1233, y = 7396, z = 1, sourceType="tank", source = {x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z} },
        { sprite = "fixtures_bathroom_01_52", x = 1233, y = 7398, z = 1, sourceType="tank", source = {x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z} },
        { sprite = "fixtures_bathroom_01_3", x = 1236, y = 7398, z = 1, sourceType="tank", source = {x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z} },
        -- west bathroom
        { sprite = "fixtures_sinks_01_5", x = 1222, y = 7379, z = 1, sourceType="tank", source = {x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z} },
        { sprite = "fixtures_bathroom_01_55", x = 1224, y = 7379, z = 1, sourceType="tank", source = {x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z} },
        { sprite = "fixtures_bathroom_01_3", x = 1224, y = 7381, z = 1, sourceType="tank", source = {x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z} },
    },
    generators = {
        {
            controls = { sprite = "industry_02_67", x = generator.x, y = generator.y, z = generator.z, },
            chunks = {
                {152, 919},
                {152, 920},
                {152, 921},
                {152, 922},
                {153, 919},
                {153, 920},
                {153, 921},
                {153, 922},
                {154, 919},
                {154, 920},
                {154, 921},
                {154, 922},
                {155, 919},
                {155, 920},
                {155, 921},
                {155, 922},
                {156, 919},
                {156, 920},
                {156, 921},
                {156, 922},
                {157, 919},
                {157, 920},
                {157, 921},
                {157, 922},
                {151, 921},
                {151, 922},
                {151, 923},
                {152, 923},
                {152, 924},
                {153, 923},
                {153, 924},
                {154, 923},
                {154, 924},
                {155, 923},
                {155, 924},
            },
        },
    },
    doorKeys = {
        name = "Quill Manor Key",
        doors = {
            { sprite = "fixtures_doors_01_45", x = 1241, y = 7382, z = 0, },
            { sprite = "fixtures_doors_01_33", x = 1224, y = 7370, z = -10, },
        },
    },
    map = { name = "DWAPStashMap32", },
    objectSpawns = {
        -- upper floors invisible water tank for performance
        { sprite = "crafted_01_11", x = wtcMainFloor.x, y = wtcMainFloor.y, z = wtcMainFloor.z, enabled = "EnableWaterSystem", },
        { sprite = "floors_exterior_tilesandstone_01_5", x = 1203, y = 7375, z = 0, enabled = "EnableWaterSystem", },
        { sprite = "camping_01_64", x = 1203, y = 7375, z = 0, enabled = "EnableWaterSystem", }, -- fountain

        -- jam an elevator into the hallway and make a new door for the bathroom
        { x = 1225, y = 7368, z = 0, clearExisting = true, }, --removeFloor = true,},
        { x = 1225, y = 7369, z = 0, clearExisting = true, }, --removeFloor = true,},
        { x = 1226, y = 7368, z = 0, clearExisting = true, }, --removeFloor = true,},
        { x = 1226, y = 7369, z = 0, clearExisting = true, }, --removeFloor = true,},
        { x = 1227, y = 7368, z = 0, clearExisting = true, }, --removeFloor = true,},
        { x = 1227, y = 7369, z = 0, clearExisting = true, }, --removeFloor = true,},
        { sprite = "location_restaurant_bar_01_46", x = 1225, y = 7370, z = 0, replaceWall = true,},
        { sprite = "fixtures_escalators_01_57", x = 1225, y = 7370, z = 0, },
        { sprite = "location_restaurant_bar_01_45", x = 1226, y = 7370, z = 0, },
        { sprite = "fixtures_escalators_01_50", x = 1226, y = 7370, z = 0, },
        { sprite = "location_restaurant_bar_01_45", x = 1227, y = 7370, z = 0, },
        { sprite = "fixtures_escalators_01_51", x = 1227, y = 7370, z = 0, },
        { sprite = "industry_trucks_01_5", x = 1226, y = 7368, z = 0, removeWall = "north", clearExisting = true, },

        { sprite = "fixtures_doors_01_4", x = 1225, y = 7365, z = 0, removeWall = "west", isDoor = true, doorN = false, },
        { sprite = "walls_interior_bathroom_01_10", x = 1225, y = 7365, z = 0, },
        { sprite = "fixtures_doors_frames_01_8", x = 1225, y = 7365, z = 0, },

        { barricade = "metal", enabled = "Barricade", target="walls_commercial_02_54", x = 1230, y = 7364, z = 0, },
        { barricade = "metal", enabled = "Barricade", target="walls_commercial_02_54", x = 1239, y = 7364, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target="fixtures_windows_01_72", x = 1242, y = 7366, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target="fixtures_windows_01_72", x = 1242, y = 7370, z = 0, },
    },
    loot = {
        -- only basement for now.
        -- security room
        { -- desk1
            type = 'container',
            coords = {x=1221,y=7376,z=-10},
            dist = { "GunStoreKnives", "PawnShopKnives",  },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- desk2
            type = 'container',
            coords = {x=1218,y=7377,z=-10},
            dist = {"TestingLab", "TobaccoStoreAccessories", "CandyStoreSnacks"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=1222,y=7376,z=-10},
            dist = {"GasStoreEmergency","StoreCounterTobacco", "BurglarTools", "CarpenterTools", "BarnTools",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=1222,y=7375,z=-10},
            dist = {"ArmyStorageAmmunition", "SafehouseTraps", "GunStoreKnives",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=1222,y=7374,z=-10},
            dist = {"ArmyStorageElectronics", "RandomFiller" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        -- security bunkroom
        {
            type = 'container',
            coords = {x=1217,y=7373,z=-10},
            dist = {"MeleeWeapons", "MeleeWeapons_Mid" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=1217,y=7372,z=-10},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=1217,y=7370,z=-10},
            dist = {"JanitorCleaning","MedicalCabinet","MedicalClinicDrugs", "CrateLinens"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        {
            type = 'container',
            coords = {x=1217,y=7370,z=-9.5},
            dist = {"BathroomCounter", "GasStoreToiletries"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=1220,y=7370,z=-10},
            dist = {"DrugLabOutfit", "MechanicOutfit", "ArmySurplusOutfit"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=1222,y=7370,z=-10},
            dist = {"ClothingStorageWinter", "GymLaundry"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=1222,y=7371,z=-10},
            dist = {"SafehouseArmor", "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=1222,y=7372,z=-10},
            sandboxEnable = 'Loot',
            special = "essentials",
        },
        {
            type = 'container',
            coords = {x=1222,y=7373,z=-10},
            dist = {"CrateFishing", "FishermanTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        {
            type = 'container',
            coords = {x=1220,y=7373,z=-10},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=1219,y=7373,z=-10},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        -- living room
        {
            type = 'container',
            coords = {x=1217,y=7363,z=-10},
            dist = {"MusicStoreCDs"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        {
            type = 'container',
            coords = {x=1222,y=7358,z=-10},
            dist = {"CrateVHSTapes"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        {
            type = 'container',
            coords = {x=1223,y=7358,z=-10},
            dist = {"TheatreDrinks", "TheatreSnacks"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- dining
        {
            type = 'container',
            coords = {x=1225,y=7361,z=-10},
            dist = {"StoreCounterTobacco", "CandyStoreSnacks"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=1225,y=7360,z=-10},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=1225,y=7359,z=-10},
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=1225,y=7358,z=-10},
            dist = {"ButcherSpices","GigamartSpices","GroceryBagGourmet",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=1226,y=7358,z=-10},
            dist = {"CrateTortillaChips", "CandyStoreSnacks","FridgeSoda",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=1230,y=7358,z=-10},
            dist = {"BurgerKitchenFreezer", },
            distIncludeJunk = false,
            randUntilFull = true,
            frozen = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=1231,y=7358,z=-10},
            dist = {"WesternKitchenSauce", "WhiskeyBottlingFull", "WesternKitchenBaking"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=1232,y=7358,z=-10},
            dist = {"KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=1232,y=7359,z=-10},
            dist = {"StoreKitchenBaking", "WesternKitchenBaking"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- pantry
        {
            type = 'container',
            coords = {x=1233,y=7358,z=-10},
            dist = {"FreezerIceCream", },
            distIncludeJunk = false,
            randUntilFull = true,
            frozen = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=1234,y=7358,z=-10},
            dist = {"CatfishKitchenFreezer", },
            distIncludeJunk = false,
            randUntilFull = true,
            frozen = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=1235,y=7358,z=-10},
            dist = {"FreezerIceCream", },
            distIncludeJunk = false,
            randUntilFull = true,
            frozen = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=1236,y=7358,z=-10},
            dist = {"ButcherFreezer", },
            distIncludeJunk = false,
            randUntilFull = true,
            frozen = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=1236,y=7360,z=-10},
            dist = {"WesternKitchenFreezer", },
            distIncludeJunk = false,
            randUntilFull = true,
            frozen = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=1236,y=7361,z=-10},
            dist = {"BurgerKitchenFreezer", },
            distIncludeJunk = false,
            randUntilFull = true,
            frozen = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=1236,y=7362,z=-10},
            dist = {"KitchenDryFood", "GigamartDryGoods", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=1236,y=7363,z=-10},
            dist = {"GigamartBakingMisc", "CrateFlour", "CrateOilVegetable" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=1234,y=7363,z=-10},
            dist = {"GigamartBakingMisc", "CrateFlour", "CrateOilVegetable" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=1233,y=7363,z=-10},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=1234,y=7361,z=-10},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=1233,y=7361,z=-10},
            dist = {"ButcherSpices","GigamartSpices","GroceryBagGourmet",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- rec area/hallway
        {
            type = 'container',
            coords = {x=1228,y=7370,z=-10},
            dist = {"LiquorStoreMix", "DishCabinetVIPLounge"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=1228,y=7369,z=-10},
            dist = {"CrateLiquor", "LiquorStoreWhiskey"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=1233,y=7364,z=-10},
            dist = {"LivingRoomShelfClassy","BookstoreMilitaryHistory"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        {
            type = 'container',
            coords = {x=1234,y=7364,z=-10},
            dist = {"KitchenBottles", "CrateSodaCans", "CrateSodaBottles"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=1241,y=7365,z=-10},
            dist = {"CrateLiquor", "DishCabinetVIPLounge", "MusicStoreCDs", "CrateVHSTapes", "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        {
            type = 'container',
            coords = {x=1242,y=7365,z=-10},
            dist = {"LiquorStoreBrandy", "LiquorStoreGin"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- north bedroom
        {
            type = 'container',
            coords = {x=1242,y=7358,z=-10},
            dist = {"ArmyHangarOutfit", "ArmyStorageOutfit", "ArmySurplusOutfit", "LaundryLoad4", "LaundryLoad5", "LaundryLoad6", "LaundryLoad7", "LaundryLoad8"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=1239,y=7358,z=-10},
            dist = {"JanitorCleaning","MedicalCabinet","MedicalClinicDrugs", "CrateLinens"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        {
            type = 'container',
            coords = {x=1244,y=7364,z=-10},
            dist = {"ClothingStorageWinter", "GymLaundry"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=1243,y=7364,z=-10},
            dist = {"SafehouseArmor", "ArmySurplusOutfit"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        -- generator room/warehouse
        {
            type = 'container',
            coords = {x=1250,y=7365,z=-10},
            dist = {"GasStoreEmergency","StoreCounterTobacco", "BurglarTools", "CarpenterTools", "BarnTools","SafehouseArmor", "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=1251,y=7365,z=-10},
            dist = {"GardenStoreTools", "Homesteading", "CrateLinens", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        {
            type = 'container',
            coords = {x=1252,y=7365,z=-10},
            dist = {"ToolCabinetMechanics","CrateMechanics"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=1254,y=7365,z=-10},
            dist = {"ToolStoreMetalwork","CrateBlacksmithing", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=1256,y=7365,z=-10},
            dist = {"CrateCarpentry","LoggingFactoryTools", "WoodcraftDudeCounter"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=1256,y=7370,z=-10},
            dist = { "CarSupplyTools", "GasStorageMechanics",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=1256,y=7371,z=-10},
            dist = {"CampingStoreTools", "ArmyHangarTools", "CarSupplyTools", "BurglarTools", "CarpenterTools", "BarnTools", "GarageTools","GigamartTools", "JanitorTools", "LoggingFactoryTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=1256,y=7373,z=-10},
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = {9,12} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        {
            type = 'container',
            coords = {x=1256,y=7374,z=-10},
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = {8,10} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        {
            type = 'container',
            coords = {x=1256,y=7376,z=-10},
            dist = {"ArtStorePottery","CrateMasonry" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=1256,y=7377,z=-10},
            dist = {"CrateLumber", "CrateSheetMetal", "ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=1254,y=7370,z=-10},
            dist = {"CrateLumber", "CrateSheetMetal", "ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=1254,y=7371,z=-10},
            dist = {"CrateTailoring", "CrateFabric_Cotton", "CrateFabric_DenimBlack", "CrateLeather","SewingStoreFabric"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        {
            type = 'container',
            coords = {x=1254,y=7373,z=-10},
            dist = {"CampingStoreTools", "ArmyHangarTools", "CarSupplyTools", "BurglarTools", "CarpenterTools", "BarnTools", "GarageTools","GigamartTools", "JanitorTools", "LoggingFactoryTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=1254,y=7374,z=-10},
            dist = {"GigamartBreakfast","GigamartCandy","Homesteading","CrateLiquor",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=1254,y=7376,z=-10},
            dist = {"ArmyStorageGuns","ArmyStorageAmmunition","FirearmWeapons_Late"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=1254,y=7377,z=-10},
            dist = {"GunStoreMagsAmmo", "GunStoreAmmunition", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=1252,y=7370,z=-10},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        {
            type = 'container',
            coords = {x=1252,y=7371,z=-10},
            dist = {"SafehouseTraps","GunStoreKnives","CampingStoreBackpacks","CrateLiquor", "CarSupplyTools","DrugLabOutfit"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=1250,y=7370,z=-10},
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        {
            type = 'container',
            coords = {x=1250,y=7371,z=-10},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        {
            type = 'container',
            coords = {x=1248,y=7370,z=-10},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        {
            type = 'container',
            coords = {x=1248,y=7371,z=-10},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        -- gym
        {
            type = 'container',
            coords = {x=1240,y=7377,z=-10},
            dist = {"FitnessTrainer"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=1238,y=7371,z=-10},
            dist = {"LaundryLoad1", "LaundryLoad2", "LaundryLoad3", "LaundryLoad4", "LaundryLoad5", "LaundryLoad6", "LaundryLoad7", "LaundryLoad8"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        -- south bedroom
        {
            type = 'container',
            coords = {x=1231,y=7371,z=-10},
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        {
            type = 'container',
            coords = {x=1232,y=7371,z=-10},
            dist = {"MusicStoreCDs"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        {
            type = 'container',
            coords = {x=1233,y=7376,z=-10},
            dist = {"ArmyStorageOutfit", "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateBootsArmy", "RandomFiller"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=1233,y=7377,z=-10},
            dist = {"CrateVHSTapes"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        {
            type = 'container',
            coords = {x=1228,y=7377,z=-10},
            dist = {"SafehouseTraps","GunStoreKnives","CampingStoreBackpacks",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=1228,y=7373,z=-10},
            dist = {"BathroomCounter", "GasStoreToiletries"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=1228,y=7373,z=-9.5},
            dist = {"BathroomCounter", "SafehouseMedical"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
    },
}
-- 2559
-- 14453
-- if getActivatedMods():contains("\\Ladders") then
--     table.insert(QuillManor.objectSpawns, { x = 2559, y = 14454, z = 0, removeFloor = true, clearExisting = true, })
-- else
--     table.insert(QuillManor.objectSpawns, { sprite = "industry_trucks_01_4", x = 2607, y = 14453, z = -1, replaceWall = true, })
-- end
if getActivatedMods():contains("\\Gelevator") then
    table.insert(QuillManor.objectSpawns, { sprite = "blends_natural_01_23", x = 1228, y = 7363, z = 0, })
    table.insert(QuillManor.objectSpawns, { sprite = "blends_natural_01_23", x = 1227, y = 7363, z = 0, })
    table.insert(QuillManor.objectSpawns, { sprite = "blends_natural_01_23", x = 1226, y = 7363, z = 0, })
else
    table.insert(QuillManor.objectSpawns, { sprite = "fixtures_railings_01_29", x = 1226, y = 7363, z = 0, })
    table.insert(QuillManor.objectSpawns, { sprite = "fixtures_railings_01_29", x = 1227, y = 7363, z = 0, })
    table.insert(QuillManor.objectSpawns, { sprite = "fixtures_railings_01_29", x = 1228, y = 7363, z = 0, })
    table.insert(QuillManor.objectSpawns, { sprite = "fixtures_railings_01_28", x = 1229, y = 7363, z = 0, })
    table.insert(QuillManor.objectSpawns, { x = 1226, y = 7378, z = -10, removeWall = "north", })
end
return QuillManor