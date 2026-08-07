-- @TODO (2026-08-07 audit) unresolved - delete lines as they are fixed
--   * 46 skeleton entries carry coords but no loot yet - entries 1-46
local wtc1 = { x = 12538, y = 5213, z = -1, }
local pb1 = { x = 12534, y = 5214, z = -1 }
local ForLease = {
    group = "Valley Station",            -- pretty far west, but this seems closest
    baseBuildings = {
        { x = 12538, y = 5211, z = 0 },  -- building
        { x = 12535, y = 5214, z = -1 }, -- building
    },
    spawn = { x = 12538, y = 5211, z = 0 },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 12536, y = 5213, z = -1 },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 12534, y = 5213, z = -1, },
            fakeGenerators = {
                { x = 12534, y = 5220, z = -1, createTile = true },
            },
        },
    },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc1.x, y = wtc1.y, z = wtc1.z, sourceType = "generator", source = { x = pb1.x - 1, y = pb1.y, z = pb1.z } },
    },
    waterFixtures = {
        { sprite = "fixtures_bathroom_01_1", x = 12534, y = 5217, z = 0, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_13",   x = 12534, y = 5218, z = 0, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
    },
    doorKeys = {
        name = "Kinsella Rd Realtor Key",
        doors = {
            { sprite = "fixtures_doors_02_5", x = 12545, y = 5215, z = 0, },
            { sprite = "fixtures_doors_02_5", x = 12533, y = 5218, z = -1, },
        },
    },
    map = { name = "DWAPStashMap38", },
    objectSpawns = {
        { sprite = "industry_02_175", x = pb1.x,             y = pb1.y,                       z = pb1.z, disabled = "EnableGenSystemSolar", clearExisting = true, },
        -- { sprite = "camping_01_16", x = 12529, y = 5213, z = 0, enabled = "EnableWaterSystem", }, -- well

        { barricade = "wood",         enabled = "Barricade", target = "walls_commercial_01_40", x = 12546, y = 5219,                        z = 0, },
        { barricade = "wood",         enabled = "Barricade", target = "walls_commercial_01_40", x = 12546, y = 5218,                        z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_commercial_01_40", x = 12546, y = 5217,                        z = 0, },
        { barricade = "wood",         enabled = "Barricade", target = "fixtures_doors_01_48", x = 12546, y = 5215,                          z = 0, },
        { barricade = "wood",         enabled = "Barricade", target = "fixtures_doors_01_48", x = 12546, y = 5214,                          z = 0, },
        { barricade = "wood",         enabled = "Barricade", target = "walls_commercial_01_40", x = 12546, y = 5212,                        z = 0, },
        { barricade = "wood",         enabled = "Barricade", target = "walls_commercial_01_40", x = 12546, y = 5211,                        z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_commercial_01_40", x = 12546, y = 5210,                        z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "fixtures_doors_01_49", x = 12544, y = 5209,                          z = 0, },

    },
    loot = {
        -- E1
        { type = 'container', coords = {x=12537,y=5210,z=0}, }, -- cardboardbox @ empty
        -- E2
        { type = 'container', coords = {x=12540,y=5210,z=0}, }, -- counter @ empty
        -- E3
        { type = 'container', coords = {x=12541,y=5210,z=0}, }, -- counter @ empty
        -- E4
        { type = 'container', coords = {x=12542,y=5210,z=0}, }, -- counter @ empty
        -- E5
        { type = 'container', coords = {x=12539,y=5215,z=0}, }, -- cardboardbox @ empty
        -- E6
        { type = 'container', coords = {x=12539,y=5216,z=0}, }, -- cardboardbox @ empty
        -- E7
        { type = 'container', coords = {x=12536,y=5211,z=0}, }, -- crate @ grocerystorage
        -- E8
        { type = 'container', coords = {x=12538,y=5217,z=-1}, }, -- fridge @ bunker
        -- E9
        { type = 'container', coords = {x=12538,y=5217,z=-1}, slot = "freezer", }, -- freezer @ bunker
        -- E10
        { type = 'container', coords = {x=12539,y=5217,z=-1}, }, -- counter @ bunker
        -- E11
        { type = 'container', coords = {x=12539,y=5217,z=-1}, slot = "upper", }, -- overhead @ bunker
        -- E12
        { type = 'container', coords = {x=12540,y=5217,z=-1}, }, -- woodstove @ bunker
        -- E13
        { type = 'container', coords = {x=12541,y=5217,z=-1}, }, -- counter @ bunker
        -- E14
        { type = 'container', coords = {x=12541,y=5217,z=-1}, slot = "upper", }, -- overhead @ bunker
        -- E15
        { type = 'container', coords = {x=12537,y=5218,z=-1}, slot = "upper", }, -- medicine @ bunker
        -- E16
        { type = 'container', coords = {x=12536,y=5219,z=-1}, slot = "upper", }, -- shelves @ bunker
        -- E17
        { type = 'container', coords = {x=12539,y=5219,z=-1}, }, -- crate @ bunker
        -- E18
        { type = 'container', coords = {x=12540,y=5219,z=-1}, }, -- crate @ bunker
        -- E19
        { type = 'container', coords = {x=12535,y=5218,z=-1}, }, -- counter @ bunker
        -- E20
        { type = 'container', coords = {x=12535,y=5218,z=-1}, slot = "upper", }, -- medicine @ bunker
        -- E21
        { type = 'container', coords = {x=12539,y=5212,z=-1}, }, -- crate @ farmstorage
        -- E22
        { type = 'container', coords = {x=12539,y=5212,z=-1}, stack = 2, }, -- crate @ farmstorage
        -- E23
        { type = 'container', coords = {x=12540,y=5212,z=-1}, }, -- crate @ farmstorage
        -- E24
        { type = 'container', coords = {x=12541,y=5214,z=-1}, }, -- shelves @ farmstorage
        -- E25
        { type = 'container', coords = {x=12542,y=5214,z=-1}, }, -- shelves @ farmstorage
        -- E26
        { type = 'container', coords = {x=12543,y=5214,z=-1}, }, -- shelves @ farmstorage
        -- E27
        { type = 'container', coords = {x=12536,y=5216,z=-1}, }, -- crate @ farmstorage
        -- E28
        { type = 'container', coords = {x=12536,y=5216,z=-1}, stack = 2, }, -- crate @ farmstorage
        -- E29
        { type = 'container', coords = {x=12537,y=5216,z=-1}, }, -- metal_shelves @ farmstorage
        -- E30
        { type = 'container', coords = {x=12538,y=5216,z=-1}, }, -- metal_shelves @ farmstorage
        -- E31
        { type = 'container', coords = {x=12539,y=5216,z=-1}, }, -- metal_shelves @ farmstorage
        -- E32
        { type = 'container', coords = {x=12540,y=5216,z=-1}, }, -- metal_shelves @ farmstorage
        -- E33
        { type = 'container', coords = {x=12541,y=5216,z=-1}, }, -- metal_shelves @ farmstorage
        -- E34
        { type = 'container', coords = {x=12542,y=5216,z=-1}, }, -- metal_shelves @ farmstorage
        -- E35
        { type = 'container', coords = {x=12543,y=5216,z=-1}, }, -- metal_shelves @ farmstorage
        -- E36
        { type = 'container', coords = {x=12544,y=5212,z=-1}, }, -- crate @ farmstorage
        -- E37
        { type = 'container', coords = {x=12544,y=5214,z=-1}, }, -- shelves @ farmstorage
        -- E38
        { type = 'container', coords = {x=12535,y=5216,z=-1}, }, -- crate @ farmstorage
        -- E39
        { type = 'container', coords = {x=12535,y=5216,z=-1}, stack = 2, }, -- crate @ farmstorage
        -- E40
        { type = 'container', coords = {x=12534,y=5218,z=-1}, }, -- militarycrate @ farmstorage
        -- E41
        { type = 'container', coords = {x=12534,y=5218,z=-1}, stack = 2, }, -- militarycrate @ farmstorage
        -- E42
        { type = 'container', coords = {x=12544,y=5216,z=-1}, }, -- metal_shelves @ farmstorage
        -- E43
        { type = 'container', coords = {x=12541,y=5212,z=-1}, }, -- militarycrate @ gunstore
        -- E44
        { type = 'container', coords = {x=12541,y=5212,z=-1}, stack = 2, }, -- militarycrate @ gunstore
        -- E45
        { type = 'container', coords = {x=12542,y=5212,z=-1}, }, -- militarylocker @ gunstore
        -- E46
        { type = 'container', coords = {x=12543,y=5212,z=-1}, }, -- militarylocker @ gunstore
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(ForLease.objectSpawns,
        { enabled = "EnableLadders", sprite = "fencing_01_27", x = 1628, y = 5760, z = 0, removeFloor = true, clearExisting = true, })
end

return ForLease
