-- @TODO (2026-08-07 audit) unresolved - delete lines as they are fixed
--   * stash has no buildingX/buildingY (DWAPStashDesc.lua "March Ridge Bunker
--     Map") - the map item will not highlight a building
local wtc = { x = 9955, y = 12620, z = -4, }
local origin = { x = 9947, y = 12616, z = -4 } -- generator-controls square
local BigBunkerShell = require("DWAP/configs/presets/BigBunkerShell")
local loot = BigBunkerShell(origin)

local MarchRidgeConfig = {
    group = "March Ridge",
    baseBuildings = {
        { x = 9960, y = 12624, z = -4 }, -- bunker
    },
    spawn = { x = 9960, y = 12624, z = -4, },
    doorKeys = {
        name = "Bunker",
        doors = {
            { x = 9925, y = 12625, z = 0, },
            { x = 9950, y = 12625, z = -4, },
            { sprite = "walls_garage_02_0", x = 9924, y = 12626, z = -4, },
            { sprite = "walls_garage_02_0", x = 9934, y = 12626, z = -4, },
            { sprite = "walls_garage_02_0", x = 9944, y = 12626, z = -4, },
        },
    },
    map = { name = "DWAPStashMap4", },
    objectSpawns = {
        { clearExisting = true, x = 9931, y = 12616, z = 0, disabled = "EnableWaterSystem", }, -- fountain
    },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 9947, y = 12616, z = -4, },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 9945, y = 12616, z = -4, },
            fakeGenerators = {
                { x = 9920, y = 12625, z = -4, createTile = false },
                { x = 9943, y = 12628, z = -4, createTile = false },
                { x = 9948, y = 12652, z = -4, createTile = false },
                { x = 9974, y = 12638, z = -4, createTile = false },
                { x = 9963, y = 12606, z = -4, createTile = false },
                { x = 9929, y = 12627, z = -1, createTile = false },
            },
        }
    },
    waterTanks = {
        { sprite = "industry_02_72", x = wtc.x, y = wtc.y, z = wtc.z, sourceType="generator", source = {x = 9947, y = 12616, z = -4} },
    },
    waterFixtures = {
        -- wash room sinks
        { sprite = "fixtures_sinks_01_6", x = 9956, y = 12604, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_6", x = 9956, y = 12605, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_6", x = 9956, y = 12606, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_6", x = 9956, y = 12607, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- wash room toilets
        { sprite = "fixtures_bathroom_01_5", x = 9952, y = 12603, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_5", x = 9952, y = 12604, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_5", x = 9952, y = 12605, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_5", x = 9952, y = 12606, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_5", x = 9952, y = 12607, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- washroom showers
        { sprite = "fixtures_bathroom_01_31", x = 9948, y = 12607, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_31", x = 9948, y = 12605, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_31", x = 9948, y = 12603, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_23", x = 9951, y = 12607, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_23", x = 9951, y = 12605, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_23", x = 9951, y = 12603, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },

        -- laundry room washers
        { sprite = "appliances_laundry_01_6", x = 9960, y = 12607, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "appliances_laundry_01_6", x = 9961, y = 12607, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- kitchen sink
        { sprite = "fixtures_sinks_01_17", x = 9967, y = 12610, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- utility sink
        { sprite = "fixtures_sinks_01_34", x = 9970, y = 12639, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- gym fountain
        { sprite = "fixtures_sinks_01_24", x = 9962, y = 12636, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- laundry room washers
        { sprite = "appliances_laundry_01_4", x = 9960, y = 12643, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "appliances_laundry_01_4", x = 9961, y = 12643, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- wash room sinks
        { sprite = "fixtures_sinks_01_6", x = 9956, y = 12646, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_6", x = 9956, y = 12645, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_6", x = 9956, y = 12644, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_6", x = 9956, y = 12643, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- wash room toilets
        { sprite = "fixtures_bathroom_01_5", x = 9952, y = 12643, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_5", x = 9952, y = 12644, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- {x = 9952, y = 12645, z = -4, sprite = "fixtures_bathroom_01_9",}, -- These are the urinals and PZ doesn't use them currently. Unsure if mods like Lifestyle do
        -- {x = 9952, y = 12646, z = -4, sprite = "fixtures_bathroom_01_9",},
        -- {x = 9952, y = 12647, z = -4, sprite = "fixtures_bathroom_01_9",},
        -- washroom showers
        { sprite = "fixtures_bathroom_01_31", x = 9948, y = 12647, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_31", x = 9948, y = 12645, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_31", x = 9948, y = 12643, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_23", x = 9951, y = 12647, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_23", x = 9951, y = 12645, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_23", x = 9951, y = 12643, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },

        -- decon showers
        { sprite = "fixtures_bathroom_01_22", x = 9944, y = 12628, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_22", x = 9945, y = 12628, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_22", x = 9946, y = 12628, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_22", x = 9947, y = 12628, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_22", x = 9948, y = 12628, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_22", x = 9949, y = 12628, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_30", x = 9946, y = 12626, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_30", x = 9947, y = 12626, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_22", x = 9946, y = 12624, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_22", x = 9947, y = 12624, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_30", x = 9944, y = 12622, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_30", x = 9945, y = 12622, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_30", x = 9946, y = 12622, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_30", x = 9947, y = 12622, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_30", x = 9948, y = 12622, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_30", x = 9949, y = 12622, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
    },
    loot = loot,
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(MarchRidgeConfig.doorKeys.doors, { sprite = "industry_trucks_01_33", x = 9881, y = 12618, z = 0, })
    table.insert(MarchRidgeConfig.objectSpawns, { enabled = "EnableLadders", x = 9883, y = 12619, z = 0, removeFloor = true, clearExisting = true, })
    -- table.insert(MarchRidgeConfig.objectSpawns, { enabled = "EnableLadders", x = 9921, y = 12623, z = -4, removeWall = "west", })
end

return MarchRidgeConfig