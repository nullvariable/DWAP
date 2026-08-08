local wtc1 = {x = 10773, y = 10551, z = -1,}
local pb1 = { x = 10771, y = 10551, z = -1 }
local RustyRifle = {
    group = "Muldraugh",
    baseBuildings = {
        { x = 10748, y = 10543, z = 1 }, --main bar
        { x = 10764, y = 10544, z = -1 }, --bar basement
        { x = 10765, y = 10553, z = -1 }, --extended basement
        { x = 10778, y = 10574, z = 0 }, --workshop/booze storage
        { x = 10763, y = 10529, z = 0 }, --shed
    },
    spawn = { x = 10748, y = 10543, z = 1 },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 10770, y = 10551, z = pb1.z },
            fuelTank = { sprite = "dwap_tiles_01_24", x= 10768, y= 10551, z= -1, },
            fakeGenerators = {
                { x = 10759, y = 10549, z = -1, createTile = true },
                { x = 10775, y = 10566, z = -1, createTile = true },
            },
        },
    },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc1.x, y = wtc1.y, z = wtc1.z, sourceType="generator", source = {x = 10770, y = 10551, z = -1} },
    },
    waterFixtures = {
        -- owner's suite
        { sprite = "fixtures_sinks_01_5", x = 10753, y = 10546, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_33", x = 10753, y = 10544, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_2", x = 10754, y = 10544, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_0", x = 10755, y = 10544, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        -- kitchen
        { sprite = "fixtures_sinks_01_10", x = 10755, y = 10543, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_10", x = 10755, y = 10544, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        -- restrooms
        { sprite = "fixtures_sinks_01_13", x = 10768, y = 10545, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_13", x = 10768, y = 10544, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_0", x = 10768, y = 10542, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_0", x = 10769, y = 10542, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_0", x = 10770, y = 10542, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        -- shelter
        { sprite = "fixtures_bathroom_01_3", x = 10764, y = 10557, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_16", x = 10760, y = 10556, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_17", x = 10764, y = 10562, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
    },
    doorKeys = {
        name = "Rusty Rifle",
        doors = {
            { sprite = "location_community_church_small_01_65", x = 10761, y = 10554, z = 0, },
            { sprite = "fixtures_doors_01_7", x = 10776, y = 10575, z = 0, },
            { sprite = "fixtures_doors_01_29", x = 10762, y = 10531, z = 0, },
            { sprite = "fixtures_doors_01_37", x = 10750, y = 10595, z = 0, },
            { sprite = "fixtures_doors_01_9", x = 10765, y = 10548, z = -1, },
        },
    },
    map = { name = "DWAPStashMap23", },
    objectSpawns = {
        -- { sprite = "crafted_01_11", x = wtc1.x, y = wtc1.y, z = wtc1.z, enabled = "EnableWaterSystem", }, -- invisible "tank" to simulate the well
        -- { sprite = "camping_01_64", x = 10776, y = 10563, z = 0, enabled = "EnableWaterSystem", }, -- fountain
        { sprite = "industry_02_175", x = pb1.x, y = pb1.y, z = pb1.z, disabled = "EnableGenSystemSolar", clearExisting = true, },

        -- { sprite = "fixtures_railings_01_29", x = 10777, y = 10577, z = 0, clearExisting = true, }, -- basement railing
        -- { sprite = "fixtures_railings_01_29", x = 10778, y = 10577, z = 0, clearExisting = true, }, -- basement railing
        -- { sprite = "fixtures_railings_01_29", x = 10779, y = 10577, z = 0, clearExisting = true, }, -- basement railing
        -- { sprite = "fixtures_railings_01_28", x = 10780, y = 10577, z = 0, clearExisting = true, }, -- basement railing
        -- { sprite = "fixtures_railings_01_31", x = 10780, y = 10577, z = 0, }, -- basement railing

        -- -- between basements door
        -- { sprite = "location_sewer_01_19", x = 10765, y = 10548, z = -1, replaceWall = true, },
        -- { sprite = "fixtures_doors_01_9", x = 10765, y = 10548, z = -1, isDoor = true, doorN = true, },
        -- { sprite = "location_sewer_01_0", x = 10766, y = 10548, z = -1, replaceWall = true, },

        -- basement bookshelves
        -- { sprite = "furniture_shelving_01_40", x = 10764, y = 10542, z = -1, isContainer = true, clearExisting = false, },
        -- { sprite = "furniture_shelving_01_40", x = 10765, y = 10542, z = -1, isContainer = true, clearExisting = false, },
        -- { sprite = "furniture_shelving_01_40", x = 10766, y = 10542, z = -1, isContainer = true, clearExisting = false, },

        { barricade = "metalbar", enabled = "Barricade", target="walls_exterior_wooden_01_33", x = 10748, y = 10548, z = 1, },
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_doors_01_5", x = 10748, y = 10548, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_exterior_wooden_01_33", x = 10754, y = 10548, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target="walls_exterior_wooden_01_33", x = 10754, y = 10548, z = 1, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_exterior_wooden_01_33", x = 10757, y = 10555, z = 0, },
        { barricade = "wood", enabled = "Barricade", target="walls_exterior_wooden_01_33", x = 10759, y = 10555, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="location_community_church_small_01_65", x = 10761, y = 10555, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_exterior_wooden_01_33", x = 10764, y = 10555, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_exterior_wooden_01_33", x = 10766, y = 10555, z = 0, },
    },
    loot = {
        -- owner suite
        -- bedroom
        { -- E1
            coords = {x=10747,y=10543,z=1},
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E2
            coords = {x=10750,y=10542,z=1},
            dist = {"ArmyStorageOutfit", "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateBootsArmy"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E3
            coords = {x=10749,y=10544,z=1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E4
            coords = {x=10750,y=10544,z=1},
            dist = {"SafehouseArmor", "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        -- hallway
        { -- E5
            coords = {x=10751,y=10542,z=1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E6
            coords = {x=10752,y=10542,z=1},
            dist = {"CrateToiletPaper"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E7
            coords = {x=10753,y=10542,z=1},
            dist = {"CrateLiquor", "DishCabinetVIPLounge"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E8
            coords = {x=10754,y=10542,z=1},
            special = "essentials",
        },
        { -- E9
            coords = {x=10755,y=10542,z=1},
            dist = {"GasStoreEmergency", "StoreCounterTobacco", "CandyStoreSnacks"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- living room
        { -- E10
            coords = {x=10750,y=10545,z=1},
            dist = {"MusicStoreCDs"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        -- kitchen
        { -- E11
            coords = {x=10753,y=10546,z=1},
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E12
            coords = {x=10755,y=10546,z=1},
            slot = "upper",
            dist = {"ButcherSpices","GigamartSpices","GroceryBagGourmet","CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- bathroom
        { -- E13
            coords = {x=10754,y=10544,z=1},
            dist = {"MedicalClinicDrugs", "SafehouseMedical","BathroomCounter" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        -- storage closet
        { -- E14
            coords = {x=10766,y=10543,z=1},
            dist = {"ButcherSpices","GigamartSpices","GroceryBagGourmet",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E15
            coords = {x=10766,y=10542,z=1},
            dist = {"CrateFishing", "FishermanTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E16
            coords = {x=10767,y=10542,z=1},
            dist = {"HuntingLockers", "RangerTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        -- main floor
        -- bar area
        { -- E17
            coords = {x=10756,y=10544,z=0},
            dist = {"CrateLiquor"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E18
            coords = {x=10756,y=10543,z=0},
            dist = {"CrateLiquor", "DishCabinetVIPLounge"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E19
            coords = {x=10756,y=10542,z=0},
            dist = {"StoreKitchenCafe"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E20
            coords = {x=10758,y=10542,z=0},
            dist = {"LiquorStoreBeer","LiquorStoreBeerFancy","LiquorStoreWine"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E21
            coords = {x=10760,y=10542,z=0},
            dist = {"CrateLiquor", "DishCabinetVIPLounge", "DishCabinetLiquor"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E22
            coords = {x=10762,y=10542,z=0},
            dist = {"CrateTortillaChips", "KitchenDryFood"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E23
            coords = {x=10759,y=10544,z=0},
            dist = {"CrateTortillaChips", "KitchenDryFood"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E24
            coords = {x=10762,y=10544,z=0},
            dist = {"ArmyStorageOutfit", "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateBootsArmy"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        -- main kitchen
        { -- E25
            coords = {x=10755,y=10545,z=0},
            dist = {"FridgeFarmStorage", "FridgeGeneric"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E26
            coords = {x=10755,y=10544,z=0},
            dist = {"LaundryCleaning", "JanitorCleaning"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E27
            coords = {x=10755,y=10543,z=0},
            dist = {"GigamartCannedFood", "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E28
            coords = {x=10755,y=10542,z=0},
            dist = {"GigamartCannedFood", "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E29
            coords = {x=10753,y=10542,z=0},
            dist = {"GigamartDryGoods", "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E30
            coords = {x=10752,y=10542,z=0},
            dist = {"GigamartBreakfast","GigamartCandy"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E31
            coords = {x=10753,y=10547,z=0},
            dist = {"FreezerIceCream", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E32
            coords = {x=10754,y=10547,z=0},
            dist = {"SushiKitchenFreezer", "WesternKitchenFreezer", "BakeryKitchenFreezer"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- garage
        { -- E33
            coords = {x=10747,y=10546,z=0},
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E34
            coords = {x=10747,y=10545,z=0},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E35
            coords = {x=10747,y=10544,z=0},
            dist = {"CampingStoreTools", "ArmyHangarTools", "CarSupplyTools", "BurglarTools", "CarpenterTools", "BarnTools", "CrateTools", "GarageTools","GigamartTools", "JanitorTools", "LoggingFactoryTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E36
            coords = {x=10747,y=10542,z=0},
            slot = "upper",
            dist = {"CampingStoreBackpacks","CrateLinens"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E37
            coords = {x=10751,y=10542,z=0},
            dist = { "GunStoreKnives", "PawnShopKnives",  },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        -- basement
        -- first room
        { -- E38
            coords = {x = 10764, y = 10542, z = -1,},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E39
            coords = {x = 10765, y = 10542, z = -1,},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E40
            coords = {x = 10766, y = 10542, z = -1,},
            dist = {"BookstoreBiography", "MedicalOfficeBooks", "LibraryMedical", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E41
            coords = {x=10767,y=10547,z=-1},
            dist = {"FreezerIceCream", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E42
            coords = {x=10766,y=10547,z=-1},
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E43
            coords = {x=10766,y=10550,z=-1},
            dist = {"FreezerIceCream", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E44
            coords = {x=10766,y=10551,z=-1},
            dist = {"SushiKitchenFreezer", "WesternKitchenFreezer", "BakeryKitchenFreezer"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E45
            coords = {x=10766,y=10552,z=-1},
            dist = {"FridgeFarmStorage", "FridgeGeneric"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- shelter room
        { -- E46
            coords = {x=10763,y=10557,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E47
            coords = {x=10762,y=10557,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E48
            coords = {x=10760,y=10557,z=-1},
            dist = {"BakeryKitchenFreezer"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E49
            coords = {x=10760,y=10557,z=-1},
            slot = "upper",
            dist = {"ArmyStorageAmmunition", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E50
            coords = {x=10760,y=10556,z=-1},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E51
            coords = {x=10760,y=10556,z=-1},
            slot = "upper",
            dist = {"CampingStoreTools", "ArmyHangarTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E52
            coords = {x=10760,y=10555,z=-1},
            dist = {"GigamartBakingMisc", "CrateFlour", "CrateOilVegetable" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E53
            coords = {x=10760,y=10555,z=-1},
            slot = "upper",
            dist = { "CrateFlour", "CrateOilVegetable" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- gambling room
        { -- E54
            coords = {x=10761,y=10562,z=-1},
            dist = {"ArmyStorageGuns","ArmyStorageAmmunition"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E55
            coords = {x=10762,y=10562,z=-1},
            dist = {"CrateLiquor", "DishCabinetVIPLounge"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = 3,
        },
        { -- E56
            coords = {x=10763,y=10562,z=-1},
            dist = {"CrateLiquor", "DishCabinetVIPLounge"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = 3,
        },
        { -- E57
            coords = {x=10764,y=10562,z=-1},
            dist = {"SafehouseTraps", "ArmyStorageAmmunition"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        -- workshop area
        { -- E58
            coords = {x=10782,y=10575,z=0},
            slot = "upper",
            dist = {"ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E59
            coords = {x=10782,y=10573,z=0},
            dist = {"CrateSheetMetal","CrateLumber" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E60
            coords = {x=10782,y=10572,z=0},
            dist = {"CrateSheetMetal","CrateLumber" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E61
            coords = {x=10782,y=10570,z=0},
            dist = {"CrateSheetMetal","CrateLumber" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E62
            coords = {x=10781,y=10570,z=0},
            dist = {"CampingStoreTools", "ArmyHangarTools", "CarSupplyTools", "BurglarTools", "CarpenterTools", "BarnTools", "CrateTools", "GarageTools","GigamartTools", "JanitorTools", "LoggingFactoryTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E63
            coords = {x=10780,y=10570,z=0},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E64
            coords = {x=10779,y=10570,z=0},
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = {9,12} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E65
            coords = {x=10782,y=10568,z=0},
            dist = {"SewingStoreTools","SewingStoreFabric", "CrateLeather"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- E66
            coords = {x=10781,y=10568,z=0},
            dist = {"CampingStoreTools", "ArmyHangarTools", "GasStorageMechanics", "BurglarTools", "CarpenterTools", "BarnTools", "CrateTools", "GarageTools","GigamartTools", "JanitorTools", "LoggingFactoryTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E67
            coords = {x=10780,y=10568,z=0},
            dist = {"CrateTortillaChips", "KitchenDryFood"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E68
            coords = {x=10779,y=10568,z=0},
            sandboxEnable = 'SeedLibrary',
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = {8,10} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E69
            coords = {x=10782,y=10566,z=0},
            dist = {"SafehouseTraps", "ArmyStorageAmmunition"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E70
            coords = {x=10781,y=10566,z=0},
            dist = {"ArmyStorageGuns",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E71
            coords = {x=10780,y=10566,z=0},
            dist = {"ArmyStorageElectronics", "ToolFactoryIngots" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E72
            coords = {x=10779,y=10566,z=0},
            dist = {"MedicalClinicDrugs", "SafehouseMedical" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        -- shed out back
        { -- E73
            coords = {x=10761,y=10531,z=0},
            dist = {"CampingStoreTools", "ArmyHangarTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E74
            coords = {x=10761,y=10530,z=0},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E75
            coords = {x=10761,y=10528,z=0},
            slot = "upper",
            dist = {"CrateFishing", "FishermanTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E76
            coords = {x=10762,y=10528,z=0},
            slot = "upper",
            dist = {"ArtStorePottery",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E77
            coords = {x=10763,y=10528,z=0},
            dist = {"HuntingLockers", "RangerTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(RustyRifle.objectSpawns, { enabled = "EnableLadders", x = 10752, y = 10547, z = 0, removeFloor = true, })
else
    table.insert(RustyRifle.objectSpawns, { sprite = "location_sewer_01_0", x = 10765, y = 10548, z = -1, replaceWall = false, })
end


return RustyRifle