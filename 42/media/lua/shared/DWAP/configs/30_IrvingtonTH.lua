local bunkerTopLeft = { x = 2607, y = 14436, z = -1 }
local wtc = { x = 2609, y = 14446, z = -1 }
local pb1 = { x = 2611, y = 14448, z = -1 }
local origin = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 2, z = bunkerTopLeft.z } -- bunker shell E1 (maps cabinet @ bunker, 2607,14438,-1)
local BunkerShell = require("DWAP/configs/presets/BunkerShell")
-- Straight 1:1 bunker shell (wood stove replaces the fridge/freezer); no
-- per-slot loadout tweaks -- adopt the reference shell verbatim.
local loot = BunkerShell(origin, {
    E8 = false, -- wood stove replaces the fridge
    E9 = false, -- wood stove replaces the freezer
    E17 = false, -- locker instead of crates
    E19 = false,
    E21 = false, -- +(2,5) is a single militarylocker (audit); drop the stack-2 twin
})

-- config 30 site-specific squares: extra metal shelves along the far wall
-- (a firewood cache for the wood stove + a build-materials shelf).
local siteLoot = {
    { -- E22
        note = "metal_shelves @ bunker",
        coords = { x = 2609, y = 14448, z = -1 },
        items = {
            { name = 'Base.Firewood', chance = 1, count = { 30, 30 } },
        },
        level = "Loot_FarmLevel",
    },
    { -- E23
        note = "metal_shelves @ bunker",
        coords = { x = 2610, y = 14448, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPBuildMats",
    },
    {
        note = "smallbox @ storage",
        coords = { x = 2610, y = 14456, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPMedia",
    },
    {
        note = "crate @ storage",
        coords = { x = 2611, y = 14456, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPFarm",
    },
    {
        note = "crate @ storage",
        coords = { x = 2612, y = 14456, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPBuildMats",
    },
    {
        note = "crate @ storage",
        coords = { x = 2612, y = 14456, z = -1 },
        stack = 2,
        distIncludeJunk = true,
        tag = "DWAPTools",
    },
    {
        note = "crate @ storage",
        coords = { x = 2612, y = 14457, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPBooze",
    },
    {
        note = "crate @ storage",
        coords = { x = 2612, y = 14458, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPBuildMats",
    },
    {
        note = "metal_shelves @ laundry",
        coords = { x = 2612, y = 14463, z = -1 },
        slot = "upper",
        distIncludeJunk = true,
        tag = "DWAPLockers",
    },
    {
        note = "metal_shelves @ laundry",
        coords = { x = 2606, y = 14464, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPGun",
    },
    {
        note = "metal_shelves @ laundry",
        coords = { x = 2606, y = 14465, z = -1 },
        distIncludeJunk = true,
        tag = "DWAPFish",
    },


    {
        note = "wardrobe @ hall",
        coords = { x = 2606, y = 14462, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPBooze",
    },
    {
        note = "wardrobe @ hall",
        coords = { x = 2606, y = 14463, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPGun",
    },

    {
        note = "fridge @ kitchen",
        coords = { x = 2608, y = 14465, z = 0 },
        distIncludeJunk = false,
        tag = "DWAPFridge",
    },
    {
        note = "freezer @ kitchen",
        coords = { x = 2608, y = 14465, z = 0 },
        slot = "freezer",
        distIncludeJunk = false,
        tag = "DWAPFreezer",
    },
    {
        note = "counter @ kitchen",
        coords = { x = 2609, y = 14465, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPFarm",
    },
    {
        note = "counter @ kitchen",
        coords = { x = 2610, y = 14465, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPFood",
    },
    {
        note = "counter @ kitchen",
        coords = { x = 2611, y = 14465, z = 0 },
        distIncludeJunk = true,
        tag = "DWAPFood",
    },
    {
        note = "counter @ kitchen",
        coords = { x = 2612, y = 14465, z = 0 },
        special = "kitchentools",
    },
    {
        note = "shelves @ kitchen",
        coords = { x = 2612, y = 14461, z = 0 },
        slot = "upper",
        distIncludeJunk = true,
        tag = "DWAPTailor",
    },

    {
        note = "dresser @ bedroom",
        coords = { x = 2611, y = 14457, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPLockers",
    },
    {
        note = "wardrobe @ bedroom",
        coords = { x = 2608, y = 14459, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPLockers",
    },
    {
        note = "wardrobe @ bedroom",
        coords = { x = 2608, y = 14460, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPGun",
    },
    {
        note = "sidetable @ bedroom",
        coords = { x = 2612, y = 14460, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPFood",
    },
    {
        note = "metal_shelves @ closet",
        coords = { x = 2610, y = 14461, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPTools",
        slot = "upper",
    },
    {
        note = "sidetable @ bedroom",
        coords = { x = 2608, y = 14464, z = 1 },
        special = "gunlocker",
        level = "Loot_GunLevel",
    },
    {
        note = "dresser @ bedroom",
        coords = { x = 2610, y = 14462, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPFood",
    },
    {
        note = "counter @ bathroom",
        coords = { x = 2606, y = 14465, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPMed",
    },
    {
        note = "shelves @ hall",
        coords = { x = 2606, y = 14461, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPLockers",
    },
    {
        note = "shelves @ hall",
        coords = { x = 2606, y = 14462, z = 1 },
        distIncludeJunk = true,
        tag = "DWAPMedia",
    },
}
for i = 1, #siteLoot do loot[#loot + 1] = siteLoot[i] end

local IrvingtonTH = {
    group = "Irvington",
    baseBuildings = {
        { x = 2609, y = 14458, z = 1 },  -- townhome
        { x = 2609, y = 14458, z = -1 }, -- townhome basement
        { x = 2609, y = 14449, z = -1 }, -- bunker
    },
    spawn = { x = 2609, y = 14458, z = 1 },
    waterTanks = {
        { sprite = "dwap_tiles_01_8", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = { x = 2614, y = 14446, z = -1 } },
    },
    waterFixtures = {
        { sprite = "fixtures_bathroom_01_6",  x = 2609, y = 14444, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_16",    x = 2607, y = 14440, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "appliances_laundry_01_7", x = 2612, y = 14464, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_11",    x = 2611, y = 14465, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_0",     x = 2606, y = 14465, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_3",  x = 2607, y = 14465, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_33", x = 2606, y = 14463, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
    },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 2614, y = 14446, z = -1, },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 2612, y = 14446, z = -1, },
            fakeGenerators = {
                { x = 2606, y = 14454, z = -1, createTile = true },
            },
        },
    },
    doorKeys = {
        name = "Irvington Townhome",
        doors = {
            { sprite = "fixtures_doors_01_45", x = 2611, y = 14456, z = 0, },
            { sprite = "fixtures_doors_01_53", x = 2608, y = 14449, z = -1, },
        },
    },
    map = { name = "DWAPStashMap30", },
    objectSpawns = {
        { barricade = "woodhalf", enabled = "Barricade", target = "walls_commercial_01_41",     x = 2608, y = 14456, z = 0, }, -- window N | livingroom, bld 10,56#16
        { barricade = "woodhalf", enabled = "Barricade", target = "walls_commercial_01_41",     x = 2609, y = 14456, z = 0, }, -- window N | livingroom, bld 10,56#16
        { barricade = "metal",    enabled = "Barricade", target = "walls_exterior_house_01_25", x = 2611, y = 14466, z = 0, },
    },
    loot = loot,
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(IrvingtonTH.objectSpawns,
        { enabled = "EnableLadders", x = 2559, y = 14454, z = 0, removeFloor = true, clearExisting = true, })
else
    table.insert(IrvingtonTH.objectSpawns,
        { sprite = "industry_trucks_01_4", x = 2607, y = 14453, z = -1, replaceWall = true, })
end
return IrvingtonTH
