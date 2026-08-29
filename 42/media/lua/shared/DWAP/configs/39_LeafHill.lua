local wtc = { x = 12394, y = 3411, z = -2, }
local pb1 = { x = 12397, y = 3415, z = -2, }
local LeafHill = {
    group = "Louisville",
    baseBuildings = {
        { x = 12395, y = 3404, z = 1 },  -- house
        { x = 12396, y = 3411, z = -1 }, -- basement
    },
    spawn = { x = 12395, y = 3404, z = 1 },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 12396, y = 3415, z = -2 },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 12394, y = 3415, z = -2, },
            fakeGenerators = {
                { x = 12399, y = 3417, z = -1 },
            },
        },
    },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = wtc },
    },
    waterFixtures = {
        { sprite = "fixtures_sinks_01_32",    x = 12395, y = 3416, z = -1, sourceType = "tank", source = wtc, }, -- bar, bld 48,13#25

        { sprite = "fixtures_bathroom_01_3",  x = 12408, y = 3410, z = 0,  sourceType = "tank", source = wtc, }, -- bathroom, bld 48,13#21
        { sprite = "fixtures_sinks_01_28",    x = 12407, y = 3410, z = 0,  sourceType = "tank", source = wtc, }, -- bathroom, bld 48,13#21
        { sprite = "fixtures_sinks_01_11",    x = 12406, y = 3415, z = 0,  sourceType = "tank", source = wtc, }, -- kitchen, bld 48,13#21
        { sprite = "fixtures_sinks_01_4",     x = 12400, y = 3415, z = 0,  sourceType = "tank", source = wtc, }, -- laundry, bld 48,13#21
        { sprite = "appliances_laundry_01_5", x = 12400, y = 3413, z = 0,  sourceType = "tank", source = wtc, }, -- laundry, bld 48,13#21

        { sprite = "fixtures_sinks_01_28",    x = 12402, y = 3415, z = 1,  sourceType = "tank", source = wtc, }, -- bathroom, bld 48,13#21
        { sprite = "fixtures_bathroom_01_3",  x = 12400, y = 3415, z = 1,  sourceType = "tank", source = wtc, }, -- bathroom, bld 48,13#21
        { sprite = "fixtures_bathroom_01_25", x = 12399, y = 3414, z = 1,  sourceType = "tank", source = wtc, }, -- bathroom, bld 48,13#21
        { sprite = "fixtures_sinks_01_1",     x = 12405, y = 3410, z = 1,  sourceType = "tank", source = wtc, }, -- bathroom, bld 48,13#21
        { sprite = "fixtures_sinks_01_1",     x = 12405, y = 3409, z = 1,  sourceType = "tank", source = wtc, }, -- bathroom, bld 48,13#21
        { sprite = "fixtures_bathroom_01_1",  x = 12406, y = 3408, z = 1,  sourceType = "tank", source = wtc, }, -- bathroom, bld 48,13#21
        { sprite = "fixtures_bathroom_01_25", x = 12408, y = 3408, z = 1,  sourceType = "tank", source = wtc, }, -- bathroom, bld 48,13#21
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
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_doors_01_45",  x = 12402, y = 3403, z = 0, },
        { barricade = "metal",    enabled = "Barricade", target = "fixtures_windows_01_1", x = 12398, y = 3402, z = 0, },
        { barricade = "metal",    enabled = "Barricade", target = "fixtures_windows_01_1", x = 12395, y = 3402, z = 0, },
        { barricade = "metal",    enabled = "Barricade", target = "fixtures_windows_01_0", x = 12394, y = 3407, z = 0, },
    },
    loot = {
        { -- E1
            note = "dresser @ kidsbedroom",
            coords = { x = 12394, y = 3403, z = 1 },
            tag = "DWAPLockers",
        },
        { -- E2
            note = "shelves @ kidsbedroom",
            coords = { x = 12395, y = 3406, z = 1 },
            tag = "DWAPMedia",
        },
        { -- E3
            note = "shelves @ hall",
            coords = { x = 12400, y = 3404, z = 1 },
            special = "maps",
        },
        { -- E4
            note = "shelves @ hall",
            coords = { x = 12401, y = 3404, z = 1 },
            tag = "DWAPMedia",
        },
        { -- E5
            note = "wardrobe @ bedroom",
            coords = { x = 12395, y = 3411, z = 1 },
            tag = "DWAPLockers",
        },
        { -- E6
            note = "wardrobe @ bedroom",
            coords = { x = 12396, y = 3411, z = 1 },
            tag = "DWAPLockers",
        },
        { -- E7
            note = "sidetable @ bedroom",
            coords = { x = 12394, y = 3415, z = 1 },
            tag = "DWAPMedia",
        },
        { -- E8
            note = "medicine @ bathroom",
            coords = { x = 12402, y = 3415, z = 1 },
            tag = "DWAPMed",
        },
        { -- E9
            note = "wardrobe @ bedroom",
            coords = { x = 12403, y = 3414, z = 1 },
            tag = "DWAPLockers",
        },
        { -- E10
            note = "wardrobe @ bedroom",
            coords = { x = 12403, y = 3415, z = 1 },
            tag = "DWAPLockers",
        },
        { -- E11
            note = "dresser @ bedroom",
            coords = { x = 12405, y = 3415, z = 1 },
            tag = "DWAPLockers",
        },
        { -- E12
            note = "metal_shelves @ closet",
            coords = { x = 12408, y = 3410, z = 1 },
            tag = "DWAPBuildMats",
        },
        { -- E13
            note = "counter @ bathroom",
            coords = { x = 12405, y = 3409, z = 1 },
            tag = "DWAPMed",
        },
        { -- E14
            note = "counter @ bathroom",
            coords = { x = 12405, y = 3410, z = 1 },
            tag = "DWAPMed",
        },
        { -- E15
            note = "metal_shelves @ closet",
            coords = { x = 12404, y = 3409, z = 1 },
            tag = "DWAPTools",
        },
        { -- E16
            note = "metal_shelves @ closet",
            coords = { x = 12404, y = 3410, z = 1 },
            tag = "DWAPFarm",
        },
        { -- E17
            note = "cardboardbox @ bedroom",
            coords = { x = 12406, y = 3406, z = 1 },
            tag = "DWAPBuildMats",
        },
        { -- E18
            note = "cardboardbox @ bedroom",
            coords = { x = 12406, y = 3407, z = 1 },
            tag = "DWAPTools",
        },
        { -- E19
            note = "cardboardbox @ bedroom",
            coords = { x = 12407, y = 3407, z = 1 },
            tag = "DWAPFarm",
        },
        { -- E20
            note = "cardboardbox @ bedroom",
            coords = { x = 12407, y = 3407, z = 1 },
            slot = "upper",
            tag = "DWAPBuildMats",
        },
        { -- E21
            note = "cardboardbox @ bedroom",
            coords = { x = 12408, y = 3407, z = 1 },
            tag = "DWAPFood",
        },
        { -- E22
            note = "metal_shelves @ closet",
            coords = { x = 12403, y = 3404, z = 1 },
            tag = "DWAPBuildMats",
        },
        { -- E23
            note = "dishescabinet @ diningroom",
            coords = { x = 12394, y = 3413, z = 0 },
            tag = "DWAPFood",
        },
        { -- E24
            note = "dishescabinet @ diningroom",
            coords = { x = 12394, y = 3414, z = 0 },
            tag = "DWAPFood",
        },
        { -- E25
            note = "counter @ laundry",
            coords = { x = 12400, y = 3415, z = 0 },
            tag = "DWAPLockers",
        },
        { -- E26
            note = "counter @ kitchen",
            coords = { x = 12405, y = 3412, z = 0 },
            tag = "DWAPFood",
        },
        { -- E27
            note = "counter @ kitchen",
            coords = { x = 12405, y = 3413, z = 0 },
            tag = "DWAPFood",
        },
        { -- E28
            note = "counter @ kitchen",
            coords = { x = 12405, y = 3415, z = 0 },
            tag = "DWAPFood",
        },
        { -- E29
            note = "counter @ kitchen",
            coords = { x = 12406, y = 3415, z = 0 },
            tag = "DWAPFood",
        },
        { -- E30
            note = "counter @ kitchen",
            coords = { x = 12407, y = 3415, z = 0 },
            tag = "DWAPFood",
        },
        { -- E31
            note = "fridge @ kitchen",
            coords = { x = 12408, y = 3412, z = 0 },
            tag = "DWAPFridge",
        },
        { -- E32
            note = "freezer @ kitchen",
            coords = { x = 12408, y = 3412, z = 0 },
            slot = "freezer",
            tag = "DWAPFreezer",
        },
        { -- E33
            note = "counter @ kitchen",
            coords = { x = 12408, y = 3413, z = 0 },
            tag = "DWAPFood",
        },
        { -- E34
            note = "counter @ kitchen",
            coords = { x = 12408, y = 3415, z = 0 },
            tag = "DWAPFood",
        },
        { -- E35
            note = "metal_shelves @ garage",
            coords = { x = 12408, y = 3405, z = 0 },
            tag = "DWAPTools",
        },
        { -- E36
            note = "metal_shelves @ garage",
            coords = { x = 12408, y = 3406, z = 0 },
            tag = "DWAPBuildMats",
        },
        { -- E37
            note = "cardboardbox @ closet",
            coords = { x = 12400, y = 3402, z = 0 },
            tag = "DWAPBuildMats",
        },
        { -- E38
            note = "cardboardbox @ closet",
            coords = { x = 12400, y = 3402, z = 0 },
            slot = "upper",
            tag = "DWAPTools",
        },
        { -- E39
            note = "shelves @ bar",
            coords = { x = 12395, y = 3411, z = -1 },
            tag = "DWAPFood",
        },
        { -- E40
            note = "shelves @ bar",
            coords = { x = 12395, y = 3412, z = -1 },
            tag = "DWAPFood",
        },
        { -- E41
            note = "shelves @ bar",
            coords = { x = 12395, y = 3413, z = -1 },
            tag = "DWAPFood",
        },
        { -- E42
            note = "counter @ bar",
            coords = { x = 12397, y = 3413, z = -1 },
            tag = "DWAPFood",
        },
        { -- E43
            note = "shelves @ bar",
            coords = { x = 12395, y = 3414, z = -1 },
            tag = "DWAPFood",
        },
        { -- E44
            note = "counter @ bar",
            coords = { x = 12397, y = 3414, z = -1 },
            tag = "DWAPFood",
        },
        { -- E45
            note = "shelves @ bar",
            coords = { x = 12395, y = 3415, z = -1 },
            tag = "DWAPFood",
        },
        { -- E46
            note = "counter @ bar",
            coords = { x = 12397, y = 3415, z = -1 },
            tag = "DWAPFood",
        },
        { -- E47
            note = "crate @ warehouse",
            coords = { x = 12393, y = 3410, z = -1 },
            special = "essentials",
        },
        { -- E48
            note = "crate @ warehouse",
            coords = { x = 12393, y = 3410, z = -1 },
            stack = 2,
            tag = "DWAPFarm",
        },
        { -- E49
            note = "metal_shelves @ warehouse",
            coords = { x = 12393, y = 3411, z = -1 },
            tag = "DWAPTools",
        },
        { -- E50
            note = "metal_shelves @ warehouse",
            coords = { x = 12393, y = 3412, z = -1 },
            tag = "DWAPBuildMats",
        },
        { -- E51
            note = "metal_shelves @ warehouse",
            coords = { x = 12393, y = 3413, z = -1 },
            tag = "DWAPFarm",
        },
        { -- E52
            note = "metal_shelves @ warehouse",
            coords = { x = 12393, y = 3414, z = -1 },
            tag = "DWAPTools",
        },
        { -- E53
            note = "metal_shelves @ warehouse",
            coords = { x = 12393, y = 3415, z = -1 },
            tag = "DWAPBuildMats",
        },
        { -- E54
            note = "metal_shelves @ warehouse",
            coords = { x = 12393, y = 3416, z = -1 },
            tag = "DWAPFarm",
        },
        { -- E55
            note = "wardrobe @ warehouse",
            coords = { x = 12399, y = 3410, z = -2 },
            tag = "DWAPLockers",
        },
        { -- E56
            note = "metal_shelves @ warehouse",
            coords = { x = 12395, y = 3411, z = -2 },
            tag = "DWAPTools",
        },
        { -- E57
            note = "metal_shelves @ warehouse",
            coords = { x = 12396, y = 3411, z = -2 },
            tag = "DWAPBuildMats",
        },
        { -- E58
            note = "metal_shelves @ warehouse",
            coords = { x = 12397, y = 3411, z = -2 },
            tag = "DWAPFarm",
        },
        { -- E59
            note = "wardrobe @ warehouse",
            coords = { x = 12393, y = 3412, z = -2 },
            tag = "DWAPLockers",
        },
        { -- E60
            note = "locker @ warehouse",
            coords = { x = 12399, y = 3412, z = -2 },
            tag = "DWAPLockers",
        },
        { -- E61
            note = "wardrobe @ warehouse",
            coords = { x = 12393, y = 3413, z = -2 },
            tag = "DWAPLockers",
        },
        { -- E62
            note = "metal_shelves @ warehouse",
            coords = { x = 12397, y = 3414, z = -2 },
            tag = "DWAPBuildMats",
        },
        { -- E63
            note = "locker @ warehouse",
            coords = { x = 12399, y = 3414, z = -2 },
            tag = "DWAPLockers",
        },
        { -- E65
            note = "wardrobe @ warehouse",
            coords = { x = 12400, y = 3410, z = -2 },
            tag = "DWAPLockers",
        },
        { -- E66
            note = "locker @ warehouse",
            coords = { x = 12400, y = 3412, z = -2 },
            tag = "DWAPLockers",
        },
        { -- E67
            note = "locker @ warehouse",
            coords = { x = 12400, y = 3414, z = -2 },
            tag = "DWAPLockers",
        },
        { -- E68
            note = "locker @ warehouse",
            coords = { x = 12393, y = 3416, z = -2 },
            tag = "DWAPLockers",
        },
        { -- E69
            note = "crate @ warehouse",
            coords = { x = 12399, y = 3416, z = -2 },
            tag = "DWAPFood",
        },
        { -- E70
            note = "crate @ warehouse",
            coords = { x = 12399, y = 3416, z = -2 },
            stack = 2,
            tag = "DWAPFarm",
        },
        { -- E71
            note = "crate @ warehouse",
            coords = { x = 12400, y = 3416, z = -2 },
            tag = "DWAPFood",
        },
        { -- E72
            note = "crate @ warehouse",
            coords = { x = 12400, y = 3416, z = -2 },
            stack = 2,
            tag = "DWAPBuildMats",
        },
    },
}

-- if getActivatedMods():contains("\\Ladders") then
--     table.insert(LeafHill.objectSpawns, { sprite = "fencing_01_27", x = 1628, y = 5760, z = 0, removeFloor = true, clearExisting = true, })
-- end

return LeafHill
