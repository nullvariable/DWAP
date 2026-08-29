local wtc1 = { x = 594, y = 9371, z = 0, }
local pb1 = { x = 589, y = 9378, z = -1 }
local bunkerTopLeft = { x = 591, y = 9366, z = -1 }
local origin = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 2, z = bunkerTopLeft.z } -- bunker shell E1 (filing cabinet @ bunker, 591,9368,-1)
local BunkerShell = require("DWAP/configs/presets/BunkerShell_17")
local loot = BunkerShell(origin, {
    E8  = false, -- wood stove replaces the fridge
    E9  = false, -- wood stove replaces the freezer
    -- Adopt the reference LOADOUT, but keep config 21's own audited furniture:
    -- these squares are a filing cabinet and militarycrates, not the reference's
    -- dresser and plain crates (the room is already "@ bunker").
    E1  = { note = "filingcabinet @ bunker" },
    E22 = { note = "militarycrate @ bunker" },
    E23 = { note = "militarycrate @ bunker" },
    E24 = { note = "militarycrate @ bunker" },
    E25 = { note = "militarycrate @ bunker" },
})

-- config 21 site-specific squares; the bunker shell itself is the preset above.
local siteLoot = {
    -- derelict crate, upper floor
    { -- E1
        note = "crate @ derelict",
        coords = { x = 567, y = 9380, z = 1 },
        distIncludeJunk = false,
        tag = "DWAPFood",
    },
    -- extra bunker containers (not part of the preset shell)
    { -- E25
        note = "crate @ bunker",
        coords = { x = 597, y = 9375, z = -1 },
        distIncludeJunk = false,
        tag = "DWAPFood",
    },
    {     -- E26
        note = "crate @ bunker",
        coords = { x = 597, y = 9375, z = -1 },
        stack = 2,
        distIncludeJunk = false,
        tag = "DWAPFood",
    },
    {     -- E27
        note = "crate @ bunker",
        coords = { x = 596, y = 9375, z = -1 },
        distIncludeJunk = false,
        tag = "DWAPGun",
    },
    {     -- E28
        note = "crate @ bunker",
        coords = { x = 596, y = 9375, z = -1 },
        stack = 2,
        distIncludeJunk = false,
        tag = "DWAPGun",
    },
    {     -- E29
        note = "crate @ bunker",
        coords = { x = 595, y = 9375, z = -1 },
        distIncludeJunk = false,
        tag = "DWAPGun",
    },
    {     -- E30
        note = "crate @ bunker",
        coords = { x = 595, y = 9375, z = -1 },
        stack = 2,
        distIncludeJunk = false,
        tag = "DWAPGun",
    },
    {     -- E31
        note = "locker @ bunker",
        coords = { x = 594, y = 9375, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPTools",
    },
    {     -- E32
        note = "locker @ bunker",
        coords = { x = 593, y = 9375, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPTools",
    },
    {     -- E33
        note = "freezer @ bunker",
        coords = { x = 597, y = 9377, z = -1 },
        dist = { "FreezerIceCream", },
        distIncludeJunk = false,
        tag = "DWAPFreezer",
    },
    {     -- E34
        note = "locker @ bunker",
        coords = { x = 597, y = 9378, z = -1 },
        special = "gunlocker",
        level = "Loot_GunLevel",
    },
    {     -- E35
        note = "metal_shelves @ bunker",
        coords = { x = 595, y = 9377, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPBuildMats",
    },
    {     -- E36
        note = "metal_shelves @ bunker",
        coords = { x = 595, y = 9378, z = -1 },
        dist = { "KitchenDryFood" },
        distIncludeJunk = false,
        tag = "DWAPFood",
    },
    {     -- E37
        note = "metal_shelves @ bunker",
        coords = { x = 593, y = 9377, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPMed",
    },
    {     -- E38
        note = "metal_shelves @ bunker",
        coords = { x = 593, y = 9378, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPTailor",
    },
    -- 2nd floor, first floor, and exterior
    { -- E39
        note = "locker @ derelict",
        coords = { x = 575, y = 9371, z = 1 },
        distIncludeJunk = false,
        tag = "DWAPMedia",
    },
    {     -- E40
        note = "locker @ derelict",
        coords = { x = 572, y = 9371, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPTools",
    },
    {     -- E41
        note = "locker @ derelict",
        coords = { x = 569, y = 9371, z = 1 },
        distIncludeJunk = false,
        tag = "DWAPFish",
    },
    {     -- E42
        note = "locker @ derelict",
        coords = { x = 566, y = 9371, z = 1 },
        distIncludeJunk = false,
        tag = "DWAPFish",
    },
    {     -- E43
        note = "locker @ derelict",
        coords = { x = 575, y = 9377, z = 1 },
        distIncludeJunk = false,
        tag = "DWAPBooze",
    },
    {     -- E44
        note = "locker @ derelict",
        coords = { x = 572, y = 9377, z = 1 },
        distIncludeJunk = false,
        tag = "DWAPBooze",
    },
    {     -- E45
        note = "locker @ derelict",
        coords = { x = 569, y = 9377, z = 1 },
        distIncludeJunk = false,
        tag = "DWAPFood",
    },
    {     -- E46
        note = "locker @ derelict",
        coords = { x = 573, y = 9378, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPLockers",
    },
    {     -- E47
        note = "locker @ derelict",
        coords = { x = 574, y = 9378, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPLockers",
    },
    {     -- E48
        note = "locker @ derelict",
        coords = { x = 575, y = 9378, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPLockers",
    },
    {     -- E49
        note = "locker @ derelict",
        coords = { x = 576, y = 9378, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPLockers",
    },
    -- first floor
    {     -- E50
        note = "metal_shelves @ derelict",
        coords = { x = 564, y = 9378, z = 0 },
        distIncludeJunk = false,
        tag = "DWAPFarm",
    },
    {     -- E51
        note = "metal_shelves @ derelict",
        coords = { x = 564, y = 9380, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPFood",
    },
    {     -- E52
        note = "locker @ derelict",
        coords = { x = 575, y = 9371, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPTailor",
    },
    {     -- E53
        note = "locker @ derelict",
        coords = { x = 572, y = 9371, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPMed",
    },
    {     -- E54
        note = "locker @ derelict",
        coords = { x = 569, y = 9371, z = 0 },
        dist = { "CrateTortillaChips" },
        distIncludeJunk = true,
        tag = "DWAPFood",
    },
    {     -- E55
        note = "locker @ derelict",
        coords = { x = 566, y = 9371, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPTools",
    },
    {     -- E56
        note = "locker @ derelict",
        coords = { x = 566, y = 9377, z = 0 },
        dist = { "GigamartDryGoods" },
        distIncludeJunk = false,
        tag = "DWAPFood",
    },
    {     -- E57
        note = "locker @ derelict",
        coords = { x = 569, y = 9377, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPFood",
    },
    {     -- E58
        note = "locker @ derelict",
        coords = { x = 572, y = 9377, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPTools",
    },

    {     -- E59
        note = "logs @ outside",
        coords = { x = 557, y = 9379, z = 1 },
        items = {
            { name = 'Base.Firewood', chance = 1, count = { 30, 30 } },
        },
        level = "Loot_FarmLevel",
    },
    {     -- E60
        note = "logs @ outside",
        coords = { x = 558, y = 9379, z = 1 },
        items = {
            { name = 'Base.Firewood', chance = 1, count = { 30, 30 } },
        },
        level = "Loot_FarmLevel",
    },
    -- hallway kitchen
    {     -- E61
        note = "crate @ derelict",
        coords = { x = 564, y = 9380, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPFood",
    },
    {     -- E62
        note = "crate @ derelict",
        coords = { x = 564, y = 9380, z = 1 },
        stack = 2,
        distIncludeJunk = true,
        tag = "DWAPFood",
    },
    {     -- E63
        note = "counter @ derelict",
        coords = { x = 564, y = 9378, z = 1 },
        special = "kitchentools",
        level = "Loot_FoodLevel",
    },

    -- exterior near water tank
    {     -- E64
        note = "crate @ derelict",
        coords = { x = 593, y = 9374, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPBuildMats",
    },
    {     -- E65
        note = "crate @ derelict",
        coords = { x = 593, y = 9375, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPBuildMats",
    },
    {     -- E66
        note = "crate @ derelict",
        coords = { x = 594, y = 9375, z = 0 },
        items = {
            { name = 'Base.NailsBox', },
            { name = 'Base.ScrewsBox', },
        },
        level = "Loot_BuildMatsLevel",
    }
}
for i = 1, #siteLoot do loot[#loot + 1] = siteLoot[i] end

local EkronFactory = {
    group = "Ekron",
    baseBuildings = {
        { x = 565, y = 9374, z = 1 },  -- factory
        { x = 581, y = 9376, z = -1 }, -- factory basement
        { x = 592, y = 9375, z = -1 }, -- bunker
    },
    spawn = { x = 565, y = 9374, z = 1 },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 583, y = 9374, z = pb1.z },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 581, y = 9374, z = -1, },
            fakeGenerators = {
                { x = 587, y = 9377, z = -1, },
                { x = 568, y = 9381, z = -1, },
            },
        },
    },
    waterTanks = {
        { sprite = "industry_02_73", x = wtc1.x, y = wtc1.y, z = wtc1.z, sourceType = "generator", source = { x = 583, y = 9374, z = -1 } },
    },
    waterFixtures = {
        { sprite = "fixtures_sinks_01_13",   x = 564, y = 9375, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_13",   x = 564, y = 9376, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_29",   x = 576, y = 9376, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_29",   x = 576, y = 9377, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_6", x = 593, y = 9374, z = -1, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_16",   x = 591, y = 9370, z = -1, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
    },
    doorKeys = {
        name = "Ekron Factory",
        doors = {
            { sprite = "fixtures_doors_01_44", x = 576, y = 9379, z = 0, },
        },
    },
    map = { name = "DWAPStashMap21", },
    objectSpawns = {
        { barricade = "metalbar", target = "walls_commercial_01_84", x = 577, y = 9378, z = 0, },
        { barricade = "metal",    target = "walls_commercial_01_84", x = 577, y = 9380, z = 0, },
    },
    loot = loot,
}
if getActivatedMods():contains("\\Ladders") then
    table.insert(EkronFactory.objectSpawns,
        { enabled = "EnableLadders", x = 598, y = 9379, z = -1, removeWall = "north", })
    table.insert(EkronFactory.objectSpawns, { enabled = "EnableLadders", x = 598, y = 9376, z = 0, removeFloor = true, })
    table.insert(EkronFactory.objectSpawns,
        { enabled = "EnableLadders", x = 598, y = 9375, z = 0, clearExisting = true, })
end

return EkronFactory
