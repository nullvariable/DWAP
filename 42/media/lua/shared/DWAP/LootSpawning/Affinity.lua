--- DWAP loot allocation — affinity seed dataset (step 1 of the step-8 plan).
---
--- Data-only module. Holds the category x furniture and category x room share
--- tables measured from the 3041 authored placements (proposal r4 §5.3, the
--- printed n >= 25 rows), a sparse override overlay, and an empty deny list.
--- NO behaviour yet: the near-no-op load-time pass uses FLAT affinity and never
--- reads these tables; step 7 flips consumers onto getAffinity().
---
--- affinity(container, category) =
---       PRIMARY      if category == the entry's declared `level`
---     + furniture share (below)
---     + room share (below)
---     * 0            if the category is on the container's deny list
---
--- Furniture beats room when they disagree ("a freezer in a bedroom is still a
--- freezer"). PRIMARY is low but first-pass-dominant: the declared category
--- reliably takes its budget on the first descending-affinity pass, then spill
--- runs free. Shares are placement fractions in [0,1]; unlisted furniture/room
--- types and unlisted categories contribute 0 (flat, until an override lifts
--- them). Deterministic; no RNG, no globals.

local Affinity = {}

--- The ten budgeted categories (the Loot_*Level sandbox keys). SPECIAL is NOT
--- budgeted and is deliberately absent — specials are immune to budget and tier.
--- Order is stable and used as the canonical category iteration order.
Affinity.CATEGORIES = {
    "Food", "Media", "Gun", "Med", "Farm",
    "Fish", "Tailor", "Lockers", "Tools", "BuildMats",
}

-- Fast membership set for validation (a resolver must land on exactly one).
Affinity.CATEGORY_SET = {}
for i = 1, #Affinity.CATEGORIES do
    Affinity.CATEGORY_SET[Affinity.CATEGORIES[i]] = true
end

--- PRIMARY weight: added to a category's affinity for the container whose entry
--- declared that category. Low but first-pass-dominant. Numeric weight is a
--- deferred tuning knob (step 11); this seed value keeps the declared category
--- ahead of any single furniture/room share (max ~0.99) without swamping spill.
Affinity.PRIMARY = 1.0

--- Furniture share table (proposal r4 §5.3, n >= 25). furniture -> category ->
--- placement fraction. Only the measured categories are listed per row; any
--- category absent from a row is 0 for that furniture. Keys are the mod's
--- furniture-type tokens (the first half of a `note = "furniture @ room"`).
Affinity.FURNITURE = {
    freezer        = { Food = 0.99 },
    fridge         = { Food = 0.95 },
    medicine       = { Med = 0.81, Lockers = 0.12 },
    clothingrack   = { Lockers = 0.79 },
    overhead       = { Food = 0.74, Fish = 0.17 },
    dishescabinet  = { Food = 0.73, Fish = 0.07, Media = 0.07 },
    militarylocker = { Gun = 0.16, Lockers = 0.07, Food = 0.07 },
    counter        = { Food = 0.46, Med = 0.10, Tools = 0.07 },
    dresser        = { Lockers = 0.42, Food = 0.10, Gun = 0.08 },
    locker         = { Lockers = 0.40, Gun = 0.17 },
    cardboardbox   = { BuildMats = 0.43, Food = 0.15, Fish = 0.09, Farm = 0.07, Tools = 0.07 },
    sidetable      = { Media = 0.40, Lockers = 0.19, Food = 0.10, Gun = 0.07 },
    wardrobe       = { Lockers = 0.37, Gun = 0.17, Tailor = 0.10, Food = 0.08 },
    shelves        = { Media = 0.32, Food = 0.21 },
    crate          = { Food = 0.30, BuildMats = 0.26, Farm = 0.11, Tools = 0.09, Lockers = 0.07 },
    militarycrate  = { Gun = 0.18, Lockers = 0.14, Tools = 0.13, Media = 0.13, Farm = 0.13 },
    metal_shelves  = { Food = 0.16, BuildMats = 0.16, Farm = 0.14, Tools = 0.14 },
}

--- Room share table (proposal r4 §5.3, n >= 25, abbreviated rows). room ->
--- category -> placement fraction. Keys are IsoRoom names (the second half of a
--- `note`), matched case-insensitively by the resolver.
Affinity.ROOM = {
    kitchen    = { Food = 0.83 },
    bar        = { Food = 0.74, Media = 0.09 },
    bathroom   = { Med = 0.45, Lockers = 0.23, Food = 0.15 },
    livingroom = { Media = 0.39, Food = 0.20 },
    bedroom    = { Lockers = 0.38, Media = 0.10, Gun = 0.08, Food = 0.07 },
    security   = { Food = 0.18, Gun = 0.16, Farm = 0.08 },
    bunker     = { Food = 0.15, Farm = 0.12, Tools = 0.09, Lockers = 0.09 },
    warehouse  = { Food = 0.24, BuildMats = 0.19, Tools = 0.16, Farm = 0.13 },
    storage    = { Food = 0.36, BuildMats = 0.17, Gun = 0.09 },
    oldarmy    = { Food = 0.24, Lockers = 0.20, Gun = 0.11, Tools = 0.11, Farm = 0.10 },
    empty      = { Food = 0.26, Media = 0.18, Gun = 0.11, Tailor = 0.10 },
}

--- Sparse override overlay. Added on top of the derived furniture/room share for
--- a (furniture|room, category) cell — the place to put a nonzero floor under an
--- accidental zero so spill has somewhere to land, or to hand-correct a noisy
--- small-n row. An overlay, not a replacement: cells not listed here fall
--- through to FURNITURE/ROOM unchanged. Starts empty; tuning is deferred.
--- Shape mirrors FURNITURE/ROOM: OVERRIDE.furniture[type][cat], OVERRIDE.room[type][cat].
Affinity.OVERRIDE = {
    furniture = {
        -- Low-n furniture types below the §5.3 display cut that still appear on
        -- level-less entries. Given a single sensible category each so the
        -- top-affinity resolver places them instead of falling through: office
        -- paper/records read as Media, misc small/cooking containers as Food.
        desk          = { Media = 0.50 },
        filingcabinet = { Media = 0.50 },
        smallbox      = { Food = 0.30 },
        barbecue      = { Food = 0.60 },
    },
    room = {},
}

--- Empty deny list. A category listed for a furniture type gets a HARD zero
--- affinity there regardless of shares/overrides (no fresh produce in the
--- medicine cabinet). Keep it short — the fiction is a prepper base, and lumber
--- in the kitchen is characterful, not a bug. Starts empty; tuning is deferred.
--- Shape: DENY.furniture[type] = { Category = true, ... }, DENY.room likewise.
Affinity.DENY = {
    furniture = {},
    room = {},
}

--- Look up a single furniture-share cell (override applied, deny honoured).
--- @param furniture string|nil furniture-type token
--- @param category string one of CATEGORIES
--- @return number share in [0,1] (0 when unlisted/denied)
local function furnitureShare(furniture, category)
    if not furniture then return 0 end
    local denyRow = Affinity.DENY.furniture[furniture]
    if denyRow and denyRow[category] then return 0 end
    local base = 0
    local row = Affinity.FURNITURE[furniture]
    if row and row[category] then base = row[category] end
    local ovRow = Affinity.OVERRIDE.furniture[furniture]
    if ovRow and ovRow[category] then base = base + ovRow[category] end
    return base
end

--- Look up a single room-share cell (override applied, deny honoured).
--- @param room string|nil room name (matched lowercase)
--- @param category string one of CATEGORIES
--- @return number share in [0,1] (0 when unlisted/denied)
local function roomShare(room, category)
    if not room then return 0 end
    room = string.lower(room)
    local denyRow = Affinity.DENY.room[room]
    if denyRow and denyRow[category] then return 0 end
    local base = 0
    local row = Affinity.ROOM[room]
    if row and row[category] then base = row[category] end
    local ovRow = Affinity.OVERRIDE.room[room]
    if ovRow and ovRow[category] then base = base + ovRow[category] end
    return base
end

--- Derived affinity of a container (identified by furniture token + room name +
--- its entry's declared category) for a candidate category. This is the
--- step-7-flip function; the near-no-op path does NOT call it.
---
--- Furniture beats room: when both list the category, the larger share wins
--- rather than summing (a freezer in a bedroom is still a freezer, not a
--- freezer-plus-bedroom). A hard deny on either axis zeroes the cell.
--- @param furniture string|nil furniture-type token
--- @param room string|nil room name
--- @param declared string|nil the entry's declared (primary) category
--- @param category string the candidate category to score
--- @return number affinity (>= 0)
function Affinity.getAffinity(furniture, room, declared, category)
    -- A deny on either axis is absolute.
    local fDeny = Affinity.DENY.furniture[furniture]
    if fDeny and fDeny[category] then return 0 end
    local rKey = room and string.lower(room) or nil
    local rDeny = rKey and Affinity.DENY.room[rKey]
    if rDeny and rDeny[category] then return 0 end

    local fShare = furnitureShare(furniture, category)
    local rShare = roomShare(room, category)
    local share = fShare > rShare and fShare or rShare
    local primary = (declared and declared == category) and Affinity.PRIMARY or 0
    return primary + share
end

--- Fallback category for a budgeted entry that carries no category signal at
--- all (no level string, no parseable note). Food is the modal authored
--- category, the safest generic "supplies" bucket. The offline validator
--- reports every entry that lands here so the tail stays auditable.
Affinity.FALLBACK_CATEGORY = "Food"

--- Split a `note = "furniture @ room"` string into its two tokens.
--- @param note string|nil
--- @return string|nil furniture, string|nil room (both nil when unparseable)
function Affinity.parseNote(note)
    if type(note) ~= "string" then return nil, nil end
    local furn, room = note:match("^%s*(.-)%s*@%s*(.-)%s*$")
    if furn then
        if furn == "" then furn = nil end
        if room == "" then room = nil end
        return furn, room
    end
    -- no "@": treat the whole note as a furniture token
    local only = note:match("^%s*(.-)%s*$")
    if only == "" then only = nil end
    return only, nil
end

--- Top-affinity category for a container: the argmax share, furniture first
--- (furniture beats room), with CATEGORIES order as the deterministic
--- tie-break. Returns nil only when neither furniture nor room contributes any
--- share (i.e. both are unlisted/denied).
--- @param furniture string|nil furniture-type token
--- @param room string|nil room name
--- @return string|nil category
function Affinity.topCategory(furniture, room)
    local function argmax(shareFn, key)
        local best, bestv = nil, 0
        for i = 1, #Affinity.CATEGORIES do
            local cat = Affinity.CATEGORIES[i]
            local v = shareFn(key, cat)
            if v > bestv then best, bestv = cat, v end
        end
        return best
    end
    local cat = argmax(furnitureShare, furniture)
    if cat then return cat end
    return argmax(roomShare, room)
end

--- Resolve a declarative loot entry to exactly one budgeted category (its
--- PRIMARY). Specials are NOT budgeted and return nil. Order:
---   1. `level = "Loot_<Cat>Level"` -> <Cat> (the authored category; ~2454 of
---      the ~2971 budgeted entries).
---   2. numeric/absent level -> top-affinity of the note's furniture/room.
---   3. no signal at all -> FALLBACK_CATEGORY.
--- The second return value is the resolution source, for the offline validator:
--- "level" | "furniture" | "room" | "fallback" | "special" | "bad-level".
--- A "bad-level" source (level string naming an unknown category) is a real
--- typo signal the validator RAISEs on; at runtime it degrades to the fallback
--- so loot loading never crashes.
--- @param entry table a declarative loot entry
--- @return string|nil category (nil for specials), string source
function Affinity.resolveCategory(entry)
    if not entry then return nil, "special" end
    if entry.special then return nil, "special" end
    local lvl = entry.level
    if type(lvl) == "string" then
        local cat = lvl:match("^Loot_(.+)Level$")
        if cat and Affinity.CATEGORY_SET[cat] then
            return cat, "level"
        end
        return Affinity.FALLBACK_CATEGORY, "bad-level"
    end
    local furn, room = Affinity.parseNote(entry.note)
    -- Which axis actually produced the category? topCategory tries furniture
    -- first, so re-derive the source with the same precedence.
    local fCat = Affinity.topCategory(furn, nil)
    if fCat then return fCat, "furniture" end
    local rCat = Affinity.topCategory(nil, room)
    if rCat then return rCat, "room" end
    return Affinity.FALLBACK_CATEGORY, "fallback"
end

--- Flat affinity: PRIMARY for the declared category, a small uniform base
--- elsewhere so every category has nonzero headroom for spill. This is the
--- near-no-op v1 ranking; step 7 swaps callers onto getAffinity().
--- @param declared string|nil the entry's declared (primary) category
--- @param category string the candidate category to score
--- @return number affinity (>= 0)
function Affinity.getFlatAffinity(declared, category)
    local primary = (declared and declared == category) and Affinity.PRIMARY or 0
    return primary + 0.01
end

return Affinity
