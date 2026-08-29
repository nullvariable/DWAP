local wtc = { x = 12980, y = 1920, z = 0 } -- waterTankCoords
local pb1 = { x = 12981, y = 1922, z = -1 }
local bunkerTopLeft = { x = 12981, y = 1907, z = -1 }
local origin = { x = 12981, y = 1909, z = -1 } -- bunker shell E1 (maps dresser @ bunker)
local BunkerShell = require("DWAP/configs/presets/BunkerShell")
local loot = BunkerShell(origin)

-- config 09 site-specific squares: surface storage crates (E1-E3) and the
-- upstairs apartment (E28-E50); the bunker itself now comes from the preset.
loot[#loot + 1] = {
    note = "crate @ storage",
    coords = { x = 12984, y = 1916, z = 0 },
    distIncludeJunk = true,
    tag = "DWAPBuildMats",
}
loot[#loot + 1] = {
    note = "militarycrate @ storage",
    coords = { x = 12984, y = 1917, z = 0 },
    items = {
        { name = 'Base.NailsBox', },
        { name = 'Base.ScrewsBox', },
    },
    level = "Loot_BuildMatsLevel",
}
loot[#loot + 1] = {
    note = "militarycrate @ storage",
    coords = { x = 12984, y = 1918, z = 0 },
    dist = { "GasStoreEmergency" },
    distIncludeJunk = true,
    level = 2,
}
loot[#loot + 1] = {
    note = "shelves @ kitchen",
    coords = { x = 12995, y = 1911, z = 2 },
    slot = "upper",
    distIncludeJunk = true,
    tag = "DWAPTools",
}
loot[#loot + 1] = {
    note = "counter @ kitchen",
    coords = { x = 12991, y = 1911, z = 2 },
    distIncludeJunk = true,
    tag = "DWAPTools",
}
loot[#loot + 1] = {
    note = "fridge @ kitchen",
    coords = { x = 12992, y = 1911, z = 2 },
    distIncludeJunk = true,
    tag = "DWAPFridge",
}
loot[#loot + 1] = {
    note = "freezer @ kitchen",
    coords = { x = 12992, y = 1911, z = 2 },
    slot = "freezer",
    distIncludeJunk = true,
    tag = "DWAPFreezer",
}
loot[#loot + 1] = {
    note = "sidetable @ livingroom",
    coords = { x = 12993, y = 1922, z = 2 },
    dist = { "CrateVHSTapes" },
    distIncludeJunk = false,
    tag = "DWAPMedia",
}
loot[#loot + 1] = {
    note = "shelves @ livingroom",
    coords = { x = 12992, y = 1916, z = 2 },
    distIncludeJunk = false,
    tag = "DWAPMedia",
}
loot[#loot + 1] = {
    note = "sidetable @ livingroom",
    coords = { x = 12996, y = 1923, z = 2 },
    distIncludeJunk = false,
    tag = "DWAPMedia",
}
loot[#loot + 1] = {
    note = "wardrobe @ kidsbedroom",
    coords = { x = 12989, y = 1919, z = 2 },
    distIncludeJunk = true,
    tag = "DWAPTools",
}
loot[#loot + 1] = {
    note = "wardrobe @ kidsbedroom",
    coords = { x = 12990, y = 1919, z = 2 },
    distIncludeJunk = false,
    tag = "DWAPFish",
}
loot[#loot + 1] = {
    note = "sidetable @ kidsbedroom",
    coords = { x = 12989, y = 1922, z = 2 },
    distIncludeJunk = true,
    tag = "DWAPGun",
}
loot[#loot + 1] = {
    note = "dresser @ kidsbedroom",
    coords = { x = 12992, y = 1923, z = 2 },
    distIncludeJunk = true,
    tag = "DWAPLockers",
}
loot[#loot + 1] = {
    note = "counter @ kitchen",
    coords = { x = 12990, y = 1911, z = 2 },
    distIncludeJunk = false,
    tag = "DWAPFood",
}
loot[#loot + 1] = {
    note = "counter @ kitchen",
    coords = { x = 12989, y = 1911, z = 2 },
    distIncludeJunk = false,
    tag = "DWAPFood",
}
loot[#loot + 1] = {
    note = "counter @ kitchen",
    coords = { x = 12989, y = 1912, z = 2 },
    special = "kitchentools",
    level = "Loot_FoodLevel",
}
loot[#loot + 1] = {
    note = "counter @ kitchen",
    coords = { x = 12989, y = 1913, z = 2 },
    dist = { "StoreKitchenBaking", },
    distIncludeJunk = false,
    tag = "DWAPFood",
}
loot[#loot + 1] = {
    note = "dishescabinet @ diningroom",
    coords = { x = 13002, y = 1911, z = 2 },
    distIncludeJunk = false,
    tag = "DWAPBooze",
}
loot[#loot + 1] = {
    note = "dishescabinet @ diningroom",
    coords = { x = 13003, y = 1911, z = 2 },
    distIncludeJunk = false,
    tag = "DWAPBooze",
}
loot[#loot + 1] = {
    note = "counter @ bathroom",
    coords = { x = 12996, y = 1913, z = 2 },
    distIncludeJunk = true,
    tag = "DWAPMed",
}
loot[#loot + 1] = {
    note = "wardrobe @ bedroom",
    coords = { x = 13002, y = 1919, z = 2 },
    special = "gunlocker",
    level = "Loot_GunLevel",
}
loot[#loot + 1] = {
    note = "sidetable @ bedroom",
    coords = { x = 13000, y = 1920, z = 2 },
    special = "gunlocker",
    level = "Loot_GunLevel",
}
loot[#loot + 1] = {
    note = "sidetable @ bedroom",
    coords = { x = 13000, y = 1923, z = 2 },
    distIncludeJunk = true,
    tag = "DWAPLockers",
}
loot[#loot + 1] = {
    note = "counter @ bathroom",
    coords = { x = 12996, y = 1912, z = 2 },
    distIncludeJunk = true,
    tag = "DWAPTailor",
}
loot[#loot + 1] = {
    note = "wardrobe @ bedroom",
    coords = { x = 13003, y = 1919, z = 2 },
    distIncludeJunk = true,
    tag = "DWAPGun",
}

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
        { barricade = "metalbar", enabled = "Barricade", target = "walls_commercial_01_57", x = 12989, y = 1923, z = 2, },
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_57", x = 12990, y = 1924, z = 2, }, -- window N | outside, outside
        { barricade = "metalbar", enabled = "Barricade", target = "walls_commercial_01_57", x = 12998, y = 1924, z = 2, },
        { barricade = "metalbar", enabled = "Barricade", target = "walls_commercial_01_57", x = 13002, y = 1924, z = 2, },

        { sprite = "appliances_cooking_01_16", x = 12989, y = 1915, z = 2, isFireplace = true, },
    },
    loot = loot,
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(LowryCourt.objectSpawns, { enabled = "EnableLadders", x = 12939, y = 1933, z = 0, removeFloor = true, })
    table.insert(LowryCourt.objectSpawns,
        { enabled = "EnableLadders", sprite = "walls_interior_house_04_16", x = 12940, y = 1933, z = 0, })

    table.insert(LowryCourt.generators[1].fakeGenerators, { x = 12951, y = 1931, z = -4, createTile = false })
end

return LowryCourt
