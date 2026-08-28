-- @TODO (2026-08-07 audit) unresolved - delete lines as they are fixed
--   * entries 1,2,3,4,5,6,7,8,9,10,11: square holds no container at all -
--     coords are stale or the object was removed
--   * systems: generator controls declare industry_02_67 but no such object
--     is on the square. 11 configs name that sprite and ALL 11 fail, while 32
--     configs use dwap_tiles_01_22 - the maps look to have moved on and these
--     configs did not. Confirm what is actually there before editing
--   * systems: 4 components at 8136-8139,11510-11513 z=0 name a sprite that
--     is not on the square, though the square itself loads - config drifted
--     from the map
--   * every loot entry fails with "no containers on square" - the whole table
--     addresses squares that hold no container, so this is a re-pick, not a
--     per-entry fix
local wtc1            = { x = 8146, y = 11509, z = -2, }
local pb1             = { x = 8140, y = 11508, z = -2, }
local SecretMausoleum = {
    group = "",
    baseBuildings = {
        { x = 8143, y = 11515, z = 0 },  -- church
        { x = 8141, y = 11513, z = -1 }, -- Mausoleum
    },
    baseRooms = {
        { x = 8148, y = 11505, z = 0 },  -- livingroom
        { x = 8148, y = 11509, z = 0 },  -- kitchen
        { x = 8138, y = 11505, z = 0 },  -- officechurch
        { x = 8138, y = 11508, z = 0 },  -- bathroom
        { x = 8136, y = 11512, z = -1 }, -- hall
        { x = 8128, y = 11516, z = -2 }, -- hall
        { x = 8128, y = 11512, z = -2 }, -- bedroom
        { x = 8136, y = 11512, z = -2 }, -- kitchen
    },
    spawn = { x = 8143, y = 11515, z = 0 },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 8143, y = 11509, z = -2, },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 8145, y = 11509, z = -2, },
            fakeGenerators = {
                { x = 8131, y = 11519, z = -1 },
            },
        },
    },
    waterTanks = {
        { sprite = "dwap_tiles_01_8", x = wtc1.x, y = wtc1.y, z = wtc1.z, sourceType = "generator", source = 1 },
    },
    waterFixtures = {
        { sprite = "fixtures_bathroom_01_0", x = 8138, y = 11508, z = 1,  sourceType = "tank", source = wtc1, }, -- bathroom, bld 31,44#36
        { sprite = "fixtures_sinks_01_2",    x = 8139, y = 11508, z = 1,  sourceType = "tank", source = wtc1, }, -- bathroom, bld 31,44#36
        { sprite = "fixtures_sinks_01_4",    x = 8130, y = 11513, z = 0,  sourceType = "tank", source = wtc1, }, -- kitchen, bld 31,44#36
        { sprite = "fixtures_bathroom_01_3", x = 8138, y = 11510, z = 0,  sourceType = "tank", source = wtc1, }, -- lobby, bld 31,44#36
        { sprite = "fixtures_sinks_01_2",    x = 8138, y = 11508, z = 0,  sourceType = "tank", source = wtc1, }, -- bathroom, bld 31,44#36
        { sprite = "fixtures_sinks_01_16",   x = 8137, y = 11508, z = -2, sourceType = "tank", source = 1 },
    },
    doorKeys = {
        name = "Secret Mausoleum Key",
        doors = {
            { sprite = "fixtures_doors_02_5", x = 8141, y = 11516, z = 0, },
            { sprite = "fixtures_doors_02_5", x = 8130, y = 11516, z = -1, },
        },
    },
    map = { name = "DWAPStashMap41", },
    objectSpawns = {

    },
    loot = {
        -- main house
        -- kitchen
        { -- E1
            note = "counter @ kitchen",
            coords = { x = 8150, y = 11511, z = 0 },
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E2
            note = "counter @ kitchen",
            coords = { x = 8149, y = 11511, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E3
            note = "counter @ kitchen",
            coords = { x = 8148, y = 11511, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E4
            note = "counter @ kitchen",
            coords = { x = 8148, y = 11509, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E5 fridge
            note = "fridge @ kitchen",
            coords = { x = 8149, y = 11509, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E5 fridge
            note = "freezer @ kitchen",
            coords = { x = 8149, y = 11509, z = 0 },
            slot = "freezer",
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        -- bathroom
        { -- E7
            note = "counter @ kitchen",
            coords = { x = 8151, y = 11511, z = 0 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        -- living room
        { -- E8
            note = "shelves @ livingroom",
            coords = { x = 8154, y = 11505, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        -- office
        { -- E9
            note = "shelves @ officechurch",
            coords = { x = 8142, y = 11505, z = 0 },
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E10
            note = "dresser @ officechurch",
            coords = { x = 8142, y = 11506, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -- entrance hall
        { -- E11
            note = "shelves @ officechurch",
            coords = { x = 8142, y = 11507, z = 0 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },

        -- below crypts
        -- crates by stairs
        { -- E12
            note = "crate @ hall",
            coords = { x = 8128, y = 11520, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E13
            note = "crate @ hall",
            coords = { x = 8129, y = 11520, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        -- chests by cots
        { -- E14
            note = "locker @ bedroom",
            coords = { x = 8128, y = 11515, z = -2 },
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E15
            note = "locker @ bedroom",
            coords = { x = 8128, y = 11512, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E16
            note = "locker @ bedroom",
            coords = { x = 8128, y = 11509, z = -2 },
            dist = { "SafehouseTraps", },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E17
            note = "locker @ bedroom",
            coords = { x = 8132, y = 11512, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E18
            note = "locker @ bedroom",
            coords = { x = 8132, y = 11509, z = -2 },
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.Sheet', },
                { name = 'Base.WoodAxe', },
                { name = 'Base.Machete', },
            },
            level = "Loot_BuildMatsLevel",
        },
        -- crates by cots
        { -- E19
            note = "crate @ bedroom",
            coords = { x = 8131, y = 11513, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPFarm",
        },
        { -- E20
            note = "crate @ bedroom",
            coords = { x = 8132, y = 11513, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        -- shelving
        { -- E21
            note = "metal_shelves @ kitchen",
            coords = { x = 8135, y = 11508, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E22
            note = "metal_shelves @ kitchen",
            coords = { x = 8135, y = 11509, z = -2 },
            dist = { "CrateBlacksmithing" },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E23
            note = "metal_shelves @ kitchen",
            coords = { x = 8135, y = 11510, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E24
            note = "metal_shelves @ kitchen",
            coords = { x = 8135, y = 11511, z = -2 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E25
            note = "metal_shelves @ kitchen",
            coords = { x = 8135, y = 11512, z = -2 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E26
            note = "metal_shelves @ kitchen",
            coords = { x = 8135, y = 11513, z = -2 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E27
            note = "metal_shelves @ kitchen",
            coords = { x = 8137, y = 11512, z = -2 },
            dist = { "SafehouseMedical" },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E28
            note = "metal_shelves @ kitchen",
            coords = { x = 8137, y = 11513, z = -2 },
            special = "essentials",
        },
        -- kitchen cabinets
        { -- E29
            note = "counter @ kitchen",
            coords = { x = 8137, y = 11508, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E30
            note = "counter @ kitchen",
            coords = { x = 8137, y = 11509, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E31 fridge
            note = "fridge @ kitchen",
            coords = { x = 8137, y = 11511, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        -- crates
        { -- E32
            note = "crate @ kitchen",
            coords = { x = 8144, y = 11513, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E33
            note = "crate @ kitchen",
            coords = { x = 8145, y = 11513, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(SecretMausoleum.objectSpawns,
        { enabled = "EnableLadders", x = 8128, y = 11514, z = 0, removeFloor = true, })
    table.insert(SecretMausoleum.objectSpawns,
        { enabled = "EnableLadders", x = 8128, y = 11515, z = -1, removeWall = "north", })
end

return SecretMausoleum
