-- @TODO (2026-08-07 audit) unresolved - delete lines as they are fixed
--   * 23 skeleton entries carry coords but no loot yet - entries 32-54
--   * systems: 16 components at 10146-10163,6620-6635 z=-1,0,1 report "square
--     not loaded" - those chunks never stream when travelling to this base,
--     which is what a pre-move or otherwise wrong coordinate looks like
--   * stash buildingX/buildingY still 10162,6622 (pre-move site) - anchors
--     are 10091,7352 / 10083,7371
--   * doorKeys (3) and objectSpawns (6) still point at the old site too,
--     alongside the waterFixtures the audit flags below
local wtc = { x = 10096, y = 7348, z = -1 } -- waterTankCoords
local pb1 = { x = 10088, y = 7347, z = -1 }
local WWestPointSafeHouse = {
    group = "West Point",
    baseBuildings = {
        { x = 10091, y = 7352, z = 0 }, -- shed w/basement
        { x = 10083, y = 7371, z = 0 }, -- house
    },
    spawn = { x = 10083, y = 7371, z = 0 },
    waterTanks = {
        { sprite = "dwap_tiles_01_8", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = { x = 10149, y = 6620, z = -1 } },
    },
    waterFixtures = {
        { sprite = "appliances_laundry_01_3", x = 10157, y = 6622, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_6",     x = 10157, y = 6620, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_29",    x = 10155, y = 6626, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_2",  x = 10155, y = 6627, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_11",    x = 10162, y = 6631, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

        -- 2nd floor
        { sprite = "fixtures_bathroom_01_0",  x = 10152, y = 6625, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_2",     x = 10153, y = 6625, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_2",     x = 10154, y = 6625, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_26", x = 10152, y = 6627, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_13",    x = 10160, y = 6628, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_2",  x = 10163, y = 6629, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_55", x = 10163, y = 6630, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

        -- basement fixtures
        { sprite = "fixtures_sinks_01_35",    x = 10156, y = 6621, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_33", x = 10146, y = 6631, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_16",    x = 10146, y = 6635, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_6",  x = 10148, y = 6631, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
    },
    doorKeys = {
        name = "W West Point Safe House",
        doors = {
            { sprite = "fixtures_doors_02_5",         x = 10157, y = 6633, z = 0, },
            { sprite = "fixtures_doors_02_5",         x = 10157, y = 6632, z = 0, },
            { sprite = "fixtures_doors_fences_01_21", x = 10156, y = 6608, z = 0, },
        },
    },
    map = { name = "DWAPStashMap8", },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 10087, y = 7348, z = pb1.z },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 10085, y = 7348, z = -1, },
            fakeGenerators = {
                { x = 10087, y = 7366, z = -1, createTile = false },
            },
        },
    },
    objectSpawns = {
        { sprite = "industry_02_175", x = pb1.x,             y = pb1.y,                           z = pb1.z, disabled = "EnableGenSystemSolar", clearExisting = true, },

        { barricade = "woodhalf",     enabled = "Barricade", target = "fixtures_doors_02_5",      x = 10157, y = 6633,                          z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_exterior_house_02_9", x = 10160, y = 6632,                         z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_exterior_house_02_9", x = 10162, y = 6632,                         z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_interior_house_04_25", x = 10161, y = 6620,                        z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_interior_house_04_73", x = 10153, y = 6620,                        z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_interior_house_04_72", x = 10149, y = 6623,                        z = 0, },
    },
    loot = {

        { -- E1 cabinet next to bunk beds
            coords = { x = 10084, y = 7365, z = -1 },
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E2 upper
            sprite = 'location_trailer_02_23',
            coords = { x = 10084, y = 7364, z = -1 },
            slot = "upper",
            dist = { "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E3 lower (66)
            coords = { x = 10084, y = 7364, z = -1 },
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E4 upper
            sprite = 'location_trailer_02_23',
            coords = { x = 10084, y = 7363, z = -1 },
            slot = "upper",
            dist = { "ButcherSpices", "GigamartSpices", "GroceryBagGourmet", "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E5 lower (67)
            sprite = 'location_trailer_02_19',
            coords = { x = 10084, y = 7363, z = -1 },
            dist = { "TestingLab", "MedicalCabinet", "ArmyStorageMedical", "ArmyBunkerMedical", "JanitorCleaning" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E6 upper
            sprite = 'location_trailer_02_23',
            coords = { x = 10084, y = 7362, z = -1 },
            slot = "upper",
            dist = { "CrateFishing", "FishermanTools" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E7 lower (68)
            sprite = 'location_trailer_02_19',
            coords = { x = 10084, y = 7362, z = -1 },
            dist = { "CafeKitchenSupplies", "CafeKitchenTea", "CrateSodaBottles" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- E8
        { --crates by shower
            
            coords = { x = 10084, y = 7361, z = -1 },
            dist = { "GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        -- E9
        { --crates by shower
            
            coords = { x = 10084, y = 7360, z = -1 },
            dist = { "GasStoreEmergency", "StoreCounterTobacco", "BurglarTools", "CarpenterTools", "BarnTools", "SafehouseArmor", "SafehouseLighting" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E10
            coords = { x = 10086, y = 7360, z = -1 },
            dist = { "SafehouseTraps", "GunStoreKnives", "CampingStoreBackpacks", "CrateLiquor", "GasStorageMechanics", "DrugLabOutfit" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E11
            coords = { x = 10086, y = 7361, z = -1 },
            dist = { "CrateLiquor", "DishCabinetVIPLounge", "MusicStoreCDs", "CrateVHSTapes", "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E12
            coords = { x = 10086, y = 7362, z = -1 },
            dist = { "GardenStoreTools", "Homesteading", "CrateLinens", "CrateFarming" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E13 mil locker
            coords = { x = 10086, y = 7366, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E14 mil locker
            coords = { x = 10086, y = 7367, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        -- "bunker" entryway
        { -- E15
            coords = { x = 10086, y = 7355, z = -1 },
            special = "essentials",
        },
        { -- E16
            coords = { x = 10086, y = 7356, z = -1 },
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E17
            coords = { x = 10086, y = 7357, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E18
            coords = { x = 10086, y = 7358, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E19
            coords = { x = 10084, y = 7357, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E20
            coords = { x = 10084, y = 7358, z = -1 },
            dist = { "SewingStoreTools", "CrateLeather", "SewingStoreFabric" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },

        -- main basement
        { -- E21
            coords = { x = 10096, y = 7350, z = -1 },
            dist = { "FreezerRich", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E22
            coords = { x = 10094, y = 7350, z = -1 },
            dist = { "FridgeFarmStorage", "FridgeGeneric", "SushiKitchenFridge" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E23
            coords = { x = 10094, y = 7351, z = -1 },
            dist = { "FreezerIceCream", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E24
            coords = { x = 10094, y = 7352, z = -1 },
            dist = { "SpiffosKitchenFridge", "SpiffosKitchenFreezer" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E25
            coords = { x = 10088, y = 7354, z = -1 },
            dist = { "ArtStorePottery", "CrateMasonry" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E26
            coords = { x = 10089, y = 7354, z = -1 },
            dist = { "GigamartCrisps", "ArmyStorageElectronics", "RandomFiller" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E27
            coords = { x = 10090, y = 7354, z = -1 },
            dist = { "CampingStoreTools", "ArmyHangarTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E28
            coords = { x = 10091, y = 7354, z = -1 },
            dist = { "BurglarTools", "CarpenterTools", "BarnTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E29
            coords = { x = 10094, y = 7347, z = -1 },
            dist = { "CrateTools", "GarageTools", "BarnTools", "WeldingWorkshopTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E30
            coords = { x = 10095, y = 7347, z = -1 },
            dist = { "GigamartTools", "JanitorTools", "WeldingWorkshopTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E31
            coords = { x = 10097, y = 7350, z = -1 },
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E32
            note = "wardrobe @ livingroom",
            coords = {x=10080,y=7370,z=0},
        },
        { -- E33
            note = "wardrobe @ livingroom",
            coords = {x=10081,y=7370,z=0},
        },
        { -- E34
            note = "sidetable @ livingroom",
            coords = {x=10081,y=7374,z=0},
        },
        { -- E35
            note = "shelves @ livingroom",
            coords = {x=10083,y=7367,z=0},
        },
        { -- E36
            note = "sidetable @ livingroom",
            coords = {x=10085,y=7367,z=0},
        },
        { -- E37
            note = "counter @ kitchen",
            coords = {x=10080,y=7372,z=0},
        },
        { -- E38
            note = "counter @ kitchen",
            coords = {x=10077,y=7372,z=0},
        },
        { -- E39
            note = "fridge @ kitchen",
            coords = {x=10078,y=7372,z=0},
        },
        { -- E40
            note = "freezer @ kitchen",
            coords = {x=10078,y=7372,z=0},
            slot = "freezer",
        },
        { -- E41
            note = "counter @ kitchen",
            coords = {x=10079,y=7372,z=0},
        },
        { -- E42
            note = "counter @ kitchen",
            coords = {x=10077,y=7373,z=0},
        },
        { -- E43
            note = "counter @ kitchen",
            coords = {x=10077,y=7374,z=0},
        },
        { -- E44
            note = "counter @ kitchen",
            coords = {x=10079,y=7374,z=0},
        },
        { -- E45
            note = "dresser @ bedroom",
            coords = {x=10077,y=7369,z=0},
        },
        { -- E46
            note = "dresser @ kidsbedroom",
            coords = {x=10080,y=7368,z=0},
        },
        { -- E47
            note = "cardboardbox @ garagestorage",
            coords = {x=10093,y=7352,z=0},
        },
        { -- E48
            note = "metal_shelves @ garagestorage",
            coords = {x=10090,y=7350,z=0},
            slot = "upper",
        },
        { -- E49
            note = "metal_shelves @ garagestorage",
            coords = {x=10091,y=7350,z=0},
            slot = "upper",
        },
        { -- E50
            note = "cardboardbox @ garagestorage",
            coords = {x=10092,y=7350,z=0},
        },
        { -- E51
            note = "locker @ garagestorage",
            coords = {x=10093,y=7350,z=0},
        },
        { -- E52
            note = "metal_shelves @ garagestorage",
            coords = {x=10094,y=7350,z=0},
        },
        { -- E53
            note = "cardboardbox @ garagestorage",
            coords = {x=10091,y=7351,z=0},
        },
        { -- E54
            note = "cardboardbox @ garagestorage",
            coords = {x=10092,y=7351,z=0},
        },    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(WWestPointSafeHouse.objectSpawns,
        { enabled = "EnableLadders", sprite = "industry_trucks_01_14", x = 10146, y = 6628, z = -1, removeWall = "west" })
    table.insert(WWestPointSafeHouse.objectSpawns,
        { enabled = "EnableLadders", sprite = "fixtures_doors_frames_01_4", x = 10146, y = 6628, z = -1, })
    table.insert(WWestPointSafeHouse.objectSpawns,
        { enabled = "EnableLadders", sprite = "fixtures_doors_01_56", x = 10146, y = 6628, z = -1, isDoor = true, doorN = false, })
    table.insert(WWestPointSafeHouse.objectSpawns,
        { enabled = "EnableLadders", x = 10143, y = 6679, z = 0, removeFloor = true, })
    -- table.insert(WWestPointSafeHouse.generators[1].chunks, { 1267, 828 })
    -- table.insert(WWestPointSafeHouse.generators[1].chunks, { 1267, 829 })
    -- table.insert(WWestPointSafeHouse.generators[1].chunks, { 1267, 830 })
    -- table.insert(WWestPointSafeHouse.generators[1].chunks, { 1267, 831 })
    -- table.insert(WWestPointSafeHouse.generators[1].chunks, { 1268, 828 })
end

return WWestPointSafeHouse
