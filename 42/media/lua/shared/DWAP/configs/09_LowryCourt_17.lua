local wtc = { x = 12980, y = 1920, z = 0 } -- waterTankCoords
local pb1 = { x = 12981, y = 1922, z = -1 }
local bunkerTopLeft = { x = 12981, y = 1907, z = -1 }
local LowryCourt = {
    group = "Louisville",
    baseBuildings = {
        { x = 12993, y = 1914, z = 2 },  -- apartment building
        { x = 12981, y = 1907, z = -1 }, -- bunker
    },
    baseRooms = {
        { x = 12992, y = 1912, z = 2 },  -- kitchen
        { x = 12993, y = 1914, z = 2 },  -- livingroom
        { x = 12992, y = 1919, z = 2 },  -- kidsbedroom
        { x = 13000, y = 1919, z = 2 },  -- bedroom
        { x = 12999, y = 1912, z = 2 },  -- diningroom
        { x = 12996, y = 1912, z = 2 },  -- bathroom
        { x = 12992, y = 1912, z = 0 },  -- storage
        { x = 12981, y = 1916, z = -1 }, -- bunker
        { x = 12981, y = 1912, z = -1 }, -- bunker
    },
    spawn = { x = 12993, y = 1914, z = 2 },
    waterTanks = {
        { sprite = "industry_02_73", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = { x = 12989, y = 1912, z = 0 } },
    },
    waterFixtures = {
        { sprite = "fixtures_sinks_01_8",     x = 12989, y = 1912, z = 2,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_21",    x = 12996, y = 1912, z = 2,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_26", x = 12996, y = 1911, z = 2,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_0",  x = 12998, y = 1911, z = 2,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

        { sprite = "fixtures_sinks_01_10",    x = 12986, y = 1912, z = 2,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_13",    x = 12987, y = 1913, z = 2,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_55", x = 12988, y = 1911, z = 2,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_1",  x = 12987, y = 1912, z = 2,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

        { sprite = "fixtures_sinks_01_9",     x = 12976, y = 1914, z = 2,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_29",    x = 12978, y = 1918, z = 2,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_2",  x = 12978, y = 1919, z = 2,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_55", x = 12978, y = 1920, z = 2,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

        { sprite = "fixtures_bathroom_01_6",  x = 12983, y = 1915, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_16",    x = 12981, y = 1911, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
    },
    doorKeys = {
        name = "Lowry Court",
        doors = {
            { sprite = "fixtures_doors__fences_01_21", x = 12995, y = 1924, z = 0, },
            { sprite = "fixtures_doors__fences_01_21", x = 12995, y = 1923, z = 0, },
            { sprite = "fixtures_doors_01_52",         x = 12993, y = 1909, z = 0, },
            { sprite = "fixtures_doors_01_52",         x = 12992, y = 1909, z = 0, },
            { sprite = "fixtures_doors_01_57",         x = 12994, y = 1911, z = 2, },
        },
    },
    map = { name = "DWAPStashMap9", },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 12982, y = 1920, z = 0, },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 12984, y = 1920, z = 0, },
            fakeGenerators = {
                -- { x = 12983, y = 1920, z = -1, createTile = true },
                -- { x = 12984, y = 1916, z = -1, createTile = true },
                { x = 12985, y = 1916, z = -1, createTile = false },
                -- { x = 12992, y = 1924, z = 3, createTile = false },
                { x = 12989, y = 1915, z = 3,  createTile = false },
            },
        },
    },
    objectSpawns = {
        { sprite = "industry_02_175",          x = pb1.x,             y = pb1.y,                         z = pb1.z, disabled = "EnableGenSystemSolar", clearExisting = true, },

        { barricade = "metalbar",              enabled = "Barricade", target = "walls_commercial_01_57", x = 12989, y = 1923,                          z = 2, },
        { barricade = "metalbar",              enabled = "Barricade", target = "walls_commercial_01_57", x = 12994, y = 1924,                          z = 2, },
        { barricade = "metalbar",              enabled = "Barricade", target = "walls_commercial_01_57", x = 12998, y = 1924,                          z = 2, },
        { barricade = "metalbar",              enabled = "Barricade", target = "walls_commercial_01_57", x = 13002, y = 1924,                          z = 2, },

        { sprite = "appliances_cooking_01_16", x = 12989,             y = 1915,                          z = 2,     isFireplace = true, },
    },
    loot = {
        { -- E1
            note = "crate @ storage",
            coords = { x = 12984, y = 1916, z = 0 },
            dist = { "CrateLumber", "CrateSheetMetal", "ArtStorePottery", "CrateMasonry" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E2
            note = "militarycrate @ storage",
            coords = { x = 12984, y = 1917, z = 0 },
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E3
            note = "militarycrate @ storage",
            coords = { x = 12984, y = 1918, z = 0 },
            dist = { "GasStoreEmergency" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = 2,
        },
        { -- E4 cabinet next to bunk beds (9365)
            note = "dresser @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 2, z = bunkerTopLeft.z },
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E5 upper
            sprite = 'location_trailer_02_23',
            note = "overhead @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 3, z = bunkerTopLeft.z },
            slot = "upper",
            dist = { "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E6 lower (66)
            note = "counter @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 3, z = bunkerTopLeft.z },
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E7 upper
            sprite = 'location_trailer_02_23',
            note = "overhead @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 4, z = bunkerTopLeft.z },
            slot = "upper",
            dist = { "ButcherSpices", "GigamartSpices", "GroceryBagGourmet", "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E8 lower (67)
            sprite = 'location_trailer_02_19',
            note = "counter @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 4, z = bunkerTopLeft.z },
            dist = { "TestingLab", "MedicalCabinet", "ArmyStorageMedical", "ArmyBunkerMedical" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E9 upper
            sprite = 'location_trailer_02_23',
            note = "overhead @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 5, z = bunkerTopLeft.z },
            slot = "upper",
            dist = { "CrateFishing", "FishermanTools" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E10 lower (68)
            sprite = 'location_trailer_02_19',
            note = "counter @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 5, z = bunkerTopLeft.z },
            dist = { "SewingStoreTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- E11
            note = "fridge @ bunker",
            coords = { x = 12981, y = 1913, z = -1 },
        },
        { -- E12
            note = "freezer @ bunker",
            coords = { x = 12981, y = 1913, z = -1 },
            slot = "freezer",
        },
        { -- E13 metal shelves (70)
            sprite = 'location_trailer_02_23',
            note = "metal_shelves @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 7, z = bunkerTopLeft.z },
            dist = { "GardenStoreTools", "Homesteading", "CrateLinens", "CrateFarming" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E14 metal shelves (71)
            note = "metal_shelves @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 8, z = bunkerTopLeft.z },
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E15 next to inner door (9372)
            note = "metal_shelves @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 9, z = bunkerTopLeft.z },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E16 (73)
            note = "metal_shelves @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 10, z = bunkerTopLeft.z },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E17 (9374)
            note = "metal_shelves @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 11, z = bunkerTopLeft.z },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E18 far end next to stairs (9375)
            note = "metal_shelves @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 12, z = bunkerTopLeft.z },
            special = "essentials",
        },
        -- rubbish bin going south
        { -- E19
            note = "militarycrate @ bunker",
            coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y + 5, z = bunkerTopLeft.z },
            dist = { "CrateLiquor", "DishCabinetVIPLounge", "MusicStoreCDs", "CrateVHSTapes", "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E20
            note = "militarycrate @ bunker",
            coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y + 5, z = bunkerTopLeft.z },
            stack = 2,
            dist = { "CrateLiquor", "DishCabinetVIPLounge", "MusicStoreCDs", "CrateVHSTapes", "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E21
            note = "militarycrate @ bunker",
            coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y + 6, z = bunkerTopLeft.z },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E22
            note = "militarycrate @ bunker",
            coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y + 7, z = bunkerTopLeft.z },
            dist = { "GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E23
            note = "militarycrate @ bunker",
            coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y + 7, z = bunkerTopLeft.z },
            stack = 2,
            dist = { "GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },

        -- extra spawns
        { -- E24
            note = "crate @ bunker",
            coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y, z = bunkerTopLeft.z },
            dist = { "GasStoreEmergency", "StoreCounterTobacco", "BurglarTools", "CarpenterTools", "BarnTools", "SafehouseArmor", "SafehouseLighting" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E25
            note = "crate @ bunker",
            coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y, z = bunkerTopLeft.z },
            stack = 2,
            dist = { "GasStoreEmergency", "StoreCounterTobacco", "BurglarTools", "CarpenterTools", "BarnTools", "SafehouseArmor", "SafehouseLighting" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E26
            note = "crate @ bunker",
            coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y + 1, z = bunkerTopLeft.z },
            dist = { "SafehouseTraps", "GunStoreKnives", "CampingStoreBackpacks", "CrateLiquor", "CarSupplyTools", "GasStorageMechanics", "DrugLabOutfit" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E27
            note = "crate @ bunker",
            coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y + 1, z = bunkerTopLeft.z },
            stack = 2,
            dist = { "SafehouseTraps", "GunStoreKnives", "CampingStoreBackpacks", "CrateLiquor", "CarSupplyTools", "GasStorageMechanics", "DrugLabOutfit" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },

        -- 2nd floor
        { -- E28
            note = "shelves @ kitchen",
            coords = { x = 12995, y = 1911, z = 2 },
            slot = "upper",
            dist = { "BurglarTools", "CarpenterTools", "BarnTools", "WeldingWorkshopTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E29
            note = "counter @ kitchen",
            coords = { x = 12991, y = 1911, z = 2 },
            dist = { "GigamartTools", "JanitorTools", "WeldingWorkshopTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E30
            note = "fridge @ kitchen",
            coords = { x = 12992, y = 1911, z = 2 },
            dist = { "SushiKitchenFreezer", "WesternKitchenFreezer", "BakeryKitchenFreezer" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E31
            note = "freezer @ kitchen",
            coords = { x = 12992, y = 1911, z = 2 },
            slot = "freezer",
            dist = { "SushiKitchenFreezer", "WesternKitchenFreezer", "BakeryKitchenFreezer" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },

        { -- E32
            note = "sidetable @ livingroom",
            coords = { x = 12993, y = 1922, z = 2 },
            dist = { "CrateVHSTapes" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E33
            note = "shelves @ livingroom",
            coords = { x = 12992, y = 1916, z = 2 },
            dist = { "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E34
            note = "sidetable @ livingroom",
            coords = { x = 12996, y = 1923, z = 2 },
            items = {
                { name = 'Base.Remote',     chance = 1,   count = { 1, 1 } },
                { name = 'Base.VideoGame',  chance = 1,   count = { 1, 1 } },
                { name = 'Base.Headphones', chance = 1,   count = { 1, 1 } },
                { name = 'Base.CDplayer',   chance = 1,   count = { 1, 1 } },
                { name = 'Base.Bullhorn',   chance = 0.5, count = { 1, 1 } },
                { name = 'Base.VHS_Retail', chance = 1,   count = { 30, 30 } },
            },
        },
        { -- E35
            note = "wardrobe @ kidsbedroom",
            coords = { x = 12989, y = 1919, z = 2 },
            dist = { "CarSupplyTools", "GasStorageMechanics", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E36
            note = "wardrobe @ kidsbedroom",
            coords = { x = 12990, y = 1919, z = 2 },
            dist = { "HuntingLockers", "RangerTools" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E37
            note = "sidetable @ kidsbedroom",
            coords = { x = 12989, y = 1922, z = 2 },
            dist = { "GunStoreKnives", "PawnShopKnives", "CampingStoreBackpacks" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E38
            note = "dresser @ kidsbedroom",
            coords = { x = 12992, y = 1923, z = 2 },
            dist = { "SafehouseArmor", "SafehouseLighting" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E39
            note = "counter @ kitchen",
            coords = { x = 12990, y = 1911, z = 2 },
            dist = { "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E40
            note = "counter @ kitchen",
            coords = { x = 12989, y = 1911, z = 2 },
            dist = { "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E41
            note = "counter @ kitchen",
            coords = { x = 12989, y = 1912, z = 2 },
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E42
            note = "counter @ kitchen",
            coords = { x = 12989, y = 1913, z = 2 },
            dist = { "StoreKitchenBaking", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E43
            note = "dishescabinet @ diningroom",
            coords = { x = 13002, y = 1911, z = 2 },
            dist = { "CrateLiquor", "DishCabinetVIPLounge" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E44
            note = "dishescabinet @ diningroom",
            coords = { x = 13003, y = 1911, z = 2 },
            dist = { "CrateLiquor", "DishCabinetVIPLounge" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E45
            note = "counter @ bathroom",
            coords = { x = 12996, y = 1913, z = 2 },
            dist = { "ArmyStorageMedical", "ArmyBunkerMedical" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E46
            note = "wardrobe @ bedroom",
            coords = { x = 13002, y = 1919, z = 2 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E47
            note = "sidetable @ bedroom",
            coords = { x = 13000, y = 1920, z = 2 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E48
            note = "sidetable @ bedroom",
            coords = { x = 13000, y = 1923, z = 2 },
            dist = { "ArmyStorageOutfit", "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateLinens" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E49
            note = "counter @ bathroom",
            coords = { x = 12996, y = 1912, z = 2 },
            dist = { "CrateLeather", "SewingStoreFabric", "SewingStoreTools", "BathroomCounter", },
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
        { -- E50
            note = "wardrobe @ bedroom",
            coords = { x = 13003, y = 1919, z = 2 },
            dist = { "FirearmWeapons_Late", "SafehouseTraps", "ArmyStorageAmmunition", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(LowryCourt.objectSpawns, { enabled = "EnableLadders", x = 12939, y = 1933, z = 0, removeFloor = true, })
    table.insert(LowryCourt.objectSpawns,
        { enabled = "EnableLadders", sprite = "walls_interior_house_04_16", x = 12940, y = 1933, z = 0, })

    table.insert(LowryCourt.generators[1].fakeGenerators, { x = 12951, y = 1931, z = -4, createTile = false })
end

return LowryCourt
