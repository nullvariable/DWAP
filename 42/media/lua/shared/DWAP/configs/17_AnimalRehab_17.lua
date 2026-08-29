local wtc = { x = 3115, y = 12065, z = -1 } -- waterTankCoords
local pb1 = { x = 3114, y = 12067, z = -1 }
local bunkerTopLeft = { x = 3115, y = 12048, z = -1 }
local origin = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 2, z = bunkerTopLeft.z } -- bunker shell E1 (filing cabinet @ storageunit, 3115,12050,-1)
local BunkerShell = require("DWAP/configs/presets/BunkerShell_17")
local loot = BunkerShell(origin, {
    E8  = false, -- wood stove replaces the fridge
    E9  = false, -- wood stove replaces the freezer
    -- Config 17's bunker is two rooms (storageunit + security) with a filing
    -- cabinet and militarycrates. Adopt the reference LOADOUT but keep the real
    -- furniture on these squares; the other bunker notes take the preset's
    -- "@ bunker" room until a DWAPAudit(17) backfills the true storageunit/
    -- security rooms (the audit is the note source, not hand-authoring).
    E1  = { note = "filingcabinet @ storageunit", sprite = "location_business_office_generic_01_3" },
    E22 = { note = "militarycrate @ storageunit" },
    E23 = { note = "militarycrate @ storageunit" },
    E24 = { note = "militarycrate @ storageunit" },
    E25 = { note = "militarycrate @ storageunit" },
})

-- config 17 site-specific squares; the bunker itself is the preset above.
local siteLoot = {
    -- basement bar
    { -- E1
        note = "counter @ bar",
        coords = { x = 3111, y = 12050, z = -1 },
        distIncludeJunk = false,
        tag = "DWAPBooze",
    },
    {     -- E2
        note = "shelves @ bar",
        coords = { x = 3109, y = 12056, z = -1 },
        distIncludeJunk = false,
        tag = "DWAPBooze",
    },
    {     -- E3
        note = "counter @ bar",
        coords = { x = 3109, y = 12057, z = -1 },
        dist = { "SafehouseBooze" },
        distIncludeJunk = false,
        tag = "DWAPBooze",
    },
    {     -- E4
        note = "shelves @ bar",
        coords = { x = 3109, y = 12058, z = -1 },
        distIncludeJunk = false,
        tag = "DWAPBooze",
    },
    {     -- E5
        note = "shelves @ bar",
        coords = { x = 3112, y = 12061, z = -1 },
        distIncludeJunk = false,
        tag = "DWAPMedia",
    },
    {     -- E6 tv stand
        note = "sidetable @ bar",
        coords = { x = 3112, y = 12060, z = -1 },
        distIncludeJunk = false,
        tag = "DWAPFood",
    },
    {     -- E7
        note = "shelves @ bar",
        coords = { x = 3112, y = 12059, z = -1 },
        distIncludeJunk = false,
        tag = "DWAPMedia",
    },
    {     -- E8
        note = "shelves @ bar",
        coords = { x = 3112, y = 12058, z = -1 },
        distIncludeJunk = false,
        tag = "DWAPMedia",
    },
    -- extra shelves next to the bunker shell (not part of the preset)
    { -- E22
        note = "metal_shelves @ security",
        coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y + 9, z = bunkerTopLeft.z },
        dist = { "GasStoreEmergency" },
        distIncludeJunk = true,
        tag = "DWAPTools",
    },
    {     -- E23
        note = "metal_shelves @ security",
        coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y + 10, z = bunkerTopLeft.z },
        distIncludeJunk = false,
        tag = "DWAPFish",
    },
    {     -- E24
        note = "metal_shelves @ security",
        coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y + 11, z = bunkerTopLeft.z },
        distIncludeJunk = false,
        tag = "DWAPGun",
    },
    {     -- E25
        note = "metal_shelves @ security",
        coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y + 12, z = bunkerTopLeft.z },
        distIncludeJunk = false,
        tag = "DWAPGun",
    },
    -- warehouse/utility room and both floors above
    { -- E36
        note = "metal_shelves @ warehouse",
        coords = { x = 3114, y = 12070, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPTools",
    },
    {     -- E37
        note = "metal_shelves @ warehouse",
        coords = { x = 3114, y = 12069, z = -1 },
        distIncludeJunk = false,
        tag = "DWAPBuildMats",
    },
    {     -- E38
        note = "metal_shelves @ warehouse",
        coords = { x = 3116, y = 12070, z = -1 },
        distIncludeJunk = false,
        tag = "DWAPFarm",
    },
    {     -- E39
        note = "metal_shelves @ warehouse",
        coords = { x = 3116, y = 12069, z = -1 },
        items = {
            { name = 'Base.NailsBox', },
            { name = 'Base.ScrewsBox', },
        },
        level = "Loot_BuildMatsLevel",
    },
    {     -- E40
        note = "metal_shelves @ warehouse",
        coords = { x = 3118, y = 12070, z = -1 },
        dist = { "WeldingWorkshopMetal" },
        distIncludeJunk = true,
        tag = "DWAPBuildMats",
    },
    {     -- E41
        note = "metal_shelves @ warehouse",
        coords = { x = 3118, y = 12069, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPBuildMats",
    },
    {     -- E42
        note = "metal_shelves @ warehouse",
        coords = { x = 3120, y = 12070, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPBuildMats",
    },
    {     -- E43
        note = "metal_shelves @ warehouse",
        coords = { x = 3120, y = 12069, z = -1 },
        items = {
            { name = 'Base.Fertilizer', chance = 1, count = { 8, 10 } },
        },
        level = "Loot_FarmLevel",
    },
    {     -- E44
        note = "metal_shelves @ warehouse",
        coords = { x = 3122, y = 12070, z = -1 },
        items = {
            { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
        },
        level = "Loot_FarmLevel",
    },
    {     -- E45
        note = "metal_shelves @ warehouse",
        coords = { x = 3122, y = 12069, z = -1 },
        items = {
            { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
        },
        level = "Loot_FarmLevel",
    },
    {     -- E46
        note = "metal_shelves @ warehouse",
        coords = { x = 3122, y = 12068, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPBuildMats",
    },
    {     -- E47
        note = "metal_shelves @ warehouse",
        coords = { x = 3122, y = 12067, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPFood",
    },
    {     -- E48
        note = "metal_shelves @ warehouse",
        coords = { x = 3124, y = 12070, z = -1 },
        dist = { "CrateCannedFood" },
        distIncludeJunk = false,
        tag = "DWAPFood",
    },
    {     -- E49
        note = "metal_shelves @ warehouse",
        coords = { x = 3124, y = 12069, z = -1 },
        distIncludeJunk = false,
        tag = "DWAPFood",
    },
    {     -- E50
        note = "metal_shelves @ warehouse",
        coords = { x = 3124, y = 12068, z = -1 },
        distIncludeJunk = false,
        tag = "DWAPTools",
    },
    {     -- E51
        note = "metal_shelves @ warehouse",
        coords = { x = 3124, y = 12067, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPTools",
    },
    {     -- E52
        note = "freezer @ warehouse",
        coords = { x = 3123, y = 12064, z = -1 },
        dist = { "FreezerRich", },
        distIncludeJunk = true,
        tag = "DWAPFreezer",
    },
    {     -- E53
        note = "freezer @ warehouse",
        coords = { x = 3124, y = 12064, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPFreezer",
    },
    {     -- E54
        note = "militarylocker @ warehouse",
        coords = { x = 3125, y = 12064, z = -1 },
        special = "gunlocker",
        level = "Loot_GunLevel",
    },
    {     -- E55
        note = "militarycrate @ warehouse",
        coords = { x = 3126, y = 12064, z = -1 },
        distIncludeJunk = false,
        tag = "DWAPGun",
    },
    {     -- E56
        note = "militarycrate @ warehouse",
        coords = { x = 3126, y = 12064, z = -1 },
        stack = 2,
        distIncludeJunk = false,
        tag = "DWAPGun",
    },
    -- first floor
    -- kitchen
    {     -- E57
        note = "fridge @ kitchen",
        coords = { x = 3113, y = 12055, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPFridge",
    },
    {     -- E58
        note = "fridge @ kitchen",
        coords = { x = 3113, y = 12055, z = 0 },
        slot = "freezer",
        distIncludeJunk = true,
        tag = "DWAPFridge",
    },
    {     -- E59
        note = "counter @ kitchen",
        coords = { x = 3115, y = 12051, z = 0 },
        special = "kitchentools",
        level = "Loot_FoodLevel",
    },
    {     -- E60
        note = "counter @ kitchen",
        coords = { x = 3115, y = 12052, z = 0 },
        distIncludeJunk = false,
        tag = "DWAPFood",
    },
    {     -- E61
        note = "counter @ kitchen",
        coords = { x = 3115, y = 12054, z = 0 },
        dist = { "KitchenDryFood", },
        distIncludeJunk = false,
        tag = "DWAPFood",
    },
    {     -- E62
        note = "wardrobe @ hall",
        coords = { x = 3107, y = 12055, z = 0 },
        distIncludeJunk = false,
        tag = "DWAPFood",
    },
    {     -- E63
        note = "wardrobe @ hall",
        coords = { x = 3107, y = 12054, z = 0 },
        distIncludeJunk = false,
        tag = "DWAPBooze",
    },
    {     -- E64
        note = "metal_shelves @ closet",
        coords = { x = 3104, y = 12052, z = 0 },
        slot = "upper",
        special = "gunlocker",
        level = "Loot_GunLevel",
    },
    {     -- E65
        note = "shelves @ bedroom",
        coords = { x = 3105, y = 12049, z = 0 },
        distIncludeJunk = false,
        tag = "DWAPMedia",
    },
    {     -- E66
        note = "shelves @ bedroom",
        coords = { x = 3104, y = 12049, z = 0 },
        distIncludeJunk = false,
        tag = "DWAPMedia",
    },
    -- 2nd floor
    {     -- E67
        note = "counter @ bathroom",
        coords = { x = 3107, y = 12051, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPLockers",
    },
    {     -- E68
        note = "counter @ bathroom",
        coords = { x = 3107, y = 12050, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPMed",
    },
    {     -- E69 @TODO duplicate coords with entry 56
        note = "wardrobe @ bedroom",
        coords = { x = 3107, y = 12054, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPGun",
    },
    {     -- E70
        note = "wardrobe @ bedroom",
        coords = { x = 3107, y = 12053, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPLockers",
    },
    {     -- E71
        note = "dresser @ bedroom",
        coords = { x = 3111, y = 12052, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPLockers",
    },
    {     -- E72
        note = "sidetable @ bedroom",
        coords = { x = 3111, y = 12054, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPTailor",
    }
}
for i = 1, #siteLoot do loot[#loot + 1] = siteLoot[i] end

local AnimalRehab = {
    group = "Echo Creek",
    baseBuildings = {
        { x = 3108, y = 12053, z = 1 },  -- house
        { x = 3111, y = 12052, z = -1 }, -- basement
        { x = 3124, y = 12072, z = 0 },  -- nearest rehab building
    },
    spawn = { x = 3108, y = 12053, z = 1 },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = { x = 3121, y = 12065, z = -1 } },
    },
    waterFixtures = {
        { sprite = "fixtures_sinks_01_10",    x = 3115, y = 12052, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_0",  x = 3107, y = 12048, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_12",    x = 3108, y = 12048, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

        -- 2nd floor
        { sprite = "fixtures_bathroom_01_32", x = 3107, y = 12048, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_0",  x = 3108, y = 12048, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_1",     x = 3107, y = 12050, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_1",     x = 3107, y = 12051, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

        -- basement fixtures
        { sprite = "fixtures_sinks_01_8",     x = 3109, y = 12057, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_16",    x = 3115, y = 12052, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_6",  x = 3117, y = 12056, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
    },
    doorKeys = {
        name = "Animal Rehab",
        doors = {
            { sprite = "fixtures_doors_02_5", x = 3113, y = 12050, z = 0, },
            { sprite = "fixtures_doors_01_7", x = 3116, y = 12043, z = -1, },
            { sprite = "fixtures_doors_01_7", x = 3125, y = 12084, z = 0, },
            { sprite = "fixtures_doors_01_7", x = 3180, y = 12140, z = 0, },
        },
    },
    map = { name = "DWAPStashMap17", },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 3121, y = 12065, z = -1, },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 3119, y = 12065, z = -1, },
            fakeGenerators = {
                { x = 3117, y = 12061, z = -1 },
            },
        },
    },
    objectSpawns = {
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_8", x = 3116, y = 12052, z = 0, }, -- kitchen, bld 12,47#0
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_8", x = 3114, y = 12049, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_8", x = 3104, y = 12050, z = 0, }, -- window W | bedroom, bld 12,47#0
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_9", x = 3108, y = 12056, z = 0, }, -- hall, bld 12,47#0
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_9", x = 3112, y = 12056, z = 0, }, -- kitchen, bld 12,47#0
    },
    loot = loot,
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(AnimalRehab.objectSpawns,
        { enabled = "EnableLadders", x = 3113, y = 12063, z = -1, removeWall = "north", })

    table.insert(AnimalRehab.objectSpawns,
        { enabled = "EnableLadders", x = 3127, y = 12078, z = 0, removeFloor = true, clearExisting = true, })
end

return AnimalRehab
