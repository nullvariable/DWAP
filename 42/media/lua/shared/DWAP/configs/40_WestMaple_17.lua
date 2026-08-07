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
        -- E1
        { type = 'container', coords = {x=6115,y=6635,z=1}, }, -- sidetable @ bedroom
        -- E2
        { type = 'container', coords = {x=6115,y=6638,z=1}, }, -- sidetable @ bedroom
        -- E3
        { type = 'container', coords = {x=6120,y=6636,z=1}, slot = "upper", }, -- shelves @ bedroom
        -- E4
        { type = 'container', coords = {x=6120,y=6637,z=1}, }, -- dresser @ bedroom
        -- E5
        { type = 'container', coords = {x=6112,y=6638,z=1}, }, -- counter @ bathroom
        -- E6
        { type = 'container', coords = {x=6112,y=6639,z=1}, }, -- counter @ bathroom
        -- E7
        { type = 'container', coords = {x=6112,y=6628,z=1}, }, -- sidetable @ bedroom
        -- E8
        { type = 'container', coords = {x=6115,y=6629,z=1}, }, -- wardrobe @ bedroom
        -- E9
        { type = 'container', coords = {x=6115,y=6630,z=1}, }, -- wardrobe @ bedroom
        -- E10
        { type = 'container', coords = {x=6116,y=6629,z=1}, }, -- counter @ bathroom
        -- E11
        { type = 'container', coords = {x=6116,y=6630,z=1}, }, -- counter @ bathroom
        -- E12
        { type = 'container', coords = {x=6119,y=6628,z=1}, }, -- filingcabinet @ bedroom
        -- E13
        { type = 'container', coords = {x=6119,y=6629,z=1}, }, -- filingcabinet @ bedroom
        -- E14
        { type = 'container', coords = {x=6118,y=6630,z=1}, slot = "upper", }, -- shelves @ bedroom
        -- E15
        { type = 'container', coords = {x=6118,y=6631,z=1}, slot = "upper", }, -- shelves @ bedroom
        -- E16
        { type = 'container', coords = {x=6123,y=6632,z=1}, slot = "upper", }, -- metal_shelves @ closet
        -- E17
        { type = 'container', coords = {x=6121,y=6634,z=1}, }, -- shelves @ kidsbedroom
        -- E18
        { type = 'container', coords = {x=6122,y=6634,z=1}, }, -- shelves @ kidsbedroom
        -- E19
        { type = 'container', coords = {x=6123,y=6634,z=1}, }, -- dresser @ kidsbedroom
        -- E20
        { type = 'container', coords = {x=6121,y=6638,z=1}, }, -- sidetable @ kidsbedroom
        -- E21
        { type = 'container', coords = {x=6112,y=6637,z=0}, }, -- fireplace @ livingroom
        -- E22
        { type = 'container', coords = {x=6116,y=6639,z=0}, }, -- shelves @ livingroom
        -- E23
        { type = 'container', coords = {x=6116,y=6640,z=0}, }, -- shelves @ livingroom
        -- E24
        { type = 'container', coords = {x=6112,y=6628,z=0}, }, -- counter @ kitchen
        -- E25
        { type = 'container', coords = {x=6112,y=6628,z=0}, slot = "upper", }, -- shelves @ kitchen
        -- E26
        { type = 'container', coords = {x=6114,y=6628,z=0}, }, -- counter @ kitchen
        -- E27
        { type = 'container', coords = {x=6115,y=6628,z=0}, }, -- counter @ kitchen
        -- E28
        { type = 'container', coords = {x=6117,y=6628,z=0}, }, -- counter @ kitchen
        -- E29
        { type = 'container', coords = {x=6118,y=6628,z=0}, }, -- counter @ kitchen
        -- E30
        { type = 'container', coords = {x=6112,y=6629,z=0}, }, -- counter @ kitchen
        -- E31
        { type = 'container', coords = {x=6112,y=6629,z=0}, slot = "upper", }, -- shelves @ kitchen
        -- E32
        { type = 'container', coords = {x=6118,y=6629,z=0}, }, -- fridge @ kitchen
        -- E33
        { type = 'container', coords = {x=6118,y=6629,z=0}, slot = "freezer", }, -- freezer @ kitchen
        -- E34
        { type = 'container', coords = {x=6118,y=6630,z=0}, }, -- counter @ kitchen
        -- E35
        { type = 'container', coords = {x=6122,y=6628,z=0}, slot = "upper", }, -- medicine @ bathroom
        -- E36
        { type = 'container', coords = {x=6122,y=6631,z=0}, slot = "upper", }, -- metal_shelves @ laundry
        -- E37
        { type = 'container', coords = {x=6121,y=6634,z=0}, }, -- metal_shelves @ garage
        -- E38
        { type = 'container', coords = {x=6124,y=6634,z=0}, }, -- cardboardbox @ garage
        -- E39
        { type = 'container', coords = {x=6125,y=6634,z=0}, }, -- cardboardbox @ garage
        -- E40
        { type = 'container', coords = {x=6121,y=6635,z=0}, }, -- metal_shelves @ garage
        -- E41
        { type = 'container', coords = {x=6120,y=6640,z=0}, slot = "upper", }, -- metal_shelves @ closet
        -- E42
        { type = 'container', coords = {x=6118,y=6646,z=-1}, }, -- crate @ warehouse
        -- E43
        { type = 'container', coords = {x=6118,y=6646,z=-1}, stack = 2, }, -- crate @ warehouse
        -- E44
        { type = 'container', coords = {x=6119,y=6646,z=-1}, }, -- crate @ warehouse
        -- E45
        { type = 'container', coords = {x=6119,y=6646,z=-1}, stack = 2, }, -- crate @ warehouse
        -- E46
        { type = 'container', coords = {x=6120,y=6646,z=-1}, }, -- crate @ warehouse
        -- E47
        { type = 'container', coords = {x=6120,y=6646,z=-1}, stack = 2, }, -- crate @ warehouse
        -- E48
        { type = 'container', coords = {x=6121,y=6646,z=-1}, }, -- crate @ warehouse
        -- E49
        { type = 'container', coords = {x=6121,y=6646,z=-1}, stack = 2, }, -- militarycrate @ warehouse
        -- E50
        { type = 'container', coords = {x=6122,y=6646,z=-1}, }, -- crate @ warehouse
        -- E51
        { type = 'container', coords = {x=6122,y=6646,z=-1}, stack = 2, }, -- militarycrate @ warehouse
        -- E52
        { type = 'container', coords = {x=6118,y=6648,z=-1}, }, -- crate @ warehouse
        -- E53
        { type = 'container', coords = {x=6118,y=6648,z=-1}, stack = 2, }, -- crate @ warehouse
        -- E54
        { type = 'container', coords = {x=6119,y=6648,z=-1}, }, -- crate @ warehouse
        -- E55
        { type = 'container', coords = {x=6119,y=6648,z=-1}, stack = 2, }, -- crate @ warehouse
        -- E56
        { type = 'container', coords = {x=6118,y=6649,z=-1}, }, -- shelves @ warehouse
        -- E57
        { type = 'container', coords = {x=6118,y=6650,z=-1}, }, -- shelves @ warehouse
        -- E58
        { type = 'container', coords = {x=6118,y=6651,z=-1}, }, -- shelves @ warehouse
        -- E59
        { type = 'container', coords = {x=6118,y=6654,z=-1}, }, -- metal_shelves @ warehouse
        -- E60
        { type = 'container', coords = {x=6119,y=6654,z=-1}, }, -- metal_shelves @ warehouse
        -- E61
        { type = 'container', coords = {x=6120,y=6648,z=-1}, }, -- crate @ warehouse
        -- E62
        { type = 'container', coords = {x=6120,y=6648,z=-1}, stack = 2, }, -- crate @ warehouse
        -- E63
        { type = 'container', coords = {x=6121,y=6648,z=-1}, }, -- crate @ warehouse
        -- E64
        { type = 'container', coords = {x=6121,y=6648,z=-1}, stack = 2, }, -- crate @ warehouse
        -- E65
        { type = 'container', coords = {x=6122,y=6648,z=-1}, }, -- crate @ warehouse
        -- E66
        { type = 'container', coords = {x=6120,y=6650,z=-1}, }, -- militarycrate @ warehouse
        -- E67
        { type = 'container', coords = {x=6120,y=6650,z=-1}, stack = 2, }, -- crate @ warehouse
        -- E68
        { type = 'container', coords = {x=6120,y=6651,z=-1}, }, -- shelves @ warehouse
        -- E69
        { type = 'container', coords = {x=6121,y=6651,z=-1}, }, -- cardboardbox @ warehouse
        -- E70
        { type = 'container', coords = {x=6121,y=6651,z=-1}, slot = "upper", }, -- cardboardbox @ warehouse
        -- E71
        { type = 'container', coords = {x=6120,y=6652,z=-1}, }, -- smallbox @ warehouse
        -- E72
        { type = 'container', coords = {x=6121,y=6652,z=-1}, }, -- smallbox @ warehouse
        -- E73
        { type = 'container', coords = {x=6120,y=6654,z=-1}, }, -- metal_shelves @ warehouse
        -- E74
        { type = 'container', coords = {x=6121,y=6654,z=-1}, }, -- metal_shelves @ warehouse
        -- E75
        { type = 'container', coords = {x=6122,y=6654,z=-1}, slot = "upper", }, -- metal_shelves @ warehouse
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(WestMaple.objectSpawns,
        { enabled = "EnableLadders", sprite = "fencing_01_27", x = 1628, y = 5760, z = 0, removeFloor = true, clearExisting = true, })
end

return WestMaple
