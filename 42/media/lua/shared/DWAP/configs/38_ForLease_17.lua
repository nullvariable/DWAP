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
            solar = {
                powerbank = { sprite = "dwap_tiles_01_0", x = pb1.x, y = pb1.y, z = pb1.z },
                panels = {
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_8",
                        x = 12534,
                        y = 5212,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_8",
                        x = 12534,
                        y = 5213,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_8",
                        x = 12534,
                        y = 5214,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_8",
                        x = 12534,
                        y = 5215,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_8",
                        x = 12535,
                        y = 5212,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_8",
                        x = 12535,
                        y = 5213,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_8",
                        x = 12535,
                        y = 5214,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_8",
                        x = 12535,
                        y = 5215,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_8",
                        x = 12535,
                        y = 5216,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_8",
                        x = 12535,
                        y = 5217,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                },
            },
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
        { type = 'container', coords = { x = 12537, y = 5210, z = 0 }, }, -- cardboardbox @ empty
        { type = 'container', coords = { x = 12540, y = 5210, z = 0 }, }, -- counter @ empty
        { type = 'container', coords = { x = 12541, y = 5210, z = 0 }, }, -- counter @ empty
        { type = 'container', coords = { x = 12542, y = 5210, z = 0 }, }, -- counter @ empty
        { type = 'container', coords = { x = 12539, y = 5215, z = 0 }, }, -- cardboardbox @ empty
        { type = 'container', coords = { x = 12539, y = 5216, z = 0 }, }, -- cardboardbox @ empty
        { type = 'container', coords = { x = 12536, y = 5211, z = 0 }, }, -- crate @ grocerystorage
        { type = 'container', coords = { x = 12538, y = 5217, z = -1 }, }, -- fridge @ bunker
        { type = 'container', coords = { x = 12538, y = 5217, z = -1 }, }, -- freezer @ bunker
        { type = 'container', coords = { x = 12539, y = 5217, z = -1 }, }, -- counter @ bunker
        { type = 'container', coords = { x = 12539, y = 5217, z = -1 }, slot = "upper", }, -- overhead @ bunker
        { type = 'container', coords = { x = 12540, y = 5217, z = -1 }, }, -- woodstove @ bunker
        { type = 'container', coords = { x = 12541, y = 5217, z = -1 }, }, -- counter @ bunker
        { type = 'container', coords = { x = 12541, y = 5217, z = -1 }, slot = "upper", }, -- overhead @ bunker
        { type = 'container', coords = { x = 12537, y = 5218, z = -1 }, }, -- medicine @ bunker
        { type = 'container', coords = { x = 12536, y = 5219, z = -1 }, }, -- shelves @ bunker
        { type = 'container', coords = { x = 12539, y = 5219, z = -1 }, }, -- crate @ bunker
        { type = 'container', coords = { x = 12535, y = 5218, z = -1 }, }, -- counter @ bunker
        { type = 'container', coords = { x = 12535, y = 5218, z = -1 }, }, -- medicine @ bunker
        { type = 'container', coords = { x = 12543, y = 5212, z = -1 }, }, -- militarylocker @ gunstore
        { type = 'container', coords = { x = 12539, y = 5212, z = -1 }, }, -- crate @ farmstorage
        { type = 'container', coords = { x = 12539, y = 5212, z = -1 }, }, -- crate @ farmstorage
        { type = 'container', coords = { x = 12540, y = 5212, z = -1 }, }, -- crate @ farmstorage
        { type = 'container', coords = { x = 12542, y = 5214, z = -1 }, }, -- shelves @ farmstorage
        { type = 'container', coords = { x = 12543, y = 5214, z = -1 }, }, -- shelves @ farmstorage
        { type = 'container', coords = { x = 12536, y = 5216, z = -1 }, }, -- crate @ farmstorage
        { type = 'container', coords = { x = 12536, y = 5216, z = -1 }, }, -- crate @ farmstorage
        { type = 'container', coords = { x = 12537, y = 5216, z = -1 }, }, -- metal_shelves @ farmstorage
        { type = 'container', coords = { x = 12538, y = 5216, z = -1 }, }, -- metal_shelves @ farmstorage
        { type = 'container', coords = { x = 12539, y = 5216, z = -1 }, }, -- metal_shelves @ farmstorage
        { type = 'container', coords = { x = 12540, y = 5216, z = -1 }, }, -- metal_shelves @ farmstorage
        { type = 'container', coords = { x = 12542, y = 5216, z = -1 }, }, -- metal_shelves @ farmstorage
        { type = 'container', coords = { x = 12543, y = 5216, z = -1 }, }, -- metal_shelves @ farmstorage
        { type = 'container', coords = { x = 12544, y = 5212, z = -1 }, }, -- crate @ farmstorage
        { type = 'container', coords = { x = 12544, y = 5214, z = -1 }, }, -- shelves @ farmstorage
        { type = 'container', coords = { x = 12535, y = 5216, z = -1 }, }, -- crate @ farmstorage
        { type = 'container', coords = { x = 12535, y = 5216, z = -1 }, }, -- crate @ farmstorage
        { type = 'container', coords = { x = 12534, y = 5218, z = -1 }, }, -- militarycrate @ farmstorage
        { type = 'container', coords = { x = 12534, y = 5218, z = -1 }, }, -- militarycrate @ farmstorage
        { type = 'container', coords = { x = 12544, y = 5216, z = -1 }, }, -- metal_shelves @ farmstorage
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(ForLease.objectSpawns,
        { enabled = "EnableLadders", sprite = "fencing_01_27", x = 1628, y = 5760, z = 0, removeFloor = true, clearExisting = true, })
end

return ForLease
