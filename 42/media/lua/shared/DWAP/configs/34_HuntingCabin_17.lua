local wtc = { x = 12718, y = 8739, z = -1 }
local bunkerTopLeft = { x = 12716, y = 8729, z = -1 }
local pb1 = { x = 12723, y = 8741, z = -1 }
local origin = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 2, z = bunkerTopLeft.z } -- bunker shell E1 (maps cabinet @ bunker, 12716,8731,-1)
local BunkerShell = require("DWAP/configs/presets/BunkerShell_17")
-- 1:1 bunker shell (same as config 33). Wood stove replaces the fridge/
-- freezer, and the two island tiles at +(2,4)/+(2,5) are single lockers (a
-- gunlocker and a militarylocker), not the crate PAIRS the reference shell
-- has -- so their stack-2 twins are dropped and both are noted as lockers.
local loot = BunkerShell(origin, {
    E8  = false, -- wood stove replaces the fridge
    E9  = false, -- wood stove replaces the freezer
    E19 = false, -- +(2,4) is a single gunlocker, not a crate pair
    E21 = false, -- +(2,5) is a single militarylocker, not a crate pair
    E18 = { note = "militarylocker @ bunker" }, -- gunlocker sits in a militarylocker
    E20 = { note = "militarylocker @ bunker" }, -- single militarylocker at +(2,5)
})

-- config 34 site-specific squares: bunker-hallway crates/shelves + the whole
-- cabin (main floor, 2nd floor) with its firewood pile.
local siteLoot = {
    { -- E22
            note = "crate @ hallway",
            coords = { x = 12716, y = 8742, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E23
            note = "crate @ hallway",
            coords = { x = 12716, y = 8742, z = -1 },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E24
            note = "shelves @ hallway",
            coords = { x = 12719, y = 8742, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        ------------------
        --- Main Floor ---
        ------------------
        { -- E25 wood pile
            note = "logs @ outside",
            coords = { x = 12718, y = 8754, z = 0 },
            items = {
                { name = 'Base.Firewood', chance = 1, count = { 30, 30 } },
            },
            level = "Loot_FarmLevel",
        },
        -- kitchen
        { -- E26
            note = "fridge @ kitchen",
            coords = { x = 12716, y = 8749, z = 0 },
            dist = { "WesternKitchenFridge", },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E27
            note = "freezer @ kitchen",
            coords = { x = 12716, y = 8749, z = 0 },
            slot = "freezer",
            dist = { "WesternKitchenFreezer", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E28
            note = "counter @ kitchen",
            coords = { x = 12713, y = 8746, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E29
            note = "counter @ kitchen",
            coords = { x = 12713, y = 8745, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E30
            note = "counter @ kitchen",
            coords = { x = 12715, y = 8745, z = 0 },
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E31
            note = "counter @ kitchen",
            coords = { x = 12716, y = 8745, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        -- living room
        { -- E32
            note = "shelves @ livingroom",
            coords = { x = 12723, y = 8753, z = 0 },
            dist = { "CrateVHSTapes" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E33
            note = "shelves @ livingroom",
            coords = { x = 12720, y = 8753, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E34
            note = "dishescabinet @ livingroom",
            coords = { x = 12718, y = 8750, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E35
            note = "dishescabinet @ livingroom",
            coords = { x = 12718, y = 8749, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        -- office/workroom
        { -- E36
            note = "cardboardbox @ office",
            coords = { x = 12714, y = 8753, z = 0 },
            items = {
                { name = 'Base.NailsBox', },
            },
            level = "Loot_BuildMatsLevel",
        },
        { -- E37
            note = "crate @ office",
            coords = { x = 12713, y = 8753, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E38
            note = "crate @ office",
            coords = { x = 12713, y = 8753, z = 0 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E39
            note = "cardboardbox @ office",
            coords = { x = 12713, y = 8752, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E40
            note = "locker @ office",
            coords = { x = 12713, y = 8750, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E41
            note = "dresser @ office",
            coords = { x = 12714, y = 8750, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        -----------------
        --- 2nd Floor ---
        -----------------
        -- bathroom
        { -- E42
            note = "counter @ bathroom",
            coords = { x = 12717, y = 8751, z = 1 },
            dist = { "CrateToiletPaper" },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E43
            note = "medicine @ bathroom",
            coords = { x = 12717, y = 8751, z = 1 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E44
            note = "counter @ bathroom",
            coords = { x = 12716, y = 8751, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPMed",
        },
        -- bunk bed bedroom
        { -- E45
            note = "dresser @ kidsbedroom",
            coords = { x = 12713, y = 8749, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E46
            note = "dresser @ kidsbedroom",
            coords = { x = 12713, y = 8748, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        -- main bedroom
        { -- E47
            note = "dresser @ bedroom",
            coords = { x = 12720, y = 8751, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E48
            note = "wardrobe @ bedroom",
            coords = { x = 12722, y = 8747, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E49
            note = "wardrobe @ bedroom",
            coords = { x = 12723, y = 8747, z = 1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E50
            note = "dresser @ bedroom",
            coords = { x = 12723, y = 8751, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        }
}
for i = 1, #siteLoot do loot[#loot + 1] = siteLoot[i] end

local HuntingCabin = {
    group = "Muldraugh",                 -- actually deep in the woods past the abandoned settlement to the south east
    baseBuildings = {
        { x = 12722, y = 8749, z = 1 },  -- cabin
        { x = 12717, y = 8738, z = -1 }, -- bunker
    },
    spawn = { x = 12722, y = 8749, z = 1 },
    waterTanks = {
        { sprite = "dwap_tiles_01_8", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = { x = pb1.x - 1, y = pb1.y, z = pb1.z } },
    },
    waterFixtures = {
        -- basement
        { sprite = "fixtures_sinks_01_16",    x = 12716, y = 8733, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_6",  x = 12718, y = 8737, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- 1st floor
        { sprite = "fixtures_sinks_01_5",     x = 12716, y = 8745, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "appliances_laundry_01_6", x = 12714, y = 8749, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "appliances_laundry_01_2", x = 12713, y = 8749, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- 2nd floor
        { sprite = "fixtures_sinks_01_20",    x = 12716, y = 8751, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_55", x = 12719, y = 8751, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_2",  x = 12719, y = 8749, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
    },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 12723, y = 8739, z = -1 },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 12721, y = 8739, z = -1, },
            fakeGenerators = {
                { x = 12720, y = 8745, z = -1, createTile = true },
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
        { barricade = "woodhalf", enabled = "Barricade", target = "walls_exterior_wooden_01_32", x = 12713, y = 8750, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target = "walls_exterior_wooden_01_32", x = 12713, y = 8751, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_1",       x = 12721, y = 8754, z = 0, }, -- window N | livingroom, bld 49,34#0
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_1",       x = 12722, y = 8754, z = 0, }, -- window N | livingroom, bld 49,34#0
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_1",       x = 12721, y = 8745, z = 0, }, -- window N | livingroom, bld 49,34#0
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_1",       x = 12722, y = 8745, z = 0, }, -- window N | livingroom, bld 49,34#0
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_0",       x = 12725, y = 8747, z = 0, }, -- window W | livingroom, bld 49,34#0
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_0",       x = 12725, y = 8751, z = 0, }, -- window W | livingroom, bld 49,34#0
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_0",       x = 12713, y = 8746, z = 0, }, -- window W | kitchen, bld 49,34#0
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_1",       x = 12715, y = 8745, z = 0, }, -- window N | kitchen, bld 49,34#0
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_1",       x = 12715, y = 8754, z = 0, }, -- window N | office, bld 49,34#0
    },
    loot = loot,
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
