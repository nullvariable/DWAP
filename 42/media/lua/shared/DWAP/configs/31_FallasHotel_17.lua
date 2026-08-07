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
        { x = 7244,    y = 8258, z = 1 },  -- hotel
        { x = 7254,    y = 8257, z = -1 }, -- hotel basement
        { x = 7258,    y = 8252, z = -2 }, -- bunkers entrance
        { x = 7255,    y = 8250, z = -3 }, -- bunker west
        { x = 7255 + 4, y = 8250, z = -3 }, -- bunker west center
        { x = 7255 + 8, y = 8250, z = -3 }, -- bunker east center
        { x = 7255 + 12, y = 8250, z = -3 }, -- bunker east
    },
    spawn = { x = 7244, y = 8258, z = 1 },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = { x = 7681, y = 12221, z = -1 } },
    },
    waterFixtures = {
        { sprite = "fixtures_sinks_01_16",   x = bunkerTopLeft.x,   y = bunkerTopLeft.y + 4, z = bunkerTopLeft.z, sourceType = "tank", source = 1 },
        { sprite = "fixtures_bathroom_01_6", x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y + 8, z = bunkerTopLeft.z, sourceType = "tank", source = 1 },

        { sprite = "fixtures_sinks_01_35",   x = 7232,              y = 8211,              z = 0,               sourceType = "tank", source = 1 },
        { sprite = "fixtures_sinks_01_16",   x = 7233,              y = 8208,              z = 0,               sourceType = "tank", source = 1 },
        { sprite = "fixtures_bathroom_01_5", x = 7229,              y = 8206,              z = 0,               sourceType = "tank", source = 1 },
        { sprite = "fixtures_sinks_01_15",   x = 7229,              y = 8204,              z = 0,               sourceType = "tank", source = 1 },
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
        { barricade = "wood",     enabled = "Barricade", target = "walls_commercial_01_113",            x = 7230, y = 8199, z = 0, },
        { barricade = "wood",     enabled = "Barricade", target = "walls_commercial_01_113",            x = 7231, y = 8199, z = 0, },
        { barricade = "wood",     enabled = "Barricade", target = "walls_commercial_01_113",            x = 7233, y = 8199, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target = "walls_commercial_01_113",            x = 7234, y = 8199, z = 0, },
        { barricade = "wood",     enabled = "Barricade", target = "walls_commercial_01_113",            x = 7238, y = 8199, z = 0, },
        { barricade = "wood",     enabled = "Barricade", target = "walls_commercial_01_113",            x = 7239, y = 8199, z = 0, },
        { barricade = "wood",     enabled = "Barricade", target = "walls_commercial_01_113",            x = 7241, y = 8199, z = 0, },
        { barricade = "wood",     enabled = "Barricade", target = "walls_commercial_01_113",            x = 7242, y = 8199, z = 0, },
        { barricade = "metal",    enabled = "Barricade", target = "walls_exterior_house_02_88",         x = 7244, y = 8202, z = 0, },
        { barricade = "metal",    enabled = "Barricade", target = "location_restaurant_pileocrepe_01_48", x = 7244, y = 8203, z = 0, },
    },
    loot = {
        -- E1
        { type = 'container', coords = {x=7248,y=8260,z=2}, }, -- locker @ janitor
        -- E2
        { type = 'container', coords = {x=7250,y=8260,z=2}, }, -- locker @ janitor
        -- E3
        { type = 'container', coords = {x=7248,y=8261,z=2}, }, -- cardboardbox @ janitor
        -- E4
        { type = 'container', coords = {x=7248,y=8262,z=2}, }, -- cardboardbox @ janitor
        -- E5
        { type = 'container', coords = {x=7248,y=8262,z=2}, slot = "upper", }, -- cardboardbox @ janitor
        -- E6
        { type = 'container', coords = {x=7248,y=8259,z=1}, }, -- cardboardbox @ janitor
        -- E7
        { type = 'container', coords = {x=7250,y=8259,z=1}, }, -- smallbox @ janitor
        -- E8
        { type = 'container', coords = {x=7248,y=8260,z=1}, }, -- cardboardbox @ janitor
        -- E9
        { type = 'container', coords = {x=7248,y=8260,z=1}, slot = "upper", }, -- cardboardbox @ janitor
        -- E10
        { type = 'container', coords = {x=7250,y=8260,z=1}, }, -- metal_shelves @ janitor
        -- E11
        { type = 'container', coords = {x=7249,y=8261,z=1}, slot = "upper", }, -- medicine @ bathroom
        -- E12
        { type = 'container', coords = {x=7249,y=8261,z=1}, }, -- counter @ bathroom
        -- E13
        { type = 'container', coords = {x=7243,y=8259,z=1}, }, -- wardrobe @ motelroom
        -- E14
        { type = 'container', coords = {x=7244,y=8259,z=1}, }, -- wardrobe @ motelroom
        -- E15
        { type = 'container', coords = {x=7246,y=8259,z=1}, }, -- dresser @ motelroom
        -- E16
        { type = 'container', coords = {x=7246,y=8256,z=1}, }, -- dresser @ motelroom
        -- E17
        { type = 'container', coords = {x=7248,y=8259,z=-1}, }, -- metal_shelves @ grocerystorage
        -- E18
        { type = 'container', coords = {x=7248,y=8260,z=-1}, }, -- metal_shelves @ grocerystorage
        -- E19
        { type = 'container', coords = {x=7248,y=8261,z=-1}, }, -- metal_shelves @ grocerystorage
        -- E20
        { type = 'container', coords = {x=7251,y=8261,z=-1}, }, -- cardboardbox @ grocerystorage
        -- E21
        { type = 'container', coords = {x=7248,y=8262,z=-1}, }, -- metal_shelves @ grocerystorage
        -- E22
        { type = 'container', coords = {x=7250,y=8262,z=-1}, }, -- smallbox @ grocerystorage
        -- E23
        { type = 'container', coords = {x=7251,y=8262,z=-1}, }, -- cardboardbox @ grocerystorage
        -- E24
        { type = 'container', coords = {x=7256,y=8256,z=-1}, }, -- counter @ janitor
        -- E25
        { type = 'container', coords = {x=7257,y=8256,z=-1}, }, -- metal_shelves @ janitor
        -- E26
        { type = 'container', coords = {x=7258,y=8253,z=-1}, }, -- cardboardbox @ storage
        -- E27
        { type = 'container', coords = {x=7259,y=8253,z=-1}, }, -- cardboardbox @ storage
        -- E28
        { type = 'container', coords = {x=7259,y=8253,z=-1}, slot = "upper", }, -- cardboardbox @ storage
        -- E29
        { type = 'container', coords = {x=7254,y=8256,z=-2}, }, -- locker @ laundry
        -- E30
        { type = 'container', coords = {x=7255,y=8253,z=-2}, slot = "upper", }, -- medicine @ laundry
        -- E31
        { type = 'container', coords = {x=7258,y=8249,z=-2}, }, -- militarylocker @ storage
        -- E32
        { type = 'container', coords = {x=7262,y=8249,z=-2}, }, -- militarylocker @ storage
        -- E33
        { type = 'container', coords = {x=7256,y=8253,z=-2}, }, -- woodstove @ storage
        -- E34
        { type = 'container', coords = {x=7260,y=8254,z=-2}, }, -- crate @ storage
        -- E35
        { type = 'container', coords = {x=7261,y=8254,z=-2}, }, -- crate @ storage
        -- E36
        { type = 'container', coords = {x=7261,y=8254,z=-2}, stack = 2, }, -- crate @ storage
        -- E37
        { type = 'container', coords = {x=7262,y=8254,z=-2}, }, -- crate @ storage
        -- E38
        { type = 'container', coords = {x=7262,y=8254,z=-2}, stack = 2, }, -- crate @ storage
        -- E39
        { type = 'container', coords = {x=7263,y=8254,z=-2}, }, -- crate @ storage
        -- E40
        { type = 'container', coords = {x=7256,y=8255,z=-2}, }, -- crate @ storage
        -- E41
        { type = 'container', coords = {x=7260,y=8255,z=-2}, }, -- crate @ storage
        -- E42
        { type = 'container', coords = {x=7261,y=8255,z=-2}, }, -- crate @ storage
        -- E43
        { type = 'container', coords = {x=7261,y=8255,z=-2}, stack = 2, }, -- crate @ storage
        -- E44
        { type = 'container', coords = {x=7262,y=8255,z=-2}, }, -- crate @ storage
        -- E45
        { type = 'container', coords = {x=7262,y=8255,z=-2}, stack = 2, }, -- crate @ storage
        -- E46
        { type = 'container', coords = {x=7263,y=8255,z=-2}, }, -- crate @ storage
        -- E47
        { type = 'container', coords = {x=7263,y=8255,z=-2}, stack = 2, }, -- crate @ storage
        -- E48
        { type = 'container', coords = {x=7267,y=8256,z=-2}, }, -- militarycrate @ storage
        -- E49
        { type = 'container', coords = {x=7268,y=8256,z=-2}, }, -- militarycrate @ storage
        -- E50
        { type = 'container', coords = {x=7266,y=8249,z=-2}, }, -- militarylocker @ storage
        -- E51
        { type = 'container', coords = {x=7264,y=8254,z=-2}, }, -- crate @ storage
        -- E52
        { type = 'container', coords = {x=7264,y=8255,z=-2}, }, -- crate @ storage
        -- E53
        { type = 'container', coords = {x=7264,y=8255,z=-2}, stack = 2, }, -- crate @ storage
        -- E54
        { type = 'container', coords = {x=7268,y=8255,z=-2}, }, -- militarycrate @ storage
        -- The four bunkers below (z=-3, 4 + 18 containers each) are copies of
        -- config 01 Doe Valley's floor plan and are identical to one another.
        -- They carry their own overlay, so their loot should be varied from 01
        -- rather than mirroring it, and ideally varied between the four.
        -- E55
        { type = 'container', coords = {x=7254,y=8250,z=-3}, }, -- metal_shelves @ bunker
        -- E56
        { type = 'container', coords = {x=7254,y=8251,z=-3}, }, -- metal_shelves @ bunker
        -- E57
        { type = 'container', coords = {x=7254,y=8252,z=-3}, }, -- metal_shelves @ bunker
        -- E58
        { type = 'container', coords = {x=7254,y=8253,z=-3}, }, -- metal_shelves @ bunker
        -- E59
        { type = 'container', coords = {x=7254,y=8248,z=-3}, }, -- metal_shelves @ bunker
        -- E60
        { type = 'container', coords = {x=7254,y=8249,z=-3}, }, -- metal_shelves @ bunker
        -- E61
        { type = 'container', coords = {x=7254,y=8243,z=-3}, }, -- dresser @ bunker
        -- E62
        { type = 'container', coords = {x=7254,y=8244,z=-3}, slot = "upper", }, -- overhead @ bunker
        -- E63
        { type = 'container', coords = {x=7254,y=8244,z=-3}, }, -- counter @ bunker
        -- E64
        { type = 'container', coords = {x=7254,y=8245,z=-3}, slot = "upper", }, -- overhead @ bunker
        -- E65
        { type = 'container', coords = {x=7254,y=8245,z=-3}, }, -- counter @ bunker
        -- E66
        { type = 'container', coords = {x=7254,y=8246,z=-3}, slot = "upper", }, -- overhead @ bunker
        -- E67
        { type = 'container', coords = {x=7254,y=8246,z=-3}, }, -- counter @ bunker
        -- E68
        { type = 'container', coords = {x=7254,y=8247,z=-3}, }, -- fridge @ bunker
        -- E69
        { type = 'container', coords = {x=7254,y=8247,z=-3}, slot = "freezer", }, -- freezer @ bunker
        -- E70
        { type = 'container', coords = {x=7256,y=8248,z=-3}, }, -- militarylocker @ bunker
        -- E71
        { type = 'container', coords = {x=7256,y=8241,z=-3}, }, -- crate @ bunker
        -- E72
        { type = 'container', coords = {x=7256,y=8241,z=-3}, stack = 2, }, -- crate @ bunker
        -- E73
        { type = 'container', coords = {x=7256,y=8242,z=-3}, }, -- crate @ bunker
        -- E74
        { type = 'container', coords = {x=7256,y=8242,z=-3}, stack = 2, }, -- crate @ bunker
        -- E75
        { type = 'container', coords = {x=7256,y=8246,z=-3}, }, -- locker @ bunker
        -- E76
        { type = 'container', coords = {x=7256,y=8247,z=-3}, }, -- militarylocker @ bunker
        -- E77
        { type = 'container', coords = {x=7258,y=8250,z=-3}, }, -- metal_shelves @ bunker
        -- E78
        { type = 'container', coords = {x=7258,y=8251,z=-3}, }, -- metal_shelves @ bunker
        -- E79
        { type = 'container', coords = {x=7258,y=8252,z=-3}, }, -- metal_shelves @ bunker
        -- E80
        { type = 'container', coords = {x=7258,y=8253,z=-3}, }, -- metal_shelves @ bunker
        -- E81
        { type = 'container', coords = {x=7258,y=8248,z=-3}, }, -- metal_shelves @ bunker
        -- E82
        { type = 'container', coords = {x=7260,y=8248,z=-3}, }, -- militarylocker @ bunker
        -- E83
        { type = 'container', coords = {x=7258,y=8249,z=-3}, }, -- metal_shelves @ bunker
        -- E84
        { type = 'container', coords = {x=7260,y=8241,z=-3}, }, -- crate @ bunker
        -- E85
        { type = 'container', coords = {x=7260,y=8241,z=-3}, stack = 2, }, -- crate @ bunker
        -- E86
        { type = 'container', coords = {x=7260,y=8242,z=-3}, }, -- crate @ bunker
        -- E87
        { type = 'container', coords = {x=7260,y=8242,z=-3}, stack = 2, }, -- crate @ bunker
        -- E88
        { type = 'container', coords = {x=7258,y=8243,z=-3}, }, -- dresser @ bunker
        -- E89
        { type = 'container', coords = {x=7258,y=8244,z=-3}, slot = "upper", }, -- overhead @ bunker
        -- E90
        { type = 'container', coords = {x=7258,y=8244,z=-3}, }, -- counter @ bunker
        -- E91
        { type = 'container', coords = {x=7258,y=8245,z=-3}, slot = "upper", }, -- overhead @ bunker
        -- E92
        { type = 'container', coords = {x=7258,y=8245,z=-3}, }, -- counter @ bunker
        -- E93
        { type = 'container', coords = {x=7258,y=8246,z=-3}, slot = "upper", }, -- overhead @ bunker
        -- E94
        { type = 'container', coords = {x=7258,y=8246,z=-3}, }, -- counter @ bunker
        -- E95
        { type = 'container', coords = {x=7260,y=8246,z=-3}, }, -- locker @ bunker
        -- E96
        { type = 'container', coords = {x=7258,y=8247,z=-3}, }, -- fridge @ bunker
        -- E97
        { type = 'container', coords = {x=7258,y=8247,z=-3}, slot = "freezer", }, -- freezer @ bunker
        -- E98
        { type = 'container', coords = {x=7260,y=8247,z=-3}, }, -- militarylocker @ bunker
        -- E99
        { type = 'container', coords = {x=7262,y=8250,z=-3}, }, -- metal_shelves @ bunker
        -- E100
        { type = 'container', coords = {x=7262,y=8251,z=-3}, }, -- metal_shelves @ bunker
        -- E101
        { type = 'container', coords = {x=7262,y=8252,z=-3}, }, -- metal_shelves @ bunker
        -- E102
        { type = 'container', coords = {x=7262,y=8253,z=-3}, }, -- metal_shelves @ bunker
        -- E103
        { type = 'container', coords = {x=7262,y=8248,z=-3}, }, -- metal_shelves @ bunker
        -- E104
        { type = 'container', coords = {x=7262,y=8249,z=-3}, }, -- metal_shelves @ bunker
        -- E105
        { type = 'container', coords = {x=7262,y=8243,z=-3}, }, -- dresser @ bunker
        -- E106
        { type = 'container', coords = {x=7262,y=8244,z=-3}, slot = "upper", }, -- overhead @ bunker
        -- E107
        { type = 'container', coords = {x=7262,y=8244,z=-3}, }, -- counter @ bunker
        -- E108
        { type = 'container', coords = {x=7262,y=8245,z=-3}, slot = "upper", }, -- overhead @ bunker
        -- E109
        { type = 'container', coords = {x=7262,y=8245,z=-3}, }, -- counter @ bunker
        -- E110
        { type = 'container', coords = {x=7262,y=8246,z=-3}, slot = "upper", }, -- overhead @ bunker
        -- E111
        { type = 'container', coords = {x=7262,y=8246,z=-3}, }, -- counter @ bunker
        -- E112
        { type = 'container', coords = {x=7262,y=8247,z=-3}, }, -- fridge @ bunker
        -- E113
        { type = 'container', coords = {x=7262,y=8247,z=-3}, slot = "freezer", }, -- freezer @ bunker
        -- E114
        { type = 'container', coords = {x=7264,y=8248,z=-3}, }, -- militarylocker @ bunker
        -- E115
        { type = 'container', coords = {x=7264,y=8241,z=-3}, }, -- crate @ bunker
        -- E116
        { type = 'container', coords = {x=7264,y=8241,z=-3}, stack = 2, }, -- crate @ bunker
        -- E117
        { type = 'container', coords = {x=7264,y=8242,z=-3}, }, -- crate @ bunker
        -- E118
        { type = 'container', coords = {x=7264,y=8242,z=-3}, stack = 2, }, -- crate @ bunker
        -- E119
        { type = 'container', coords = {x=7264,y=8246,z=-3}, }, -- locker @ bunker
        -- E120
        { type = 'container', coords = {x=7264,y=8247,z=-3}, }, -- militarylocker @ bunker
        -- E121
        { type = 'container', coords = {x=7266,y=8250,z=-3}, }, -- metal_shelves @ bunker
        -- E122
        { type = 'container', coords = {x=7266,y=8251,z=-3}, }, -- metal_shelves @ bunker
        -- E123
        { type = 'container', coords = {x=7266,y=8252,z=-3}, }, -- metal_shelves @ bunker
        -- E124
        { type = 'container', coords = {x=7266,y=8253,z=-3}, }, -- metal_shelves @ bunker
        -- E125
        { type = 'container', coords = {x=7266,y=8248,z=-3}, }, -- metal_shelves @ bunker
        -- E126
        { type = 'container', coords = {x=7268,y=8248,z=-3}, }, -- militarylocker @ bunker
        -- E127
        { type = 'container', coords = {x=7266,y=8249,z=-3}, }, -- metal_shelves @ bunker
        -- E128
        { type = 'container', coords = {x=7268,y=8241,z=-3}, }, -- crate @ bunker
        -- E129
        { type = 'container', coords = {x=7268,y=8241,z=-3}, stack = 2, }, -- crate @ bunker
        -- E130
        { type = 'container', coords = {x=7268,y=8242,z=-3}, }, -- crate @ bunker
        -- E131
        { type = 'container', coords = {x=7268,y=8242,z=-3}, stack = 2, }, -- crate @ bunker
        -- E132
        { type = 'container', coords = {x=7266,y=8243,z=-3}, }, -- dresser @ bunker
        -- E133
        { type = 'container', coords = {x=7266,y=8244,z=-3}, slot = "upper", }, -- overhead @ bunker
        -- E134
        { type = 'container', coords = {x=7266,y=8244,z=-3}, }, -- counter @ bunker
        -- E135
        { type = 'container', coords = {x=7266,y=8245,z=-3}, slot = "upper", }, -- overhead @ bunker
        -- E136
        { type = 'container', coords = {x=7266,y=8245,z=-3}, }, -- counter @ bunker
        -- E137
        { type = 'container', coords = {x=7266,y=8246,z=-3}, slot = "upper", }, -- overhead @ bunker
        -- E138
        { type = 'container', coords = {x=7266,y=8246,z=-3}, }, -- counter @ bunker
        -- E139
        { type = 'container', coords = {x=7268,y=8246,z=-3}, }, -- locker @ bunker
        -- E140
        { type = 'container', coords = {x=7266,y=8247,z=-3}, }, -- fridge @ bunker
        -- E141
        { type = 'container', coords = {x=7266,y=8247,z=-3}, slot = "freezer", }, -- freezer @ bunker
        -- E142
        { type = 'container', coords = {x=7268,y=8247,z=-3}, }, -- militarylocker @ bunker
    },
}

-- if getActivatedMods():contains("\\Ladders") then
--     table.insert(FallasHotel.objectSpawns, { x = 7678, y = 12206, z = -1, removeWall = "west" })
--     table.insert(FallasHotel.objectSpawns, { x = 7679, y = 12205, z = 0, removeFloor = true, clearExisting = true, })
-- else
-- --     table.insert(FallasHotel.objectSpawns, { sprite = "industry_trucks_01_4", x = 2607, y = 14453, z = -1, replaceWall = true, })
-- end
return FallasHotel
