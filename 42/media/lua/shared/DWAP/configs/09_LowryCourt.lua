local wtc = {x = 12980, y = 1920, z = 0} -- waterTankCoords
local bunkerTopLeft = {x = 12981, y = 1907, z = -1}
local LowryCourt = {
    spawn = { x = 12993, y = 1914, z = 2 },
    waterTanks = {
        { sprite = "industry_02_73", x = wtc.x, y = wtc.y, z = wtc.z, sourceType="generator", source = {x = 12989, y = 1912, z = 0} },
    },
    waterFixtures = {
        { sprite = "fixtures_sinks_01_8", x = 12989, y = 1912, z = 2, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_21", x = 12996, y = 1912, z = 2, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_26", x = 12996, y = 1911, z = 2, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_0", x = 12998, y = 1911, z = 2, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },

        { sprite = "fixtures_sinks_01_10", x = 12986, y = 1912, z = 2, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_13", x = 12987, y = 1913, z = 2, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_55", x = 12988, y = 1911, z = 2, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_1", x = 12997, y = 1912, z = 2, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },

        { sprite = "fixtures_sinks_01_9", x = 12976, y = 1914, z = 2, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_29", x = 12978, y = 1918, z = 2, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_2", x = 12978, y = 1919, z = 2, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_55", x = 12978, y = 1920, z = 2, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },

        { sprite = "fixtures_bathroom_01_6", x = 12983, y = 1915, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_16", x = 12981, y = 1911, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
    },
    doorKeys = {
        name = "Lowry Court",
        doors = {
            { sprite = "fixtures_doors__fences_01_21", x = 12995, y = 1924, z = 0, },
            { sprite = "fixtures_doors__fences_01_21", x = 12995, y = 1923, z = 0, },
            { sprite = "fixtures_doors_01_52", x = 12993, y = 1909, z = 0, },
            { sprite = "fixtures_doors_01_52", x = 12992, y = 1909, z = 0, },
            { sprite = "fixtures_doors_01_57", x = 12994, y = 1911, z = 2, },
        },
    },
    map = { name = "DWAPStashMap9", },
    generators = {
        {
            controls = { sprite = "industry_02_67", x = 12989, y = 1912, z = 0, ghost = false, },
            chunks = {
                {1623, 239}, -- generator chunk
                {1620, 240},
                {1621, 240},
                {1622, 240},
                {1623, 240},
                {1624, 240},
                {1625, 240},
                {1620, 239},
                {1621, 239},
                {1622, 239},
                {1623, 239},
                {1624, 239},
                {1625, 239},
                {1620, 238},
                {1621, 238},
                {1622, 238},
                {1623, 238},
                {1624, 238},
                {1625, 238},
            },
        },
    },
    objectSpawns = {
        { sprite = "camping_01_16", x = 12989, y = 1897, z = 0, enabled = "EnableWaterSystem", }, -- fountain

        { sprite = "constructedobjects_01_45", x = 12982, y = 1919, z = 0, clearExisting = false, isContainer = true, },
        { barricade = "metalbar", enabled = "Barricade", target="walls_commercial_01_57", x = 12989, y = 1923, z = 2, },
        { barricade = "metalbar", enabled = "Barricade", target="walls_commercial_01_57", x = 12994, y = 1924, z = 2, },
        { barricade = "metalbar", enabled = "Barricade", target="walls_commercial_01_57", x = 12998, y = 1924, z = 2, },
        { barricade = "metalbar", enabled = "Barricade", target="walls_commercial_01_57", x = 13002, y = 1924, z = 2, },

        { x = 12983, y = 1916, z = 0, clearExisting = true, },
        { x = 12983, y = 1917, z = 0, clearExisting = true, },
        { x = 12983, y = 1918, z = 0, clearExisting = true, },

        { sprite = "constructedobjects_01_45", x = 12994, y = 1908, z = 2, clearExisting = false, isContainer = true, },
        { sprite = "appliances_cooking_01_16", x = 12989, y = 1915, z = 2, isFireplace = true, },

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
    },
    loot = {
        {
            type = 'container',
            coords = {x = 12982, y = 1919, z = 0},
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
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
            dist = {"SafehouseTraps","GunStoreKnives","CampingStoreBackpacks","CrateLiquor", "CarSupplyTools","GasStorageMechanics","DrugLabOutfit"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },

        -- 2nd floor
        {
            type = 'container',
            coords = {x = 12994, y = 1908, z = 2},
            dist = {"GasStoreEmergency"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = 2,
        },
        {
            type = 'container',
            coords = {x=12995,y=1911,z=2.5},
            dist = {"BurglarTools", "CarpenterTools", "BarnTools", "WeldingWorkshopTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=12991,y=1911,z=2},
            dist = {"GigamartTools", "JanitorTools", "WeldingWorkshopTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=12992,y=1911,z=2},
            dist = {"SushiKitchenFreezer", "WesternKitchenFreezer", "BakeryKitchenFreezer"},
            distIncludeJunk = true,
            randUntilFull = true,
            frozen = true,
            level = "Loot_ToolsLevel",
        },

        {
            type = 'container',
            coords = {x=12993,y=1922,z=2},
            dist = {"CrateVHSTapes"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        {
            type = 'container',
            coords = {x=12992,y=1916,z=2},
            dist = {"BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        {
            type = 'container',
            coords = {x=12996,y=1923,z=2},
            items = {
                { name = 'Base.Remote', chance = 1, count = {1,1} },
                { name = 'Base.VideoGame', chance = 1, count = {1,1} },
                { name = 'Base.Headphones', chance = 1, count = {1,1} },
                { name = 'Base.CDplayer', chance = 1, count = {1,1} },
                { name = 'Base.Bullhorn', chance = 0.5, count = {1,1} },
                { name = 'Base.VHS_Retail', chance = 1, count = {30,30} },
            },
        },
        {
            type = 'container',
            coords = {x=12989,y=1919,z=2},
            dist = {"CarSupplyTools", "GasStorageMechanics",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=12990,y=1919,z=2},
            dist = {"HuntingLockers", "RangerTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        {
            type = 'container',
            coords = {x=12989,y=1922,z=2},
            dist = { "GunStoreKnives",  "PawnShopKnives","CampingStoreBackpacks" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=12992,y=1923,z=2},
            dist = {"SafehouseArmor", "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=12990,y=1911,z=2},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=12989,y=1911,z=2},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=12989,y=1912,z=2},
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=12989,y=1913,z=2},
            dist = {"StoreKitchenBaking",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=13002,y=1911,z=2},
            dist = {"CrateLiquor", "DishCabinetVIPLounge"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=13003,y=1911,z=2},
            dist = {"CrateLiquor", "DishCabinetVIPLounge"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=12996,y=1913,z=2},
            dist = {"ArmyStorageMedical", "ArmyBunkerMedical"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        {
            type = 'container',
            coords = {x=13002,y=1919,z=2},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=13000,y=1920,z=2},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=13000,y=1923,z=2},
            dist = {"ArmyStorageOutfit", "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateLinens"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=12996,y=1912,z=2},
            dist = {"CrateLeather", "SewingStoreFabric", "SewingStoreTools", "BathroomCounter",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        -- {
        --     type = 'container',
        --     coords = {x=10155,y=6621,z=1},
        --     dist = {"ArmyStorageOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "ToolStoreOutfit"},
        --     distIncludeJunk = true,
        --     randUntilFull = true,
        --     level = "Loot_LockersLevel",
        -- },
        -- {
        --     type = 'container',
        --     coords = {x=10153,y=6620,z=1},
        --     dist = {"BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
        --     distIncludeJunk = false,
        --     randUntilFull = true,
        --     level = "Loot_MediaLevel",
        -- },
        {
            type = 'container',
            coords = {x=13003,y=1919,z=2},
            dist = {"FirearmWeapons_Late", "SafehouseTraps", "ArmyStorageAmmunition", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(LowryCourt.objectSpawns, { sprite = "industry_trucks_01_15", x = 12982, y = 1920, z = -1, removeWall = "north" })
    table.insert(LowryCourt.objectSpawns, { sprite = "fixtures_doors_frames_01_5", x = 12982, y = 1920, z = -1, })
    table.insert(LowryCourt.objectSpawns, { sprite = "fixtures_doors_01_53", x = 12982, y = 1920, z = -1, isDoor = true, doorN = true, })
    table.insert(LowryCourt.objectSpawns, { x = 12939, y = 1933, z = 0, removeFloor = true, })
    table.insert(LowryCourt.objectSpawns, { sprite = "walls_interior_house_04_16", x = 12940, y = 1933, z = 0, })
    table.insert(LowryCourt.generators[1].chunks, { 1622, 241 })
    table.insert(LowryCourt.generators[1].chunks, { 1621, 241 })
    table.insert(LowryCourt.generators[1].chunks, { 1620, 241 })
    table.insert(LowryCourt.generators[1].chunks, { 1619, 241 })

    -- ladder to 3rd floor
    table.insert(LowryCourt.objectSpawns, { sprite = "location_sewer_01_33", x = 12989, y = 1918, z = 0, })
    table.insert(LowryCourt.objectSpawns, { sprite = "walls_interior_house_02_49", x = 12989, y = 1918, z = 0, })
    table.insert(LowryCourt.objectSpawns, { sprite = "walls_interior_house_02_50", x = 12989, y = 1917, z = 0, })
    table.insert(LowryCourt.objectSpawns, { sprite = "walls_interior_house_02_48", x = 12990, y = 1917, z = 0, })
    table.insert(LowryCourt.objectSpawns, { sprite = "walls_interior_house_02_51", x = 12990, y = 1918, z = 0, })
    table.insert(LowryCourt.objectSpawns, { sprite = "location_sewer_01_33", x = 12989, y = 1918, z = 1, })
    table.insert(LowryCourt.objectSpawns, { sprite = "industry_trucks_01_6", x = 12989, y = 1918, z = 1, removeWall = "west", removeFloor = true, })
    table.insert(LowryCourt.objectSpawns, { sprite = "walls_interior_house_03_16", x = 12990, y = 1918, z = 1, })
    table.insert(LowryCourt.objectSpawns, { x = 12989, y = 1918, z = 2, removeFloor = true, clearExisting = true, })
    table.insert(LowryCourt.objectSpawns, { sprite = "walls_interior_house_03_16", x = 12990, y = 1918, z = 2, clearExisting = true, })
    table.insert(LowryCourt.objectSpawns, { sprite = "furniture_shelving_01_41", x = 12990, y = 1918, z = 2, })
    table.insert(LowryCourt.objectSpawns, { x = 12989, y = 1917, z = 2, clearExisting = true, })
    table.insert(LowryCourt.objectSpawns, { sprite = "furniture_shelving_01_41", x = 12990, y = 1917, z = 2, clearExisting = true, })
end

return LowryCourt