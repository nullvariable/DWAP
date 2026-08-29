local wtc = { x = 1907, y = 9944, z = -1 } -- waterTankCoords
local pb1 = { x = 1913, y = 9943, z = -1 }
-- local bunkerTopLeft = {x = 1895, y = 9946, z = -2}
local bunkerTopLeft = { x = 1917, y = 9934, z = -1 }
local origin = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 2, z = bunkerTopLeft.z } -- bunker shell E1 (filing cabinet @ bunker)
local BunkerShell = require("DWAP/configs/presets/BunkerShell")
local loot = BunkerShell(origin, {
    E8  = false, -- wood stove replaces the fridge
    E9  = false, -- wood stove replaces the freezer
    -- Adopt the reference LOADOUT (tags/dists), but keep config 15's own audited
    -- furniture: these squares are a filing cabinet and militarycrates, not the
    -- reference's dresser and plain crates. note describes the real object (and
    -- drives _cat for the spill/purge paths), so it must stay true to the site.
    E1  = { note = "filingcabinet @ bunker" },
    E22 = { note = "militarycrate @ bunker" },
    E23 = { note = "militarycrate @ bunker" },
    E24 = { note = "militarycrate @ bunker" },
    E25 = { note = "militarycrate @ bunker" },
})

-- config 15 site-specific squares: basement storage and both house floors;
-- the bunker itself is the preset above.
local siteLoot = {
    -- extra shelves next to bunkershell
    {
        note = "metal_shelves @ bunker",
        coords = { x = 1919, y = 9943, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPBuildMats",
    },
    {
        note = "metal_shelves @ bunker",
        coords = { x = 1919, y = 9944, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPBuildMats",
    },
    {
        note = "metal_shelves @ bunker",
        coords = { x = 1919, y = 9945, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPTools",
    },
    {
        note = "metal_shelves @ bunker",
        coords = { x = 1919, y = 9946, z = -1 },
        dist = { "CrateCannedFood" },
        distIncludeJunk = false,
        tag = "DWAPFood",
    },
    -- first basement
    { -- E24
        note = "freezer @ storage",
        coords = { x = 1906, y = 9957, z = -1 },
        dist = { "FreezerRich", },
        distIncludeJunk = true,
        tag = "DWAPFreezer",
    },
    { -- E25
        note = "toolcabinet @ storage",
        coords = { x = 1906, y = 9954, z = -1 },
        dist = { "GasStoreEmergency" },
        distIncludeJunk = true,
        level = 2,
    },
    { -- E26
        note = "crate @ storage",
        coords = { x = 1906, y = 9953, z = -1 },
        dist = { "WeldingWorkshopMetal" },
        distIncludeJunk = true,
        tag = "DWAPBuildMats",
    },
    { -- E27
        note = "crate @ storage",
        coords = { x = 1906, y = 9951, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPBuildMats",
    },
    { -- E28
        note = "metal_shelves @ storage",
        coords = { x = 1902, y = 9952, z = -1 },
        items = {
            { name = 'Base.NailsBox', },
            { name = 'Base.ScrewsBox', },
        },
        level = "Loot_BuildMatsLevel",
    },
    { -- E29
        note = "metal_shelves @ storage",
        coords = { x = 1902, y = 9953, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPBuildMats",
    },
    { -- E30
        note = "metal_shelves @ storage",
        coords = { x = 1898, y = 9949, z = -1 },
        distIncludeJunk = false,
        tag = "DWAPMedia",
    },
    { -- E31
        note = "locker @ storage",
        coords = { x = 1897, y = 9949, z = -1 },
        items = {
            { name = 'Base.CigaretteCarton', chance = 1, count = { 5, 15 } },
        },
        level = "Loot_FoodLevel",
    },
    { -- E32
        note = "metal_shelves @ storage",
        coords = { x = 1897, y = 9962, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPTools",
    },
    -- first floor
    { -- E33
        note = "shelves @ livingroom",
        coords = { x = 1900, y = 9952, z = 0 },
        dist = { "MovieRentalShelves" },
        distIncludeJunk = false,
        tag = "DWAPMedia",
    },
    { -- E34
        note = "counter @ lobby",
        coords = { x = 1902, y = 9955, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPTools",
    },
    { -- E35
        note = "wardrobe @ lobby",
        coords = { x = 1897, y = 9959, z = 0 },
        distIncludeJunk = false,
        tag = "DWAPBooze",
    },
    { -- E36
        note = "wardrobe @ lobby",
        coords = { x = 1897, y = 9958, z = 0 },
        distIncludeJunk = false,
        tag = "DWAPBooze",
    },
    { -- E37
        note = "dresser @ lobby",
        coords = { x = 1897, y = 9955, z = 0 },
        distIncludeJunk = false,
        tag = "DWAPBuildMats",
    },
    -- laundry room
    { -- E38
        note = "metal_shelves @ laundry",
        coords = { x = 1900, y = 9955, z = 0 },
        dist = { "CrateToiletPaper" },
        distIncludeJunk = false,
        level = 1,
    },
    { -- E39
        note = "metal_shelves @ laundry",
        coords = { x = 1900, y = 9956, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPTailor",
    },
    -- office
    { -- E40
        note = "desk @ office",
        coords = { x = 1904, y = 9958, z = 0 },
        items = {
            { name = 'Base.Pencil',                          chance = 1, count = { 2, 5 } },
            { name = 'Base.Notebook',                        chance = 1, count = { 1, 1 } },
            { name = 'Base.Notebook',                        chance = 1, count = { 1, 1 } },
            { name = 'Base.WristWatch_Left_DigitalBlack',    chance = 1, count = { 1, 1 } },
            { name = 'Base.WristWatch_Left_ClassicMilitary', chance = 1, count = { 1, 1 } },
        },
    },
    { -- E41
        note = "shelves @ office",
        coords = { x = 1904, y = 9960, z = 0 },
        distIncludeJunk = false,
        tag = "DWAPMedia",
    },
    { -- E42
        note = "shelves @ office",
        coords = { x = 1904, y = 9961, z = 0 },
        dist = { "BookstoreMilitaryHistory" },
        distIncludeJunk = false,
        tag = "DWAPMedia",
    },
    { -- E43
        note = "sidetable @ office",
        coords = { x = 1904, y = 9963, z = 0 },
        dist = { "MusicStoreCDs" },
        distIncludeJunk = false,
        tag = "DWAPMedia",
    },
    -- kitchen
    { -- E44
        note = "fridge @ kitchen",
        coords = { x = 1897, y = 9960, z = 0 },
        distIncludeJunk = false,
        tag = "DWAPFridge",
    },
    { -- E45
        note = "fridge @ kitchen",
        coords = { x = 1897, y = 9960, z = 0 },
        slot = "freezer",
        distIncludeJunk = false,
        tag = "DWAPFridge",
    },
    { -- E46
        note = "shelves @ kitchen",
        coords = { x = 1897, y = 9965, z = 0 },
        slot = "upper",
        distIncludeJunk = false,
        tag = "DWAPFood",
    },
    { -- E47
        note = "overhead @ kitchen",
        coords = { x = 1897, y = 9964, z = 0 },
        slot = "upper",
        distIncludeJunk = false,
        tag = "DWAPFood",
    },
    { -- E48
        note = "counter @ kitchen",
        coords = { x = 1897, y = 9964, z = 0 },
        distIncludeJunk = false,
        tag = "DWAPFood",
    },
    { -- E49
        note = "overhead @ kitchen",
        coords = { x = 1897, y = 9963, z = 0 },
        slot = "upper",
        distIncludeJunk = false,
        tag = "DWAPFood",
    },
    { -- E50
        note = "counter @ kitchen",
        coords = { x = 1897, y = 9963, z = 0 },
        special = "kitchentools",
        level = "Loot_FoodLevel",
    },
    { -- E51
        note = "counter @ kitchen",
        coords = { x = 1898, y = 9960, z = 0 },
        dist = { "StoreKitchenBaking", },
        distIncludeJunk = false,
        tag = "DWAPFood",
    },
    { -- E52
        note = "counter @ kitchen",
        coords = { x = 1898, y = 9960, z = 0 },
        slot = "upper",
        dist = { "StoreKitchenBaking", },
        distIncludeJunk = false,
        tag = "DWAPFood",
    },
    { -- E53
        note = "counter @ kitchen",
        coords = { x = 1899, y = 9960, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPFood",
    },
    { -- E54
        note = "counter @ kitchen",
        coords = { x = 1899, y = 9960, z = 0 },
        slot = "upper",
        distIncludeJunk = true,
        tag = "DWAPFood",
    },
    -- living room
    { -- E55
        note = "counter @ livingroom",
        coords = { x = 1905, y = 9949, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPFood",
    },
    { -- E56
        note = "counter @ livingroom",
        coords = { x = 1906, y = 9949, z = 0 },
        distIncludeJunk = false,
        tag = "DWAPBuildMats",
    },
    { -- E57
        note = "counter @ livingroom",
        coords = { x = 1906, y = 9950, z = 0 },
        dist = { "ToolFactoryHandles" },
        distIncludeJunk = false,
        tag = "DWAPBuildMats",
    },
    { -- E58
        note = "counter @ livingroom",
        coords = { x = 1906, y = 9951, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPBuildMats",
    },
    -- 2nd floor
    { -- E59
        note = "shelves @ lobby",
        coords = { x = 1900, y = 9953, z = 1 },
        dist = { "MovieRentalShelves" },
        distIncludeJunk = false,
        tag = "DWAPMedia",
    },
    { -- E60
        note = "sidetable @ bedroom",
        coords = { x = 1903, y = 9963, z = 1 },
        distIncludeJunk = false,
        tag = "DWAPFish",
    },
    { -- E61
        note = "sidetable @ bedroom",
        coords = { x = 1900, y = 9963, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPLockers",
    },
    { -- E62
        note = "dishescabinet @ lobby",
        coords = { x = 1902, y = 9953, z = 1 },
        special = "gunlocker",
        level = "Loot_GunLevel",
    },
    { -- E63
        note = "dishescabinet @ lobby",
        coords = { x = 1903, y = 9953, z = 1 },
        special = "gunlocker",
        level = "Loot_GunLevel",
    },
    { -- E64
        note = "dresser @ kidsbedroom",
        coords = { x = 1902, y = 9949, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPLockers",
    },
    { -- E65
        note = "dresser @ kidsbedroom",
        coords = { x = 1903, y = 9949, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPLockers",
    },
    { -- E66
        note = "counter @ bathroom",
        coords = { x = 1904, y = 9956, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPMed",
    },
}
for i = 1, #siteLoot do loot[#loot + 1] = siteLoot[i] end

local EkronLakeHouse = {
    group = "Ekron",
    baseBuildings = {
        { x = 1902, y = 9951, z = 1 },  -- lake house
        { x = 1904, y = 9955, z = -1 }, -- main basement
        { x = 1908, y = 9946, z = -1 }, -- generator/bunker addon
        { x = 1920, y = 9910, z = 0 },  -- parking shed
    },
    spawn = { x = 1902, y = 9951, z = 1 },
    waterTanks = {
        { sprite = "industry_02_75",  x = 1898,  y = 9964,  z = -1, },
        { sprite = "dwap_tiles_01_9", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = { x = 1911, y = 9944, z = -1 } },
    },
    waterFixtures = {
        { sprite = "fixtures_sinks_01_4",     x = 1883,                y = 9973,                z = 0,               sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_4",     x = 1883,                y = 9977,                z = 0,               sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_9",     x = 1899,                y = 9960,                z = 0,               sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "appliances_laundry_01_2", x = 1899,                y = 9957,                z = 0,               sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

        { sprite = "fixtures_bathroom_01_26", x = 1904,                y = 9957,                z = 1,               sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_1",     x = 1904,                y = 9956,                z = 1,               sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_0",  x = 1905,                y = 9955,                z = 1,               sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

        -- basement fixtures
        { sprite = "fixtures_sinks_01_35",    x = 1900,                y = 9965,                z = -1,              sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_16",    x = bunkerTopLeft.x,     y = bunkerTopLeft.y + 4, z = bunkerTopLeft.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_6",  x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y + 8, z = bunkerTopLeft.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
    },
    doorKeys = {
        name = "East Ekron Lake House",
        doors = {
            { sprite = "fixtures_doors_01_44", x = 1906, y = 9956, z = 0, },
            { sprite = "fixtures_doors_01_44", x = 1891, y = 9974, z = 0, },
            { sprite = "fixtures_doors_01_56", x = 1921, y = 9910, z = 0, },
            { sprite = "fixtures_doors_01_28", x = 1946, y = 9942, z = 0, },
            { sprite = "fixtures_doors_01_56", x = 1851, y = 9953, z = 0, },
            { sprite = "fixtures_doors_01_56", x = 1907, y = 9946, z = 0, },
        },
    },
    map = { name = "DWAPStashMap15", },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 1911, y = 9944, z = -1, },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 1909, y = 9944, z = -1, },
            fakeGenerators = {
                { x = 1908, y = 9948, z = -1, createTile = false },
            },
        },
    },
    objectSpawns = {
        { barricade = "woodhalf", enabled = "Barricade", target = "walls_exterior_house_01_40", x = 1907, y = 9952, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target = "walls_exterior_house_01_40", x = 1907, y = 9955, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target = "walls_exterior_house_01_40", x = 1907, y = 9957, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target = "walls_exterior_house_01_40", x = 1907, y = 9960, z = 0, },
    },
    loot = loot,
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(EkronLakeHouse.objectSpawns,
        { enabled = "EnableLadders", sprite = "industry_trucks_01_7", x = 1921, y = 9947, z = -1, removeWall = "west", })

    table.insert(EkronLakeHouse.objectSpawns,
        { enabled = "EnableLadders", sprite = "industry_railroad_05_8", x = 1921, y = 9911, z = 0, removeFloor = true, })
end

return EkronLakeHouse
