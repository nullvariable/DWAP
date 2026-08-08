-- @TODO (2026-08-07 audit) unresolved - delete lines as they are fixed
--   * entry 64: square holds no container at all - coords are stale or the
--     object was removed
--   * 72 skeleton entries carry coords but no loot yet - entries 1-72
--   * systems: 11 components at 1657-1665,5744-5750 z=-4,-3,-2,0,1 report
--     "square not loaded" - those chunks never stream when travelling to this
--     base, which is what a pre-move or otherwise wrong coordinate looks like
--   * systems: generator controls declare industry_02_67 but no such object
--     is on the square. 11 configs name that sprite and ALL 11 fail, while 32
--     configs use dwap_tiles_01_22 - the maps look to have moved on and these
--     configs did not. Confirm what is actually there before editing
local wtc1 = { x = 12394, y = 3411, z = -2, }
local pb1 = { x = 12396, y = 3415, z = -2, }
local LeafHill = {
    group = "Louisville",
    baseBuildings = {
        { x = 12395, y = 3404, z = 1 },  -- house
        { x = 12396, y = 3411, z = -1 }, -- basement
    },
    spawn = { x = 12395, y = 3404, z = 1 },
    generators = {
        {
            controls = { sprite = "industry_02_67", x = pb1.x - 1, y = pb1.y, z = pb1.z, },
            fakeGenerators = {
                { x = 12399, y = 3417, z = -1, createTile = true },
            },
        },
    },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc1.x, y = wtc1.y, z = wtc1.z, sourceType = "generator", source = { x = pb1.x - 1, y = pb1.y, z = pb1.z } },
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
        name = "Leaf Hill Heights Home Key",
        doors = {
            { sprite = "fixtures_doors_01_45", x = 12402, y = 3403, z = 0, },
            { sprite = "fixtures_doors_02_5",  x = 12394, y = 3410, z = -1, },
        },
    },
    map = { name = "DWAPStashMap39", },
    objectSpawns = {

        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_1", x = 12397, y = 3416, z = 0, },
        { barricade = "metal",    enabled = "Barricade", target = "fixtures_windows_01_0", x = 12409, y = 3413, z = 0, },
        { barricade = "metal",    enabled = "Barricade", target = "fixtures_windows_01_0", x = 12409, y = 3409, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_doors_01_45", x = 12402, y = 3403, z = 0, },
        { barricade = "metal",    enabled = "Barricade", target = "fixtures_windows_01_1", x = 12398, y = 3402, z = 0, },
        { barricade = "metal",    enabled = "Barricade", target = "fixtures_windows_01_1", x = 12395, y = 3402, z = 0, },
        { barricade = "metal",    enabled = "Barricade", target = "fixtures_windows_01_0", x = 12394, y = 3407, z = 0, },
    },
    loot = {
        { -- E1
            note = "dresser @ kidsbedroom",
            coords = {x=12394,y=3403,z=1},
        },
        { -- E2
            note = "shelves @ kidsbedroom",
            coords = {x=12395,y=3406,z=1},
        },
        { -- E3
            note = "shelves @ hall",
            coords = {x=12400,y=3404,z=1},
        },
        { -- E4
            note = "shelves @ hall",
            coords = {x=12401,y=3404,z=1},
        },
        { -- E5
            note = "wardrobe @ bedroom",
            coords = {x=12395,y=3411,z=1},
        },
        { -- E6
            note = "wardrobe @ bedroom",
            coords = {x=12396,y=3411,z=1},
        },
        { -- E7
            note = "sidetable @ bedroom",
            coords = {x=12394,y=3415,z=1},
        },
        { -- E8
            note = "medicine @ bathroom",
            coords = {x=12402,y=3415,z=1},
        },
        { -- E9
            note = "wardrobe @ bedroom",
            coords = {x=12403,y=3414,z=1},
        },
        { -- E10
            note = "wardrobe @ bedroom",
            coords = {x=12403,y=3415,z=1},
        },
        { -- E11
            note = "dresser @ bedroom",
            coords = {x=12405,y=3415,z=1},
        },
        { -- E12
            note = "metal_shelves @ closet",
            coords = {x=12408,y=3410,z=1},
        },
        { -- E13
            note = "counter @ bathroom",
            coords = {x=12405,y=3409,z=1},
        },
        { -- E14
            note = "counter @ bathroom",
            coords = {x=12405,y=3410,z=1},
        },
        { -- E15
            note = "metal_shelves @ closet",
            coords = {x=12404,y=3409,z=1},
        },
        { -- E16
            note = "metal_shelves @ closet",
            coords = {x=12404,y=3410,z=1},
        },
        { -- E17
            note = "cardboardbox @ bedroom",
            coords = {x=12406,y=3406,z=1},
        },
        { -- E18
            note = "cardboardbox @ bedroom",
            coords = {x=12406,y=3407,z=1},
        },
        { -- E19
            note = "cardboardbox @ bedroom",
            coords = {x=12407,y=3407,z=1},
        },
        { -- E20
            note = "cardboardbox @ bedroom",
            coords = {x=12407,y=3407,z=1},
            slot = "upper",
        },
        { -- E21
            note = "cardboardbox @ bedroom",
            coords = {x=12408,y=3407,z=1},
        },
        { -- E22
            note = "metal_shelves @ closet",
            coords = {x=12403,y=3404,z=1},
        },
        { -- E23
            note = "dishescabinet @ diningroom",
            coords = {x=12394,y=3413,z=0},
        },
        { -- E24
            note = "dishescabinet @ diningroom",
            coords = {x=12394,y=3414,z=0},
        },
        { -- E25
            note = "counter @ laundry",
            coords = {x=12400,y=3415,z=0},
        },
        { -- E26
            note = "counter @ kitchen",
            coords = {x=12405,y=3412,z=0},
        },
        { -- E27
            note = "counter @ kitchen",
            coords = {x=12405,y=3413,z=0},
        },
        { -- E28
            note = "counter @ kitchen",
            coords = {x=12405,y=3415,z=0},
        },
        { -- E29
            note = "counter @ kitchen",
            coords = {x=12406,y=3415,z=0},
        },
        { -- E30
            note = "counter @ kitchen",
            coords = {x=12407,y=3415,z=0},
        },
        { -- E31
            note = "fridge @ kitchen",
            coords = {x=12408,y=3412,z=0},
        },
        { -- E32
            note = "freezer @ kitchen",
            coords = {x=12408,y=3412,z=0},
            slot = "freezer",
        },
        { -- E33
            note = "counter @ kitchen",
            coords = {x=12408,y=3413,z=0},
        },
        { -- E34
            note = "counter @ kitchen",
            coords = {x=12408,y=3415,z=0},
        },
        { -- E35
            note = "metal_shelves @ garage",
            coords = {x=12408,y=3405,z=0},
        },
        { -- E36
            note = "metal_shelves @ garage",
            coords = {x=12408,y=3406,z=0},
        },
        { -- E37
            note = "cardboardbox @ closet",
            coords = {x=12400,y=3402,z=0},
        },
        { -- E38
            note = "cardboardbox @ closet",
            coords = {x=12400,y=3402,z=0},
            slot = "upper",
        },
        { -- E39
            note = "shelves @ bar",
            coords = {x=12395,y=3411,z=-1},
        },
        { -- E40
            note = "shelves @ bar",
            coords = {x=12395,y=3412,z=-1},
        },
        { -- E41
            note = "shelves @ bar",
            coords = {x=12395,y=3413,z=-1},
        },
        { -- E42
            note = "counter @ bar",
            coords = {x=12397,y=3413,z=-1},
        },
        { -- E43
            note = "shelves @ bar",
            coords = {x=12395,y=3414,z=-1},
        },
        { -- E44
            note = "counter @ bar",
            coords = {x=12397,y=3414,z=-1},
        },
        { -- E45
            note = "shelves @ bar",
            coords = {x=12395,y=3415,z=-1},
        },
        { -- E46
            note = "counter @ bar",
            coords = {x=12397,y=3415,z=-1},
        },
        { -- E47
            note = "crate @ warehouse",
            coords = {x=12393,y=3410,z=-1},
        },
        { -- E48
            note = "crate @ warehouse",
            coords = {x=12393,y=3410,z=-1},
            stack = 2,
        },
        { -- E49
            note = "metal_shelves @ warehouse",
            coords = {x=12393,y=3411,z=-1},
        },
        { -- E50
            note = "metal_shelves @ warehouse",
            coords = {x=12393,y=3412,z=-1},
        },
        { -- E51
            note = "metal_shelves @ warehouse",
            coords = {x=12393,y=3413,z=-1},
        },
        { -- E52
            note = "metal_shelves @ warehouse",
            coords = {x=12393,y=3414,z=-1},
        },
        { -- E53
            note = "metal_shelves @ warehouse",
            coords = {x=12393,y=3415,z=-1},
        },
        { -- E54
            note = "metal_shelves @ warehouse",
            coords = {x=12393,y=3416,z=-1},
        },
        { -- E55
            note = "wardrobe @ warehouse",
            coords = {x=12399,y=3410,z=-2},
        },
        { -- E56
            note = "metal_shelves @ warehouse",
            coords = {x=12395,y=3411,z=-2},
        },
        { -- E57
            note = "metal_shelves @ warehouse",
            coords = {x=12396,y=3411,z=-2},
        },
        { -- E58
            note = "metal_shelves @ warehouse",
            coords = {x=12397,y=3411,z=-2},
        },
        { -- E59
            note = "wardrobe @ warehouse",
            coords = {x=12393,y=3412,z=-2},
        },
        { -- E60
            note = "locker @ warehouse",
            coords = {x=12399,y=3412,z=-2},
        },
        { -- E61
            note = "wardrobe @ warehouse",
            coords = {x=12393,y=3413,z=-2},
        },
        { -- E62
            note = "metal_shelves @ warehouse",
            coords = {x=12397,y=3414,z=-2},
        },
        { -- E63
            note = "locker @ warehouse",
            coords = {x=12399,y=3414,z=-2},
        },
        { -- E64
            note = "metal_shelves @ warehouse",
            coords = {x=12397,y=3415,z=-2},
        },
        { -- E65
            note = "wardrobe @ warehouse",
            coords = {x=12400,y=3410,z=-2},
        },
        { -- E66
            note = "locker @ warehouse",
            coords = {x=12400,y=3412,z=-2},
        },
        { -- E67
            note = "locker @ warehouse",
            coords = {x=12400,y=3414,z=-2},
        },
        { -- E68
            note = "locker @ warehouse",
            coords = {x=12393,y=3416,z=-2},
        },
        { -- E69
            note = "crate @ warehouse",
            coords = {x=12399,y=3416,z=-2},
        },
        { -- E70
            note = "crate @ warehouse",
            coords = {x=12399,y=3416,z=-2},
            stack = 2,
        },
        { -- E71
            note = "crate @ warehouse",
            coords = {x=12400,y=3416,z=-2},
        },
        { -- E72
            note = "crate @ warehouse",
            coords = {x=12400,y=3416,z=-2},
            stack = 2,
        },    },
}

-- if getActivatedMods():contains("\\Ladders") then
--     table.insert(LeafHill.objectSpawns, { sprite = "fencing_01_27", x = 1628, y = 5760, z = 0, removeFloor = true, clearExisting = true, })
-- end

return LeafHill
