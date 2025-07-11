local wtc = {x = 12718, y = 8739, z = -1}
local bunkerTopLeft = {x = 12716, y = 8729, z = -1}
local generator = {x = 12723, y = 8739, z = -1}
local HuntingCabin = {
    spawn = { x = 12722, y = 8749, z = 1 },
    waterTanks = {
        { sprite = "industry_02_72", x = wtc.x, y = wtc.y, z = wtc.z, sourceType="generator", source = {x = generator.x, y = generator.y, z = generator.z} },
    },
    waterFixtures = {
        -- basement
        { sprite = "fixtures_sinks_01_16", x = 12716, y = 8733, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_6", x = 12718, y = 8737, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- 1st floor
        { sprite = "fixtures_sinks_01_5", x = 12716, y = 8745, z = 0, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "appliances_laundry_01_6", x = 12714, y = 8749, z = 0, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "appliances_laundry_01_2", x = 12713, y = 8749, z = 0, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- 2nd floor
        { sprite = "fixtures_sinks_01_20", x = 12716, y = 8751, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_55", x = 12719, y = 8751, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_2", x = 12719, y = 8749, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
    },
    generators = {
        {
            controls = { sprite = "industry_02_67", x = generator.x, y = generator.y, z = generator.z, },
            chunks = {
                {1589, 1091},
                {1589, 1092},
                {1589, 1093},
                {1590, 1092},
                {1590, 1093},
            },
        },
    },
    doorKeys = {
        name = "Hunting Cabin Key",
        doors = {
            { sprite = "fixtures_doors_02_4", x = 12724, y = 8749, z = 0, },
            { sprite = "fixtures_doors_01_4", x = 12716, y = 8744, z = 0, },
        },
    },
    map = { name = "DWAPStashMap34", },
    objectSpawns = {
        { x = 8709, y = 15310, z = 0, removeWall = "north" },
        { x = 8709, y = 15309, z = 0, clearExisting = true, },
        { x = 8709, y = 15308, z = 0, clearExisting = true, },
        { x = 8709, y = 15307, z = 0, clearExisting = true, },

        { barricade = "woodhalf", enabled = "Barricade", target="walls_exterior_wooden_01_32", x = 12713, y = 8750, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_exterior_wooden_01_32", x = 12713, y = 8751, z = 0, },
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
        {
            type = 'container',
            coords = {x=12716,y=8742,z=-1},
            dist = {"GardenStoreTools", "Homesteading", "CrateLinens", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        {
            type = 'container',
            coords = {x=12719,y=8742,z=-1},
            dist = {"CrateFishing", "FishermanTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        ------------------
        --- Main Floor ---
        ------------------
        { -- wood pile
            type = 'container',
            coords = {x=12718,y=8754,z=0},
            items = {
                { name = 'Base.Firewood', chance = 1, count = {30,30} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        -- kitchen
        {
            type = 'container',
            coords = {x=12716,y=8749,z=0},
            dist = {"WesternKitchenFreezer", },
            distIncludeJunk = false,
            randUntilFull = true,
            frozen = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=12713,y=8746,z=0},
            dist = {"GroceryBagGourmet","CrateFlour","CrateOilVegetable",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=12713,y=8745,z=0},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=12715,y=8745,z=0},
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=12716,y=8745,z=0},
            dist = {"GigamartDryGoods", "GigamartBreakfast"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- living room
        {
            type = 'container',
            coords = {x=12723,y=8753,z=0},
            dist = {"CrateVHSTapes"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        {
            type = 'container',
            coords = {x=12720,y=8753,z=0},
            dist = {"CrateLiquor", "DishCabinetVIPLounge", "LivingRoomShelfClassy", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        {
            type = 'container',
            coords = {x=12718,y=8750,z=0},
            dist = {"SafehouseTraps","GunStoreKnives","CampingStoreBackpacks","CrateLiquor", "CarSupplyTools","DrugLabOutfit"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=12718,y=8749,z=0},
            dist = {"CrateLiquor", "LiquorStoreWhiskey"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- office/workroom
        {
            type = 'container',
            coords = {x=12714,y=8753,z=0},
            items = {
                { name = 'Base.NailsBox', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=12713,y=8753,z=0},
            dist = {"CrateLumber", "CrateSheetMetal", "ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=12713,y=8752,z=0},
            dist = {"CrateLumber", "CrateSheetMetal", "ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=12713,y=8750,z=0},
            dist = {"ArmyStorageAmmunition", "SafehouseTraps", "GunStoreKnives",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=12714,y=8750,z=0},
            dist = {"MeleeWeapons", "SafehouseTraps", "GunStoreKnives",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        -----------------
        --- 2nd Floor ---
        -----------------
        -- bathroom
        {
            type = 'container',
            coords = {x=12717,y=8751,z=1},
            dist = {"CrateToiletPaper"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=12717,y=8751,z=1.5},
            dist = {"MedicalCabinet","BathroomCounter", "GasStoreToiletries"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=12716,y=8751,z=1},
            dist = {"JanitorCleaning","MedicalCabinet","MedicalClinicDrugs", "CrateLinens"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        -- bunk bed bedroom
        {
            type = 'container',
            coords = {x=12713,y=8749,z=1},
            dist = {"LaundryLoad1", "LaundryLoad2", "LaundryLoad3", "LaundryLoad4", "LaundryLoad5", "LaundryLoad6", "LaundryLoad7", "LaundryLoad8"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=12713,y=8748,z=1},
            dist = {"CrateTailoring", "CrateFabric_Cotton", "CrateFabric_DenimBlack", "CrateLeather","SewingStoreFabric"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        -- main bedroom
        {
            type = 'container',
            coords = {x=12720,y=8751,z=1},
            dist = {"TheatrePopcorn", "TheatreSnacks"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=12722,y=8747,z=1},
            dist = {"ArmyStorageOutfit", "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateBootsArmy"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=12723,y=8747,z=1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=12723,y=8751,z=1},
            dist = {"GasStoreEmergency","StoreCounterTobacco", "SafehouseArmor", "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
    },
}

-- if getActivatedMods():contains("\\Ladders") then
--     table.insert(HuntingCabin.objectSpawns, { x = 8712, y = 15311, z = -1, removeWall = "west" })
--     table.insert(HuntingCabin.objectSpawns, { sprite = "walls_exterior_wooden_01_26", x = 8716, y = 15314, z = 0, removeFloor = true, clearExisting = true, })
--     table.insert(HuntingCabin.objectSpawns, { sprite = "location_sewer_01_33", x = 8716, y = 15314, z = 0, })
--     table.insert(HuntingCabin.objectSpawns, { x = 8716, y = 15314, z = 1, removeFloor = true, clearExisting = true, })
-- else
--     -- table.insert(HuntingCabin.objectSpawns, { sprite = "industry_trucks_01_4", x = 2607, y = 14453, z = -1, replaceWall = true, })
-- end
return HuntingCabin