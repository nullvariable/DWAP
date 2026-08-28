-- @TODO (2026-08-07 audit) unresolved - delete lines as they are fixed
--   * solar is UNVERIFIED - every systems run so far skipped it ("ISA mod
--     inactive or EnableGenSystemSolar off"). Definitions now live in
--     configs/ISA/01_DoeValleyBunker_17.lua and only load when ISA is active;
-- solar should be fine when we get it patched, no map changes to adjust for.
--     a run with ISA loaded is still owed. Applies to all 38 solar configs
--   * the only config with an empty objectSpawns table, yet it has a surface
--     door at 5576,9375,z=0 - confirm with FindUnbarricaded() that no
--     barricades are wanted here
-- no barricades, the location is fully underground and we don't want to block the only entrance/exit

--- Notes:
--- Lives in the woods, remote with poor car access
--- fairly small but low local zombies and plenty of room to
--- do custom building. Not a bad walk West to Doe Valley which is
--- a small town with a big survivalist gun store, mechanic, gas station,
--- clinic, grocery, and restaurant

-- The E1-E25 "bunker shell" is the shared preset emitted at this site's E1
-- tile (the maps dresser). Config 01 is the preset's source of truth and
-- passes NO overrides. E26-E32 (@ warehouse) are site-specific and stay inline.
local BunkerShell = require("DWAP/configs/presets/BunkerShell_17")
local loot = BunkerShell({ x = 5575, y = 9365, z = -1 })

-- addon room (warehouse) - not part of the bunker shell
loot[#loot + 1] = { -- E26
    note = "clothingwasher @ warehouse",
    coords = {x = 5578, y = 9373, z = -1},
    special = "gunlocker",
    level = "Loot_GunLevel",
}
loot[#loot + 1] = { -- E27 [20]
    note = "counter @ warehouse",
    coords = {x = 5581, y = 9376, z = -1},
    distIncludeJunk = false,
    tag = "DWAPFish",
}
loot[#loot + 1] = { -- E28
    note = "counter @ warehouse",
    coords = {x = 5582, y = 9376, z = -1},
    dist = {"BurglarTools", "CarpenterTools", "BarnTools","SafehouseArmor", "SafehouseLighting"},
    distIncludeJunk = true,
    tag = "DWAPLockers",
}
loot[#loot + 1] = { -- E29
    note = "counter @ warehouse",
    coords = {x = 5583, y = 9376, z = -1},
    dist = {"CarSupplyTools", "GasStorageMechanics", "CampingLockers"},
    distIncludeJunk = true,
    tag = "DWAPGun",
}
loot[#loot + 1] = { -- E30
    note = "counter @ warehouse",
    coords = {x = 5584, y = 9376, z = -1},
    dist = {"SafehouseTraps","GunStoreKnives","CampingStoreBackpacks","CrateLiquor",},
    distIncludeJunk = true,
    tag = "DWAPGun",
}
loot[#loot + 1] = { -- E31
    note = "counter @ warehouse",
    coords = {x = 5584, y = 9375, z = -1},
    distIncludeJunk = true,
    tag = "DWAPTools",
}
loot[#loot + 1] = { -- E32
    note = "counter @ warehouse",
    coords = {x = 5584, y = 9374, z = -1},
    distIncludeJunk = false,
    tag = "DWAPFood",
}

local DoeValleyBunker = {
    group = "Doe Valley",
    baseBuildings = {
        { x = 5576, y = 9365, z = -1}, -- bunker
    },
    spawn = { x = 5576, y = 9365, z = -1 },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = 5579, y = 9372, z = -1, sourceType="generator", source = {x = 5583, y = 9371, z = -1} },
    },
    waterFixtures = {
        { sprite = "fixtures_bathroom_01_6", x = 5577, y = 9371, z = -1, sourceType="tank", source = 1 },
        { sprite = "fixtures_sinks_01_16", x = 5575, y = 9367, z = -1, sourceType="tank", source = 1 },
        { sprite = "appliances_laundry_01_1", x = 5578, y = 9373, z = -1, sourceType="tank", source = 1 },
    },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 5583, y = 9372, z = -1 },
            fuelTank = { sprite = "dwap_tiles_01_24", x= 5581, y= 9372, z= -1, },
            fakeGenerators = {
                { x = 5579, y = 9370, z = -1, },
            },
        },
    },
    doorKeys = {
        name = "Doe Valley Bunker",
        doors = {
            { sprite = "fixtures_doors_01_53", x = 5576, y = 9375, z = 0, },
            { sprite = "fixtures_doors_01_53", x = 5576, y = 9372, z = -1, },
        },
    },
    map = { name = "DWAPStashMap1", },
    objectSpawns = {

    },
    loot = loot,
}

return DoeValleyBunker
