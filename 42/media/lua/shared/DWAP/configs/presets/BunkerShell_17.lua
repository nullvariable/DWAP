--- Reusable "bunker shell" loot preset (entries E1-E25).
---
--- The bunker shell is a fixed layout of 25 containers that recurs across ~8
--- safehouse configs, hand-duplicated in each and varying only by coordinate
--- ORIGIN plus small per-site tweaks. This module is the single source of
--- truth for that layout. Config 01 (Doe Valley Bunker) is the reference: the
--- offsets below are measured FROM config 01's E1 tile {x=5575,y=9365,z=-1},
--- and config 01 itself passes NO overrides, so the defaults here equal 01
--- exactly.
---
--- Usage:
---   local shell = require("DWAP/configs/presets/BunkerShell_17")
---   loot = shell({ x = 5575, y = 9365, z = -1 })          -- config 01
---   loot = shell({ x = 12828, y = 1607, z = -1 }, {       -- a migrated site
---       E8 = { dist = { "SafehouseFridge" } },
---       E9 = { dist = { "SafehouseFreezer" } },
---   })
---
--- @param origin table {x=,y=,z=} the tile matching config 01's E1 (the maps
---        dresser). Every emitted entry's coords = origin + (dx,dy,dz).
--- @param overrides table|nil optional map keyed by shell-slot id
---        ("E1".."E25"). Each value is a PARTIAL field table shallow-merged
---        onto that entry AFTER the defaults are applied: any key present
---        replaces the default (dist swapped, sprite changed, items added,
---        level retuned, etc.). List-valued override fields (dist, items) are
---        copied, so the caller's config table is never aliased into the
---        emitted loot. Keys are stable slot ids, independent of coords, so a
---        site whose origin differs still targets the right entry. A slot id
---        that matches no entry is ignored (only "E1".."E25" exist). Removing
---        a default field is not expressible via shallow merge; none of the
---        current sites need it.
--- @return table a fresh array of loot entries (new tables every call)

-- Each spec is one shell entry: its stable id, offset from E1, and the exact
-- field set config 01 emits. `dist`/`items` are templates copied per call.
-- `pin = true` is set on every dist-bearing (non-special) entry by the
-- builder; specials (maps/kitchentools/SeedLibrary/skillmags/skillbooks*/
-- essentials/gunlocker) are guaranteed by the fill code, so they carry no pin.
local specs = {
    { id = "E1", dx = 0, dy = 0, dz = 0,
        note = "dresser @ bunker", sandboxEnable = "Loot_EnableMaps", special = "maps" },
    { id = "E2", dx = 0, dy = 1, dz = 0,
        note = "overhead @ bunker", slot = "upper",
        distIncludeJunk = false, tag = "DWAPFood" },
    { id = "E3", dx = 0, dy = 1, dz = 0,
        note = "counter @ bunker", special = "kitchentools", level = "Loot_FoodLevel" },
    { id = "E4", dx = 0, dy = 2, dz = 0,
        note = "overhead @ bunker", slot = "upper",
        distIncludeJunk = false, tag = "DWAPFood" },
    { id = "E5", dx = 0, dy = 2, dz = 0,
        sprite = "location_trailer_02_19", note = "counter @ bunker",
        distIncludeJunk = false, tag = "DWAPMed" },
    { id = "E6", dx = 0, dy = 3, dz = 0,
        sprite = "location_trailer_02_23", note = "overhead @ bunker", slot = "upper",
        distIncludeJunk = false, tag = "DWAPFish" },
    { id = "E7", dx = 0, dy = 3, dz = 0,
        sprite = "location_trailer_02_19", note = "counter @ bunker",
        dist = { "SewingStoreTools" },
        distIncludeJunk = true, tag = "DWAPTailor" },
    { id = "E8", dx = 0, dy = 4, dz = 0,
        note = "fridge @ bunker",
        distIncludeJunk = true, tag = "DWAPFridge" },
    { id = "E9", dx = 0, dy = 4, dz = 0,
        slot = "freezer", note = "freezer @ bunker",
        dist = { "FreezerIceCream" },
        distIncludeJunk = true, tag = "DWAPFreezer" },
    { id = "E10", dx = 0, dy = 5, dz = 0,
        sprite = "location_trailer_02_23", note = "metal_shelves @ bunker",
        distIncludeJunk = false, tag = "DWAPFarm" },
    { id = "E11", dx = 0, dy = 6, dz = 0,
        note = "metal_shelves @ bunker", sandboxEnable = "SeedLibrary", special = "SeedLibrary" },
    { id = "E12", dx = 0, dy = 7, dz = 0,
        note = "metal_shelves @ bunker", sandboxEnable = "Loot_EnableBooks", special = "skillmags" },
    { id = "E13", dx = 0, dy = 8, dz = 0,
        note = "metal_shelves @ bunker", sandboxEnable = "Loot_EnableBooks", special = "skillbooks2" },
    { id = "E14", dx = 0, dy = 9, dz = 0,
        note = "metal_shelves @ bunker", sandboxEnable = "Loot_EnableBooks", special = "skillbooks1" },
    { id = "E15", dx = 0, dy = 10, dz = 0,
        note = "metal_shelves @ bunker", special = "essentials" },
    { id = "E16", dx = 2, dy = 3, dz = 0,
        stack = 1, note = "militarycrate @ bunker",
        distIncludeJunk = false, tag = "DWAPMedia" },
    { id = "E17", dx = 2, dy = 3, dz = 0,
        stack = 2, note = "militarycrate @ bunker",
        distIncludeJunk = true, tag = "DWAPGun" },
    { id = "E18", dx = 2, dy = 4, dz = 0,
        stack = 1, note = "militarycrate @ bunker", special = "gunlocker", level = "Loot_GunLevel" },
    { id = "E19", dx = 2, dy = 4, dz = 0,
        stack = 2, note = "militarycrate @ bunker", special = "gunlocker", level = "Loot_GunLevel" },
    { id = "E20", dx = 2, dy = 5, dz = 0,
        stack = 1, note = "militarycrate @ bunker",
        distIncludeJunk = true, tag = "DWAPFarm" },
    { id = "E21", dx = 2, dy = 5, dz = 0,
        stack = 2, note = "militarycrate @ bunker",
        distIncludeJunk = false, tag = "DWAPFood" },
    { id = "E22", dx = 2, dy = -2, dz = 0,
        note = "crate @ bunker", stack = 1,
        distIncludeJunk = true, tag = "DWAPTools" },
    { id = "E23", dx = 2, dy = -2, dz = 0,
        note = "crate @ bunker", stack = 2,
        distIncludeJunk = true, tag = "DWAPBuildMats" },
    { id = "E24", dx = 2, dy = -1, dz = 0,
        note = "crate @ bunker", stack = 1,
        distIncludeJunk = true, tag = "DWAPLockers" },
    { id = "E25", dx = 2, dy = -1, dz = 0,
        note = "crate @ bunker", stack = 2,
        dist = { "CampingStoreBackpacks", "CrateLiquor", "DrugLabOutfit", "GasStoreEmergency", "StoreCounterTobacco" },
        distIncludeJunk = true, tag = "DWAPLockers" },
}

-- Fields copied verbatim from a spec into the emitted entry (scalars only;
-- coords, dist and items are handled separately).
local scalarFields = {
    "note", "slot", "stack", "special", "sandboxEnable",
    "distIncludeJunk", "tag", "level", "sprite",
}

local function copyList(t)
    if t == nil then return nil end
    local out = {}
    for i = 1, #t do out[i] = t[i] end
    return out
end

return function(origin, overrides)
    local out = {}
    for i = 1, #specs do
        local spec = specs[i]
        local entry = {}
        for j = 1, #scalarFields do
            local f = scalarFields[j]
            entry[f] = spec[f]
        end
        entry.coords = { x = origin.x + spec.dx, y = origin.y + spec.dy, z = origin.z + spec.dz }
        entry.dist = copyList(spec.dist)
        -- non-special entries are pinned; specials are guaranteed by fill code.
        -- spec.dist may now be nil after tag migration, so pin on non-special.
        if not spec.special then
            entry.pin = true
        end

        local ov = overrides and overrides[spec.id]
        if ov then
            for k, v in pairs(ov) do
                if k == "dist" or k == "items" then
                    entry[k] = copyList(v)
                else
                    entry[k] = v
                end
            end
        end

        out[i] = entry
    end
    return out
end
