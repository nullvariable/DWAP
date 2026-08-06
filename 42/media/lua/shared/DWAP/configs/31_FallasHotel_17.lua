
local bunkerTopLeft = {x = 7226, y = 8197, z = -1}
local wtc = {x = 7234, y = 8215, z = 0}
local pb1 = { x = 7254, y = 8253, z = -1 }
local FallasHotel = {
    group = "Fallas Lake",
    baseBuildings = {
        { x = 7244, y = 8258, z = 1 }, -- hotel
        { x = 7254, y = 8257, z = -1 }, -- hotel basement
        { x = 7258, y = 8252, z = -2 }, -- bunkers entrance
        { x = 7255, y = 8250, z = -3 }, -- bunker west
        { x = 7255+4, y = 8250, z = -3 }, -- bunker west center
        { x = 7255+8, y = 8250, z = -3 }, -- bunker east center
        { x = 7255+12, y = 8250, z = -3 }, -- bunker east
    },
    spawn = { x = 7244, y = 8258, z = 1 },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc.x, y = wtc.y, z = wtc.z, sourceType="generator", source = {x = 7681, y = 12221, z = -1} },
    },
    waterFixtures = {
        { sprite = "fixtures_sinks_01_16", x = bunkerTopLeft.x, y = bunkerTopLeft.y+4, z = bunkerTopLeft.z, sourceType="tank", source = 1 },
        { sprite = "fixtures_bathroom_01_6", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+8, z = bunkerTopLeft.z, sourceType="tank", source = 1 },

        { sprite = "fixtures_sinks_01_35", x = 7232, y = 8211, z = 0, sourceType="tank", source = 1 },
        { sprite = "fixtures_sinks_01_16", x = 7233, y = 8208, z = 0, sourceType="tank", source = 1 },
        { sprite = "fixtures_bathroom_01_5", x = 7229, y = 8206, z = 0, sourceType="tank", source = 1 },
        { sprite = "fixtures_sinks_01_15", x = 7229, y = 8204, z = 0, sourceType="tank", source = 1 },
    },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 7259, y = 8250, z = -1 },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 7257, y = 8250, z = -1, },
            solar = {
                powerbank = { sprite = "dwap_tiles_01_0", x = pb1.x, y = pb1.y, z = pb1.z },
                panels = {
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_8",
                        x = 7229,
                        y = 8215,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_8",
                        x = 7230,
                        y = 8215,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_8",
                        x = 7231,
                        y = 8215,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_8",
                        x = 7232,
                        y = 8215,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_8",
                        x = 7233,
                        y = 8215,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_8",
                        x = 7234,
                        y = 8215,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_8",
                        x = 7229,
                        y = 8216,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_8",
                        x = 7230,
                        y = 8216,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_8",
                        x = 7231,
                        y = 8216,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_8",
                        x = 7232,
                        y = 8216,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_8",
                        x = 7233,
                        y = 8216,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_8",
                        x = 7234,
                        y = 8216,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                }
            },
            fakeGenerators = {
                { x = 7254, y = 8254, z = -1, },
            },
        },
    },
    doorKeys = {
        name = "Fallas Hotel Keys",
        doors = {
            { sprite = "fixtures_doors_01_45", x = 7236, y = 8199, z = 0, },
            { sprite = "fixtures_doors_01_53", x = 7231, y = 8217, z = 0, },
            { sprite = "fixtures_doors_01_53", x = 7228, y = 8205, z = 0, },
            { sprite = "fixtures_doors_01_53", x = bunkerTopLeft.x, y = bunkerTopLeft.y, z = bunkerTopLeft.z, },
        },
    },
    map = { name = "DWAPStashMap31", },
    objectSpawns = {
        { barricade = "wood", enabled = "Barricade", target="walls_commercial_01_113", x = 7230, y = 8199, z = 0, },
        { barricade = "wood", enabled = "Barricade", target="walls_commercial_01_113", x = 7231, y = 8199, z = 0, },
        { barricade = "wood", enabled = "Barricade", target="walls_commercial_01_113", x = 7233, y = 8199, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_commercial_01_113", x = 7234, y = 8199, z = 0, },
        { barricade = "wood", enabled = "Barricade", target="walls_commercial_01_113", x = 7238, y = 8199, z = 0, },
        { barricade = "wood", enabled = "Barricade", target="walls_commercial_01_113", x = 7239, y = 8199, z = 0, },
        { barricade = "wood", enabled = "Barricade", target="walls_commercial_01_113", x = 7241, y = 8199, z = 0, },
        { barricade = "wood", enabled = "Barricade", target="walls_commercial_01_113", x = 7242, y = 8199, z = 0, },
        { barricade = "metal", enabled = "Barricade", target="walls_exterior_house_02_88", x = 7244, y = 8202, z = 0, },
        { barricade = "metal", enabled = "Barricade", target="location_restaurant_pileocrepe_01_48", x = 7244, y = 8203, z = 0, },
    },
    loot = {
        
    },
}

-- if getActivatedMods():contains("\\Ladders") then
--     table.insert(FallasHotel.objectSpawns, { x = 7678, y = 12206, z = -1, removeWall = "west" })
--     table.insert(FallasHotel.objectSpawns, { x = 7679, y = 12205, z = 0, removeFloor = true, clearExisting = true, })
-- else
-- --     table.insert(FallasHotel.objectSpawns, { sprite = "industry_trucks_01_4", x = 2607, y = 14453, z = -1, replaceWall = true, })
-- end
return FallasHotel