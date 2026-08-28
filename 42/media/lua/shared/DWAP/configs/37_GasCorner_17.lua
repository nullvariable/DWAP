-- @TODO (2026-08-07 audit) unresolved - delete lines as they are fixed
--   * 2 skeleton entries carry coords but no loot yet - entries 26-27
--   * systems: generator controls declare industry_02_67 but no such object
--     is on the square. 11 configs name that sprite and ALL 11 fail, while 32
--     configs use dwap_tiles_01_22 - the maps look to have moved on and these
--     configs did not. Confirm what is actually there before editing
--   * systems: 1 component at 1659,5747 z=0 names a sprite that is not on the
--     square, though the square itself loads - config drifted from the map
local wtc = { x = 1662, y = 5746, z = -2, }
local pb1 = { x = 1660, y = 5747, z = -2 }
local GasCorner = {
    group = "Brandenburg",
    baseBuildings = {
        { x = 1664, y = 5746, z = 1 },  -- gas station
        { x = 1664, y = 5746, z = -1 }, -- basement 1
        { x = 1664, y = 5746, z = -4 }, -- basement 2
    },
    spawn = { x = 1664, y = 5746, z = 1 },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 1666, y = 5746, z = -4 },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 1664, y = 5746, z = -4, },
            fakeGenerators = {
                { x = 1659, y = 5749, z = -1, createTile = true },
            },
        },
    },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = { x = 1666, y = 5746, z = -4 } },
    },
    waterFixtures = {
        { sprite = "fixtures_sinks_01_9",     x = 1663, y = 5749, z = -4, sourceType = "tank", source = wtc, }, -- bunker, bld 6,22#27
        { sprite = "fixtures_bathroom_01_30", x = 1658, y = 5750, z = -4, sourceType = "tank", source = wtc, }, -- lobby, bld 6,22#27
        { sprite = "fixtures_bathroom_01_1",  x = 1661, y = 5749, z = -4, sourceType = "tank", source = wtc, }, -- bunker, bld 6,22#27

        { sprite = "fixtures_sinks_01_32",    x = 1665, y = 5749, z = -3, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "appliances_laundry_01_7", x = 1659, y = 5746, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

        { sprite = "fixtures_bathroom_01_4",  x = 1658, y = 5747, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_9",     x = 1659, y = 5747, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

        { sprite = "fixtures_sinks_01_9",     x = 1661, y = 5744, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_33", x = 1657, y = 5748, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_2",  x = 1659, y = 5748, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_23",    x = 1659, y = 5747, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
    },
    doorKeys = {
        name = "Brandenburg Gas Corner",
        doors = {
            { sprite = "fixtures_doors_02_5", x = 1661, y = 5752, z = 0, },
            { sprite = "fixtures_doors_02_5", x = 1657, y = 5748, z = 0, },
            { sprite = "fixtures_doors_02_5", x = 1657, y = 5749, z = -1, },
        },
    },
    map = { name = "DWAPStashMap37", },
    objectSpawns = {
        { barricade = "metal",    enabled = "Barricade", target = "walls_commercial_01_113", x = 1663, y = 5753, z = 0, },
        { barricade = "metal",    enabled = "Barricade", target = "walls_commercial_01_113", x = 1664, y = 5753, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_doors_02_5",     x = 1661, y = 5753, z = 0, },
        { barricade = "metal",    enabled = "Barricade", target = "fixtures_windows_01_56",  x = 1673, y = 5747, z = 0, },
    },
    loot = {
        -- lowest level
        { -- E1
            note = "counter @ bunker",
            coords = { x = 1664, y = 5749, z = -4 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E2
            note = "overhead @ bunker",
            coords = { x = 1664, y = 5749, z = -4 },
            slot = "upper",
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E3
            note = "counter @ bunker",
            coords = { x = 1663, y = 5749, z = -4 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E4
            note = "overhead @ bunker",
            coords = { x = 1663, y = 5749, z = -4 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E5
            note = "medicine @ bunker",
            coords = { x = 1661, y = 5749, z = -4 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E6
            note = "shelves @ bunker",
            coords = { x = 1660, y = 5750, z = -4 },
            slot = "upper",
            items = {
                { name = 'Base.Hat_GasMask', },
                { name = 'Base.GasmaskFilter', },
            },
            level = "Loot_LockersLevel",
        },
        { -- E7
            note = "medicine @ bunker",
            coords = { x = 1659, y = 5750, z = -4 },
            slot = "upper",
            dist = { "SafehouseMedical" },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E8
            note = "locker @ gunstore",
            coords = { x = 1658, y = 5749, z = -4 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E9
            note = "militarycrate @ gunstore",
            coords = { x = 1660, y = 5745, z = -4 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E10
            note = "militarycrate @ gunstore",
            coords = { x = 1660, y = 5745, z = -4 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E11
            note = "militarylocker @ gunstore",
            coords = { x = 1661, y = 5745, z = -4 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E12
            note = "militarylocker @ gunstore",
            coords = { x = 1662, y = 5745, z = -4 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E13
            note = "cardboardbox @ gunstore",
            coords = { x = 1667, y = 5745, z = -4 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E14
            note = "cardboardbox @ gunstore",
            coords = { x = 1667, y = 5745, z = -4 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        -- -3, books and crafting room
        { -- E15
            note = "shelves @ lobby",
            coords = { x = 1659, y = 5744, z = -3 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E16
            note = "shelves @ lobby",
            coords = { x = 1659, y = 5745, z = -3 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E17
            note = "shelves @ lobby",
            coords = { x = 1659, y = 5746, z = -3 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E18
            note = "shelves @ lobby",
            coords = { x = 1659, y = 5747, z = -3 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        -- small back room
        { -- E19
            note = "metal_shelves @ warehouse",
            coords = { x = 1665, y = 5750, z = -3 },
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E20
            note = "metal_shelves @ warehouse",
            coords = { x = 1665, y = 5748, z = -3 },
            distIncludeJunk = true,
            tag = "DWAPFarm",
        },
        { -- E21
            note = "crate @ warehouse",
            coords = { x = 1667, y = 5750, z = -3 },
            special = "essentials",
        },
        -- main work room
        { -- E22
            note = "metal_shelves @ farmstorage",
            coords = { x = 1661, y = 5750, z = -3 },
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = { 8, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E23
            note = "metal_shelves @ farmstorage",
            coords = { x = 1661, y = 5749, z = -3 },
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E24
            note = "counter @ farmstorage",
            coords = { x = 1661, y = 5747, z = -3 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E25
            note = "counter @ farmstorage",
            coords = { x = 1661, y = 5746, z = -3 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E26
            note = "counter @ farmstorage",
            coords = { x = 1661, y = 5745, z = -3 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E27
            note = "counter @ farmstorage",
            coords = { x = 1663, y = 5745, z = -3 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E28
            note = "metal_shelves @ farmstorage",
            coords = { x = 1665, y = 5745, z = -3 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E29
            note = "metal_shelves @ farmstorage",
            coords = { x = 1665, y = 5746, z = -3 },
            distIncludeJunk = true,
            tag = "DWAPFarm",
        },
        { -- E30
            note = "metal_shelves @ farmstorage",
            coords = { x = 1667, y = 5745, z = -3 },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E31
            note = "metal_shelves @ farmstorage",
            coords = { x = 1667, y = 5746, z = -3 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        -- -2 level, laundry, main storage
        { -- E32
            note = "clothingdryerbasic @ lobby",
            coords = { x = 1659, y = 5744, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E33
            note = "shelves @ lobby",
            coords = { x = 1659, y = 5744, z = -2 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPLockers",
        },
        { -- E34
            note = "freezer @ warehouse",
            coords = { x = 1661, y = 5750, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E35
            note = "freezer @ warehouse",
            coords = { x = 1661, y = 5749, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E36
            note = "woodstove @ warehouse",
            coords = { x = 1662, y = 5750, z = -2 },
            items = {
                { name = 'Base.Firewood', chance = 1, count = { 10, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E37
            note = "metal_shelves @ warehouse",
            coords = { x = 1663, y = 5750, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E38
            note = "shelves @ warehouse",
            coords = { x = 1664, y = 5750, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E39
            note = "shelves @ warehouse",
            coords = { x = 1665, y = 5750, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E40
            note = "shelves @ warehouse",
            coords = { x = 1666, y = 5750, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E41
            note = "shelves @ warehouse",
            coords = { x = 1667, y = 5750, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E42
            note = "crate @ warehouse",
            coords = { x = 1663, y = 5747, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E43
            note = "crate @ warehouse",
            coords = { x = 1663, y = 5747, z = -2 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E44
            note = "crate @ warehouse",
            coords = { x = 1663, y = 5746, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E45
            note = "crate @ warehouse",
            coords = { x = 1663, y = 5746, z = -2 },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E46
            note = "crate @ warehouse",
            coords = { x = 1663, y = 5745, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E47
            note = "crate @ warehouse",
            coords = { x = 1663, y = 5745, z = -2 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E48
            note = "smallbox @ warehouse",
            coords = { x = 1665, y = 5748, z = -2 },
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.Sheet', },
                { name = 'Base.WoodAxe', },
                { name = 'Base.Machete', },
            },
            level = "Loot_BuildMatsLevel",
        },
        { -- E49
            note = "clothingrack @ warehouse",
            coords = { x = 1665, y = 5747, z = -2 },
            dist = { "ClothingStorageWinter", },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E50
            note = "clothingrack @ warehouse",
            coords = { x = 1665, y = 5746, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E51
            note = "clothingrack @ warehouse",
            coords = { x = 1665, y = 5745, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E52
            note = "cardboardbox @ warehouse",
            coords = { x = 1667, y = 5748, z = -2 },
            dist = { "CrateFishing", },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E53
            note = "crate @ warehouse",
            coords = { x = 1667, y = 5747, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E54
            note = "crate @ warehouse",
            coords = { x = 1667, y = 5747, z = -2 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E55
            note = "crate @ warehouse",
            coords = { x = 1667, y = 5746, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E56
            note = "crate @ warehouse",
            coords = { x = 1667, y = 5746, z = -2 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E57
            note = "crate @ warehouse",
            coords = { x = 1667, y = 5745, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E58
            note = "crate @ warehouse",
            coords = { x = 1667, y = 5745, z = -2 },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        -- store basement
        { -- E59
            note = "metal_shelves @ hall",
            coords = { x = 1658, y = 5747, z = -1 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E60
            note = "metal_shelves @ janitor",
            coords = { x = 1658, y = 5746, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E61
            note = "metal_shelves @ janitor",
            coords = { x = 1658, y = 5745, z = -1 },
            dist = { "CrateBlacksmithing" },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E62
            note = "metal_shelves @ storageunit",
            coords = { x = 1664, y = 5744, z = -1 },
            slot = "upper",
            dist = { "ArmyStorageOutfit", },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E63
            note = "metal_shelves @ storageunit",
            coords = { x = 1665, y = 5744, z = -1 },
            slot = "upper",
            dist = { "DrugLabOutfit", },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E64
            note = "crate @ storageunit",
            coords = { x = 1662, y = 5746, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E65
            note = "crate @ storageunit",
            coords = { x = 1663, y = 5746, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E66
            note = "crate @ storageunit",
            coords = { x = 1663, y = 5746, z = -1 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E67
            note = "crate @ storageunit",
            coords = { x = 1664, y = 5746, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E68
            note = "crate @ storageunit",
            coords = { x = 1663, y = 5747, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E69
            note = "crate @ storageunit",
            coords = { x = 1664, y = 5747, z = -1 },
            dist = { "CrateVHSTapes" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E70
            note = "locker @ storageunit",
            coords = { x = 1664, y = 5748, z = -1 },
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E71
            note = "crate @ storageunit",
            coords = { x = 1663, y = 5751, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        -- store area
        { -- E72
            note = "shelves @ gasstore",
            coords = { x = 1661, y = 5746, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E73
            note = "shelves @ gasstore",
            coords = { x = 1662, y = 5746, z = 0 },
            dist = { "CrateBootsArmy", },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E74
            note = "shelves @ gasstore",
            coords = { x = 1663, y = 5746, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E75
            note = "shelves @ gasstore",
            coords = { x = 1664, y = 5746, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E76
            note = "shelvesmag @ gasstore",
            coords = { x = 1660, y = 5751, z = 0 },
            dist = { "LivingRoomShelfClassy" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E77
            note = "shelvesmag @ gasstore",
            coords = { x = 1660, y = 5752, z = 0 },
            dist = { "MusicStoreCDs" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E78
            note = "counter @ gasstore",
            coords = { x = 1664, y = 5750, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        -- upper house level
        { -- E79
            note = "fridge @ kitchen",
            coords = { x = 1659, y = 5744, z = 1 },
            dist = { "SushiKitchenFridge", },
            distIncludeJunk = true,
            tag = "DWAPFridge",
        },
        { -- E80
            note = "freezer @ kitchen",
            coords = { x = 1659, y = 5744, z = 1 },
            slot = "freezer",
            dist = { "SushiKitchenFreezer", },
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        { -- E81
            note = "counter @ kitchen",
            coords = { x = 1660, y = 5744, z = 1 },
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E82
            note = "counter @ kitchen",
            coords = { x = 1661, y = 5744, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E83
            note = "counter @ kitchen",
            coords = { x = 1662, y = 5744, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E84
            note = "sidetable @ bedroom",
            coords = { x = 1664, y = 5744, z = 1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E85
            note = "dresser @ bedroom",
            coords = { x = 1665, y = 5747, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E86
            note = "counter @ bathroom",
            coords = { x = 1659, y = 5747, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E87
            note = "sidetable @ livingroom",
            coords = { x = 1665, y = 5749, z = 1 },
            items = {
                { name = 'Base.Sledgehammer', chance = 1, count = { 1, 1 }, },
                { name = 'Base.Machete',      chance = 1, count = { 1, 1 }, },
            },
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(GasCorner.objectSpawns,
        { enabled = "EnableLadders", sprite = "fencing_01_27", x = 1628, y = 5760, z = 0, removeFloor = true, clearExisting = true, })
end

return GasCorner
