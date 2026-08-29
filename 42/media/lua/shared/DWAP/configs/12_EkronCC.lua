local genCoords = { x = 751, y = 9812, z = -5, }
local wtc = { x = genCoords.x + 8, y = genCoords.y + 4, z = genCoords.z, }
local origin = genCoords -- generator-controls square
local BigBunkerShell = require("DWAP/configs/presets/BigBunkerShell")
local loot = BigBunkerShell(origin)

local EkronCC = {
    group = "Ekron",
    baseBuildings = {
        { x = 764, y = 9821, z = -5 }, -- community college
    },
    baseRooms = {
        { x = 760, y = 9816, z = -5 }, -- empty
        { x = 760, y = 9808, z = -5 }, -- oldarmy
        { x = 760, y = 9800, z = -5 }, -- empty
        { x = 752, y = 9800, z = -5 }, -- empty
        { x = 761, y = 9816, z = -5 }, -- empty
        { x = 763, y = 9801, z = -5 }, -- empty
        { x = 763, y = 9816, z = -5 }, -- oldarmy
        { x = 777, y = 9810, z = -5 }, -- empty
        { x = 777, y = 9816, z = -5 }, -- empty
        { x = 769, y = 9817, z = -5 }, -- oldmedical
        { x = 772, y = 9822, z = -5 }, -- oldmedical
        { x = 769, y = 9824, z = -5 }, -- oldarmy
        { x = 777, y = 9829, z = -5 }, -- empty
        { x = 770, y = 9829, z = -5 }, -- empty
        { x = 770, y = 9833, z = -5 }, -- empty
        { x = 763, y = 9832, z = -5 }, -- empty
        { x = 763, y = 9827, z = -5 }, -- empty
        { x = 763, y = 9817, z = -5 }, -- empty
        { x = 760, y = 9823, z = -5 }, -- oldarmy
        { x = 752, y = 9825, z = -5 }, -- oldmedical
        { x = 760, y = 9832, z = -5 }, -- oldarmy
        { x = 760, y = 9839, z = -5 }, -- empty
        { x = 752, y = 9839, z = -5 }, -- empty
        { x = 752, y = 9818, z = -5 }, -- empty
        { x = 744, y = 9820, z = -5 }, -- empty
        { x = 725, y = 9819, z = -5 }, -- empty
        { x = 725, y = 9819, z = -4 }, -- empty
        { x = 725, y = 9819, z = -3 }, -- empty
        { x = 725, y = 9819, z = -2 }, -- empty
        { x = 728, y = 9816, z = -1 }, -- storage
    },
    spawn = { x = 764, y = 9821, z = -5, },
    doorKeys = {
        name = "Ekron Community College",
        doors = {
            { sprite = "fixtures_doors_01_56", x = 733, y = 9818, z = -1, }, -- storage room door
            { sprite = "fixtures_doors_02_41", x = 747, y = 9816, z = 0, },
        },
    },
    map = { name = "DWAPStashMap12", },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = genCoords.x, y = genCoords.y, z = genCoords.z, },
            fuelTank = { sprite = "dwap_tiles_01_24", x = genCoords.x - 2, y = genCoords.y, z = genCoords.z, },
            fakeGenerators = {
                { x = genCoords.x - 22, y = genCoords.y + 12, z = -5, createTile = false },
                { x = genCoords.x - 5,  y = genCoords.y + 12, z = -5, createTile = false },
                { x = genCoords.x + 1,  y = genCoords.y + 36, z = -5, createTile = false },
                { x = genCoords.x + 30, y = genCoords.y + 22, z = -5, createTile = false },
                { x = genCoords.x + 15, y = genCoords.y - 12, z = -5, createTile = false },
            },
        }
    },
    waterTanks = {
        { sprite = "industry_02_72", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = { x = genCoords.x, y = genCoords.y, z = genCoords.z } },
    },
    waterFixtures = {
        -- wash room sinks
        { sprite = "fixtures_sinks_01_6",     x = genCoords.x + 9,  y = genCoords.y - 12, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_6",     x = genCoords.x + 9,  y = genCoords.y - 13, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_6",     x = genCoords.x + 9,  y = genCoords.y - 14, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_6",     x = genCoords.x + 9,  y = genCoords.y - 15, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- wash room toilets
        { sprite = "fixtures_bathroom_01_5",  x = genCoords.x + 5,  y = genCoords.y - 11, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_5",  x = genCoords.x + 5,  y = genCoords.y - 12, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_5",  x = genCoords.x + 5,  y = genCoords.y - 13, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_5",  x = genCoords.x + 5,  y = genCoords.y - 14, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_5",  x = genCoords.x + 5,  y = genCoords.y - 15, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- washroom showers
        { sprite = "fixtures_bathroom_01_31", x = genCoords.x + 1,  y = genCoords.y - 11, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_31", x = genCoords.x + 1,  y = genCoords.y - 9,  z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_31", x = genCoords.x + 1,  y = genCoords.y - 7,  z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_23", x = genCoords.x + 4,  y = genCoords.y - 11, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_23", x = genCoords.x + 4,  y = genCoords.y - 9,  z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_23", x = genCoords.x + 4,  y = genCoords.y - 7,  z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- laundry room washers
        { sprite = "appliances_laundry_01_6", x = genCoords.x + 13, y = genCoords.y - 9,  z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "appliances_laundry_01_6", x = genCoords.x + 14, y = genCoords.y - 9,  z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- kitchen sink
        { sprite = "fixtures_sinks_01_17",    x = genCoords.x + 20, y = genCoords.y - 6,  z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- utility sink
        { sprite = "fixtures_sinks_01_34",    x = genCoords.x + 23, y = genCoords.y + 23, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- gym fountain
        { sprite = "fixtures_sinks_01_24",    x = genCoords.x + 15, y = genCoords.y + 20, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- laundry room washers
        { sprite = "appliances_laundry_01_4", x = genCoords.x + 13, y = genCoords.y + 27, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "appliances_laundry_01_4", x = genCoords.x + 14, y = genCoords.y + 27, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- wash room sinks
        { sprite = "fixtures_sinks_01_6",     x = genCoords.x + 9,  y = genCoords.y + 27, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_6",     x = genCoords.x + 9,  y = genCoords.y + 28, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_6",     x = genCoords.x + 9,  y = genCoords.y + 29, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_6",     x = genCoords.x + 9,  y = genCoords.y + 30, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- wash room toilets
        { sprite = "fixtures_bathroom_01_5",  x = genCoords.x + 5,  y = genCoords.y + 27, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_5",  x = genCoords.x + 5,  y = genCoords.y + 26, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- washroom showers
        { sprite = "fixtures_bathroom_01_31", x = genCoords.x + 1,  y = genCoords.y + 31, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_31", x = genCoords.x + 1,  y = genCoords.y - 29, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_31", x = genCoords.x + 1,  y = genCoords.y - 27, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_23", x = genCoords.x + 4,  y = genCoords.y + 31, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_23", x = genCoords.x + 4,  y = genCoords.y - 29, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_23", x = genCoords.x + 4,  y = genCoords.y - 27, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

        -- decon showers
        { sprite = "fixtures_bathroom_01_22", x = genCoords.x - 3,  y = genCoords.y + 12, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_22", x = genCoords.x - 2,  y = genCoords.y + 12, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_22", x = genCoords.x - 1,  y = genCoords.y + 12, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_22", x = genCoords.x,      y = genCoords.y + 12, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_22", x = genCoords.x + 1,  y = genCoords.y + 12, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_22", x = genCoords.x + 2,  y = genCoords.y + 12, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_30", x = genCoords.x - 1,  y = genCoords.y + 10, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_30", x = genCoords.x,      y = genCoords.y + 10, z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_22", x = genCoords.x - 1,  y = genCoords.y + 8,  z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_22", x = genCoords.x,      y = genCoords.y + 8,  z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_30", x = genCoords.x - 3,  y = genCoords.y + 6,  z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_30", x = genCoords.x - 2,  y = genCoords.y + 6,  z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_30", x = genCoords.x - 1,  y = genCoords.y + 6,  z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_30", x = genCoords.x,      y = genCoords.y + 6,  z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_30", x = genCoords.x + 1,  y = genCoords.y + 6,  z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_30", x = genCoords.x + 2,  y = genCoords.y + 6,  z = genCoords.z, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
    },
    objectSpawns = {
        { sprite = "industry_02_52", x = 754, y = 9811, z = -5, clearExisting = false, enabled = "EnableWaterSystem", },

        -- { sprite = "fixtures_railings_01_36", x = 726, y = 9820, z = -1, clearExisting = false, },
        -- { sprite = "fixtures_railings_01_36", x = 726, y = 9821, z = -1, clearExisting = false, },
        -- { sprite = "fixtures_railings_01_36", x = 726, y = 9822, z = -1, clearExisting = false, },
        -- { x = 725, y = 9819, z = -1, clearExisting = true, },
        -- { x = 725, y = 9820, z = -1, clearExisting = true, },
        -- { x = 725, y = 9821, z = -1, clearExisting = true, },
        -- { x = 725, y = 9822, z = -1, clearExisting = true, },

        -- { sprite = "constructedobjects_01_45", x = 12994, y = 1908, z = 2, clearExisting = false, isContainer = true, },
        -- { sprite = "appliances_cooking_01_16", x = 12989, y = 1915, z = 2, },
    },
    loot = loot,
}
if getActivatedMods():contains("\\Ladders") then
    -- table.insert(EkronCC.objectSpawns, { sprite = "walls_garage_01_46", x = 13610, y = 1269, z = -4, removeWall = "west" })
    -- table.insert(EkronCC.objectSpawns, { sprite = "walls_garage_01_47", x = 754, y = 9796, z = -5, removeWall = "north", clearExisting = true, })
    -- table.insert(EkronCC.objectSpawns, { sprite = "fixtures_doors_01_53", x = 754, y = 9796, z = -5, isDoor = true, doorN = true, })
    -- table.insert(EkronCC.objectSpawns, { sprite = "floors_exterior_natural_01_10", x = 754, y = 9795, z = -5, isFloor = true, })
    -- table.insert(EkronCC.objectSpawns, { sprite = "walls_garage_01_32", x = 754, y = 9795, z = -5, })
    -- table.insert(EkronCC.objectSpawns, { sprite = "walls_garage_01_32", x = 755, y = 9795, z = -5, })

    table.insert(EkronCC.objectSpawns,
        { enabled = "EnableLadders", sprite = "walls_garage_02_16", x = 755, y = 9780, z = 0, })
    table.insert(EkronCC.objectSpawns, { enabled = "EnableLadders", x = 754, y = 9780, z = 0, removeFloor = true, })
end
return EkronCC
