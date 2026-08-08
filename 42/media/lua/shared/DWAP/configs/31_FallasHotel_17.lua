-- @TODO (2026-08-07 audit) unresolved - delete lines as they are fixed
--   * 142 skeleton entries carry coords but no loot yet - entries 1-142
--   * systems: 2 components at 7226-7228,8201-8205 z=-1 report "square not
--     loaded" - those chunks never stream when travelling to this base, which
--     is what a pre-move or otherwise wrong coordinate looks like
--   * systems: 5 components at 7229-7234,8204-8215 z=0 name a sprite that is
--     not on the square, though the square itself loads - config drifted from
--     the map
--   * systems: gen 1 ghost 1 at 7254,8254,-1 never converted - object is
--     there, the conversion did not run on it
--   * the four bunkers are clones of the config 01 floor plan; vary their
--     loot rather than repeating it, and lean on the unique overlay this base
--     already has
local bunkerTopLeft = { x = 7226, y = 8197, z = -1 }
local wtc = { x = 7234, y = 8215, z = 0 }
local pb1 = { x = 7254, y = 8253, z = -1 }
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
        { x = 7243, y = 8256, z = 1 }, -- motelroom
        { x = 7243, y = 8259, z = 1 }, -- motelroom
        { x = 7248, y = 8261, z = 1 }, -- bathroom
        { x = 7248, y = 8259, z = 1 }, -- janitor
        { x = 7248, y = 8259, z = 2 }, -- janitor
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
        { sprite = "dwap_tiles_01_9", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = { x = 7681, y = 12221, z = -1 } },
    },
    waterFixtures = {
        { sprite = "fixtures_sinks_01_16",   x = bunkerTopLeft.x,     y = bunkerTopLeft.y + 4, z = bunkerTopLeft.z, sourceType = "tank", source = 1 },
        { sprite = "fixtures_bathroom_01_6", x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y + 8, z = bunkerTopLeft.z, sourceType = "tank", source = 1 },

        { sprite = "fixtures_sinks_01_35",   x = 7232,                y = 8211,                z = 0,               sourceType = "tank", source = 1 },
        { sprite = "fixtures_sinks_01_16",   x = 7233,                y = 8208,                z = 0,               sourceType = "tank", source = 1 },
        { sprite = "fixtures_bathroom_01_5", x = 7229,                y = 8206,                z = 0,               sourceType = "tank", source = 1 },
        { sprite = "fixtures_sinks_01_15",   x = 7229,                y = 8204,                z = 0,               sourceType = "tank", source = 1 },
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
        { barricade = "wood",     enabled = "Barricade", target = "walls_commercial_01_113",              x = 7230, y = 8199, z = 0, },
        { barricade = "wood",     enabled = "Barricade", target = "walls_commercial_01_113",              x = 7231, y = 8199, z = 0, },
        { barricade = "wood",     enabled = "Barricade", target = "walls_commercial_01_113",              x = 7233, y = 8199, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target = "walls_commercial_01_113",              x = 7234, y = 8199, z = 0, },
        { barricade = "wood",     enabled = "Barricade", target = "walls_commercial_01_113",              x = 7238, y = 8199, z = 0, },
        { barricade = "wood",     enabled = "Barricade", target = "walls_commercial_01_113",              x = 7239, y = 8199, z = 0, },
        { barricade = "wood",     enabled = "Barricade", target = "walls_commercial_01_113",              x = 7241, y = 8199, z = 0, },
        { barricade = "wood",     enabled = "Barricade", target = "walls_commercial_01_113",              x = 7242, y = 8199, z = 0, },
        { barricade = "metal",    enabled = "Barricade", target = "walls_exterior_house_02_88",           x = 7244, y = 8202, z = 0, },
        { barricade = "metal",    enabled = "Barricade", target = "location_restaurant_pileocrepe_01_48", x = 7244, y = 8203, z = 0, },
    },
    loot = {
        { -- E1
            note = "locker @ janitor",
            coords = { x = 7248, y = 8260, z = 2 },
        },
        { -- E2
            note = "locker @ janitor",
            coords = { x = 7250, y = 8260, z = 2 },
        },
        { -- E3
            note = "cardboardbox @ janitor",
            coords = { x = 7248, y = 8261, z = 2 },
        },
        { -- E4
            note = "cardboardbox @ janitor",
            coords = { x = 7248, y = 8262, z = 2 },
        },
        { -- E5
            note = "cardboardbox @ janitor",
            coords = { x = 7248, y = 8262, z = 2 },
            slot = "upper",
        },
        { -- E6
            note = "cardboardbox @ janitor",
            coords = { x = 7248, y = 8259, z = 1 },
        },
        { -- E7
            note = "smallbox @ janitor",
            coords = { x = 7250, y = 8259, z = 1 },
        },
        { -- E8
            note = "cardboardbox @ janitor",
            coords = { x = 7248, y = 8260, z = 1 },
        },
        { -- E9
            note = "cardboardbox @ janitor",
            coords = { x = 7248, y = 8260, z = 1 },
            slot = "upper",
        },
        { -- E10
            note = "metal_shelves @ janitor",
            coords = { x = 7250, y = 8260, z = 1 },
        },
        { -- E11
            note = "medicine @ bathroom",
            coords = { x = 7249, y = 8261, z = 1 },
            slot = "upper",
        },
        { -- E12
            note = "counter @ bathroom",
            coords = { x = 7249, y = 8261, z = 1 },
        },
        { -- E13
            note = "wardrobe @ motelroom",
            coords = { x = 7243, y = 8259, z = 1 },
        },
        { -- E14
            note = "wardrobe @ motelroom",
            coords = { x = 7244, y = 8259, z = 1 },
        },
        { -- E15
            note = "dresser @ motelroom",
            coords = { x = 7246, y = 8259, z = 1 },
        },
        { -- E16
            note = "dresser @ motelroom",
            coords = { x = 7246, y = 8256, z = 1 },
        },
        { -- E17
            note = "metal_shelves @ grocerystorage",
            coords = { x = 7248, y = 8259, z = -1 },
        },
        { -- E18
            note = "metal_shelves @ grocerystorage",
            coords = { x = 7248, y = 8260, z = -1 },
        },
        { -- E19
            note = "metal_shelves @ grocerystorage",
            coords = { x = 7248, y = 8261, z = -1 },
        },
        { -- E20
            note = "cardboardbox @ grocerystorage",
            coords = { x = 7251, y = 8261, z = -1 },
        },
        { -- E21
            note = "metal_shelves @ grocerystorage",
            coords = { x = 7248, y = 8262, z = -1 },
        },
        { -- E22
            note = "smallbox @ grocerystorage",
            coords = { x = 7250, y = 8262, z = -1 },
        },
        { -- E23
            note = "cardboardbox @ grocerystorage",
            coords = { x = 7251, y = 8262, z = -1 },
        },
        { -- E24
            note = "counter @ janitor",
            coords = { x = 7256, y = 8256, z = -1 },
        },
        { -- E25
            note = "metal_shelves @ janitor",
            coords = { x = 7257, y = 8256, z = -1 },
        },
        { -- E26
            note = "cardboardbox @ storage",
            coords = { x = 7258, y = 8253, z = -1 },
        },
        { -- E27
            note = "cardboardbox @ storage",
            coords = { x = 7259, y = 8253, z = -1 },
        },
        { -- E28
            note = "cardboardbox @ storage",
            coords = { x = 7259, y = 8253, z = -1 },
            slot = "upper",
        },
        { -- E29
            note = "locker @ laundry",
            coords = { x = 7254, y = 8256, z = -2 },
        },
        { -- E30
            note = "medicine @ laundry",
            coords = { x = 7255, y = 8253, z = -2 },
            slot = "upper",
        },
        { -- E31
            note = "militarylocker @ storage",
            coords = { x = 7258, y = 8249, z = -2 },
        },
        { -- E32
            note = "militarylocker @ storage",
            coords = { x = 7262, y = 8249, z = -2 },
        },
        { -- E33
            note = "woodstove @ storage",
            coords = { x = 7256, y = 8253, z = -2 },
        },
        { -- E34
            note = "crate @ storage",
            coords = { x = 7260, y = 8254, z = -2 },
        },
        { -- E35
            note = "crate @ storage",
            coords = { x = 7261, y = 8254, z = -2 },
        },
        { -- E36
            note = "crate @ storage",
            coords = { x = 7261, y = 8254, z = -2 },
            stack = 2,
        },
        { -- E37
            note = "crate @ storage",
            coords = { x = 7262, y = 8254, z = -2 },
        },
        { -- E38
            note = "crate @ storage",
            coords = { x = 7262, y = 8254, z = -2 },
            stack = 2,
        },
        { -- E39
            note = "crate @ storage",
            coords = { x = 7263, y = 8254, z = -2 },
        },
        { -- E40
            note = "crate @ storage",
            coords = { x = 7256, y = 8255, z = -2 },
        },
        { -- E41
            note = "crate @ storage",
            coords = { x = 7260, y = 8255, z = -2 },
        },
        { -- E42
            note = "crate @ storage",
            coords = { x = 7261, y = 8255, z = -2 },
        },
        { -- E43
            note = "crate @ storage",
            coords = { x = 7261, y = 8255, z = -2 },
            stack = 2,
        },
        { -- E44
            note = "crate @ storage",
            coords = { x = 7262, y = 8255, z = -2 },
        },
        { -- E45
            note = "crate @ storage",
            coords = { x = 7262, y = 8255, z = -2 },
            stack = 2,
        },
        { -- E46
            note = "crate @ storage",
            coords = { x = 7263, y = 8255, z = -2 },
        },
        { -- E47
            note = "crate @ storage",
            coords = { x = 7263, y = 8255, z = -2 },
            stack = 2,
        },
        { -- E48
            note = "militarycrate @ storage",
            coords = { x = 7267, y = 8256, z = -2 },
        },
        { -- E49
            note = "militarycrate @ storage",
            coords = { x = 7268, y = 8256, z = -2 },
        },
        { -- E50
            note = "militarylocker @ storage",
            coords = { x = 7266, y = 8249, z = -2 },
        },
        { -- E51
            note = "crate @ storage",
            coords = { x = 7264, y = 8254, z = -2 },
        },
        { -- E52
            note = "crate @ storage",
            coords = { x = 7264, y = 8255, z = -2 },
        },
        { -- E53
            note = "crate @ storage",
            coords = { x = 7264, y = 8255, z = -2 },
            stack = 2,
        },
        { -- E54
            note = "militarycrate @ storage",
            coords = { x = 7268, y = 8255, z = -2 },
        }, -- The four bunkers below (z=-3, 4 + 18 containers each) are copies of
        -- config 01 Doe Valley's floor plan and are identical to one another.
        -- They carry their own overlay, so their loot should be varied from 01
        -- rather than mirroring it, and ideally varied between the four.
        { -- E55
            note = "metal_shelves @ bunker",
            coords = { x = 7254, y = 8250, z = -3 },
        },
        { -- E56
            note = "metal_shelves @ bunker",
            coords = { x = 7254, y = 8251, z = -3 },
        },
        { -- E57
            note = "metal_shelves @ bunker",
            coords = { x = 7254, y = 8252, z = -3 },
        },
        { -- E58
            note = "metal_shelves @ bunker",
            coords = { x = 7254, y = 8253, z = -3 },
        },
        { -- E59
            note = "metal_shelves @ bunker",
            coords = { x = 7254, y = 8248, z = -3 },
        },
        { -- E60
            note = "metal_shelves @ bunker",
            coords = { x = 7254, y = 8249, z = -3 },
        },
        { -- E61
            note = "dresser @ bunker",
            coords = { x = 7254, y = 8243, z = -3 },
        },
        { -- E62
            note = "overhead @ bunker",
            coords = { x = 7254, y = 8244, z = -3 },
            slot = "upper",
        },
        { -- E63
            note = "counter @ bunker",
            coords = { x = 7254, y = 8244, z = -3 },
        },
        { -- E64
            note = "overhead @ bunker",
            coords = { x = 7254, y = 8245, z = -3 },
            slot = "upper",
        },
        { -- E65
            note = "counter @ bunker",
            coords = { x = 7254, y = 8245, z = -3 },
        },
        { -- E66
            note = "overhead @ bunker",
            coords = { x = 7254, y = 8246, z = -3 },
            slot = "upper",
        },
        { -- E67
            note = "counter @ bunker",
            coords = { x = 7254, y = 8246, z = -3 },
        },
        { -- E68
            note = "fridge @ bunker",
            coords = { x = 7254, y = 8247, z = -3 },
        },
        { -- E69
            note = "freezer @ bunker",
            coords = { x = 7254, y = 8247, z = -3 },
            slot = "freezer",
        },
        { -- E70
            note = "militarylocker @ bunker",
            coords = { x = 7256, y = 8248, z = -3 },
        },
        { -- E71
            note = "crate @ bunker",
            coords = { x = 7256, y = 8241, z = -3 },
        },
        { -- E72
            note = "crate @ bunker",
            coords = { x = 7256, y = 8241, z = -3 },
            stack = 2,
        },
        { -- E73
            note = "crate @ bunker",
            coords = { x = 7256, y = 8242, z = -3 },
        },
        { -- E74
            note = "crate @ bunker",
            coords = { x = 7256, y = 8242, z = -3 },
            stack = 2,
        },
        { -- E75
            note = "locker @ bunker",
            coords = { x = 7256, y = 8246, z = -3 },
        },
        { -- E76
            note = "militarylocker @ bunker",
            coords = { x = 7256, y = 8247, z = -3 },
        },
        { -- E77
            note = "metal_shelves @ bunker",
            coords = { x = 7258, y = 8250, z = -3 },
        },
        { -- E78
            note = "metal_shelves @ bunker",
            coords = { x = 7258, y = 8251, z = -3 },
        },
        { -- E79
            note = "metal_shelves @ bunker",
            coords = { x = 7258, y = 8252, z = -3 },
        },
        { -- E80
            note = "metal_shelves @ bunker",
            coords = { x = 7258, y = 8253, z = -3 },
        },
        { -- E81
            note = "metal_shelves @ bunker",
            coords = { x = 7258, y = 8248, z = -3 },
        },
        { -- E82
            note = "militarylocker @ bunker",
            coords = { x = 7260, y = 8248, z = -3 },
        },
        { -- E83
            note = "metal_shelves @ bunker",
            coords = { x = 7258, y = 8249, z = -3 },
        },
        { -- E84
            note = "crate @ bunker",
            coords = { x = 7260, y = 8241, z = -3 },
        },
        { -- E85
            note = "crate @ bunker",
            coords = { x = 7260, y = 8241, z = -3 },
            stack = 2,
        },
        { -- E86
            note = "crate @ bunker",
            coords = { x = 7260, y = 8242, z = -3 },
        },
        { -- E87
            note = "crate @ bunker",
            coords = { x = 7260, y = 8242, z = -3 },
            stack = 2,
        },
        { -- E88
            note = "dresser @ bunker",
            coords = { x = 7258, y = 8243, z = -3 },
        },
        { -- E89
            note = "overhead @ bunker",
            coords = { x = 7258, y = 8244, z = -3 },
            slot = "upper",
        },
        { -- E90
            note = "counter @ bunker",
            coords = { x = 7258, y = 8244, z = -3 },
        },
        { -- E91
            note = "overhead @ bunker",
            coords = { x = 7258, y = 8245, z = -3 },
            slot = "upper",
        },
        { -- E92
            note = "counter @ bunker",
            coords = { x = 7258, y = 8245, z = -3 },
        },
        { -- E93
            note = "overhead @ bunker",
            coords = { x = 7258, y = 8246, z = -3 },
            slot = "upper",
        },
        { -- E94
            note = "counter @ bunker",
            coords = { x = 7258, y = 8246, z = -3 },
        },
        { -- E95
            note = "locker @ bunker",
            coords = { x = 7260, y = 8246, z = -3 },
        },
        { -- E96
            note = "fridge @ bunker",
            coords = { x = 7258, y = 8247, z = -3 },
        },
        { -- E97
            note = "freezer @ bunker",
            coords = { x = 7258, y = 8247, z = -3 },
            slot = "freezer",
        },
        { -- E98
            note = "militarylocker @ bunker",
            coords = { x = 7260, y = 8247, z = -3 },
        },
        { -- E99
            note = "metal_shelves @ bunker",
            coords = { x = 7262, y = 8250, z = -3 },
        },
        { -- E100
            note = "metal_shelves @ bunker",
            coords = { x = 7262, y = 8251, z = -3 },
        },
        { -- E101
            note = "metal_shelves @ bunker",
            coords = { x = 7262, y = 8252, z = -3 },
        },
        { -- E102
            note = "metal_shelves @ bunker",
            coords = { x = 7262, y = 8253, z = -3 },
        },
        { -- E103
            note = "metal_shelves @ bunker",
            coords = { x = 7262, y = 8248, z = -3 },
        },
        { -- E104
            note = "metal_shelves @ bunker",
            coords = { x = 7262, y = 8249, z = -3 },
        },
        { -- E105
            note = "dresser @ bunker",
            coords = { x = 7262, y = 8243, z = -3 },
        },
        { -- E106
            note = "overhead @ bunker",
            coords = { x = 7262, y = 8244, z = -3 },
            slot = "upper",
        },
        { -- E107
            note = "counter @ bunker",
            coords = { x = 7262, y = 8244, z = -3 },
        },
        { -- E108
            note = "overhead @ bunker",
            coords = { x = 7262, y = 8245, z = -3 },
            slot = "upper",
        },
        { -- E109
            note = "counter @ bunker",
            coords = { x = 7262, y = 8245, z = -3 },
        },
        { -- E110
            note = "overhead @ bunker",
            coords = { x = 7262, y = 8246, z = -3 },
            slot = "upper",
        },
        { -- E111
            note = "counter @ bunker",
            coords = { x = 7262, y = 8246, z = -3 },
        },
        { -- E112
            note = "fridge @ bunker",
            coords = { x = 7262, y = 8247, z = -3 },
        },
        { -- E113
            note = "freezer @ bunker",
            coords = { x = 7262, y = 8247, z = -3 },
            slot = "freezer",
        },
        { -- E114
            note = "militarylocker @ bunker",
            coords = { x = 7264, y = 8248, z = -3 },
        },
        { -- E115
            note = "crate @ bunker",
            coords = { x = 7264, y = 8241, z = -3 },
        },
        { -- E116
            note = "crate @ bunker",
            coords = { x = 7264, y = 8241, z = -3 },
            stack = 2,
        },
        { -- E117
            note = "crate @ bunker",
            coords = { x = 7264, y = 8242, z = -3 },
        },
        { -- E118
            note = "crate @ bunker",
            coords = { x = 7264, y = 8242, z = -3 },
            stack = 2,
        },
        { -- E119
            note = "locker @ bunker",
            coords = { x = 7264, y = 8246, z = -3 },
        },
        { -- E120
            note = "militarylocker @ bunker",
            coords = { x = 7264, y = 8247, z = -3 },
        },
        { -- E121
            note = "metal_shelves @ bunker",
            coords = { x = 7266, y = 8250, z = -3 },
        },
        { -- E122
            note = "metal_shelves @ bunker",
            coords = { x = 7266, y = 8251, z = -3 },
        },
        { -- E123
            note = "metal_shelves @ bunker",
            coords = { x = 7266, y = 8252, z = -3 },
        },
        { -- E124
            note = "metal_shelves @ bunker",
            coords = { x = 7266, y = 8253, z = -3 },
        },
        { -- E125
            note = "metal_shelves @ bunker",
            coords = { x = 7266, y = 8248, z = -3 },
        },
        { -- E126
            note = "militarylocker @ bunker",
            coords = { x = 7268, y = 8248, z = -3 },
        },
        { -- E127
            note = "metal_shelves @ bunker",
            coords = { x = 7266, y = 8249, z = -3 },
        },
        { -- E128
            note = "crate @ bunker",
            coords = { x = 7268, y = 8241, z = -3 },
        },
        { -- E129
            note = "crate @ bunker",
            coords = { x = 7268, y = 8241, z = -3 },
            stack = 2,
        },
        { -- E130
            note = "crate @ bunker",
            coords = { x = 7268, y = 8242, z = -3 },
        },
        { -- E131
            note = "crate @ bunker",
            coords = { x = 7268, y = 8242, z = -3 },
            stack = 2,
        },
        { -- E132
            note = "dresser @ bunker",
            coords = { x = 7266, y = 8243, z = -3 },
        },
        { -- E133
            note = "overhead @ bunker",
            coords = { x = 7266, y = 8244, z = -3 },
            slot = "upper",
        },
        { -- E134
            note = "counter @ bunker",
            coords = { x = 7266, y = 8244, z = -3 },
        },
        { -- E135
            note = "overhead @ bunker",
            coords = { x = 7266, y = 8245, z = -3 },
            slot = "upper",
        },
        { -- E136
            note = "counter @ bunker",
            coords = { x = 7266, y = 8245, z = -3 },
        },
        { -- E137
            note = "overhead @ bunker",
            coords = { x = 7266, y = 8246, z = -3 },
            slot = "upper",
        },
        { -- E138
            note = "counter @ bunker",
            coords = { x = 7266, y = 8246, z = -3 },
        },
        { -- E139
            note = "locker @ bunker",
            coords = { x = 7268, y = 8246, z = -3 },
        },
        { -- E140
            note = "fridge @ bunker",
            coords = { x = 7266, y = 8247, z = -3 },
        },
        { -- E141
            note = "freezer @ bunker",
            coords = { x = 7266, y = 8247, z = -3 },
            slot = "freezer",
        },
        { -- E142
            note = "militarylocker @ bunker",
            coords = { x = 7268, y = 8247, z = -3 },
        }, },
}

-- if getActivatedMods():contains("\\Ladders") then
--     table.insert(FallasHotel.objectSpawns, { x = 7678, y = 12206, z = -1, removeWall = "west" })
--     table.insert(FallasHotel.objectSpawns, { x = 7679, y = 12205, z = 0, removeFloor = true, clearExisting = true, })
-- else
-- --     table.insert(FallasHotel.objectSpawns, { sprite = "industry_trucks_01_4", x = 2607, y = 14453, z = -1, replaceWall = true, })
-- end
return FallasHotel
