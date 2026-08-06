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
            solar = {
                powerbank = { sprite = "dwap_tiles_01_0", x = pb1.x, y = pb1.y, z = pb1.z },
                panels = {
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_9",
                        x = 12390,
                        y = 3406,
                        z = 0,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_9",
                        x = 12390,
                        y = 3407,
                        z = 0,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_9",
                        x = 12390,
                        y = 3408,
                        z = 0,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_9",
                        x = 12390,
                        y = 3409,
                        z = 0,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_9",
                        x = 12390,
                        y = 3410,
                        z = 0,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_9",
                        x = 12390,
                        y = 3411,
                        z = 0,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_9",
                        x = 12390,
                        y = 3412,
                        z = 0,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_9",
                        x = 12390,
                        y = 3413,
                        z = 0,
                        pb = 1,
                        spawn = false,
                    },
                },
            },
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
        { type = 'container', coords = {x=12394,y=3403,z=1}, }, -- dresser @ kidsbedroom
        { type = 'container', coords = {x=12395,y=3406,z=1}, }, -- shelves @ kidsbedroom
        { type = 'container', coords = {x=12400,y=3404,z=1}, }, -- shelves @ hall
        { type = 'container', coords = {x=12401,y=3404,z=1}, }, -- shelves @ hall
        { type = 'container', coords = {x=12395,y=3411,z=1}, }, -- wardrobe @ bedroom
        { type = 'container', coords = {x=12396,y=3411,z=1}, }, -- wardrobe @ bedroom
        { type = 'container', coords = {x=12394,y=3415,z=1}, }, -- sidetable @ bedroom
        { type = 'container', coords = {x=12402,y=3415,z=1}, }, -- medicine @ bathroom
        { type = 'container', coords = {x=12403,y=3414,z=1}, }, -- wardrobe @ bedroom
        { type = 'container', coords = {x=12403,y=3415,z=1}, }, -- wardrobe @ bedroom
        { type = 'container', coords = {x=12405,y=3415,z=1}, }, -- dresser @ bedroom
        { type = 'container', coords = {x=12408,y=3410,z=1}, }, -- metal_shelves @ closet
        { type = 'container', coords = {x=12405,y=3409,z=1}, }, -- counter @ bathroom
        { type = 'container', coords = {x=12405,y=3410,z=1}, }, -- counter @ bathroom
        { type = 'container', coords = {x=12404,y=3409,z=1}, }, -- metal_shelves @ closet
        { type = 'container', coords = {x=12404,y=3410,z=1}, }, -- metal_shelves @ closet
        { type = 'container', coords = {x=12406,y=3406,z=1}, }, -- cardboardbox @ bedroom
        { type = 'container', coords = {x=12406,y=3407,z=1}, }, -- cardboardbox @ bedroom
        { type = 'container', coords = {x=12407,y=3407,z=1}, }, -- cardboardbox @ bedroom
        { type = 'container', coords = {x=12407,y=3407,z=1}, slot = "upper", }, -- cardboardbox @ bedroom
        { type = 'container', coords = {x=12408,y=3407,z=1}, }, -- cardboardbox @ bedroom
        { type = 'container', coords = {x=12403,y=3404,z=1}, }, -- metal_shelves @ closet
        { type = 'container', coords = {x=12394,y=3413,z=0}, }, -- dishescabinet @ diningroom
        { type = 'container', coords = {x=12394,y=3414,z=0}, }, -- dishescabinet @ diningroom
        { type = 'container', coords = {x=12400,y=3415,z=0}, }, -- counter @ laundry
        { type = 'container', coords = {x=12405,y=3412,z=0}, }, -- counter @ kitchen
        { type = 'container', coords = {x=12405,y=3413,z=0}, }, -- counter @ kitchen
        { type = 'container', coords = {x=12405,y=3415,z=0}, }, -- counter @ kitchen
        { type = 'container', coords = {x=12406,y=3415,z=0}, }, -- counter @ kitchen
        { type = 'container', coords = {x=12407,y=3415,z=0}, }, -- counter @ kitchen
        { type = 'container', coords = {x=12408,y=3412,z=0}, }, -- fridge @ kitchen
        { type = 'container', coords = {x=12408,y=3412,z=0}, slot = "freezer", }, -- freezer @ kitchen
        { type = 'container', coords = {x=12408,y=3413,z=0}, }, -- counter @ kitchen
        { type = 'container', coords = {x=12408,y=3415,z=0}, }, -- counter @ kitchen
        { type = 'container', coords = {x=12408,y=3405,z=0}, }, -- metal_shelves @ garage
        { type = 'container', coords = {x=12408,y=3406,z=0}, }, -- metal_shelves @ garage
        { type = 'container', coords = {x=12400,y=3402,z=0}, }, -- cardboardbox @ closet
        { type = 'container', coords = {x=12400,y=3402,z=0}, slot = "upper", }, -- cardboardbox @ closet
        { type = 'container', coords = {x=12395,y=3411,z=-1}, }, -- shelves @ bar
        { type = 'container', coords = {x=12395,y=3412,z=-1}, }, -- shelves @ bar
        { type = 'container', coords = {x=12395,y=3413,z=-1}, }, -- shelves @ bar
        { type = 'container', coords = {x=12397,y=3413,z=-1}, }, -- counter @ bar
        { type = 'container', coords = {x=12395,y=3414,z=-1}, }, -- shelves @ bar
        { type = 'container', coords = {x=12397,y=3414,z=-1}, }, -- counter @ bar
        { type = 'container', coords = {x=12395,y=3415,z=-1}, }, -- shelves @ bar
        { type = 'container', coords = {x=12397,y=3415,z=-1}, }, -- counter @ bar
        { type = 'container', coords = {x=12393,y=3410,z=-1}, }, -- crate @ warehouse
        { type = 'container', coords = {x=12393,y=3410,z=-1}, stack = 2, }, -- crate @ warehouse
        { type = 'container', coords = {x=12393,y=3411,z=-1}, }, -- metal_shelves @ warehouse
        { type = 'container', coords = {x=12393,y=3412,z=-1}, }, -- metal_shelves @ warehouse
        { type = 'container', coords = {x=12393,y=3413,z=-1}, }, -- metal_shelves @ warehouse
        { type = 'container', coords = {x=12393,y=3414,z=-1}, }, -- metal_shelves @ warehouse
        { type = 'container', coords = {x=12393,y=3415,z=-1}, }, -- metal_shelves @ warehouse
        { type = 'container', coords = {x=12393,y=3416,z=-1}, }, -- metal_shelves @ warehouse
        { type = 'container', coords = {x=12399,y=3410,z=-2}, }, -- wardrobe @ warehouse
        { type = 'container', coords = {x=12395,y=3411,z=-2}, }, -- metal_shelves @ warehouse
        { type = 'container', coords = {x=12396,y=3411,z=-2}, }, -- metal_shelves @ warehouse
        { type = 'container', coords = {x=12397,y=3411,z=-2}, }, -- metal_shelves @ warehouse
        { type = 'container', coords = {x=12393,y=3412,z=-2}, }, -- wardrobe @ warehouse
        { type = 'container', coords = {x=12399,y=3412,z=-2}, }, -- locker @ warehouse
        { type = 'container', coords = {x=12393,y=3413,z=-2}, }, -- wardrobe @ warehouse
        { type = 'container', coords = {x=12397,y=3414,z=-2}, }, -- metal_shelves @ warehouse
        { type = 'container', coords = {x=12399,y=3414,z=-2}, }, -- locker @ warehouse
        { type = 'container', coords = {x=12397,y=3415,z=-2}, }, -- metal_shelves @ warehouse
        { type = 'container', coords = {x=12400,y=3410,z=-2}, }, -- wardrobe @ warehouse
        { type = 'container', coords = {x=12400,y=3412,z=-2}, }, -- locker @ warehouse
        { type = 'container', coords = {x=12400,y=3414,z=-2}, }, -- locker @ warehouse
        { type = 'container', coords = {x=12393,y=3416,z=-2}, }, -- locker @ warehouse
        { type = 'container', coords = {x=12399,y=3416,z=-2}, }, -- crate @ warehouse
        { type = 'container', coords = {x=12399,y=3416,z=-2}, stack = 2, }, -- crate @ warehouse
        { type = 'container', coords = {x=12400,y=3416,z=-2}, }, -- crate @ warehouse
        { type = 'container', coords = {x=12400,y=3416,z=-2}, stack = 2, }, -- crate @ warehouse
    },
}

-- if getActivatedMods():contains("\\Ladders") then
--     table.insert(LeafHill.objectSpawns, { sprite = "fencing_01_27", x = 1628, y = 5760, z = 0, removeFloor = true, clearExisting = true, })
-- end

return LeafHill
