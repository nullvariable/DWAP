local bunkerTopLeft = { x = 7226, y = 8197, z = -1 }
local wtc = { x = 7256, y = 8261, z = -1 }
local pb1 = { x = 7254, y = 8253, z = -1 }
local BunkerShell = require("DWAP/configs/presets/BunkerShell")
local R = "__REMOVE__" -- BunkerShell field-removal sentinel (see preset docs)

-- The four z=-3 bunkers are identical copies of config 01's floor plan, so
-- each is the shared BunkerShell. Deltas from the reference shell:
--   * every non-gunlocker special (maps, kitchentools, seed library, skill
--     mags, skill books, essentials) is redirected to DWAPFood -- those
--     specials live upstairs in the hotel, so down here the shelves are food.
--   * the two former militarycrate island tiles are single containers with the
--     stack-2 twin dropped (a plain locker at +(2,3), a militarylocker at
--     +(2,5)); the gunlocker tile is likewise a single militarylocker.
local bunkerOverrides = {
    E1  = { special = R, sandboxEnable = R, note = "dresser @ bunker",       tag = "DWAPFood" },
    E3  = { special = R, level = R,         note = "counter @ bunker",       tag = "DWAPFood" },
    E11 = { special = R, sandboxEnable = R, note = "metal_shelves @ bunker", tag = "DWAPFood" },
    E12 = { special = R, sandboxEnable = R, note = "metal_shelves @ bunker", tag = "DWAPFood" },
    E13 = { special = R, sandboxEnable = R, note = "metal_shelves @ bunker", tag = "DWAPFood" },
    E14 = { special = R, sandboxEnable = R, note = "metal_shelves @ bunker", tag = "DWAPFood" },
    E15 = { special = R,                    note = "metal_shelves @ bunker", tag = "DWAPFood" },
    E16 = { note = "locker @ bunker", tag = "DWAPGun", distIncludeJunk = true }, -- (2,3) is a plain locker (audit); was militarycrate (Media)
    E17 = false,                                                -- collapsed into E16
    E18 = { note = "militarylocker @ bunker" },                 -- single gunlocker
    E19 = false,                                                -- collapsed into E18
    E20 = { note = "militarylocker @ bunker", tag = "DWAPGun", distIncludeJunk = true }, -- was militarycrate (Farm)
    E21 = false,                                                -- collapsed into E20
}

local bunkerOrigins = {
    { x = 7254, y = 8243, z = -3 }, -- bunker west (maps dresser)
    { x = 7258, y = 8243, z = -3 }, -- bunker west center
    { x = 7262, y = 8243, z = -3 }, -- bunker east center
    { x = 7266, y = 8243, z = -3 }, -- bunker east
}

-- E1-E54: the hotel + z=-2 storage above the bunkers, preserved as authored.
local loot = {
    { -- E1
            note = "locker @ janitor",
            coords = { x = 7248, y = 8260, z = 2 },
            tag = "DWAPLockers",
        },
        { -- E2
            note = "locker @ janitor",
            coords = { x = 7250, y = 8260, z = 2 },
            tag = "DWAPLockers",
        },
        { -- E3
            note = "cardboardbox @ janitor",
            coords = { x = 7248, y = 8261, z = 2 },
            tag = "DWAPTools",
        },
        { -- E4
            note = "cardboardbox @ janitor",
            coords = { x = 7248, y = 8262, z = 2 },
            tag = "DWAPTools",
        },
        { -- E5
            note = "cardboardbox @ janitor",
            coords = { x = 7248, y = 8262, z = 2 },
            slot = "upper",
            tag = "DWAPBuildMats",
        },
        { -- E6
            note = "cardboardbox @ janitor",
            coords = { x = 7248, y = 8259, z = 1 },
            tag = "DWAPTools",
        },
        { -- E7
            note = "smallbox @ janitor",
            coords = { x = 7250, y = 8259, z = 1 },
            tag = "DWAPTools",
        },
        { -- E8
            note = "cardboardbox @ janitor",
            coords = { x = 7248, y = 8260, z = 1 },
            tag = "DWAPBuildMats",
        },
        { -- E9
            note = "cardboardbox @ janitor",
            coords = { x = 7248, y = 8260, z = 1 },
            slot = "upper",
            tag = "DWAPTools",
        },
        { -- E10
            note = "metal_shelves @ janitor",
            coords = { x = 7250, y = 8260, z = 1 },
            tag = "DWAPBuildMats",
        },
        { -- E11
            note = "medicine @ bathroom",
            coords = { x = 7249, y = 8261, z = 1 },
            slot = "upper",
            tag = "DWAPMed",
        },
        { -- E12
            note = "counter @ bathroom",
            coords = { x = 7249, y = 8261, z = 1 },
            tag = "DWAPMed",
        },
        { -- E13
            note = "wardrobe @ motelroom",
            coords = { x = 7243, y = 8259, z = 1 },
            tag = "DWAPLockers",
        },
        { -- E14
            note = "wardrobe @ motelroom",
            coords = { x = 7244, y = 8259, z = 1 },
            tag = "DWAPLockers",
        },
        { -- E15
            note = "dresser @ motelroom",
            coords = { x = 7246, y = 8259, z = 1 },
            special = "essentials",
        },
        { -- E16
            note = "dresser @ motelroom",
            coords = { x = 7246, y = 8256, z = 1 },
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E17
            note = "metal_shelves @ grocerystorage",
            coords = { x = 7248, y = 8259, z = -1 },
            tag = "DWAPFood",
        },
        { -- E18
            note = "metal_shelves @ grocerystorage",
            coords = { x = 7248, y = 8260, z = -1 },
            tag = "DWAPFood",
        },
        { -- E19
            note = "metal_shelves @ grocerystorage",
            coords = { x = 7248, y = 8261, z = -1 },
            tag = "DWAPFarm",
        },
        { -- E20
            note = "cardboardbox @ grocerystorage",
            coords = { x = 7251, y = 8261, z = -1 },
            tag = "DWAPFood",
        },
        { -- E21
            note = "metal_shelves @ grocerystorage",
            coords = { x = 7248, y = 8262, z = -1 },
            tag = "DWAPFood",
        },
        { -- E22
            note = "smallbox @ grocerystorage",
            coords = { x = 7250, y = 8262, z = -1 },
            tag = "DWAPFood",
        },
        { -- E23
            note = "cardboardbox @ grocerystorage",
            coords = { x = 7251, y = 8262, z = -1 },
            tag = "DWAPFarm",
        },
        { -- E24
            note = "counter @ janitor",
            coords = { x = 7256, y = 8256, z = -1 },
            tag = "DWAPTools",
        },
        { -- E25
            note = "metal_shelves @ janitor",
            coords = { x = 7257, y = 8256, z = -1 },
            tag = "DWAPTools",
        },
        { -- E26
            note = "cardboardbox @ storage",
            coords = { x = 7258, y = 8253, z = -1 },
            tag = "DWAPBuildMats",
        },
        { -- E27
            note = "cardboardbox @ storage",
            coords = { x = 7259, y = 8253, z = -1 },
            tag = "DWAPBuildMats",
        },
        { -- E28
            note = "cardboardbox @ storage",
            coords = { x = 7259, y = 8253, z = -1 },
            slot = "upper",
            tag = "DWAPFarm",
        },
        { -- E29
            note = "locker @ laundry",
            coords = { x = 7254, y = 8256, z = -2 },
            tag = "DWAPLockers",
        },
        { -- E30
            note = "medicine @ laundry",
            coords = { x = 7255, y = 8253, z = -2 },
            slot = "upper",
            tag = "DWAPMed",
        },
        { -- E31
            note = "militarylocker @ storage",
            coords = { x = 7258, y = 8249, z = -2 },
            tag = "DWAPGun",
        },
        { -- E32
            note = "militarylocker @ storage",
            coords = { x = 7262, y = 8249, z = -2 },
            tag = "DWAPGun",
        },
        { -- E33
            note = "woodstove @ storage",
            coords = { x = 7256, y = 8253, z = -2 },
            tag = "DWAPFarm",
        },
        { -- E34
            note = "crate @ storage",
            coords = { x = 7260, y = 8254, z = -2 },
            tag = "DWAPBuildMats",
        },
        { -- E35
            note = "crate @ storage",
            coords = { x = 7261, y = 8254, z = -2 },
            tag = "DWAPBuildMats",
        },
        { -- E36
            note = "crate @ storage",
            coords = { x = 7261, y = 8254, z = -2 },
            stack = 2,
            tag = "DWAPFarm",
        },
        { -- E37
            note = "crate @ storage",
            coords = { x = 7262, y = 8254, z = -2 },
            tag = "DWAPTools",
        },
        { -- E38
            note = "crate @ storage",
            coords = { x = 7262, y = 8254, z = -2 },
            stack = 2,
            tag = "DWAPBuildMats",
        },
        { -- E39
            note = "crate @ storage",
            coords = { x = 7263, y = 8254, z = -2 },
            tag = "DWAPFarm",
        },
        { -- E40
            note = "crate @ storage",
            coords = { x = 7256, y = 8255, z = -2 },
            tag = "DWAPBuildMats",
        },
        { -- E41
            note = "crate @ storage",
            coords = { x = 7260, y = 8255, z = -2 },
            tag = "DWAPTools",
        },
        { -- E42
            note = "crate @ storage",
            coords = { x = 7261, y = 8255, z = -2 },
            tag = "DWAPBuildMats",
        },
        { -- E43
            note = "crate @ storage",
            coords = { x = 7261, y = 8255, z = -2 },
            stack = 2,
            tag = "DWAPFarm",
        },
        { -- E44
            note = "crate @ storage",
            coords = { x = 7262, y = 8255, z = -2 },
            tag = "DWAPBuildMats",
        },
        { -- E45
            note = "crate @ storage",
            coords = { x = 7262, y = 8255, z = -2 },
            stack = 2,
            tag = "DWAPTools",
        },
        { -- E46
            note = "crate @ storage",
            coords = { x = 7263, y = 8255, z = -2 },
            tag = "DWAPBuildMats",
        },
        { -- E47
            note = "crate @ storage",
            coords = { x = 7263, y = 8255, z = -2 },
            stack = 2,
            tag = "DWAPFarm",
        },
        { -- E48
            note = "militarycrate @ storage",
            coords = { x = 7267, y = 8256, z = -2 },
            tag = "DWAPGun",
        },
        { -- E49
            note = "militarycrate @ storage",
            coords = { x = 7268, y = 8256, z = -2 },
            tag = "DWAPGun",
        },
        { -- E50
            note = "militarylocker @ storage",
            coords = { x = 7266, y = 8249, z = -2 },
            tag = "DWAPGun",
        },
        { -- E51
            note = "crate @ storage",
            coords = { x = 7264, y = 8254, z = -2 },
            tag = "DWAPTools",
        },
        { -- E52
            note = "crate @ storage",
            coords = { x = 7264, y = 8255, z = -2 },
            tag = "DWAPBuildMats",
        },
        { -- E53
            note = "crate @ storage",
            coords = { x = 7264, y = 8255, z = -2 },
            stack = 2,
            tag = "DWAPFarm",
        },
        { -- E54
            note = "militarycrate @ storage",
            coords = { x = 7268, y = 8255, z = -2 },
            tag = "DWAPGun",
        }
}
for i = 1, #bunkerOrigins do
    local shell = BunkerShell(bunkerOrigins[i], bunkerOverrides)
    for j = 1, #shell do loot[#loot + 1] = shell[j] end
end

local FallasHotel = {
    group = "Fallas Lake",
    baseBuildings = {
        { x = 7244,      y = 8258, z = 1 },  -- hotel
        { x = 7254,      y = 8257, z = -1 }, -- hotel basement
        { x = 7258,      y = 8252, z = -2 }, -- bunkers entrance
        { x = 7255,      y = 8250, z = -3 }, -- bunker west
        { x = 7255 + 4,  y = 8250, z = -3 }, -- bunker west center
        { x = 7255 + 8,  y = 8250, z = -3 }, -- bunker east center
        { x = 7255 + 12, y = 8250, z = -3 }, -- bunker east
    },
    baseRooms = {
        { x = 7243, y = 8256, z = 1 },  -- motelroom
        { x = 7243, y = 8259, z = 1 },  -- motelroom
        { x = 7248, y = 8261, z = 1 },  -- bathroom
        { x = 7248, y = 8259, z = 1 },  -- janitor
        { x = 7248, y = 8259, z = 2 },  -- janitor
        { x = 7248, y = 8259, z = -1 }, -- grocerystorage
        { x = 7254, y = 8256, z = -1 }, -- janitor
        { x = 7254, y = 8249, z = -1 }, -- storage
        { x = 7254, y = 8256, z = -2 }, -- laundry
        { x = 7254, y = 8250, z = -3 }, -- bunker
        { x = 7254, y = 8248, z = -3 }, -- bunker
        { x = 7256, y = 8256, z = -2 }, -- storage
        { x = 7258, y = 8250, z = -3 }, -- bunker
        { x = 7258, y = 8248, z = -3 }, -- bunker
        { x = 7262, y = 8248, z = -3 }, -- bunker
        { x = 7262, y = 8250, z = -3 }, -- bunker
        { x = 7266, y = 8248, z = -3 }, -- bunker
        { x = 7266, y = 8250, z = -3 }, -- bunker
    },
    spawn = { x = 7244, y = 8258, z = 1 },
    waterTanks = {
        { sprite = "dwap_tiles_01_8", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = { x = 7681, y = 12221, z = -1 } },
    },
    waterFixtures = {
        { sprite = "fixtures_bathroom_01_31", x = 7254, y = 8254, z = -2, sourceType = "tank", source = wtc, }, -- laundry, bld 28,32#56
        { sprite = "fixtures_bathroom_01_31", x = 7254, y = 8255, z = -2, sourceType = "tank", source = wtc, }, -- laundry, bld 28,32#56
        { sprite = "fixtures_bathroom_01_6",  x = 7256, y = 8249, z = -3, sourceType = "tank", source = wtc, }, -- bunker, bld 28,32#58
        { sprite = "fixtures_sinks_01_16",    x = 7254, y = 8245, z = -3, sourceType = "tank", source = wtc, }, -- bunker, bld 28,32#58
        { sprite = "fixtures_sinks_01_16",    x = 7258, y = 8245, z = -3, sourceType = "tank", source = wtc, }, -- bunker, bld 28,32#60
        { sprite = "fixtures_bathroom_01_6",  x = 7260, y = 8249, z = -3, sourceType = "tank", source = wtc, }, -- bunker, bld 28,32#60
        { sprite = "fixtures_bathroom_01_6",  x = 7264, y = 8249, z = -3, sourceType = "tank", source = wtc, }, -- bunker, bld 28,32#62
        { sprite = "fixtures_sinks_01_16",    x = 7262, y = 8245, z = -3, sourceType = "tank", source = wtc, }, -- bunker, bld 28,32#62
        { sprite = "fixtures_sinks_01_16",    x = 7266, y = 8245, z = -3, sourceType = "tank", source = wtc, }, -- bunker, bld 28,32#64
        { sprite = "fixtures_bathroom_01_6",  x = 7268, y = 8249, z = -3, sourceType = "tank", source = wtc, }, -- bunker, bld 28,32#64
        { sprite = "appliances_laundry_01_2", x = 7257, y = 8258, z = -1, sourceType = "tank", source = wtc, }, -- janitor, bld 28,32#2
        { sprite = "appliances_laundry_01_2", x = 7256, y = 8258, z = -1, sourceType = "tank", source = wtc, }, -- janitor, bld 28,32#2
        { sprite = "fixtures_sinks_01_29",    x = 7248, y = 8256, z = -1, sourceType = "tank", source = wtc, }, -- bathroom, bld 28,32#2
        { sprite = "fixtures_bathroom_01_1",  x = 7246, y = 8256, z = -1, sourceType = "tank", source = wtc, }, -- bathroom, bld 28,32#2
        { sprite = "fixtures_sinks_01_33",    x = 7244, y = 8256, z = -1, sourceType = "tank", source = wtc, }, -- kitchen, bld 28,32#2
        { sprite = "fixtures_sinks_01_16",    x = 7242, y = 8259, z = -1, sourceType = "tank", source = wtc, }, -- kitchen, bld 28,32#2
        { sprite = "fixtures_sinks_01_4",     x = 7243, y = 8258, z = 0,  sourceType = "tank", source = wtc, }, -- office, bld 28,32#36
        { sprite = "fixtures_sinks_01_12",    x = 7246, y = 8260, z = 0,  sourceType = "tank", source = wtc, }, -- bathroom, bld 28,32#36
        { sprite = "fixtures_bathroom_01_0",  x = 7247, y = 8260, z = 0,  sourceType = "tank", source = wtc, }, -- bathroom, bld 28,32#36
        { sprite = "fixtures_bathroom_01_55", x = 7247, y = 8262, z = 0,  sourceType = "tank", source = wtc, }, -- bathroom, bld 28,32#36
        { sprite = "fixtures_bathroom_01_0",  x = 7248, y = 8261, z = 1,  sourceType = "tank", source = wtc, }, -- bathroom, bld 28,32#36
        { sprite = "fixtures_sinks_01_2",     x = 7249, y = 8261, z = 1,  sourceType = "tank", source = wtc, }, -- bathroom, bld 28,32#36
        { sprite = "fixtures_bathroom_01_25", x = 7250, y = 8261, z = 1,  sourceType = "tank", source = wtc, }, -- bathroom, bld 28,32#36
        { sprite = "fixtures_bathroom_01_25", x = 7251, y = 8261, z = 1,  sourceType = "tank", source = wtc, }, -- bathroom, bld 28,32#36
        { sprite = "fixtures_sinks_01_2",     x = 7252, y = 8261, z = 1,  sourceType = "tank", source = wtc, }, -- bathroom, bld 28,32#36
        { sprite = "fixtures_bathroom_01_0",  x = 7253, y = 8261, z = 1,  sourceType = "tank", source = wtc, }, -- bathroom, bld 28,32#36
        { sprite = "fixtures_bathroom_01_1",  x = 7254, y = 8259, z = 1,  sourceType = "tank", source = wtc, }, -- bathroom, bld 28,32#36
        { sprite = "fixtures_sinks_01_1",     x = 7254, y = 8258, z = 1,  sourceType = "tank", source = wtc, }, -- bathroom, bld 28,32#36
        { sprite = "fixtures_bathroom_01_52", x = 7256, y = 8259, z = 1,  sourceType = "tank", source = wtc, }, -- bathroom, bld 28,32#36
        { sprite = "fixtures_bathroom_01_25", x = 7251, y = 8261, z = 2,  sourceType = "tank", source = wtc, }, -- bathroom, bld 28,32#36
        { sprite = "fixtures_sinks_01_2",     x = 7252, y = 8261, z = 2,  sourceType = "tank", source = wtc, }, -- bathroom, bld 28,32#36
        { sprite = "fixtures_bathroom_01_0",  x = 7253, y = 8261, z = 2,  sourceType = "tank", source = wtc, }, -- bathroom, bld 28,32#36
        { sprite = "fixtures_bathroom_01_1",  x = 7254, y = 8259, z = 2,  sourceType = "tank", source = wtc, }, -- bathroom, bld 28,32#36
        { sprite = "fixtures_sinks_01_1",     x = 7254, y = 8258, z = 2,  sourceType = "tank", source = wtc, }, -- bathroom, bld 28,32#36
        { sprite = "fixtures_bathroom_01_52", x = 7256, y = 8259, z = 2,  sourceType = "tank", source = wtc, }, -- bathroom, bld 28,32#36
    },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 7259, y = 8250, z = -1 },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 7257, y = 8250, z = -1, },
            fakeGenerators = {
                { x = 7254, y = 8254, z = -1, },
            },
        },
    },
    doorKeys = {
        name = "Fallas Hotel Keys",
        doors = {
            { sprite = "fixtures_doors_01_45", x = 7236,            y = 8199,            z = 0, },
            { sprite = "fixtures_doors_01_53", x = 7231,            y = 8217,            z = 0, },
            { sprite = "fixtures_doors_01_53", x = 7228,            y = 8205,            z = 0, },
            { sprite = "fixtures_doors_01_53", x = bunkerTopLeft.x, y = bunkerTopLeft.y, z = bunkerTopLeft.z, },
        },
    },
    map = { name = "DWAPStashMap31", },
    objectSpawns = {
        { barricade = "metalbar", enabled = "Barricade", target = "walls_commercial_02_53", x = 7261, y = 8256, z = 0, }, -- window W | hall, bld 28,32#36
        { barricade = "metalbar", enabled = "Barricade", target = "walls_commercial_02_52", x = 7261, y = 8257, z = 0, }, -- window W | hall, bld 28,32#36
        { barricade = "metalbar", enabled = "Barricade", target = "walls_commercial_02_51", x = 7261, y = 8258, z = 0, }, -- window W | hall, bld 28,32#36
        { barricade = "metalbar", enabled = "Barricade", target = "walls_commercial_02_53", x = 7261, y = 8260, z = 0, }, -- window W | hall, bld 28,32#36
        { barricade = "metalbar", enabled = "Barricade", target = "walls_commercial_02_52", x = 7261, y = 8261, z = 0, }, -- window W | hall, bld 28,32#36
        { barricade = "metalbar", enabled = "Barricade", target = "walls_commercial_02_51", x = 7261, y = 8262, z = 0, }, -- window W | hall, bld 28,32#36
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_25", x = 7244, y = 8256, z = 0, }, -- window N | office, bld 28,32#36
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_24", x = 7243, y = 8258, z = 0, }, -- window W | office, bld 28,32#36
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_24", x = 7243, y = 8260, z = 0, }, -- window W | bedroom, bld 28,32#36
    },
    loot = loot,
}

-- if getActivatedMods():contains("\\Ladders") then
--     table.insert(FallasHotel.objectSpawns, { x = 7678, y = 12206, z = -1, removeWall = "west" })
--     table.insert(FallasHotel.objectSpawns, { x = 7679, y = 12205, z = 0, removeFloor = true, clearExisting = true, })
-- else
-- --     table.insert(FallasHotel.objectSpawns, { sprite = "industry_trucks_01_4", x = 2607, y = 14453, z = -1, replaceWall = true, })
-- end
return FallasHotel
