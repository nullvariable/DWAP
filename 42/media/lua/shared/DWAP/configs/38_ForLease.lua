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
                { x = 12534, y = 5220, z = -1 },
            },
        },
    },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc1.x, y = wtc1.y, z = wtc1.z, sourceType = "generator", source = wtc1 },
    },
    waterFixtures = {
        { sprite = "fixtures_bathroom_01_1",  x = 12534, y = 5217, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_13",    x = 12534, y = 5218, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },

        { sprite = "fixtures_bathroom_01_30", x = 12534, y = 5219, z = -1, sourceType = "tank", source = wtc1, }, -- lobby, bld 48,20#11
        { sprite = "fixtures_sinks_01_1",     x = 12535, y = 5218, z = -1, sourceType = "tank", source = wtc1, }, -- bunker, bld 48,20#11
        { sprite = "fixtures_bathroom_01_1",  x = 12535, y = 5217, z = -1, sourceType = "tank", source = wtc1, }, -- bunker, bld 48,20#11
        { sprite = "fixtures_sinks_01_9",     x = 12541, y = 5217, z = -1, sourceType = "tank", source = wtc1, }, -- bunker, bld 48,20#11
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
        { barricade = "wood",     enabled = "Barricade", target = "walls_commercial_01_40", x = 12546, y = 5219, z = 0, },
        { barricade = "wood",     enabled = "Barricade", target = "walls_commercial_01_40", x = 12546, y = 5218, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target = "walls_commercial_01_40", x = 12546, y = 5217, z = 0, },
        { barricade = "wood",     enabled = "Barricade", target = "fixtures_doors_01_48",   x = 12546, y = 5215, z = 0, },
        { barricade = "wood",     enabled = "Barricade", target = "fixtures_doors_01_48",   x = 12546, y = 5214, z = 0, },
        { barricade = "wood",     enabled = "Barricade", target = "walls_commercial_01_40", x = 12546, y = 5212, z = 0, },
        { barricade = "wood",     enabled = "Barricade", target = "walls_commercial_01_40", x = 12546, y = 5211, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target = "walls_commercial_01_40", x = 12546, y = 5210, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_doors_01_49",   x = 12544, y = 5209, z = 0, },

    },
    loot = {
        { -- E1
            note = "cardboardbox @ empty",
            coords = { x = 12537, y = 5210, z = 0 },
            tag = "DWAPBuildMats",
        },
        { -- E2
            note = "counter @ empty",
            coords = { x = 12540, y = 5210, z = 0 },
            tag = "DWAPFood",
        },
        { -- E3
            note = "counter @ empty",
            coords = { x = 12541, y = 5210, z = 0 },
            tag = "DWAPFood",
        },
        { -- E4
            note = "counter @ empty",
            coords = { x = 12542, y = 5210, z = 0 },
            tag = "DWAPFood",
        },
        { -- E5
            note = "cardboardbox @ empty",
            coords = { x = 12539, y = 5215, z = 0 },
            tag = "DWAPBuildMats",
        },
        { -- E6
            note = "cardboardbox @ empty",
            coords = { x = 12539, y = 5216, z = 0 },
            tag = "DWAPBuildMats",
        },
        { -- E7
            note = "crate @ grocerystorage",
            coords = { x = 12536, y = 5211, z = 0 },
            tag = "DWAPFood",
        },
        { -- E8
            note = "fridge @ bunker",
            coords = { x = 12538, y = 5217, z = -1 },
            tag = "DWAPFridge",
        },
        { -- E9
            note = "freezer @ bunker",
            coords = { x = 12538, y = 5217, z = -1 },
            slot = "freezer",
            tag = "DWAPFreezer",
        },
        { -- E10
            note = "counter @ bunker",
            coords = { x = 12539, y = 5217, z = -1 },
            tag = "DWAPFood",
        },
        { -- E11
            note = "overhead @ bunker",
            coords = { x = 12539, y = 5217, z = -1 },
            slot = "upper",
            tag = "DWAPFood",
        },
        { -- E12
            note = "woodstove @ bunker",
            coords = { x = 12540, y = 5217, z = -1 },
            tag = "DWAPFood",
        },
        { -- E13
            note = "counter @ bunker",
            coords = { x = 12541, y = 5217, z = -1 },
            tag = "DWAPFood",
        },
        { -- E14
            note = "overhead @ bunker",
            coords = { x = 12541, y = 5217, z = -1 },
            slot = "upper",
            tag = "DWAPFood",
        },
        { -- E15
            note = "medicine @ bunker",
            coords = { x = 12537, y = 5218, z = -1 },
            slot = "upper",
            tag = "DWAPMed",
        },
        { -- E16
            note = "shelves @ bunker",
            coords = { x = 12536, y = 5219, z = -1 },
            slot = "upper",
            tag = "DWAPMedia",
        },
        { -- E17
            note = "crate @ bunker",
            coords = { x = 12539, y = 5219, z = -1 },
            tag = "DWAPFood",
        },
        { -- E18
            note = "crate @ bunker",
            coords = { x = 12540, y = 5219, z = -1 },
            tag = "DWAPFood",
        },
        { -- E19
            note = "counter @ bunker",
            coords = { x = 12535, y = 5218, z = -1 },
            tag = "DWAPFood",
        },
        { -- E20
            note = "medicine @ bunker",
            coords = { x = 12535, y = 5218, z = -1 },
            slot = "upper",
            tag = "DWAPMed",
        },
        { -- E21
            note = "crate @ farmstorage",
            coords = { x = 12539, y = 5212, z = -1 },
            tag = "DWAPFarm",
        },
        { -- E22
            note = "crate @ farmstorage",
            coords = { x = 12539, y = 5212, z = -1 },
            stack = 2,
            tag = "DWAPFarm",
        },
        { -- E23
            note = "crate @ farmstorage",
            coords = { x = 12540, y = 5212, z = -1 },
            tag = "DWAPFarm",
        },
        { -- E24
            note = "shelves @ farmstorage",
            coords = { x = 12541, y = 5214, z = -1 },
            tag = "DWAPMedia",
        },
        { -- E25
            note = "shelves @ farmstorage",
            coords = { x = 12542, y = 5214, z = -1 },
            tag = "DWAPMedia",
        },
        { -- E26
            note = "shelves @ farmstorage",
            coords = { x = 12543, y = 5214, z = -1 },
            tag = "DWAPMedia",
        },
        { -- E27
            note = "crate @ farmstorage",
            coords = { x = 12536, y = 5216, z = -1 },
            tag = "DWAPFarm",
        },
        { -- E28
            note = "crate @ farmstorage",
            coords = { x = 12536, y = 5216, z = -1 },
            stack = 2,
            tag = "DWAPFarm",
        },
        { -- E29
            note = "metal_shelves @ farmstorage",
            coords = { x = 12537, y = 5216, z = -1 },
            tag = "DWAPBuildMats",
        },
        { -- E30
            note = "metal_shelves @ farmstorage",
            coords = { x = 12538, y = 5216, z = -1 },
            tag = "DWAPTools",
        },
        { -- E31
            note = "metal_shelves @ farmstorage",
            coords = { x = 12539, y = 5216, z = -1 },
            tag = "DWAPBuildMats",
        },
        { -- E32
            note = "metal_shelves @ farmstorage",
            coords = { x = 12540, y = 5216, z = -1 },
            tag = "DWAPTools",
        },
        { -- E33
            note = "metal_shelves @ farmstorage",
            coords = { x = 12541, y = 5216, z = -1 },
            tag = "DWAPBuildMats",
        },
        { -- E34
            note = "metal_shelves @ farmstorage",
            coords = { x = 12542, y = 5216, z = -1 },
            tag = "DWAPTools",
        },
        { -- E35
            note = "metal_shelves @ farmstorage",
            coords = { x = 12543, y = 5216, z = -1 },
            tag = "DWAPBuildMats",
        },
        { -- E36
            note = "crate @ farmstorage",
            coords = { x = 12544, y = 5212, z = -1 },
            tag = "DWAPFarm",
        },
        { -- E37
            note = "shelves @ farmstorage",
            coords = { x = 12544, y = 5214, z = -1 },
            tag = "DWAPMedia",
        },
        { -- E38
            note = "crate @ farmstorage",
            coords = { x = 12535, y = 5216, z = -1 },
            tag = "DWAPFarm",
        },
        { -- E39
            note = "crate @ farmstorage",
            coords = { x = 12535, y = 5216, z = -1 },
            stack = 2,
            tag = "DWAPFarm",
        },
        { -- E40
            note = "militarycrate @ farmstorage",
            coords = { x = 12534, y = 5218, z = -1 },
            tag = "DWAPGun",
        },
        { -- E41
            note = "militarycrate @ farmstorage",
            coords = { x = 12534, y = 5218, z = -1 },
            stack = 2,
            tag = "DWAPGun",
        },
        { -- E42
            note = "metal_shelves @ farmstorage",
            coords = { x = 12544, y = 5216, z = -1 },
            tag = "DWAPTools",
        },
        { -- E43
            note = "militarycrate @ gunstore",
            coords = { x = 12541, y = 5212, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E44
            note = "militarycrate @ gunstore",
            coords = { x = 12541, y = 5212, z = -1 },
            stack = 2,
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E45
            note = "militarylocker @ gunstore",
            coords = { x = 12542, y = 5212, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E46
            note = "militarylocker @ gunstore",
            coords = { x = 12543, y = 5212, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
    },
}

-- if getActivatedMods():contains("\\Ladders") then
--     table.insert(ForLease.objectSpawns,
--         { enabled = "EnableLadders", sprite = "fencing_01_27", x = 1628, y = 5760, z = 0, removeFloor = true, clearExisting = true, })
-- end

return ForLease
