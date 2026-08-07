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
        -- E1
        { type = 'container', coords = {x=12394,y=3403,z=1}, }, -- dresser @ kidsbedroom
        -- E2
        { type = 'container', coords = {x=12395,y=3406,z=1}, }, -- shelves @ kidsbedroom
        -- E3
        { type = 'container', coords = {x=12400,y=3404,z=1}, }, -- shelves @ hall
        -- E4
        { type = 'container', coords = {x=12401,y=3404,z=1}, }, -- shelves @ hall
        -- E5
        { type = 'container', coords = {x=12395,y=3411,z=1}, }, -- wardrobe @ bedroom
        -- E6
        { type = 'container', coords = {x=12396,y=3411,z=1}, }, -- wardrobe @ bedroom
        -- E7
        { type = 'container', coords = {x=12394,y=3415,z=1}, }, -- sidetable @ bedroom
        -- E8
        { type = 'container', coords = {x=12402,y=3415,z=1}, }, -- medicine @ bathroom
        -- E9
        { type = 'container', coords = {x=12403,y=3414,z=1}, }, -- wardrobe @ bedroom
        -- E10
        { type = 'container', coords = {x=12403,y=3415,z=1}, }, -- wardrobe @ bedroom
        -- E11
        { type = 'container', coords = {x=12405,y=3415,z=1}, }, -- dresser @ bedroom
        -- E12
        { type = 'container', coords = {x=12408,y=3410,z=1}, }, -- metal_shelves @ closet
        -- E13
        { type = 'container', coords = {x=12405,y=3409,z=1}, }, -- counter @ bathroom
        -- E14
        { type = 'container', coords = {x=12405,y=3410,z=1}, }, -- counter @ bathroom
        -- E15
        { type = 'container', coords = {x=12404,y=3409,z=1}, }, -- metal_shelves @ closet
        -- E16
        { type = 'container', coords = {x=12404,y=3410,z=1}, }, -- metal_shelves @ closet
        -- E17
        { type = 'container', coords = {x=12406,y=3406,z=1}, }, -- cardboardbox @ bedroom
        -- E18
        { type = 'container', coords = {x=12406,y=3407,z=1}, }, -- cardboardbox @ bedroom
        -- E19
        { type = 'container', coords = {x=12407,y=3407,z=1}, }, -- cardboardbox @ bedroom
        -- E20
        { type = 'container', coords = {x=12407,y=3407,z=1}, slot = "upper", }, -- cardboardbox @ bedroom
        -- E21
        { type = 'container', coords = {x=12408,y=3407,z=1}, }, -- cardboardbox @ bedroom
        -- E22
        { type = 'container', coords = {x=12403,y=3404,z=1}, }, -- metal_shelves @ closet
        -- E23
        { type = 'container', coords = {x=12394,y=3413,z=0}, }, -- dishescabinet @ diningroom
        -- E24
        { type = 'container', coords = {x=12394,y=3414,z=0}, }, -- dishescabinet @ diningroom
        -- E25
        { type = 'container', coords = {x=12400,y=3415,z=0}, }, -- counter @ laundry
        -- E26
        { type = 'container', coords = {x=12405,y=3412,z=0}, }, -- counter @ kitchen
        -- E27
        { type = 'container', coords = {x=12405,y=3413,z=0}, }, -- counter @ kitchen
        -- E28
        { type = 'container', coords = {x=12405,y=3415,z=0}, }, -- counter @ kitchen
        -- E29
        { type = 'container', coords = {x=12406,y=3415,z=0}, }, -- counter @ kitchen
        -- E30
        { type = 'container', coords = {x=12407,y=3415,z=0}, }, -- counter @ kitchen
        -- E31
        { type = 'container', coords = {x=12408,y=3412,z=0}, }, -- fridge @ kitchen
        -- E32
        { type = 'container', coords = {x=12408,y=3412,z=0}, slot = "freezer", }, -- freezer @ kitchen
        -- E33
        { type = 'container', coords = {x=12408,y=3413,z=0}, }, -- counter @ kitchen
        -- E34
        { type = 'container', coords = {x=12408,y=3415,z=0}, }, -- counter @ kitchen
        -- E35
        { type = 'container', coords = {x=12408,y=3405,z=0}, }, -- metal_shelves @ garage
        -- E36
        { type = 'container', coords = {x=12408,y=3406,z=0}, }, -- metal_shelves @ garage
        -- E37
        { type = 'container', coords = {x=12400,y=3402,z=0}, }, -- cardboardbox @ closet
        -- E38
        { type = 'container', coords = {x=12400,y=3402,z=0}, slot = "upper", }, -- cardboardbox @ closet
        -- E39
        { type = 'container', coords = {x=12395,y=3411,z=-1}, }, -- shelves @ bar
        -- E40
        { type = 'container', coords = {x=12395,y=3412,z=-1}, }, -- shelves @ bar
        -- E41
        { type = 'container', coords = {x=12395,y=3413,z=-1}, }, -- shelves @ bar
        -- E42
        { type = 'container', coords = {x=12397,y=3413,z=-1}, }, -- counter @ bar
        -- E43
        { type = 'container', coords = {x=12395,y=3414,z=-1}, }, -- shelves @ bar
        -- E44
        { type = 'container', coords = {x=12397,y=3414,z=-1}, }, -- counter @ bar
        -- E45
        { type = 'container', coords = {x=12395,y=3415,z=-1}, }, -- shelves @ bar
        -- E46
        { type = 'container', coords = {x=12397,y=3415,z=-1}, }, -- counter @ bar
        -- E47
        { type = 'container', coords = {x=12393,y=3410,z=-1}, }, -- crate @ warehouse
        -- E48
        { type = 'container', coords = {x=12393,y=3410,z=-1}, stack = 2, }, -- crate @ warehouse
        -- E49
        { type = 'container', coords = {x=12393,y=3411,z=-1}, }, -- metal_shelves @ warehouse
        -- E50
        { type = 'container', coords = {x=12393,y=3412,z=-1}, }, -- metal_shelves @ warehouse
        -- E51
        { type = 'container', coords = {x=12393,y=3413,z=-1}, }, -- metal_shelves @ warehouse
        -- E52
        { type = 'container', coords = {x=12393,y=3414,z=-1}, }, -- metal_shelves @ warehouse
        -- E53
        { type = 'container', coords = {x=12393,y=3415,z=-1}, }, -- metal_shelves @ warehouse
        -- E54
        { type = 'container', coords = {x=12393,y=3416,z=-1}, }, -- metal_shelves @ warehouse
        -- E55
        { type = 'container', coords = {x=12399,y=3410,z=-2}, }, -- wardrobe @ warehouse
        -- E56
        { type = 'container', coords = {x=12395,y=3411,z=-2}, }, -- metal_shelves @ warehouse
        -- E57
        { type = 'container', coords = {x=12396,y=3411,z=-2}, }, -- metal_shelves @ warehouse
        -- E58
        { type = 'container', coords = {x=12397,y=3411,z=-2}, }, -- metal_shelves @ warehouse
        -- E59
        { type = 'container', coords = {x=12393,y=3412,z=-2}, }, -- wardrobe @ warehouse
        -- E60
        { type = 'container', coords = {x=12399,y=3412,z=-2}, }, -- locker @ warehouse
        -- E61
        { type = 'container', coords = {x=12393,y=3413,z=-2}, }, -- wardrobe @ warehouse
        -- E62
        { type = 'container', coords = {x=12397,y=3414,z=-2}, }, -- metal_shelves @ warehouse
        -- E63
        { type = 'container', coords = {x=12399,y=3414,z=-2}, }, -- locker @ warehouse
        -- E64
        { type = 'container', coords = {x=12397,y=3415,z=-2}, }, -- metal_shelves @ warehouse
        -- E65
        { type = 'container', coords = {x=12400,y=3410,z=-2}, }, -- wardrobe @ warehouse
        -- E66
        { type = 'container', coords = {x=12400,y=3412,z=-2}, }, -- locker @ warehouse
        -- E67
        { type = 'container', coords = {x=12400,y=3414,z=-2}, }, -- locker @ warehouse
        -- E68
        { type = 'container', coords = {x=12393,y=3416,z=-2}, }, -- locker @ warehouse
        -- E69
        { type = 'container', coords = {x=12399,y=3416,z=-2}, }, -- crate @ warehouse
        -- E70
        { type = 'container', coords = {x=12399,y=3416,z=-2}, stack = 2, }, -- crate @ warehouse
        -- E71
        { type = 'container', coords = {x=12400,y=3416,z=-2}, }, -- crate @ warehouse
        -- E72
        { type = 'container', coords = {x=12400,y=3416,z=-2}, stack = 2, }, -- crate @ warehouse
    },
}

-- if getActivatedMods():contains("\\Ladders") then
--     table.insert(LeafHill.objectSpawns, { sprite = "fencing_01_27", x = 1628, y = 5760, z = 0, removeFloor = true, clearExisting = true, })
-- end

return LeafHill
