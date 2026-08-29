local generatorStartCoords = { x = 13636, y = 1262, z = -4, }
local wtc = { x = generatorStartCoords.x + 8, y = generatorStartCoords.y + 4, z = -4, }
local origin = generatorStartCoords -- generator-controls square
local BigBunkerShell = require("DWAP/configs/presets/BigBunkerShell")
local loot = BigBunkerShell(origin)

local GrandOhioConfig = {
    group = "Louisville",
    baseBuildings = {
        { x = 13649, y = 1272, z = -4 }, -- fallout shelter
    },
    spawn = { x = 13649, y = 1272, z = -4, },
    doorKeys = {
        name = "Fallout Shelter",
        doors = {
            { sprite = "fixtures_doors_01_56", x = 13614,                    y = 1269,                     z = 0, }, -- storage room door
            { sprite = "fixtures_doors_01_54", x = generatorStartCoords.x + 3, y = generatorStartCoords.y + 9, z = -4, },
        },
    },
    map = { name = "DWAPStashMap10", },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = generatorStartCoords.x, y = generatorStartCoords.y, z = -4, },
            fuelTank = { sprite = "dwap_tiles_01_24", x = generatorStartCoords.x - 2, y = generatorStartCoords.y, z = -4, },
            fakeGenerators = {
                { x = generatorStartCoords.x - 22, y = generatorStartCoords.y + 12, z = -4, createTile = false },
                { x = generatorStartCoords.x - 5, y = generatorStartCoords.y + 12, z = -4, createTile = false },
                { x = generatorStartCoords.x + 1, y = generatorStartCoords.y + 36, z = -4, createTile = false },
                { x = generatorStartCoords.x + 30, y = generatorStartCoords.y + 22, z = -4, createTile = false },
                { x = generatorStartCoords.x + 15, y = generatorStartCoords.y - 12, z = -4, createTile = false },
                -- { x = generatorStartCoords.x-18, y = generatorStartCoords.y+11, z = -1, createTile = true }, -- this ends up powering a huge amount of the mall which is probably not what we want
            },
        }
    },
    waterTanks = {
        { sprite = "industry_02_72", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = { x = generatorStartCoords.x, y = generatorStartCoords.y, z = -4 } },
    },
    waterFixtures = {
        -- wash room sinks
        { sprite = "fixtures_sinks_01_6",     x = generatorStartCoords.x + 9, y = generatorStartCoords.y - 12, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_6",     x = generatorStartCoords.x + 9, y = generatorStartCoords.y - 13, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_6",     x = generatorStartCoords.x + 9, y = generatorStartCoords.y - 14, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_6",     x = generatorStartCoords.x + 9, y = generatorStartCoords.y - 15, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- wash room toilets
        { sprite = "fixtures_bathroom_01_5",  x = generatorStartCoords.x + 5, y = generatorStartCoords.y - 11, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_5",  x = generatorStartCoords.x + 5, y = generatorStartCoords.y - 12, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_5",  x = generatorStartCoords.x + 5, y = generatorStartCoords.y - 13, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_5",  x = generatorStartCoords.x + 5, y = generatorStartCoords.y - 14, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_5",  x = generatorStartCoords.x + 5, y = generatorStartCoords.y - 15, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- washroom showers
        { sprite = "fixtures_bathroom_01_31", x = generatorStartCoords.x + 1, y = generatorStartCoords.y - 11, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_31", x = generatorStartCoords.x + 1, y = generatorStartCoords.y - 9, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_31", x = generatorStartCoords.x + 1, y = generatorStartCoords.y - 7, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_23", x = generatorStartCoords.x + 4, y = generatorStartCoords.y - 11, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_23", x = generatorStartCoords.x + 4, y = generatorStartCoords.y - 9, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_23", x = generatorStartCoords.x + 4, y = generatorStartCoords.y - 7, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- laundry room washers
        { sprite = "appliances_laundry_01_6", x = generatorStartCoords.x + 13, y = generatorStartCoords.y - 9, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "appliances_laundry_01_6", x = generatorStartCoords.x + 14, y = generatorStartCoords.y - 9, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- kitchen sink
        { sprite = "fixtures_sinks_01_17",    x = generatorStartCoords.x + 20, y = generatorStartCoords.y - 6, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- utility sink
        { sprite = "fixtures_sinks_01_34",    x = generatorStartCoords.x + 23, y = generatorStartCoords.y + 23, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- gym fountain
        { sprite = "fixtures_sinks_01_24",    x = generatorStartCoords.x + 15, y = generatorStartCoords.y + 20, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- laundry room washers
        { sprite = "appliances_laundry_01_4", x = generatorStartCoords.x + 13, y = generatorStartCoords.y + 27, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "appliances_laundry_01_4", x = generatorStartCoords.x + 14, y = generatorStartCoords.y + 27, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- wash room sinks
        { sprite = "fixtures_sinks_01_6",     x = generatorStartCoords.x + 9, y = generatorStartCoords.y + 27, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_6",     x = generatorStartCoords.x + 9, y = generatorStartCoords.y + 28, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_6",     x = generatorStartCoords.x + 9, y = generatorStartCoords.y + 29, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_6",     x = generatorStartCoords.x + 9, y = generatorStartCoords.y + 30, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- wash room toilets
        { sprite = "fixtures_bathroom_01_5",  x = generatorStartCoords.x + 5, y = generatorStartCoords.y + 27, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_5",  x = generatorStartCoords.x + 5, y = generatorStartCoords.y + 26, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- washroom showers
        { sprite = "fixtures_bathroom_01_31", x = generatorStartCoords.x + 1, y = generatorStartCoords.y + 31, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_31", x = generatorStartCoords.x + 1, y = generatorStartCoords.y - 29, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_31", x = generatorStartCoords.x + 1, y = generatorStartCoords.y - 27, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_23", x = generatorStartCoords.x + 4, y = generatorStartCoords.y + 31, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_23", x = generatorStartCoords.x + 4, y = generatorStartCoords.y - 29, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_23", x = generatorStartCoords.x + 4, y = generatorStartCoords.y - 27, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

        -- decon showers
        { sprite = "fixtures_bathroom_01_22", x = generatorStartCoords.x - 3, y = generatorStartCoords.y + 12, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_22", x = generatorStartCoords.x - 2, y = generatorStartCoords.y + 12, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_22", x = generatorStartCoords.x - 1, y = generatorStartCoords.y + 12, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_22", x = generatorStartCoords.x,    y = generatorStartCoords.y + 12, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_22", x = generatorStartCoords.x + 1, y = generatorStartCoords.y + 12, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_22", x = generatorStartCoords.x + 2, y = generatorStartCoords.y + 12, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_30", x = generatorStartCoords.x - 1, y = generatorStartCoords.y + 10, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_30", x = generatorStartCoords.x,    y = generatorStartCoords.y + 10, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_22", x = generatorStartCoords.x - 1, y = generatorStartCoords.y + 8, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_22", x = generatorStartCoords.x,    y = generatorStartCoords.y + 8, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_30", x = generatorStartCoords.x - 3, y = generatorStartCoords.y + 6, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_30", x = generatorStartCoords.x - 2, y = generatorStartCoords.y + 6, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_30", x = generatorStartCoords.x - 1, y = generatorStartCoords.y + 6, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_30", x = generatorStartCoords.x,    y = generatorStartCoords.y + 6, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_30", x = generatorStartCoords.x + 1, y = generatorStartCoords.y + 6, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_30", x = generatorStartCoords.x + 2, y = generatorStartCoords.y + 6, z = -4, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
    },
    objectSpawns = {
        { sprite = "industry_02_52", x = 13639, y = 1261, z = -4,               clearExisting = false, enabled = "EnableWaterSystem", },

        { x = 13610,                 y = 1269,  z = 0,    clearExisting = true, },
        { x = 13610,                 y = 1270,  z = 0,    clearExisting = true, },
        { x = 13610,                 y = 1271,  z = 0,    clearExisting = true, },
        { x = 13610,                 y = 1272,  z = 0,    clearExisting = true, },

        -- { sprite = "constructedobjects_01_45", x = 12994, y = 1908, z = 2, clearExisting = false, isContainer = true, },
        -- { sprite = "appliances_cooking_01_16", x = 12989, y = 1915, z = 2, },
    },
    loot = loot,
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(GrandOhioConfig.objectSpawns,
        { enabled = "EnableLadders", sprite = "walls_garage_01_46", x = 13610, y = 1269, z = -4, removeWall = "west" })
    table.insert(GrandOhioConfig.objectSpawns,
        { enabled = "EnableLadders", sprite = "fixtures_doors_01_64", x = 13610, y = 1269, z = -4, isDoor = true, doorN = false, })
    table.insert(GrandOhioConfig.objectSpawns,
        { enabled = "EnableLadders", sprite = "floors_exterior_street_01_16", x = 13609, y = 1269, z = -4, isFloor = true, })
    table.insert(GrandOhioConfig.objectSpawns,
        { enabled = "EnableLadders", sprite = "walls_garage_01_33", x = 13609, y = 1269, z = -4, })
    table.insert(GrandOhioConfig.objectSpawns,
        { enabled = "EnableLadders", sprite = "overlay_grime_wall_01_1", x = 13609, y = 1269, z = -4, })
    table.insert(GrandOhioConfig.objectSpawns,
        { enabled = "EnableLadders", sprite = "walls_garage_01_33", x = 13609, y = 1270, z = -4, })
    table.insert(GrandOhioConfig.objectSpawns,
        { enabled = "EnableLadders", sprite = "floors_exterior_street_01_16", x = 13546, y = 1278, z = -4, isFloor = true, })
    table.insert(GrandOhioConfig.objectSpawns,
        { enabled = "EnableLadders", sprite = "walls_garage_01_33", x = 13546, y = 1278, z = -4, })
    table.insert(GrandOhioConfig.objectSpawns,
        { enabled = "EnableLadders", sprite = "overlay_grime_wall_01_1", x = 13546, y = 1278, z = -4, })
    table.insert(GrandOhioConfig.objectSpawns,
        { enabled = "EnableLadders", sprite = "walls_garage_01_33", x = 13546, y = 1279, z = -4, })
    table.insert(GrandOhioConfig.objectSpawns,
        { enabled = "EnableLadders", x = 13482, y = 1300, z = 0, removeFloor = true, })
    -- this ladder was fighting with me and wouldn't let me go down it while working fine going up, so I changed it to north facing
    -- table.insert(GrandOhioConfig.objectSpawns, { x = 13545, y = 1278, z = -1, removeFloor = true, })
    -- table.insert(GrandOhioConfig.objectSpawns, { sprite = "walls_interior_house_04_16", x = 12940, y = 1933, z = 0, })
    -- table.insert(GrandOhioConfig.generators[1].chunks, { 1622, 241 })
    -- table.insert(GrandOhioConfig.generators[1].chunks, { 1621, 241 })
    -- table.insert(GrandOhioConfig.generators[1].chunks, { 1620, 241 })
    -- table.insert(GrandOhioConfig.generators[1].chunks, { 1619, 241 })
end
return GrandOhioConfig
