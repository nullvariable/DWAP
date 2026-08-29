local wtc1 = { x = 108, y = 8945, z = -1, }
local pb1 = { x = 113, y = 8945, z = -1 }
local bunkerTopLeft = { x = 103, y = 8944, z = -1 }
local origin = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 2, z = bunkerTopLeft.z } -- bunker shell E1 (filing cabinet @ bunker, 103,8946,-1)
local BunkerShell = require("DWAP/configs/presets/BunkerShell")
local loot = BunkerShell(origin, {
    E8  = false, -- wood stove replaces the fridge
    E9  = false, -- wood stove replaces the freezer
    -- Adopt the reference LOADOUT
    E1  = { note = "filingcabinet @ bunker" },
    E22 = { note = "militarycrate @ bunker" },
    E23 = { note = "militarycrate @ bunker" },
    E24 = { note = "militarycrate @ bunker" },
    E25 = { note = "militarycrate @ bunker" },
})

-- config 28 site-specific squares (extra bunker shelves, warehouse, main
-- house); the bunker shell itself is the preset above.
local siteLoot = {
    {     -- E24
        note = "metal_shelves @ bunker",
        coords = { x = 105, y = 8953, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPTailor",
    },
    {     -- E25
        note = "metal_shelves @ bunker",
        coords = { x = 105, y = 8954, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPTools",
    },
    {     -- E26
        note = "metal_shelves @ bunker",
        coords = { x = 105, y = 8955, z = -1 },
        distIncludeJunk = false,
        tag = "DWAPFood",
    },
    {     -- E27
        note = "metal_shelves @ bunker",
        coords = { x = 105, y = 8956, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPLockers",
    },
    -- warehouse room
    {     -- E28
        note = "crate @ warehouse",
        coords = { x = 107, y = 8954, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPBuildMats",
    },
    {     -- E29
        note = "crate @ warehouse",
        coords = { x = 107, y = 8954, z = -1 },
        stack = 2,
        distIncludeJunk = true,
        tag = "DWAPBuildMats",
    },
    {     -- E30
        note = "metal_shelves @ warehouse",
        coords = { x = 107, y = 8953, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPGun",
    },
    {     -- E31
        note = "crate @ warehouse",
        coords = { x = 107, y = 8952, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPBuildMats",
    },
    {     -- E32
        note = "crate @ warehouse",
        coords = { x = 107, y = 8952, z = -1 },
        stack = 2,
        distIncludeJunk = true,
        tag = "DWAPBuildMats",
    },
    -- E27
    {     -- E33 cardboard box

        note = "cardboardbox @ warehouse",
        coords = { x = 109, y = 8955, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPBuildMats",
    },
    -- E28
    {     -- E34 cardboard box

        note = "cardboardbox @ warehouse",
        coords = { x = 109, y = 8954, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPBuildMats",
    },
    {     -- E35 cardboard box

        note = "cardboardbox @ warehouse",
        coords = { x = 109, y = 8954, z = -1 },
        stack = 2,
        distIncludeJunk = true,
        tag = "DWAPBuildMats",
    },
    -- E29
    {     -- E36 cardboard box

        note = "cardboardbox @ warehouse",
        coords = { x = 110, y = 8954, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPBuildMats",
    },
    {     -- E37
        note = "metal_shelves @ warehouse",
        coords = { x = 109, y = 8951, z = -1 },
        items = {
            { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
            { name = 'Base.Fertilizer',    chance = 1, count = { 8, 10 } },
        },
        level = "Loot_FarmLevel",
    },
    {     -- E38
        note = "metal_shelves @ warehouse",
        coords = { x = 109, y = 8950, z = -1 },
        items = {
            { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
            { name = 'Base.Fertilizer',    chance = 1, count = { 8, 10 } },
        },
        level = "Loot_FarmLevel",
    },
    {     -- E39
        note = "metal_shelves @ warehouse",
        coords = { x = 109, y = 8949, z = -1 },
        items = {
            { name = 'Base.NailsBox', },
            { name = 'Base.ScrewsBox', },
        },
        level = "Loot_BuildMatsLevel",
    },
    {     -- E40
        note = "metal_shelves @ warehouse",
        coords = { x = 109, y = 8948, z = -1 },
        items = {
            { name = 'Base.NailsBox', },
            { name = 'Base.Plank', },
            { name = 'Base.LongStick', },
        },
        level = "Loot_BuildMatsLevel",
    },
    {     -- E41
        note = "metal_shelves @ warehouse",
        coords = { x = 111, y = 8951, z = -1 },
        distIncludeJunk = false,
        tag = "DWAPFood",
    },
    {     -- E42
        note = "metal_shelves @ warehouse",
        coords = { x = 111, y = 8950, z = -1 },
        distIncludeJunk = false,
        tag = "DWAPFood",
    },
    {     -- E43
        note = "metal_shelves @ warehouse",
        coords = { x = 111, y = 8949, z = -1 },
        distIncludeJunk = false,
        tag = "DWAPFish",
    },
    {     -- E44
        note = "metal_shelves @ warehouse",
        coords = { x = 111, y = 8948, z = -1 },
        distIncludeJunk = false,
        tag = "DWAPGun",
    },
    {     -- E45
        note = "metal_shelves @ warehouse",
        coords = { x = 113, y = 8951, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPTailor",
    },
    {     -- E46
        note = "metal_shelves @ warehouse",
        coords = { x = 113, y = 8950, z = -1 },
        distIncludeJunk = false,
        tag = "DWAPTools",
    },
    {     -- E47
        note = "metal_shelves @ warehouse",
        coords = { x = 113, y = 8949, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPFood",
    },
    {     -- E48
        note = "metal_shelves @ warehouse",
        coords = { x = 113, y = 8948, z = -1 },
        distIncludeJunk = false,
        tag = "DWAPBuildMats",
    },
    {     -- E49
        note = "metal_shelves @ warehouse",
        coords = { x = 115, y = 8953, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPMed",
    },
    {     -- E50
        note = "metal_shelves @ warehouse",
        coords = { x = 115, y = 8952, z = -1 },
        distIncludeJunk = false,
        tag = "DWAPMedia",
    },
    {     -- E51
        note = "metal_shelves @ warehouse",
        coords = { x = 115, y = 8951, z = -1 },
        distIncludeJunk = false,
        tag = "DWAPFarm",
    },
    {     -- E52
        note = "metal_shelves @ warehouse",
        coords = { x = 115, y = 8950, z = -1 },
        distIncludeJunk = false,
        tag = "DWAPFarm",
    },
    {     -- E53
        note = "metal_shelves @ warehouse",
        coords = { x = 115, y = 8949, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPTools",
    },
    {     -- E54
        note = "metal_shelves @ warehouse",
        coords = { x = 115, y = 8948, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPTools",
    },
    -- crates in the corner
    {     -- E55
        note = "crate @ warehouse",
        coords = { x = 114, y = 8956, z = -1 },
        dist = { "SafehouseBooze" },
        distIncludeJunk = false,
        tag = "DWAPBooze",
    },
    {     -- E56
        note = "crate @ warehouse",
        coords = { x = 115, y = 8956, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPGun",
    },
    {     -- E57
        note = "crate @ warehouse",
        coords = { x = 115, y = 8956, z = -1 },
        stack = 2,
        distIncludeJunk = true,
        tag = "DWAPGun",
    },
    {     -- E58
        note = "crate @ warehouse",
        coords = { x = 116, y = 8956, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPTools",
    },
    {     -- E59
        note = "crate @ warehouse",
        coords = { x = 116, y = 8956, z = -1 },
        stack = 2,
        distIncludeJunk = true,
        tag = "DWAPTools",
    },
    {     -- E60
        note = "crate @ warehouse",
        coords = { x = 116, y = 8955, z = -1 },
        distIncludeJunk = false,
        tag = "DWAPFarm",
    },
    -- freezer
    {     -- E61
        note = "freezer @ warehouse",
        coords = { x = 115, y = 8944, z = -1 },
        dist = { "BurgerKitchenFreezer", },
        distIncludeJunk = false,
        tag = "DWAPFreezer",
    },
    {     -- E62
        note = "freezer @ warehouse",
        coords = { x = 116, y = 8944, z = -1 },
        dist = { "ButcherFreezer", },
        distIncludeJunk = false,
        tag = "DWAPFreezer",
    },
    ------------------
    --- Main house ---
    ------------------
    -- kitchen
    {     -- E63
        note = "counter @ kitchen",
        coords = { x = 97, y = 8959, z = 0 },
        special = "kitchentools",
        level = "Loot_FoodLevel",
    },
    {     -- E64
        note = "overhead @ kitchen",
        coords = { x = 97, y = 8959, z = 0 },
        slot = "upper",
        dist = { "SafehouseFood" },
        distIncludeJunk = false,
        tag = "DWAPFood",
    },
    {     -- E65
        note = "fridge @ kitchen",
        coords = { x = 96, y = 8959, z = 0 },
        dist = { "SafehouseFridge" },
        distIncludeJunk = true,
        tag = "DWAPFridge",
    },
    {     -- E66
        note = "freezer @ kitchen",
        coords = { x = 96, y = 8959, z = 0 },
        slot = "freezer",
        dist = { "SafehouseFreezer" },
        distIncludeJunk = true,
        tag = "DWAPFreezer",
    },
    {     -- E67
        note = "overhead @ kitchen",
        coords = { x = 96, y = 8962, z = 0 },
        slot = "upper",
        dist = { "KitchenCannedFood" },
        distIncludeJunk = false,
        tag = "DWAPFood",
    },
    {     -- E68
        note = "overhead @ kitchen",
        coords = { x = 99, y = 8959, z = 0 },
        slot = "upper",
        distIncludeJunk = true,
        tag = "DWAPFood",
    },
    {     -- E69
        note = "fridge @ kitchen",
        coords = { x = 99, y = 8959, z = 0 },
        dist = { "FridgeGeneric", },
        distIncludeJunk = false,
        tag = "DWAPFridge",
    },
    {     -- E70
        note = "freezer @ kitchen",
        coords = { x = 99, y = 8959, z = 0 },
        slot = "freezer",
        dist = { "FreezerIceCream", },
        distIncludeJunk = false,
        tag = "DWAPFreezer",
    },
    {     -- E71
        note = "counter @ kitchen",
        coords = { x = 96, y = 8962, z = 0 },
        items = {
            { name = 'Base.Firewood', chance = 1, count = { 30, 30 } },
        },
        level = "Loot_FarmLevel",
    },
    -- office
    {     -- E72
        note = "sidetable @ office",
        coords = { x = 103, y = 8962, z = 0 },
        dist = { "MusicStoreCDs" },
        distIncludeJunk = false,
        tag = "DWAPMedia",
    },
    {     -- E73
        note = "shelves @ office",
        coords = { x = 103, y = 8960, z = 0 },
        dist = { "LivingRoomShelfClassy" },
        distIncludeJunk = false,
        tag = "DWAPMedia",
    },
    {     -- E74
        note = "shelves @ office",
        coords = { x = 103, y = 8959, z = 0 },
        dist = { "CrateVHSTapes" },
        distIncludeJunk = false,
        tag = "DWAPMedia",
    },
    {     -- E75
        note = "desk @ office",
        coords = { x = 103, y = 8957, z = 0 },
        dist = { "ArmyStorageElectronics" },
        distIncludeJunk = false,
        tag = "DWAPBuildMats",
    },
    -- hallway
    {     -- E76
        note = "dishescabinet @ lobby",
        coords = { x = 98, y = 8952, z = 0 },
        distIncludeJunk = false,
        tag = "DWAPBooze",
    },
    {     -- E77
        note = "dishescabinet @ lobby",
        coords = { x = 99, y = 8952, z = 0 },
        distIncludeJunk = false,
        tag = "DWAPBooze",
    },
    -- 2nd floor
    -- bathroom
    {     -- E78
        note = "counter @ bathroom",
        coords = { x = 103, y = 8955, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPLockers",
    },
    -- master bedroom
    {     -- E79
        note = "sidetable @ bedroom",
        coords = { x = 102, y = 8962, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPLockers",
    },
    {     -- E80
        note = "sidetable @ bedroom",
        coords = { x = 99, y = 8962, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPLockers",
    },
    {     -- E81
        note = "desk @ bedroom",
        coords = { x = 99, y = 8959, z = 1 },
        special = "gunlocker",
        level = "Loot_GunLevel",
    },
    {
        note = "medicine @ bathroom",
        coords = { x = 104, y = 8954, z = 1 },
        slot = "upper",
        distIncludeJunk = true,
        tag = "DWAPMed",
    },
    {
        note = "dresser @ kidsbedroom",
        coords = { x = 101, y = 8948, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPMedia",
    },
    {
        note = "dresser @ kidsbedroom",
        coords = { x = 102, y = 8948, z = 1 },
        distIncludeJunk = false,
        tag = "DWAPLockers",
    },

    {
        note = "counter @ livingroom",
        coords = { x = 104, y = 8948, z = 0 },
        distIncludeJunk = true,
        tag = "DWAP",
    },
    {
        note = "counter @ livingroom",
        coords = { x = 105, y = 8948, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPNonFoodFiller",
    },
    {
        note = "counter @ livingroom",
        coords = { x = 105, y = 8949, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPMedia",
    },
    {
        note = "counter @ livingroom",
        coords = { x = 105, y = 8950, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPGun",
    },
    {
        note = "shelves @ livingroom",
        coords = { x = 99, y = 8950, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPGun",
    },
    {
        note = "shelves @ livingroom",
        coords = { x = 99, y = 8951, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPFarm",
    },
    {
        note = "shelves @ livingroom",
        coords = { x = 100, y = 8951, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPFarm",
    },
    {
        note = "shelves @ livingroom",
        coords = { x = 101, y = 8951, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPTools",
    },
    {
        note = "shelves @ outside",
        coords = { x = 98, y = 8947, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPMedia",
    },
    {
        note = "dresser @ lobby",
        coords = { x = 96, y = 8954, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPGun",
    },
    {
        note = "wardrobe @ lobby",
        coords = { x = 96, y = 8957, z = 0 },
        distIncludeJunk = false,
        tag = "DWAPBooze",
    },
    {
        note = "wardrobe @ lobby",
        coords = { x = 96, y = 8958, z = 0 },
        distIncludeJunk = false,
        tag = "DWAPBooze",
    },
    {
        note = "metal_shelves @ laundry",
        coords = { x = 99, y = 8956, z = 0 },
        distIncludeJunk = false,
        tag = "DWAPLockers",
    },
    {
        note = "metal_shelves @ laundry",
        coords = { x = 99, y = 8955, z = 0 },
        distIncludeJunk = false,
        tag = "DWAPBuildMats",
    },
    {
        note = "counter @ bathroom",
        coords = { x = 100, y = 8956, z = 0 },
        distIncludeJunk = false,
        tag = "DWAPMed",
    },
    {
        note = "sidetable @ outside",
        coords = { x = 105, y = 8963, z = 0 },
        distIncludeJunk = false,
        tag = "DWAPMedia",
    },
    {
        note = "overhead @ kitchen",
        coords = { x = 98, y = 8959, z = 0 },
        slot = "upper",
        distIncludeJunk = true,
        tag = "DWAPFood",
    },
    {
        note = "counter @ kitchen",
        coords = { x = 98, y = 8959, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPFood",
    },
    {
        note = "counter @ kitchen",
        coords = { x = 96, y = 8963, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPFood",
    },
    {
        note = "overhead @ kitchen",
        coords = { x = 96, y = 8963, z = 0 },
        slot = "upper",
        distIncludeJunk = true,
        tag = "DWAPFood",
    },
    {
        note = "shelves @ kitchen",
        coords = { x = 96, y = 8964, z = 0 },
        slot = "upper",
        distIncludeJunk = true,
        tag = "DWAPFish",
    },
}
for i = 1, #siteLoot do loot[#loot + 1] = siteLoot[i] end

local EkronPigFarm = {
    group = "Ekron",
    baseBuildings = {
        { x = 104, y = 8955, z = 1 },  -- farmhouse
        { x = 104, y = 8953, z = -1 }, -- basement
    },
    spawn = { x = 104, y = 8955, z = 1 },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 112, y = 8945, z = -1, },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 110, y = 8945, z = -1, },
            fakeGenerators = {
                { x = 110, y = 8959, z = -1, createTile = true },
            },
        },
    },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc1.x, y = wtc1.y, z = wtc1.z, sourceType = "generator", source = { x = 112, y = 8945, z = -1 } },
    },
    waterFixtures = {
        -- barn
        { sprite = "fixtures_sinks_01_32",    x = 95,  y = 8911, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        -- 2nd floor apts
        { sprite = "fixtures_bathroom_01_0",  x = 104, y = 8954, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_1",     x = 103, y = 8955, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_26", x = 103, y = 8956, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        -- 1st floor
        { sprite = "appliances_laundry_01_3", x = 99,  y = 8954, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_1",     x = 100, y = 8956, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_2",  x = 102, y = 8956, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_9",     x = 98,  y = 8959, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        -- basement
        { sprite = "fixtures_sinks_01_16",    x = 103, y = 8948, z = -1, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_6",  x = 105, y = 8952, z = -1, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },

    },
    doorKeys = {
        name = "Pig Farm",
        doors = {
            { sprite = "fixtures_doors_01_44", x = 105, y = 8955, z = 0, },
            { sprite = "fixtures_doors_01_53", x = 104, y = 8957, z = -1, },
            { sprite = "fixtures_doors_01_44", x = 113, y = 8978, z = 0, },
            { sprite = "fixtures_doors_01_28", x = 117, y = 8927, z = 0, },
        },
    },
    map = { name = "DWAPStashMap28", },
    objectSpawns = {
        { barricade = "woodhalf", enabled = "Barricade", target = "walls_exterior_house_02_9",   x = 97,  y = 8965, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target = "walls_exterior_house_02_9",   x = 99,  y = 8965, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_doors_01_44",        x = 101, y = 8964, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target = "walls_exterior_house_02_9",   x = 103, y = 8963, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target = "walls_exterior_house_02_8",   x = 106, y = 8959, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target = "walls_exterior_house_02_8",   x = 106, y = 8956, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target = "walls_exterior_house_02_8",   x = 106, y = 8954, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target = "walls_exterior_house_02_8",   x = 106, y = 8951, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target = "walls_exterior_wooden_01_37", x = 103, y = 8948, z = 0, },
    },
    loot = loot,
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(EkronPigFarm.objectSpawns,
        { enabled = "EnableLadders", sprite = "industry_trucks_01_7", x = 117, y = 8957, z = -1, removeWall = "north", })

    table.insert(EkronPigFarm.objectSpawns,
        { enabled = "EnableLadders", sprite = "walls_exterior_wooden_01_28", x = 117, y = 8925, z = 0, removeFloor = true, clearExisting = true, })
    table.insert(EkronPigFarm.objectSpawns,
        { enabled = "EnableLadders", sprite = "walls_exterior_wooden_01_29", x = 117, y = 8926, z = 0, })
end

return EkronPigFarm
