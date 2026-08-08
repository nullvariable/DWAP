-- @TODO (2026-08-07 audit) unresolved - delete lines as they are fixed
--   * systems: generator controls declare industry_02_67 but no such object
--     is on the square. 11 configs name that sprite and ALL 11 fail, while 32
--     configs use dwap_tiles_01_22 - the maps look to have moved on and these
--     configs did not. Confirm what is actually there before editing
--   * systems: 3 components at 1224-1227,7364-7381 z=0,1 name a sprite that
--     is not on the square, though the square itself loads - config drifted
--     from the map
--   * systems: waterTank 2 at 1242,7386,2 present but carrying no fluid
--     container - the conversion started and did not finish, so this one is a
--     bug rather than bad coords
local wtcBasement = {x = 1248, y = 7366, z = -10}
local wtcMainFloor = {x = 1242, y = 7386, z = 2}
local generator = {x = 1251, y = 7373, z = -10}

local QuillManor = {
    group = "Brandenburg", -- bit south and west but close enough
    baseBuildings = {
        { x = 1221, y = 7384, z = 1 }, -- manor
        { x = 1248, y = 7322, z = 0 }, -- shed
        { x = 1226, y = 7366, z = -10 }, -- basement
    },
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
            fakeGenerators = {
                { x = 1215, y = 7393, z = -1, },
                { x = 1242, y = 7393, z = -1, },
                { x = 1215, y = 7363, z = -1, },
                { x = 1242, y = 7363, z = -1, },
                { x = 1230, y = 7363, z = -9, },
                { x = 1230, y = 7363, z = -5, },
                { x = 1257, y = 7365, z = -10, },
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

        { barricade = "metal", enabled = "Barricade", target="walls_commercial_02_54", x = 1230, y = 7364, z = 0, },
        { barricade = "metal", enabled = "Barricade", target="walls_commercial_02_54", x = 1239, y = 7364, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target="fixtures_windows_01_72", x = 1242, y = 7366, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target="fixtures_windows_01_72", x = 1242, y = 7370, z = 0, },
    },
    loot = {
        -- only basement for now.
        -- security room
        { -- E1 desk1
            note = "desk @ security",
            coords = {x=1221,y=7376,z=-10},
            dist = { "GunStoreKnives", "PawnShopKnives",  },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E2 desk2
            note = "desk @ security",
            coords = {x=1218,y=7377,z=-10},
            dist = {"TestingLab", "TobaccoStoreAccessories", "CandyStoreSnacks"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E3
            note = "counter @ security",
            coords = {x=1222,y=7376,z=-10},
            dist = {"GasStoreEmergency","StoreCounterTobacco", "BurglarTools", "CarpenterTools", "BarnTools",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E4
            note = "counter @ security",
            coords = {x=1222,y=7375,z=-10},
            dist = {"ArmyStorageAmmunition", "SafehouseTraps", "GunStoreKnives",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E5
            note = "counter @ security",
            coords = {x=1222,y=7374,z=-10},
            dist = {"ArmyStorageElectronics", "RandomFiller" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        -- security bunkroom
        { -- E6
            note = "militarylocker @ security",
            coords = {x=1217,y=7373,z=-10},
            dist = {"MeleeWeapons", "MeleeWeapons_Mid" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E7
            note = "militarylocker @ security",
            coords = {x=1217,y=7372,z=-10},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E8
            note = "counter @ security",
            coords = {x=1217,y=7370,z=-10},
            dist = {"JanitorCleaning","MedicalCabinet","MedicalClinicDrugs", "CrateLinens"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E9
            note = "medicine @ security",
            coords = {x=1217,y=7370,z=-10},
            slot = "upper",
            dist = {"BathroomCounter", "GasStoreToiletries"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E10
            note = "locker @ security",
            coords = {x=1220,y=7370,z=-10},
            dist = {"DrugLabOutfit", "MechanicOutfit", "ArmySurplusOutfit"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E11
            note = "metal_shelves @ security",
            coords = {x=1222,y=7370,z=-10},
            dist = {"ClothingStorageWinter", "GymLaundry"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E12
            note = "metal_shelves @ security",
            coords = {x=1222,y=7371,z=-10},
            dist = {"SafehouseArmor", "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E13
            note = "metal_shelves @ security",
            coords = {x=1222,y=7372,z=-10},
            special = "essentials",
        },
        { -- E14
            note = "metal_shelves @ security",
            coords = {x=1222,y=7373,z=-10},
            dist = {"CrateFishing", "FishermanTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E15
            note = "militarylocker @ security",
            coords = {x=1220,y=7373,z=-10},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E16
            note = "militarylocker @ security",
            coords = {x=1219,y=7373,z=-10},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        -- living room
        { -- E17
            note = "sidetable @ livingroom",
            coords = {x=1217,y=7363,z=-10},
            dist = {"MusicStoreCDs"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E18
            note = "dishescabinet @ livingroom",
            coords = {x=1222,y=7358,z=-10},
            dist = {"CrateVHSTapes"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E19
            note = "dishescabinet @ livingroom",
            coords = {x=1223,y=7358,z=-10},
            dist = {"TheatreDrinks", "TheatreSnacks"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- dining
        { -- E20
            note = "counter @ kitchen",
            coords = {x=1225,y=7361,z=-10},
            dist = {"StoreCounterTobacco", "CandyStoreSnacks"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E21
            note = "counter @ kitchen",
            coords = {x=1225,y=7360,z=-10},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E22
            note = "counter @ kitchen",
            coords = {x=1225,y=7359,z=-10},
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E23
            note = "counter @ kitchen",
            coords = {x=1225,y=7358,z=-10},
            dist = {"ButcherSpices","GigamartSpices","GroceryBagGourmet",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E24
            note = "counter @ kitchen",
            coords = {x=1226,y=7358,z=-10},
            dist = {"CrateTortillaChips", "CandyStoreSnacks","FridgeSoda",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E25
            note = "fridge @ kitchen",
            coords = {x=1230,y=7358,z=-10},
            dist = {"BurgerKitchenFreezer", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E26
            note = "counter @ kitchen",
            coords = {x=1231,y=7358,z=-10},
            dist = {"WesternKitchenSauce", "WhiskeyBottlingFull", "WesternKitchenBaking"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E27
            note = "counter @ kitchen",
            coords = {x=1232,y=7358,z=-10},
            dist = {"KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E28
            note = "counter @ kitchen",
            coords = {x=1232,y=7359,z=-10},
            dist = {"StoreKitchenBaking", "WesternKitchenBaking"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- pantry
        { -- E29
            note = "freezer @ pantry",
            coords = {x=1233,y=7358,z=-10},
            dist = {"FreezerIceCream", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E30
            note = "freezer @ pantry",
            coords = {x=1234,y=7358,z=-10},
            dist = {"CatfishKitchenFreezer", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E31
            note = "freezer @ pantry",
            coords = {x=1235,y=7358,z=-10},
            dist = {"FreezerIceCream", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E32
            note = "freezer @ pantry",
            coords = {x=1236,y=7358,z=-10},
            dist = {"ButcherFreezer", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E33
            note = "freezer @ pantry",
            coords = {x=1236,y=7360,z=-10},
            dist = {"WesternKitchenFreezer", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E34
            note = "fridge @ pantry",
            coords = {x=1236,y=7361,z=-10},
            dist = {"BurgerKitchenFreezer", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E35
            note = "metal_shelves @ pantry",
            coords = {x=1236,y=7362,z=-10},
            dist = {"KitchenDryFood", "GigamartDryGoods", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E36
            note = "metal_shelves @ pantry",
            coords = {x=1236,y=7363,z=-10},
            dist = {"GigamartBakingMisc", "CrateFlour", "CrateOilVegetable" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E37
            note = "crate @ pantry",
            coords = {x=1234,y=7363,z=-10},
            dist = {"GigamartBakingMisc", "CrateFlour", "CrateOilVegetable" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E38
            note = "crate @ pantry",
            coords = {x=1233,y=7363,z=-10},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E39
            note = "metal_shelves @ pantry",
            coords = {x=1234,y=7361,z=-10},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E40
            note = "metal_shelves @ pantry",
            coords = {x=1233,y=7361,z=-10},
            dist = {"ButcherSpices","GigamartSpices","GroceryBagGourmet",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- rec area/hallway
        { -- E41
            note = "shelves @ recreation",
            coords = {x=1228,y=7370,z=-10},
            dist = {"LiquorStoreMix", "DishCabinetVIPLounge"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E42
            note = "shelves @ recreation",
            coords = {x=1228,y=7369,z=-10},
            dist = {"CrateLiquor", "LiquorStoreWhiskey"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E43
            note = "dishescabinet @ recreation",
            coords = {x=1233,y=7364,z=-10},
            dist = {"LivingRoomShelfClassy","BookstoreMilitaryHistory"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E44
            note = "dishescabinet @ recreation",
            coords = {x=1234,y=7364,z=-10},
            dist = {"KitchenBottles", "CrateSodaCans", "CrateSodaBottles"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E45
            note = "dishescabinet @ recreation",
            coords = {x=1241,y=7365,z=-10},
            dist = {"CrateLiquor", "DishCabinetVIPLounge", "MusicStoreCDs", "CrateVHSTapes", "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E46
            note = "dishescabinet @ recreation",
            coords = {x=1242,y=7365,z=-10},
            dist = {"LiquorStoreBrandy", "LiquorStoreGin"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- north bedroom
        { -- E47
            note = "dresser @ bedroom",
            coords = {x=1242,y=7358,z=-10},
            dist = {"ArmyHangarOutfit", "ArmyStorageOutfit", "ArmySurplusOutfit", "LaundryLoad4", "LaundryLoad5", "LaundryLoad6", "LaundryLoad7", "LaundryLoad8"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E48
            note = "counter @ bedroom",
            coords = {x=1239,y=7358,z=-10},
            dist = {"JanitorCleaning","MedicalCabinet","MedicalClinicDrugs", "CrateLinens"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E49
            note = "wardrobe @ bedroom",
            coords = {x=1244,y=7364,z=-10},
            dist = {"ClothingStorageWinter", "GymLaundry"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E50
            note = "wardrobe @ bedroom",
            coords = {x=1243,y=7364,z=-10},
            dist = {"SafehouseArmor", "ArmySurplusOutfit"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        -- generator room/warehouse
        { -- E51
            note = "crate @ warehouse",
            coords = {x=1250,y=7365,z=-10},
            dist = {"GasStoreEmergency","StoreCounterTobacco", "BurglarTools", "CarpenterTools", "BarnTools","SafehouseArmor", "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E52
            note = "crate @ warehouse",
            coords = {x=1251,y=7365,z=-10},
            dist = {"GardenStoreTools", "Homesteading", "CrateLinens", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E53
            note = "counter @ warehouse",
            coords = {x=1252,y=7365,z=-10},
            dist = {"ToolCabinetMechanics","CrateMechanics"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E54
            note = "counter @ warehouse",
            coords = {x=1254,y=7365,z=-10},
            dist = {"ToolStoreMetalwork","CrateBlacksmithing", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E55
            note = "counter @ warehouse",
            coords = {x=1256,y=7365,z=-10},
            dist = {"CrateCarpentry","LoggingFactoryTools", "WoodcraftDudeCounter"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E56
            note = "metal_shelves @ warehouse",
            coords = {x=1256,y=7370,z=-10},
            dist = { "CarSupplyTools", "GasStorageMechanics",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E57
            note = "metal_shelves @ warehouse",
            coords = {x=1256,y=7371,z=-10},
            dist = {"CampingStoreTools", "ArmyHangarTools", "CarSupplyTools", "BurglarTools", "CarpenterTools", "BarnTools", "GarageTools","GigamartTools", "JanitorTools", "LoggingFactoryTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E58
            note = "metal_shelves @ warehouse",
            coords = {x=1256,y=7373,z=-10},
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = {9,12} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E59
            note = "metal_shelves @ warehouse",
            coords = {x=1256,y=7374,z=-10},
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = {8,10} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E60
            note = "metal_shelves @ warehouse",
            coords = {x=1256,y=7376,z=-10},
            dist = {"ArtStorePottery","CrateMasonry" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E61
            note = "metal_shelves @ warehouse",
            coords = {x=1256,y=7377,z=-10},
            dist = {"CrateLumber", "CrateSheetMetal", "ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E62
            note = "metal_shelves @ warehouse",
            coords = {x=1254,y=7370,z=-10},
            dist = {"CrateLumber", "CrateSheetMetal", "ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E63
            note = "metal_shelves @ warehouse",
            coords = {x=1254,y=7371,z=-10},
            dist = {"CrateTailoring", "CrateFabric_Cotton", "CrateFabric_DenimBlack", "CrateLeather","SewingStoreFabric"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- E64
            note = "metal_shelves @ warehouse",
            coords = {x=1254,y=7373,z=-10},
            dist = {"CampingStoreTools", "ArmyHangarTools", "CarSupplyTools", "BurglarTools", "CarpenterTools", "BarnTools", "GarageTools","GigamartTools", "JanitorTools", "LoggingFactoryTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E65
            note = "metal_shelves @ warehouse",
            coords = {x=1254,y=7374,z=-10},
            dist = {"GigamartBreakfast","GigamartCandy","Homesteading","CrateLiquor",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E66
            note = "metal_shelves @ warehouse",
            coords = {x=1254,y=7376,z=-10},
            dist = {"ArmyStorageGuns","ArmyStorageAmmunition","FirearmWeapons_Late"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E67
            note = "metal_shelves @ warehouse",
            coords = {x=1254,y=7377,z=-10},
            dist = {"GunStoreMagsAmmo", "GunStoreAmmunition", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E68
            note = "metal_shelves @ warehouse",
            coords = {x=1252,y=7370,z=-10},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E69
            note = "metal_shelves @ warehouse",
            coords = {x=1252,y=7371,z=-10},
            dist = {"SafehouseTraps","GunStoreKnives","CampingStoreBackpacks","CrateLiquor", "CarSupplyTools","DrugLabOutfit"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E70
            note = "metal_shelves @ warehouse",
            coords = {x=1250,y=7370,z=-10},
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E71
            note = "metal_shelves @ warehouse",
            coords = {x=1250,y=7371,z=-10},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E72
            note = "metal_shelves @ warehouse",
            coords = {x=1248,y=7370,z=-10},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E73
            note = "metal_shelves @ warehouse",
            coords = {x=1248,y=7371,z=-10},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        -- gym
        { -- E74
            note = "metal_shelves @ gym",
            coords = {x=1240,y=7377,z=-10},
            dist = {"FitnessTrainer"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E75
            note = "clothingdryer @ gym",
            coords = {x=1238,y=7371,z=-10},
            dist = {"LaundryLoad1", "LaundryLoad2", "LaundryLoad3", "LaundryLoad4", "LaundryLoad5", "LaundryLoad6", "LaundryLoad7", "LaundryLoad8"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        -- south bedroom
        { -- E76
            note = "filingcabinet @ bedroom",
            coords = {x=1231,y=7371,z=-10},
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E77
            note = "desk @ bedroom",
            coords = {x=1232,y=7371,z=-10},
            dist = {"MusicStoreCDs"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E78
            note = "wardrobe @ bedroom",
            coords = {x=1233,y=7376,z=-10},
            dist = {"ArmyStorageOutfit", "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateBootsArmy", "RandomFiller"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E79
            note = "wardrobe @ bedroom",
            coords = {x=1233,y=7377,z=-10},
            dist = {"CrateVHSTapes"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E80
            note = "dresser @ bedroom",
            coords = {x=1228,y=7377,z=-10},
            dist = {"SafehouseTraps","GunStoreKnives","CampingStoreBackpacks",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E81
            note = "counter @ bedroom",
            coords = {x=1228,y=7373,z=-10},
            dist = {"BathroomCounter", "GasStoreToiletries"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E82
            note = "medicine @ bedroom",
            coords = {x=1228,y=7373,z=-10},
            slot = "upper",
            dist = {"BathroomCounter", "SafehouseMedical"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
    },
}

-- if getActivatedMods():contains("\\Gelevator") then
--     table.insert(QuillManor.objectSpawns, { sprite = "blends_natural_01_23", x = 1228, y = 7363, z = 0, isFloor = true, })
--     table.insert(QuillManor.objectSpawns, { sprite = "blends_natural_01_23", x = 1227, y = 7363, z = 0, isFloor = true, })
--     table.insert(QuillManor.objectSpawns, { sprite = "blends_natural_01_23", x = 1226, y = 7363, z = 0, isFloor = true, })
-- else
--     table.insert(QuillManor.objectSpawns, { sprite = "fixtures_railings_01_29", x = 1226, y = 7363, z = 0, })
--     table.insert(QuillManor.objectSpawns, { sprite = "fixtures_railings_01_29", x = 1227, y = 7363, z = 0, })
--     table.insert(QuillManor.objectSpawns, { sprite = "fixtures_railings_01_29", x = 1228, y = 7363, z = 0, })
--     table.insert(QuillManor.objectSpawns, { sprite = "fixtures_railings_01_28", x = 1229, y = 7363, z = 0, })
--     table.insert(QuillManor.objectSpawns, { x = 1226, y = 7378, z = -10, removeWall = "north", })
-- end
return QuillManor