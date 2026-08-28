local bunkerTopLeft = { x = 7226, y = 8197, z = -1 }
local wtc = { x = 7256, y = 8261, z = -1 }
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
        { sprite = "industry__2_72", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = { x = 7681, y = 12221, z = -1 } },
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
    loot = {
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
        }, -- The four bunkers below (z=-3, 4 + 18 containers each) are copies of
        -- config 01 Doe Valley's floor plan and are identical to one another.
        -- They carry their own overlay, so their loot should be varied from 01
        -- rather than mirroring it, and ideally varied between the four.
        { -- E55
            note = "metal_shelves @ bunker",
            coords = { x = 7254, y = 8250, z = -3 },
            tag = "DWAPFarm",
        },
        { -- E56
            note = "metal_shelves @ bunker",
            coords = { x = 7254, y = 8251, z = -3 },
            tag = "DWAPFarm",
        },
        { -- E57
            note = "metal_shelves @ bunker",
            coords = { x = 7254, y = 8252, z = -3 },
            tag = "DWAPFarm",
        },
        { -- E58
            note = "metal_shelves @ bunker",
            coords = { x = 7254, y = 8253, z = -3 },
            tag = "DWAPFood",
        },
        { -- E59
            note = "metal_shelves @ bunker",
            coords = { x = 7254, y = 8248, z = -3 },
            tag = "DWAPFarm",
        },
        { -- E60
            note = "metal_shelves @ bunker",
            coords = { x = 7254, y = 8249, z = -3 },
            tag = "DWAPFood",
        },
        { -- E61
            note = "dresser @ bunker",
            coords = { x = 7254, y = 8243, z = -3 },
            tag = "DWAPLockers",
        },
        { -- E62
            note = "overhead @ bunker",
            coords = { x = 7254, y = 8244, z = -3 },
            slot = "upper",
            tag = "DWAPFood",
        },
        { -- E63
            note = "counter @ bunker",
            coords = { x = 7254, y = 8244, z = -3 },
            tag = "DWAPFood",
        },
        { -- E64
            note = "overhead @ bunker",
            coords = { x = 7254, y = 8245, z = -3 },
            slot = "upper",
            tag = "DWAPFood",
        },
        { -- E65
            note = "counter @ bunker",
            coords = { x = 7254, y = 8245, z = -3 },
            tag = "DWAPFood",
        },
        { -- E66
            note = "overhead @ bunker",
            coords = { x = 7254, y = 8246, z = -3 },
            slot = "upper",
            tag = "DWAPFood",
        },
        { -- E67
            note = "counter @ bunker",
            coords = { x = 7254, y = 8246, z = -3 },
            tag = "DWAPFood",
        },
        { -- E68
            note = "fridge @ bunker",
            coords = { x = 7254, y = 8247, z = -3 },
            distIncludeJunk = true,
            tag = "DWAPFridge",
        },
        { -- E69
            note = "freezer @ bunker",
            coords = { x = 7254, y = 8247, z = -3 },
            slot = "freezer",
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        { -- E70
            note = "militarylocker @ bunker",
            coords = { x = 7256, y = 8248, z = -3 },
            tag = "DWAPGun",
        },
        { -- E71
            note = "crate @ bunker",
            coords = { x = 7256, y = 8241, z = -3 },
            tag = "DWAPFarm",
        },
        { -- E72
            note = "crate @ bunker",
            coords = { x = 7256, y = 8241, z = -3 },
            stack = 2,
            tag = "DWAPFarm",
        },
        { -- E73
            note = "crate @ bunker",
            coords = { x = 7256, y = 8242, z = -3 },
            tag = "DWAPFood",
        },
        { -- E74
            note = "crate @ bunker",
            coords = { x = 7256, y = 8242, z = -3 },
            stack = 2,
            tag = "DWAPFarm",
        },
        { -- E75
            note = "locker @ bunker",
            coords = { x = 7256, y = 8246, z = -3 },
            tag = "DWAPLockers",
        },
        { -- E76
            note = "militarylocker @ bunker",
            coords = { x = 7256, y = 8247, z = -3 },
            tag = "DWAPGun",
        },
        { -- E77
            note = "metal_shelves @ bunker",
            coords = { x = 7258, y = 8250, z = -3 },
            tag = "DWAPBuildMats",
        },
        { -- E78
            note = "metal_shelves @ bunker",
            coords = { x = 7258, y = 8251, z = -3 },
            tag = "DWAPBuildMats",
        },
        { -- E79
            note = "metal_shelves @ bunker",
            coords = { x = 7258, y = 8252, z = -3 },
            tag = "DWAPBuildMats",
        },
        { -- E80
            note = "metal_shelves @ bunker",
            coords = { x = 7258, y = 8253, z = -3 },
            tag = "DWAPTools",
        },
        { -- E81
            note = "metal_shelves @ bunker",
            coords = { x = 7258, y = 8248, z = -3 },
            tag = "DWAPBuildMats",
        },
        { -- E82
            note = "militarylocker @ bunker",
            coords = { x = 7260, y = 8248, z = -3 },
            tag = "DWAPGun",
        },
        { -- E83
            note = "metal_shelves @ bunker",
            coords = { x = 7258, y = 8249, z = -3 },
            tag = "DWAPBuildMats",
        },
        { -- E84
            note = "crate @ bunker",
            coords = { x = 7260, y = 8241, z = -3 },
            tag = "DWAPBuildMats",
        },
        { -- E85
            note = "crate @ bunker",
            coords = { x = 7260, y = 8241, z = -3 },
            stack = 2,
            tag = "DWAPBuildMats",
        },
        { -- E86
            note = "crate @ bunker",
            coords = { x = 7260, y = 8242, z = -3 },
            tag = "DWAPTools",
        },
        { -- E87
            note = "crate @ bunker",
            coords = { x = 7260, y = 8242, z = -3 },
            stack = 2,
            tag = "DWAPBuildMats",
        },
        { -- E88
            note = "dresser @ bunker",
            coords = { x = 7258, y = 8243, z = -3 },
            tag = "DWAPLockers",
        },
        { -- E89
            note = "overhead @ bunker",
            coords = { x = 7258, y = 8244, z = -3 },
            slot = "upper",
            tag = "DWAPFood",
        },
        { -- E90
            note = "counter @ bunker",
            coords = { x = 7258, y = 8244, z = -3 },
            tag = "DWAPFood",
        },
        { -- E91
            note = "overhead @ bunker",
            coords = { x = 7258, y = 8245, z = -3 },
            slot = "upper",
            tag = "DWAPFood",
        },
        { -- E92
            note = "counter @ bunker",
            coords = { x = 7258, y = 8245, z = -3 },
            tag = "DWAPFood",
        },
        { -- E93
            note = "overhead @ bunker",
            coords = { x = 7258, y = 8246, z = -3 },
            slot = "upper",
            tag = "DWAPFood",
        },
        { -- E94
            note = "counter @ bunker",
            coords = { x = 7258, y = 8246, z = -3 },
            tag = "DWAPFood",
        },
        { -- E95
            note = "locker @ bunker",
            coords = { x = 7260, y = 8246, z = -3 },
            tag = "DWAPLockers",
        },
        { -- E96
            note = "fridge @ bunker",
            coords = { x = 7258, y = 8247, z = -3 },
            distIncludeJunk = true,
            tag = "DWAPFridge",
        },
        { -- E97
            note = "freezer @ bunker",
            coords = { x = 7258, y = 8247, z = -3 },
            slot = "freezer",
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        { -- E98
            note = "militarylocker @ bunker",
            coords = { x = 7260, y = 8247, z = -3 },
            tag = "DWAPGun",
        },
        { -- E99
            note = "metal_shelves @ bunker",
            coords = { x = 7262, y = 8250, z = -3 },
            tag = "DWAPTools",
        },
        { -- E100
            note = "metal_shelves @ bunker",
            coords = { x = 7262, y = 8251, z = -3 },
            tag = "DWAPTools",
        },
        { -- E101
            note = "metal_shelves @ bunker",
            coords = { x = 7262, y = 8252, z = -3 },
            tag = "DWAPTools",
        },
        { -- E102
            note = "metal_shelves @ bunker",
            coords = { x = 7262, y = 8253, z = -3 },
            tag = "DWAPBuildMats",
        },
        { -- E103
            note = "metal_shelves @ bunker",
            coords = { x = 7262, y = 8248, z = -3 },
            tag = "DWAPTools",
        },
        { -- E104
            note = "metal_shelves @ bunker",
            coords = { x = 7262, y = 8249, z = -3 },
            tag = "DWAPTools",
        },
        { -- E105
            note = "dresser @ bunker",
            coords = { x = 7262, y = 8243, z = -3 },
            tag = "DWAPLockers",
        },
        { -- E106
            note = "overhead @ bunker",
            coords = { x = 7262, y = 8244, z = -3 },
            slot = "upper",
            tag = "DWAPFood",
        },
        { -- E107
            note = "counter @ bunker",
            coords = { x = 7262, y = 8244, z = -3 },
            tag = "DWAPFood",
        },
        { -- E108
            note = "overhead @ bunker",
            coords = { x = 7262, y = 8245, z = -3 },
            slot = "upper",
            tag = "DWAPFood",
        },
        { -- E109
            note = "counter @ bunker",
            coords = { x = 7262, y = 8245, z = -3 },
            tag = "DWAPFood",
        },
        { -- E110
            note = "overhead @ bunker",
            coords = { x = 7262, y = 8246, z = -3 },
            slot = "upper",
            tag = "DWAPFood",
        },
        { -- E111
            note = "counter @ bunker",
            coords = { x = 7262, y = 8246, z = -3 },
            tag = "DWAPFood",
        },
        { -- E112
            note = "fridge @ bunker",
            coords = { x = 7262, y = 8247, z = -3 },
            distIncludeJunk = true,
            tag = "DWAPFridge",
        },
        { -- E113
            note = "freezer @ bunker",
            coords = { x = 7262, y = 8247, z = -3 },
            slot = "freezer",
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        { -- E114
            note = "militarylocker @ bunker",
            coords = { x = 7264, y = 8248, z = -3 },
            tag = "DWAPGun",
        },
        { -- E115
            note = "crate @ bunker",
            coords = { x = 7264, y = 8241, z = -3 },
            tag = "DWAPTools",
        },
        { -- E116
            note = "crate @ bunker",
            coords = { x = 7264, y = 8241, z = -3 },
            stack = 2,
            tag = "DWAPTools",
        },
        { -- E117
            note = "crate @ bunker",
            coords = { x = 7264, y = 8242, z = -3 },
            tag = "DWAPBuildMats",
        },
        { -- E118
            note = "crate @ bunker",
            coords = { x = 7264, y = 8242, z = -3 },
            stack = 2,
            tag = "DWAPTools",
        },
        { -- E119
            note = "locker @ bunker",
            coords = { x = 7264, y = 8246, z = -3 },
            tag = "DWAPLockers",
        },
        { -- E120
            note = "militarylocker @ bunker",
            coords = { x = 7264, y = 8247, z = -3 },
            tag = "DWAPGun",
        },
        { -- E121
            note = "metal_shelves @ bunker",
            coords = { x = 7266, y = 8250, z = -3 },
            tag = "DWAPMed",
        },
        { -- E122
            note = "metal_shelves @ bunker",
            coords = { x = 7266, y = 8251, z = -3 },
            tag = "DWAPMed",
        },
        { -- E123
            note = "metal_shelves @ bunker",
            coords = { x = 7266, y = 8252, z = -3 },
            tag = "DWAPFarm",
        },
        { -- E124
            note = "metal_shelves @ bunker",
            coords = { x = 7266, y = 8253, z = -3 },
            tag = "DWAPMed",
        },
        { -- E125
            note = "metal_shelves @ bunker",
            coords = { x = 7266, y = 8248, z = -3 },
            tag = "DWAPFarm",
        },
        { -- E126
            note = "militarylocker @ bunker",
            coords = { x = 7268, y = 8248, z = -3 },
            tag = "DWAPGun",
        },
        { -- E127
            note = "metal_shelves @ bunker",
            coords = { x = 7266, y = 8249, z = -3 },
            tag = "DWAPMed",
        },
        { -- E128
            note = "crate @ bunker",
            coords = { x = 7268, y = 8241, z = -3 },
            tag = "DWAPLockers",
        },
        { -- E129
            note = "crate @ bunker",
            coords = { x = 7268, y = 8241, z = -3 },
            stack = 2,
            tag = "DWAPLockers",
        },
        { -- E130
            note = "crate @ bunker",
            coords = { x = 7268, y = 8242, z = -3 },
            tag = "DWAPFarm",
        },
        { -- E131
            note = "crate @ bunker",
            coords = { x = 7268, y = 8242, z = -3 },
            stack = 2,
            tag = "DWAPLockers",
        },
        { -- E132
            note = "dresser @ bunker",
            coords = { x = 7266, y = 8243, z = -3 },
            tag = "DWAPLockers",
        },
        { -- E133
            note = "overhead @ bunker",
            coords = { x = 7266, y = 8244, z = -3 },
            slot = "upper",
            tag = "DWAPFood",
        },
        { -- E134
            note = "counter @ bunker",
            coords = { x = 7266, y = 8244, z = -3 },
            tag = "DWAPFood",
        },
        { -- E135
            note = "overhead @ bunker",
            coords = { x = 7266, y = 8245, z = -3 },
            slot = "upper",
            tag = "DWAPFood",
        },
        { -- E136
            note = "counter @ bunker",
            coords = { x = 7266, y = 8245, z = -3 },
            tag = "DWAPFood",
        },
        { -- E137
            note = "overhead @ bunker",
            coords = { x = 7266, y = 8246, z = -3 },
            slot = "upper",
            tag = "DWAPFood",
        },
        { -- E138
            note = "counter @ bunker",
            coords = { x = 7266, y = 8246, z = -3 },
            tag = "DWAPFood",
        },
        { -- E139
            note = "locker @ bunker",
            coords = { x = 7268, y = 8246, z = -3 },
            tag = "DWAPLockers",
        },
        { -- E140
            note = "fridge @ bunker",
            coords = { x = 7266, y = 8247, z = -3 },
            distIncludeJunk = true,
            tag = "DWAPFridge",
        },
        { -- E141
            note = "freezer @ bunker",
            coords = { x = 7266, y = 8247, z = -3 },
            slot = "freezer",
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        { -- E142
            note = "militarylocker @ bunker",
            coords = { x = 7268, y = 8247, z = -3 },
            tag = "DWAPGun",
        },
    },
}

-- if getActivatedMods():contains("\\Ladders") then
--     table.insert(FallasHotel.objectSpawns, { x = 7678, y = 12206, z = -1, removeWall = "west" })
--     table.insert(FallasHotel.objectSpawns, { x = 7679, y = 12205, z = 0, removeFloor = true, clearExisting = true, })
-- else
-- --     table.insert(FallasHotel.objectSpawns, { sprite = "industry_trucks_01_4", x = 2607, y = 14453, z = -1, replaceWall = true, })
-- end
return FallasHotel
