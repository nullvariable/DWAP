-- @TODO (2026-08-07 audit) unresolved - delete lines as they are fixed
--   * entry 26: square holds no container at all - coords are stale or the
--     object was removed
--   * entries 57,59: square not found (bad z or the area never spawns)
--   * systems: generator controls declare industry_02_67 but no such object
--     is on the square. 11 configs name that sprite and ALL 11 fail, while 32
--     configs use dwap_tiles_01_22 - the maps look to have moved on and these
--     configs did not. Confirm what is actually there before editing
local bunkerTopLeft = { x = 12828, y = 1604, z = -1 }
local wtc = { x = 12835, y = 1614, z = 1 }
local pb1 = { x = 12832, y = 1610, z = 1 }

-- The E1-E25 "bunker shell" is the shared preset emitted at this site's E1
-- tile (the maps dresser at bunkerTopLeft + (0,2,0)). Config 01 is the
-- preset's source of truth. Overrides preserve this site's identity: E8/E9
-- keep the SafehouseFridge/SafehouseFreezer brand and E22/E24 keep their
-- expanded lower-crate lists. E17/E21/E23/E25 intentionally take the preset's
-- differentiated upper-crate defaults (they used to duplicate their lower
-- crate). E26-E68 are site-specific and stay inline below.
local BunkerShell = require("DWAP/configs/presets/BunkerShell_17")
local loot = BunkerShell(
    { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 2, z = bunkerTopLeft.z },
    {
        E8 = { dist = { "SafehouseFridge" } },
        E9 = { dist = { "SafehouseFreezer" } },
        E22 = { dist = { "GasStoreEmergency", "StoreCounterTobacco", "BurglarTools", "CarpenterTools", "BarnTools", "SafehouseArmor", "SafehouseLighting" } },
        E24 = { dist = { "SafehouseTraps", "GunStoreKnives", "CampingStoreBackpacks", "CrateLiquor", "CarSupplyTools", "DrugLabOutfit" } },
    }
)

local extra = {
        -- rest of the building
        -- kitchen 1st floor
        { -- E26 freezer
            note = "freezer @ kitchen",
            coords = { x = 12830, y = 1611, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E27 freezer
            note = "freezer @ kitchen",
            coords = { x = 12830, y = 1610, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E28
            note = "counter @ kitchen",
            coords = { x = 12833, y = 1610, z = 0 },
            dist = { "GigamartBreakfast" },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E29
            note = "counter @ kitchen",
            coords = { x = 12835, y = 1610, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E30
            note = "counter @ kitchen",
            coords = { x = 12836, y = 1610, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        -- living room
        { -- E31
            note = "dishescabinet @ livingroom",
            coords = { x = 12836, y = 1617, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E32
            note = "dishescabinet @ livingroom",
            coords = { x = 12836, y = 1618, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E33
            note = "shelves @ livingroom", -- east townhouse
            coords = { x = 12837, y = 1617, z = 0 },
            dist = { "MusicStoreCDs" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E34
            note = "shelves @ livingroom",
            coords = { x = 12830, y = 1618, z = 0 },
            dist = { "LivingRoomShelfClassy" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        -- bathroom
        { -- E35
            note = "counter @ bathroom",
            coords = { x = 12832, y = 1614, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -- 2nd floor
        -- bedroom
        { -- E36
            note = "dresser @ bedroom",
            coords = { x = 12830, y = 1620, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E37
            note = "dresser @ bedroom",
            coords = { x = 12830, y = 1617, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -- warehouse/utilities
        { -- E38 crate
            note = "crate @ warehouse",
            coords = { x = 12831, y = 1614, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E39 crate
            note = "crate @ warehouse",
            coords = { x = 12831, y = 1613, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E40 crate
            note = "crate @ warehouse",
            coords = { x = 12834, y = 1617, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        -- shelving
        { -- E41
            note = "metal_shelves @ warehouse",
            coords = { x = 12837, y = 1612, z = 1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E42
            note = "metal_shelves @ warehouse",
            coords = { x = 12837, y = 1613, z = 1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E43
            note = "metal_shelves @ warehouse",
            coords = { x = 12837, y = 1614, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E44
            note = "metal_shelves @ warehouse",
            coords = { x = 12837, y = 1615, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E45
            note = "metal_shelves @ warehouse",
            coords = { x = 12837, y = 1616, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E46
            note = "metal_shelves @ warehouse",
            coords = { x = 12837, y = 1617, z = 1 },
            dist = { "CrateLongStick" },
            items = {
                { name = 'Base.LongStick', chance = 1, count = { 10, 10 } },
                { name = 'Base.Firewood',  chance = 1, count = { 10, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E47
            note = "metal_shelves @ warehouse",
            coords = { x = 12840, y = 1612, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E48
            note = "metal_shelves @ warehouse",
            coords = { x = 12840, y = 1613, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E49
            note = "metal_shelves @ warehouse",
            coords = { x = 12840, y = 1614, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E50
            note = "metal_shelves @ warehouse",
            coords = { x = 12840, y = 1615, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E51
            note = "metal_shelves @ warehouse",
            coords = { x = 12840, y = 1616, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E52
            note = "metal_shelves @ warehouse",
            coords = { x = 12840, y = 1617, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E53
            note = "metal_shelves @ gunstore",
            coords = { x = 12843, y = 1612, z = 1 },
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = { 8, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E54
            note = "metal_shelves @ gunstore",
            coords = { x = 12843, y = 1613, z = 1 },
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E55
            note = "metal_shelves @ gunstore",
            coords = { x = 12843, y = 1614, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E56
            note = "metal_shelves @ gunstore",
            coords = { x = 12843, y = 1615, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E57
            note = "metal_shelves @ gunstore",
            coords = { x = 12843, y = 1616, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E58
            note = "metal_shelves @ gunstore",
            coords = { x = 12843, y = 1617, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        -- back wall crates
        { -- E59
            note = "crate @ warehouse",
            coords = { x = 12840, y = 1610, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E60
            note = "crate @ gunstore",
            coords = { x = 12841, y = 1610, z = 1 },
            dist = { "LiquorStoreBeer", "ArmyStorageElectronics" },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E61
            note = "crate @ gunstore",
            coords = { x = 12841, y = 1610, z = 1 },
            stack = 2,
            dist = { "LiquorStoreBeer", "ArmyStorageElectronics" },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E62
            note = "crate @ gunstore",
            coords = { x = 12842, y = 1610, z = 1 },
            dist = { "ArmyBunkerMedical", "JanitorCleaning", "MedicalStorageDrugs" },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E63
            note = "crate @ gunstore",
            coords = { x = 12843, y = 1610, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E64
            note = "crate @ gunstore",
            coords = { x = 12843, y = 1610, z = 1 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -- library/sitting area
        { -- E65
            note = "shelves @ library",
            coords = { x = 12840, y = 1619, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E67
            note = "shelves @ library",
            coords = { x = 12843, y = 1619, z = 1 },
            dist = { "MusicStoreCDs", "LiquorStoreWhiskey" },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
}
for i = 1, #extra do loot[#loot + 1] = extra[i] end

local LouisvilleTownhouse = {
    group = "Louisville",
    baseBuildings = {
        { x = 12832, y = 1619, z = 0 },  -- townhouse
        { x = 12829, y = 1613, z = -1 }, -- bunker
    },
    baseRooms = {
        { x = 12832, y = 1616, z = 0 },  -- livingroom
        { x = 12832, y = 1614, z = 0 },  -- bathroom
        { x = 12832, y = 1610, z = 0 },  -- kitchen
        { x = 12828, y = 1616, z = -1 }, -- bunker
        { x = 12828, y = 1608, z = -1 }, -- bunker
        { x = 12832, y = 1616, z = 1 },  -- warehouse
        { x = 12832, y = 1617, z = 1 },  -- bedroom
        { x = 12837, y = 1616, z = 0 },  -- livingroom
        { x = 12837, y = 1610, z = 0 },  -- kitchen
        { x = 12841, y = 1614, z = 0 },  -- bathroom
    },
    spawn = { x = 12832, y = 1619, z = 0 },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = 1 },
    },
    waterFixtures = {
        { sprite = "fixtures_bathroom_01_6", x = 12830, y = 1612, z = -1, sourceType = "tank", source = 1 },
        { sprite = "fixtures_sinks_01_16",   x = 12828, y = 1608, z = -1, sourceType = "tank", source = 1 },

        { sprite = "fixtures_bathroom_01_0", x = 12831, y = 1614, z = 0,  sourceType = "tank", source = 1 },
        { sprite = "fixtures_sinks_01_2",    x = 12832, y = 1614, z = 0,  sourceType = "tank", source = 1 },
        { sprite = "fixtures_sinks_01_9",    x = 12835, y = 1610, z = 0,  sourceType = "tank", source = 1 },
    },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 12836, y = 1611, z = 1, },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 12834, y = 1611, z = 1, },
            fakeGenerators = {
                { x = 12835, y = 1615, z = -1, },
            },
        },
    },
    doorKeys = {
        name = "Louisville Townhouse",
        doors = {
            { sprite = "fixtures_doors_01_53", x = 12830, y = 1612, z = 0, },
            { sprite = "fixtures_doors_01_53", x = 12831, y = 1612, z = 2, },
        },
    },
    map = { name = "DWAPStashMap42", },
    objectSpawns = {
        { barricade = "wood",     enabled = "Barricade", target = "fixtures_windows_01_16", x = 12830, y = 1617, z = 0, },
        { barricade = "wood",     enabled = "Barricade", target = "fixtures_windows_01_16", x = 12830, y = 1611, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_17", x = 12835, y = 1610, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_doors_01_5",    x = 12835, y = 1620, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_17", x = 12832, y = 1621, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_17", x = 12831, y = 1621, z = 0, },

        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_doors_01_5",    x = 12838, y = 1620, z = 0, }, -- door N | livingroom, bld 50,6#2
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_17", x = 12838, y = 1610, z = 0, }, -- window N | kitchen, bld 50,6#2
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_17", x = 12841, y = 1621, z = 0, }, -- window N | livingroom, bld 50,6#2
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_17", x = 12842, y = 1621, z = 0, }, -- window N | livingroom, bld 50,6#2

    },
    loot = loot,
}

return LouisvilleTownhouse
