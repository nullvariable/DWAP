-- @TODO (2026-08-07 audit) unresolved - delete lines as they are fixed
--   * 75 skeleton entries carry coords but no loot yet - entries 1-75
--   * systems: 11 components at 1657-1665,5744-5750 z=-4,-3,-2,0,1 report
--     "square not loaded" - those chunks never stream when travelling to this
--     base, which is what a pre-move or otherwise wrong coordinate looks like
local wtc1      = { x = 6119, y = 6640, z = -1, }
local pb1       = { x = 6123, y = 6640, z = -1, }
local WestMaple = {
    group = "Riverside",
    baseBuildings = {
        { x = 6117, y = 6638, z = 1 },  -- house
        { x = 6116, y = 6634, z = -1 }, -- basegame basement
        { x = 6116, y = 6634, z = -1 }, -- basegame basement
        { x = 6125, y = 6641, z = -1 }, -- generator/storage basement
    },
    spawn = { x = 6117, y = 6638, z = 1 },
    generators = {
        {
            controls = { sprite = "industry_02_67", x = pb1.x - 1, y = pb1.y, z = pb1.z, },
            fakeGenerators = {
                { x = 6127, y = 6635, z = -1, createTile = true },
            },
        },
    },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc1.x, y = wtc1.y, z = wtc1.z, sourceType = "generator", source = { x = 1666, y = 5746, z = -4 } },
    },
    waterFixtures = {
        { sprite = "fixtures_bathroom_01_1",  x = 1661, y = 5749, z = -4, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_9",     x = 1663, y = 5749, z = -4, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_30", x = 1658, y = 5750, z = -4, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_32",    x = 1665, y = 5749, z = -3, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "appliances_laundry_01_7", x = 1659, y = 5746, z = -2, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },

        { sprite = "fixtures_bathroom_01_4",  x = 1658, y = 5747, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_9",     x = 1659, y = 5747, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },

        { sprite = "fixtures_sinks_01_9",     x = 1661, y = 5744, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_33", x = 1657, y = 5748, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_2",  x = 1659, y = 5748, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_23",    x = 1659, y = 5747, z = 1,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
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
        { barricade = "metal",    enabled = "Barricade", target = "fixtures_door_02_5",  x = 6120, y = 6628, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_1", x = 6115, y = 6628, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_0", x = 6112, y = 6632, z = 0, },

    },
    loot = {
        { -- E1
            note = "sidetable @ bedroom",
            coords = {x=6115,y=6635,z=1},
        },
        { -- E2
            note = "sidetable @ bedroom",
            coords = {x=6115,y=6638,z=1},
        },
        { -- E3
            note = "shelves @ bedroom",
            coords = {x=6120,y=6636,z=1},
            slot = "upper",
        },
        { -- E4
            note = "dresser @ bedroom",
            coords = {x=6120,y=6637,z=1},
        },
        { -- E5
            note = "counter @ bathroom",
            coords = {x=6112,y=6638,z=1},
        },
        { -- E6
            note = "counter @ bathroom",
            coords = {x=6112,y=6639,z=1},
        },
        { -- E7
            note = "sidetable @ bedroom",
            coords = {x=6112,y=6628,z=1},
        },
        { -- E8
            note = "wardrobe @ bedroom",
            coords = {x=6115,y=6629,z=1},
        },
        { -- E9
            note = "wardrobe @ bedroom",
            coords = {x=6115,y=6630,z=1},
        },
        { -- E10
            note = "counter @ bathroom",
            coords = {x=6116,y=6629,z=1},
        },
        { -- E11
            note = "counter @ bathroom",
            coords = {x=6116,y=6630,z=1},
        },
        { -- E12
            note = "filingcabinet @ bedroom",
            coords = {x=6119,y=6628,z=1},
        },
        { -- E13
            note = "filingcabinet @ bedroom",
            coords = {x=6119,y=6629,z=1},
        },
        { -- E14
            note = "shelves @ bedroom",
            coords = {x=6118,y=6630,z=1},
            slot = "upper",
        },
        { -- E15
            note = "shelves @ bedroom",
            coords = {x=6118,y=6631,z=1},
            slot = "upper",
        },
        { -- E16
            note = "metal_shelves @ closet",
            coords = {x=6123,y=6632,z=1},
            slot = "upper",
        },
        { -- E17
            note = "shelves @ kidsbedroom",
            coords = {x=6121,y=6634,z=1},
        },
        { -- E18
            note = "shelves @ kidsbedroom",
            coords = {x=6122,y=6634,z=1},
        },
        { -- E19
            note = "dresser @ kidsbedroom",
            coords = {x=6123,y=6634,z=1},
        },
        { -- E20
            note = "sidetable @ kidsbedroom",
            coords = {x=6121,y=6638,z=1},
        },
        { -- E21
            note = "fireplace @ livingroom",
            coords = {x=6112,y=6637,z=0},
        },
        { -- E22
            note = "shelves @ livingroom",
            coords = {x=6116,y=6639,z=0},
        },
        { -- E23
            note = "shelves @ livingroom",
            coords = {x=6116,y=6640,z=0},
        },
        { -- E24
            note = "counter @ kitchen",
            coords = {x=6112,y=6628,z=0},
        },
        { -- E25
            note = "shelves @ kitchen",
            coords = {x=6112,y=6628,z=0},
            slot = "upper",
        },
        { -- E26
            note = "counter @ kitchen",
            coords = {x=6114,y=6628,z=0},
        },
        { -- E27
            note = "counter @ kitchen",
            coords = {x=6115,y=6628,z=0},
        },
        { -- E28
            note = "counter @ kitchen",
            coords = {x=6117,y=6628,z=0},
        },
        { -- E29
            note = "counter @ kitchen",
            coords = {x=6118,y=6628,z=0},
        },
        { -- E30
            note = "counter @ kitchen",
            coords = {x=6112,y=6629,z=0},
        },
        { -- E31
            note = "shelves @ kitchen",
            coords = {x=6112,y=6629,z=0},
            slot = "upper",
        },
        { -- E32
            note = "fridge @ kitchen",
            coords = {x=6118,y=6629,z=0},
        },
        { -- E33
            note = "freezer @ kitchen",
            coords = {x=6118,y=6629,z=0},
            slot = "freezer",
        },
        { -- E34
            note = "counter @ kitchen",
            coords = {x=6118,y=6630,z=0},
        },
        { -- E35
            note = "medicine @ bathroom",
            coords = {x=6122,y=6628,z=0},
            slot = "upper",
        },
        { -- E36
            note = "metal_shelves @ laundry",
            coords = {x=6122,y=6631,z=0},
            slot = "upper",
        },
        { -- E37
            note = "metal_shelves @ garage",
            coords = {x=6121,y=6634,z=0},
        },
        { -- E38
            note = "cardboardbox @ garage",
            coords = {x=6124,y=6634,z=0},
        },
        { -- E39
            note = "cardboardbox @ garage",
            coords = {x=6125,y=6634,z=0},
        },
        { -- E40
            note = "metal_shelves @ garage",
            coords = {x=6121,y=6635,z=0},
        },
        { -- E41
            note = "metal_shelves @ closet",
            coords = {x=6120,y=6640,z=0},
            slot = "upper",
        },
        { -- E42
            note = "crate @ warehouse",
            coords = {x=6118,y=6646,z=-1},
        },
        { -- E43
            note = "crate @ warehouse",
            coords = {x=6118,y=6646,z=-1},
            stack = 2,
        },
        { -- E44
            note = "crate @ warehouse",
            coords = {x=6119,y=6646,z=-1},
        },
        { -- E45
            note = "crate @ warehouse",
            coords = {x=6119,y=6646,z=-1},
            stack = 2,
        },
        { -- E46
            note = "crate @ warehouse",
            coords = {x=6120,y=6646,z=-1},
        },
        { -- E47
            note = "crate @ warehouse",
            coords = {x=6120,y=6646,z=-1},
            stack = 2,
        },
        { -- E48
            note = "crate @ warehouse",
            coords = {x=6121,y=6646,z=-1},
        },
        { -- E49
            note = "militarycrate @ warehouse",
            coords = {x=6121,y=6646,z=-1},
            stack = 2,
        },
        { -- E50
            note = "crate @ warehouse",
            coords = {x=6122,y=6646,z=-1},
        },
        { -- E51
            note = "militarycrate @ warehouse",
            coords = {x=6122,y=6646,z=-1},
            stack = 2,
        },
        { -- E52
            note = "crate @ warehouse",
            coords = {x=6118,y=6648,z=-1},
        },
        { -- E53
            note = "crate @ warehouse",
            coords = {x=6118,y=6648,z=-1},
            stack = 2,
        },
        { -- E54
            note = "crate @ warehouse",
            coords = {x=6119,y=6648,z=-1},
        },
        { -- E55
            note = "crate @ warehouse",
            coords = {x=6119,y=6648,z=-1},
            stack = 2,
        },
        { -- E56
            note = "shelves @ warehouse",
            coords = {x=6118,y=6649,z=-1},
        },
        { -- E57
            note = "shelves @ warehouse",
            coords = {x=6118,y=6650,z=-1},
        },
        { -- E58
            note = "shelves @ warehouse",
            coords = {x=6118,y=6651,z=-1},
        },
        { -- E59
            note = "metal_shelves @ warehouse",
            coords = {x=6118,y=6654,z=-1},
        },
        { -- E60
            note = "metal_shelves @ warehouse",
            coords = {x=6119,y=6654,z=-1},
        },
        { -- E61
            note = "crate @ warehouse",
            coords = {x=6120,y=6648,z=-1},
        },
        { -- E62
            note = "crate @ warehouse",
            coords = {x=6120,y=6648,z=-1},
            stack = 2,
        },
        { -- E63
            note = "crate @ warehouse",
            coords = {x=6121,y=6648,z=-1},
        },
        { -- E64
            note = "crate @ warehouse",
            coords = {x=6121,y=6648,z=-1},
            stack = 2,
        },
        { -- E65
            note = "crate @ warehouse",
            coords = {x=6122,y=6648,z=-1},
        },
        { -- E66
            note = "militarycrate @ warehouse",
            coords = {x=6120,y=6650,z=-1},
        },
        { -- E67
            note = "crate @ warehouse",
            coords = {x=6120,y=6650,z=-1},
            stack = 2,
        },
        { -- E68
            note = "shelves @ warehouse",
            coords = {x=6120,y=6651,z=-1},
        },
        { -- E69
            note = "cardboardbox @ warehouse",
            coords = {x=6121,y=6651,z=-1},
        },
        { -- E70
            note = "cardboardbox @ warehouse",
            coords = {x=6121,y=6651,z=-1},
            slot = "upper",
        },
        { -- E71
            note = "smallbox @ warehouse",
            coords = {x=6120,y=6652,z=-1},
        },
        { -- E72
            note = "smallbox @ warehouse",
            coords = {x=6121,y=6652,z=-1},
        },
        { -- E73
            note = "metal_shelves @ warehouse",
            coords = {x=6120,y=6654,z=-1},
        },
        { -- E74
            note = "metal_shelves @ warehouse",
            coords = {x=6121,y=6654,z=-1},
        },
        { -- E75
            note = "metal_shelves @ warehouse",
            coords = {x=6122,y=6654,z=-1},
            slot = "upper",
        },    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(WestMaple.objectSpawns,
        { enabled = "EnableLadders", sprite = "fencing_01_27", x = 1628, y = 5760, z = 0, removeFloor = true, clearExisting = true, })
end

return WestMaple
