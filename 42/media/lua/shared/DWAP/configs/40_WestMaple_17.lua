local wtc       = { x = 6119, y = 6640, z = -1, }
local pb1       = { x = 6123, y = 6640, z = -1, }
local WestMaple = {
    group = "Riverside",
    baseBuildings = {
        { x = 6117, y = 6638, z = 1 },  -- house
        { x = 6116, y = 6634, z = -1 }, -- basegame basement
        { x = 6125, y = 6641, z = -1 }, -- generator/storage basement
    },
    spawn = { x = 6117, y = 6638, z = 1 },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 6123, y = 6640, z = -1 },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 6121, y = 6640, z = -1, },
            fakeGenerators = {
                { x = 6127, y = 6635, z = -1 },
            },
        },
    },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = { x = 1666, y = 5746, z = -4 } },
    },
    waterFixtures = {
        { sprite = "fixtures_bathroom_01_1",  x = 6112, y = 6640, z = 1, sourceType = "tank", source = wtc, }, -- bathroom, bld 23,25#4
        { sprite = "fixtures_sinks_01_1",     x = 6112, y = 6639, z = 1, sourceType = "tank", source = wtc, }, -- bathroom, bld 23,25#4
        { sprite = "fixtures_sinks_01_1",     x = 6112, y = 6638, z = 1, sourceType = "tank", source = wtc, }, -- bathroom, bld 23,25#4
        { sprite = "fixtures_bathroom_01_32", x = 6112, y = 6635, z = 1, sourceType = "tank", source = wtc, }, -- bathroom, bld 23,25#4
        { sprite = "fixtures_bathroom_01_25", x = 6114, y = 6635, z = 1, sourceType = "tank", source = wtc, }, -- bathroom, bld 23,25#4
        { sprite = "fixtures_sinks_01_1",     x = 6116, y = 6630, z = 1, sourceType = "tank", source = wtc, }, -- bathroom, bld 23,25#4
        { sprite = "fixtures_sinks_01_1",     x = 6116, y = 6629, z = 1, sourceType = "tank", source = wtc, }, -- bathroom, bld 23,25#4
        { sprite = "fixtures_bathroom_01_1",  x = 6116, y = 6628, z = 1, sourceType = "tank", source = wtc, }, -- bathroom, bld 23,25#4
        { sprite = "fixtures_bathroom_01_25", x = 6118, y = 6628, z = 1, sourceType = "tank", source = wtc, }, -- bathroom, bld 23,25#4
        { sprite = "fixtures_sinks_01_9",     x = 6115, y = 6628, z = 0, sourceType = "tank", source = wtc, }, -- kitchen, bld 23,25#4
        { sprite = "appliances_laundry_01_0", x = 6121, y = 6631, z = 0, sourceType = "tank", source = wtc, }, -- laundry, bld 23,25#4
        { sprite = "fixtures_sinks_01_12",    x = 6122, y = 6628, z = 0, sourceType = "tank", source = wtc, }, -- bathroom, bld 23,25#4
        { sprite = "fixtures_bathroom_01_0",  x = 6123, y = 6628, z = 0, sourceType = "tank", source = wtc, }, -- bathroom, bld 23,25#4
    },
    doorKeys = {
        name = "West Maple Home Key",
        doors = {
            { sprite = "fixtures_doors_02_5", x = 6118, y = 6640, z = 0, },
            { sprite = "fixtures_doors_02_5", x = 6122, y = 6650, z = -1, },
        },
    },
    map = { name = "DWAPStashMap40", },
    objectSpawns = {
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_1", x = 6113, y = 6641, z = 0, },
        { barricade = "metal",    enabled = "Barricade", target = "fixtures_windows_01_1", x = 6115, y = 6641, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_0", x = 6124, y = 6629, z = 0, },
        { barricade = "metal",    enabled = "Barricade", target = "fixtures_doors_02_5",   x = 6120, y = 6628, z = 0, }, -- door N | hall, bld 23,25#4
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_1", x = 6115, y = 6628, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_0", x = 6112, y = 6632, z = 0, }, -- window W | kitchen, bld 23,25#4

    },
    loot = {
        { -- E1
            note = "sidetable @ bedroom",
            coords = { x = 6115, y = 6635, z = 1 },
            tag = "DWAPMedia",
        },
        { -- E2
            note = "sidetable @ bedroom",
            coords = { x = 6115, y = 6638, z = 1 },
            tag = "DWAPMedia",
        },
        { -- E3
            note = "shelves @ bedroom",
            coords = { x = 6120, y = 6636, z = 1 },
            slot = "upper",
            tag = "DWAPMedia",
        },
        { -- E4
            note = "dresser @ bedroom",
            coords = { x = 6120, y = 6637, z = 1 },
            tag = "DWAPLockers",
        },
        { -- E5
            note = "counter @ bathroom",
            coords = { x = 6112, y = 6638, z = 1 },
            tag = "DWAPMed",
        },
        { -- E6
            note = "counter @ bathroom",
            coords = { x = 6112, y = 6639, z = 1 },
            tag = "DWAPMed",
        },
        { -- E7
            note = "sidetable @ bedroom",
            coords = { x = 6112, y = 6628, z = 1 },
            tag = "DWAPMedia",
        },
        { -- E8
            note = "wardrobe @ bedroom",
            coords = { x = 6115, y = 6629, z = 1 },
            tag = "DWAPLockers",
        },
        { -- E9
            note = "wardrobe @ bedroom",
            coords = { x = 6115, y = 6630, z = 1 },
            tag = "DWAPLockers",
        },
        { -- E10
            note = "counter @ bathroom",
            coords = { x = 6116, y = 6629, z = 1 },
            tag = "DWAPMed",
        },
        { -- E11
            note = "counter @ bathroom",
            coords = { x = 6116, y = 6630, z = 1 },
            tag = "DWAPMed",
        },
        { -- E12
            note = "filingcabinet @ bedroom",
            coords = { x = 6119, y = 6628, z = 1 },
            tag = "DWAPMedia",
        },
        { -- E13
            note = "filingcabinet @ bedroom",
            coords = { x = 6119, y = 6629, z = 1 },
            tag = "DWAPMedia",
        },
        { -- E14
            note = "shelves @ bedroom",
            coords = { x = 6118, y = 6630, z = 1 },
            slot = "upper",
            tag = "DWAPMedia",
        },
        { -- E15
            note = "shelves @ bedroom",
            coords = { x = 6118, y = 6631, z = 1 },
            slot = "upper",
            tag = "DWAPMedia",
        },
        { -- E16
            note = "metal_shelves @ closet",
            coords = { x = 6123, y = 6632, z = 1 },
            slot = "upper",
            tag = "DWAPBuildMats",
        },
        { -- E17
            note = "shelves @ kidsbedroom",
            coords = { x = 6121, y = 6634, z = 1 },
            tag = "DWAPMedia",
        },
        { -- E18
            note = "shelves @ kidsbedroom",
            coords = { x = 6122, y = 6634, z = 1 },
            tag = "DWAPMedia",
        },
        { -- E19
            note = "dresser @ kidsbedroom",
            coords = { x = 6123, y = 6634, z = 1 },
            tag = "DWAPLockers",
        },
        { -- E20
            note = "sidetable @ kidsbedroom",
            coords = { x = 6121, y = 6638, z = 1 },
            tag = "DWAPMedia",
        },
        { -- E21
            note = "fireplace @ livingroom",
            coords = { x = 6112, y = 6637, z = 0 },
            tag = "DWAPMedia",
        },
        { -- E22
            note = "shelves @ livingroom",
            coords = { x = 6116, y = 6639, z = 0 },
            tag = "DWAPMedia",
        },
        { -- E23
            note = "shelves @ livingroom",
            coords = { x = 6116, y = 6640, z = 0 },
            tag = "DWAPMedia",
        },
        { -- E24
            note = "counter @ kitchen",
            coords = { x = 6112, y = 6628, z = 0 },
            tag = "DWAPFood",
        },
        { -- E25
            note = "shelves @ kitchen",
            coords = { x = 6112, y = 6628, z = 0 },
            slot = "upper",
            tag = "DWAPMedia",
        },
        { -- E26
            note = "counter @ kitchen",
            coords = { x = 6114, y = 6628, z = 0 },
            tag = "DWAPFood",
        },
        { -- E27
            note = "counter @ kitchen",
            coords = { x = 6115, y = 6628, z = 0 },
            tag = "DWAPFood",
        },
        { -- E28
            note = "counter @ kitchen",
            coords = { x = 6117, y = 6628, z = 0 },
            tag = "DWAPFood",
        },
        { -- E29
            note = "counter @ kitchen",
            coords = { x = 6118, y = 6628, z = 0 },
            tag = "DWAPFood",
        },
        { -- E30
            note = "counter @ kitchen",
            coords = { x = 6112, y = 6629, z = 0 },
            tag = "DWAPFood",
        },
        { -- E31
            note = "shelves @ kitchen",
            coords = { x = 6112, y = 6629, z = 0 },
            slot = "upper",
            tag = "DWAPMedia",
        },
        { -- E32
            note = "fridge @ kitchen",
            coords = { x = 6118, y = 6629, z = 0 },
            tag = "DWAPFridge",
        },
        { -- E33
            note = "freezer @ kitchen",
            coords = { x = 6118, y = 6629, z = 0 },
            slot = "freezer",
            tag = "DWAPFreezer",
        },
        { -- E34
            note = "counter @ kitchen",
            coords = { x = 6118, y = 6630, z = 0 },
            tag = "DWAPFood",
        },
        { -- E35
            note = "medicine @ bathroom",
            coords = { x = 6122, y = 6628, z = 0 },
            slot = "upper",
            tag = "DWAPMed",
        },
        { -- E36
            note = "metal_shelves @ laundry",
            coords = { x = 6122, y = 6631, z = 0 },
            slot = "upper",
            tag = "DWAPTools",
        },
        { -- E37
            note = "metal_shelves @ garage",
            coords = { x = 6121, y = 6634, z = 0 },
            tag = "DWAPTools",
        },
        { -- E38
            note = "cardboardbox @ garage",
            coords = { x = 6124, y = 6634, z = 0 },
            special = "maps",
        },
        { -- E39
            note = "cardboardbox @ garage",
            coords = { x = 6125, y = 6634, z = 0 },
            tag = "DWAPBuildMats",
        },
        { -- E40
            note = "metal_shelves @ garage",
            coords = { x = 6121, y = 6635, z = 0 },
            tag = "DWAPTools",
        },
        { -- E41
            note = "metal_shelves @ closet",
            coords = { x = 6120, y = 6640, z = 0 },
            slot = "upper",
            tag = "DWAPBuildMats",
        },
        { -- E42
            note = "crate @ warehouse",
            coords = { x = 6118, y = 6646, z = -1 },
            tag = "DWAPFood",
        },
        { -- E43
            note = "crate @ warehouse",
            coords = { x = 6118, y = 6646, z = -1 },
            stack = 2,
            tag = "DWAPFood",
        },
        { -- E44
            note = "crate @ warehouse",
            coords = { x = 6119, y = 6646, z = -1 },
            tag = "DWAPFood",
        },
        { -- E45
            note = "crate @ warehouse",
            coords = { x = 6119, y = 6646, z = -1 },
            stack = 2,
            tag = "DWAPFarm",
        },
        { -- E46
            note = "crate @ warehouse",
            coords = { x = 6120, y = 6646, z = -1 },
            tag = "DWAPBuildMats",
        },
        { -- E47
            note = "crate @ warehouse",
            coords = { x = 6120, y = 6646, z = -1 },
            stack = 2,
            tag = "DWAPBuildMats",
        },
        { -- E48
            note = "crate @ warehouse",
            coords = { x = 6121, y = 6646, z = -1 },
            tag = "DWAPFarm",
        },
        { -- E49
            note = "militarycrate @ warehouse",
            coords = { x = 6121, y = 6646, z = -1 },
            stack = 2,
            tag = "DWAPGun",
        },
        { -- E50
            note = "crate @ warehouse",
            coords = { x = 6122, y = 6646, z = -1 },
            tag = "DWAPTools",
        },
        { -- E51
            note = "militarycrate @ warehouse",
            coords = { x = 6122, y = 6646, z = -1 },
            stack = 2,
            tag = "DWAPGun",
        },
        { -- E52
            note = "crate @ warehouse",
            coords = { x = 6118, y = 6648, z = -1 },
            special = "essentials",
        },
        { -- E53
            note = "crate @ warehouse",
            coords = { x = 6118, y = 6648, z = -1 },
            stack = 2,
            tag = "DWAPFood",
        },
        { -- E54
            note = "crate @ warehouse",
            coords = { x = 6119, y = 6648, z = -1 },
            tag = "DWAPBuildMats",
        },
        { -- E55
            note = "crate @ warehouse",
            coords = { x = 6119, y = 6648, z = -1 },
            stack = 2,
            tag = "DWAPBuildMats",
        },
        { -- E56
            note = "shelves @ warehouse",
            coords = { x = 6118, y = 6649, z = -1 },
            tag = "DWAPMedia",
        },
        { -- E57
            note = "shelves @ warehouse",
            coords = { x = 6118, y = 6650, z = -1 },
            tag = "DWAPMedia",
        },
        { -- E58
            note = "shelves @ warehouse",
            coords = { x = 6118, y = 6651, z = -1 },
            tag = "DWAPMedia",
        },
        { -- E59
            note = "metal_shelves @ warehouse",
            coords = { x = 6118, y = 6654, z = -1 },
            tag = "DWAPTools",
        },
        { -- E60
            note = "metal_shelves @ warehouse",
            coords = { x = 6119, y = 6654, z = -1 },
            tag = "DWAPBuildMats",
        },
        { -- E61
            note = "crate @ warehouse",
            coords = { x = 6120, y = 6648, z = -1 },
            tag = "DWAPFood",
        },
        { -- E62
            note = "crate @ warehouse",
            coords = { x = 6120, y = 6648, z = -1 },
            stack = 2,
            tag = "DWAPFarm",
        },
        { -- E63
            note = "crate @ warehouse",
            coords = { x = 6121, y = 6648, z = -1 },
            tag = "DWAPFood",
        },
        { -- E64
            note = "crate @ warehouse",
            coords = { x = 6121, y = 6648, z = -1 },
            stack = 2,
            tag = "DWAPBuildMats",
        },
        { -- E65
            note = "crate @ warehouse",
            coords = { x = 6122, y = 6648, z = -1 },
            tag = "DWAPFood",
        },
        { -- E66
            note = "militarycrate @ warehouse",
            coords = { x = 6120, y = 6650, z = -1 },
            tag = "DWAPGun",
        },
        { -- E67
            note = "crate @ warehouse",
            coords = { x = 6120, y = 6650, z = -1 },
            stack = 2,
            tag = "DWAPTools",
        },
        { -- E68
            note = "shelves @ warehouse",
            coords = { x = 6120, y = 6651, z = -1 },
            tag = "DWAPMedia",
        },
        { -- E69
            note = "cardboardbox @ warehouse",
            coords = { x = 6121, y = 6651, z = -1 },
            tag = "DWAPBuildMats",
        },
        { -- E70
            note = "cardboardbox @ warehouse",
            coords = { x = 6121, y = 6651, z = -1 },
            slot = "upper",
            tag = "DWAPFarm",
        },
        { -- E71
            note = "smallbox @ warehouse",
            coords = { x = 6120, y = 6652, z = -1 },
            tag = "DWAPFood",
        },
        { -- E72
            note = "smallbox @ warehouse",
            coords = { x = 6121, y = 6652, z = -1 },
            tag = "DWAPFood",
        },
        { -- E73
            note = "metal_shelves @ warehouse",
            coords = { x = 6120, y = 6654, z = -1 },
            tag = "DWAPTools",
        },
        { -- E74
            note = "metal_shelves @ warehouse",
            coords = { x = 6121, y = 6654, z = -1 },
            tag = "DWAPFarm",
        },
        { -- E75
            note = "metal_shelves @ warehouse",
            coords = { x = 6122, y = 6654, z = -1 },
            slot = "upper",
            tag = "DWAPBuildMats",
        },
    },
}

-- if getActivatedMods():contains("\\Ladders") then
--     table.insert(WestMaple.objectSpawns,
--         { enabled = "EnableLadders", sprite = "fencing_01_27", x = 1628, y = 5760, z = 0, removeFloor = true, clearExisting = true, })
-- end

return WestMaple