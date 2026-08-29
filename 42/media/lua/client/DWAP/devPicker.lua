-- Dev tooling: inert outside debug mode so shipping this file is safe.
-- getDebug() is the -debug launch flag - per-launch, never set for normal
-- players, no sandbox UI exposure
if not getDebug() then return end

-- devPicker.lua
-- One picker, replacing the three that used to live in devTools.lua (plumb,
-- room and door): one queue of picks (tiles and/or rooms), one flatten to
-- squares, one export pass with the reports chosen by checkbox. DWAPPicker()
-- toggles the panel from the console or from the dev panel's DWAP Picker
-- button.
--
-- Every section emits ONE table across all picks, because the output is pasted
-- into a config and a table per pick is a paste per pick. Per-pick lines stay
-- above it as the coverage record.

local DWAPUtils = require("DWAPUtils")
local DevShared = require("DWAP/devShared")

require "ISUI/ISCollapsableWindow"
require "ISUI/ISButton"
require "ISUI/ISTickBox"

-- ---------------------------------------------------------------------------
-- Queue
-- ---------------------------------------------------------------------------

-- Ordered entries plus a key set, the shape the old room picker used:
--   { kind = "tile", key = "tile:x,y,z", x, y, z }
--   { kind = "room", key = roomDefKey(room), name, dx, dy, dz, dw, dh }
--
-- A room entry stores its def rect and key ONLY, never a square list. That is
-- what keeps it live: room:getSquares() holds what has streamed at the moment
-- it is asked, so a room picked from the doorway keeps filling in as you walk
-- it. Snapshotting the squares at click time would freeze it at whatever a
-- half-streamed room happened to hold.
local queue = {}
local queueKeys = {}

-- Mode decides only what a CLICK ADDS. Both kinds live in one queue and every
-- export sweeps the flattened set, so mixing them in a session is normal.
local pickMode = "tile"

local pickerInstance = nil

-- Key for a single-tile pick. DevShared.roomDefKey is always name@x,y,z, so a
-- form with no '@' in it cannot collide with a room key however a room is
-- named - which is what lets both kinds share queueKeys and its toggle test.
local function tilePickKey(x, y, z)
    return "tile:" .. DevShared.coordKey(x, y, z)
end

-- ---------------------------------------------------------------------------
-- flatten
-- ---------------------------------------------------------------------------

-- Cached result of flatten(), dropped on any queue mutation and re-taken every
-- FLATTEN_TICKS so newly streamed squares light up without a click.
local flatCache = nil
local FLATTEN_TICKS = 10

local function invalidate()
    flatCache = nil
end

--- Resolve the queue to squares. THE one function every consumer reads - the
--- highlight, every export option, and DWAPExplainSquare - so "it lit
--- up but did not export" cannot happen: there is only one enumeration.
---
--- Returns:
---   squares      ordered, deduped IsoGridSquare array (first queue entry wins)
---   entryIndex   parallel array: which queue entry introduced squares[i]
---   byEntry      [queue index] -> the squares that entry introduced
---   roomsByKey   [room key] -> EVERY IsoRoom carrying that key
---   missingTiles / missingRooms  entries that resolved to nothing
---
--- roomsByKey collects every match rather than the first. The cell's room list
--- holds duplicates - the same duplication the "duplicate RoomDef.metaID"
--- errors report at world load - and each duplicate carries only PART of the
--- room's squares. The old export overwrote into a key->room map and silently
--- kept whichever came last: a 15-square bedroom exported as 2 containers
--- while the highlight looked complete, because the highlight iterated every
--- match and the export did not (devTools.lua's union comment). Union here,
--- once, and neither can drift from the other again.
---
--- @param force boolean|nil bypass the cache; every export path passes true,
---   because the highlight may lag by up to FLATTEN_TICKS and an export never may
local function flatten(force)
    if not force and flatCache then return flatCache end
    local out = {
        squares = {}, entryIndex = {}, byEntry = {},
        roomsByKey = {}, missingTiles = {}, missingRooms = {},
    }
    local cell = getCell()
    -- No cell (main menu, mid-load): report nothing and do NOT cache, or the
    -- empty answer would stand until the next mutation.
    if not cell then return out end

    local byKey = out.roomsByKey
    local rooms = cell:getRoomList()
    -- Java collection: 0-based get(), size(), never # or ipairs
    for i = 0, (rooms and rooms:size() or 0) - 1 do
        local room = rooms:get(i)
        local key = DevShared.roomDefKey(room)
        if key and queueKeys[key] then
            local list = byKey[key]
            if not list then
                list = {}
                byKey[key] = list
            end
            list[#list + 1] = room
        end
    end

    local seen = {}
    local squares, entryIndex = out.squares, out.entryIndex
    for i = 1, #queue do
        local e = queue[i]
        local mine = {}
        out.byEntry[i] = mine
        -- Counted BEFORE the dedupe: an entry whose every square was already
        -- claimed by an earlier entry resolved fine, it just introduced
        -- nothing. Only a zero here means "not streamed".
        local resolved = 0
        local function take(square)
            if not square then return end
            resolved = resolved + 1
            local hash = DWAPUtils.hashCoords(square:getX(), square:getY(), square:getZ())
            if seen[hash] then return end
            seen[hash] = true
            squares[#squares + 1] = square
            entryIndex[#entryIndex + 1] = i
            mine[#mine + 1] = square
        end
        if e.kind == "tile" then
            take(cell:getGridSquare(e.x, e.y, e.z))
        else
            local matches = byKey[e.key]
            for m = 1, matches and #matches or 0 do
                local roomSquares = matches[m]:getSquares()
                for j = 0, (roomSquares and roomSquares:size() or 0) - 1 do
                    take(roomSquares:get(j))
                end
            end
        end
        if resolved == 0 then
            local miss = { index = i, key = e.key, name = e.name }
            if e.kind == "tile" then
                out.missingTiles[#out.missingTiles + 1] = miss
            else
                out.missingRooms[#out.missingRooms + 1] = miss
            end
        end
    end

    flatCache = out
    return out
end

local function queueRemove(key)
    for i = 1, #queue do
        if queue[i].key == key then
            table.remove(queue, i)
            break
        end
    end
    queueKeys[key] = nil
    invalidate()
end

local function queueClear()
    queue = {}
    queueKeys = {}
    invalidate()
end

-- ---------------------------------------------------------------------------
-- Click
-- ---------------------------------------------------------------------------

-- Named function: an anonymous handler could never be removed from the event.
--
-- Takes SCREEN coords, not an object: this rides OnMouseDown and resolves the
-- square itself, through the ground projection at the player's z. No object
-- picker, for the reason the old room picker gives - a room is many tiles wide,
-- so landing a tile off still lands in the right room, and the projection is
-- the same plane the highlight draws on, so what the cursor selects and what
-- lights up agree. Clicking high on a tall wall resolves to the square behind
-- it, so pick from open floor; picking is a toggle and the click logs what it
-- resolved, so a miss is visible and undone by clicking again.
--
-- OnMouseDown rather than OnObjectLeftMouseButtonDown: the object event only
-- fires when UIManager's checkPicked() passes (UIManager.java:597, :832), and
-- the `picked` it tests is a cache refreshed only on frames where no UI element
-- consumed the mouse move (UIManager.java:643) - which this panel does. Clicks
-- vanish with no log line and no error. OnMouseDown (UIManager.java:732) fires
-- on every left press a UI element did not consume, so the panel is still safe
-- to click on.
local function pickerClick(screenX, screenY)
    if not pickerInstance then return end
    -- coords come off the square rather than the projection's wx/wy/z: both
    -- kinds of pick are stored from the square, so a tile key and a room's
    -- squares can never name a different tile to the one that was resolved
    local square = DevShared.devScreenSquare(screenX, screenY)
    if not square then
        DWAPUtils.dprint("DWAP Picker: no square under the cursor")
        return
    end
    local tx, ty, tz = square:getX(), square:getY(), square:getZ()
    local tkey = tilePickKey(tx, ty, tz)
    local room = square:getRoom()
    local rkey = room and DevShared.roomDefKey(room) or nil

    if pickMode == "room" then
        if not rkey then
            -- Outside squares - yards, decks, sheds the mapper never gave a
            -- room def - still hold crates and shelves worth authoring, and
            -- there is no room to take, so take the one tile instead of
            -- refusing. Room mode on roomless ground is a miss otherwise.
            if room then
                DWAPUtils.dprint("DWAP Picker: room has no def, cannot identify it - taking the tile instead")
            end
            if queueKeys[tkey] then
                queueRemove(tkey)
                DWAPUtils.dprint(("DWAP Picker: removed %s (%d picks)"):format(tkey, #queue))
                return
            end
            queueKeys[tkey] = true
            queue[#queue + 1] = { kind = "tile", key = tkey, x = tx, y = ty, z = tz }
            invalidate()
            DWAPUtils.dprint(("DWAP Picker: %d,%d,%d is in no room - added as a single tile (%d picks)"):format(
                tx, ty, tz, #queue))
            return
        end
        if queueKeys[rkey] then
            queueRemove(rkey)
            DWAPUtils.dprint(("DWAP Picker: removed %s (%d picks)"):format(rkey, #queue))
            return
        end
        local def = room:getRoomDef()
        queueKeys[rkey] = true
        queue[#queue + 1] = {
            kind = "room",
            key = rkey, name = room:getName() or "?",
            dx = def:getX(), dy = def:getY(), dz = def:getZ(),
            dw = def:getW(), dh = def:getH(),
        }
        invalidate()
        DWAPUtils.dprint(("DWAP Picker: added %s (%d picks)"):format(rkey, #queue))
        return
    end

    -- Tile mode
    if queueKeys[tkey] then
        queueRemove(tkey)
        DWAPUtils.dprint(("DWAP Picker: removed %s (%d picks)"):format(tkey, #queue))
        return
    end
    queueKeys[tkey] = true
    queue[#queue + 1] = { kind = "tile", key = tkey, x = tx, y = ty, z = tz }
    invalidate()
    if rkey and queueKeys[rkey] then
        -- Deliberately NOT read as "remove the room". Taking a queued room away
        -- on a tile click would be surprising and unrecoverable - one stray
        -- click and a walked room is gone with no undo. flatten() dedupes the
        -- square anyway, so the redundant entry costs nothing but a label.
        DWAPUtils.dprint(("DWAP Picker: added %s, already covered by room %s (%d picks)"):format(
            tkey, rkey, #queue))
        return
    end
    DWAPUtils.dprint(("DWAP Picker: added %s (%d picks)"):format(tkey, #queue))
end

-- ---------------------------------------------------------------------------
-- Highlight
-- ---------------------------------------------------------------------------

local tickCount = 0

-- Plain Events.OnTick, not the devShared shim: OnTick is not one of the events
-- the in-game chunk debugger triggers, so its Lua table is never orphaned
-- (see the DEV_ORPHANABLE_EVENTS comment in devShared.lua). Only OnMouseDown
-- goes through the shim.
local function pickerTick()
    if not pickerInstance then return end
    local player = getPlayer()
    local pSquare = player and player:getCurrentSquare()
    if not pSquare then return end
    local playerNum, playerZ = player:getPlayerNum(), pSquare:getZ()

    tickCount = tickCount + 1
    if tickCount >= FLATTEN_TICKS then
        tickCount = 0
        invalidate()
    end

    local flat = flatten()
    local squares = flat.squares
    for i = 1, #squares do
        local s = squares[i]
        if s:getZ() == playerZ then
            addAreaHighlightForPlayer(playerNum, s:getX(), s:getY(), s:getX() + 1, s:getY() + 1,
                playerZ, 0.9, 0.5, 1, 0.35)
        end
    end

    -- What a click would queue right now, in yellow: the tile under the cursor
    -- in tile mode, its whole room in room mode. Previewing the room matters
    -- more than previewing the tile - a room pick can take dozens of squares,
    -- and the def rect it lands in is not obvious from a doorway.
    --
    -- getMouseX/getMouseY, never the Scaled variants: UIManager.update reads
    -- `int mx = Mouse.getXA()` (UIManager.java:533-534) and hands exactly that
    -- to OnMouseDown (:732), and getMouseX is `return Mouse.getXA()`
    -- (LuaManager.java:6726-6728) while getMouseXScaled is Mouse.getX(). Same
    -- value, same space, so the preview is byte-for-byte what pickerClick would
    -- resolve. Scaled would drift on any non-1.0 UI scale.
    local hover = DevShared.devScreenSquare(getMouseX(), getMouseY())
    if not hover then return end
    local hoverRoom = pickMode == "room" and hover:getRoom() or nil
    -- Room mode over a roomless square falls back to a tile pick, so preview
    -- the tile - the same thing pickerClick would do there.
    if hoverRoom then
        -- Live squares, not the def rect: the rect is a bounding box and an
        -- L-shaped room does not fill it, so drawing the rect would promise
        -- squares the pick will not take.
        local roomSquares = hoverRoom:getSquares()
        for i = 0, (roomSquares and roomSquares:size() or 0) - 1 do
            local s = roomSquares:get(i)
            if s and s:getZ() == playerZ then
                addAreaHighlightForPlayer(playerNum, s:getX(), s:getY(),
                    s:getX() + 1, s:getY() + 1, playerZ, 1, 1, 0, 0.35)
            end
        end
    else
        addAreaHighlightForPlayer(playerNum, hover:getX(), hover:getY(),
            hover:getX() + 1, hover:getY() + 1, playerZ, 1, 1, 0, 0.35)
    end
end

-- One label per queue ENTRY, not per square. Every square highlights the same
-- pink, which loses the old cyan/pink tile-vs-room split, so a tile pick
-- swallowed by a queued room would otherwise be invisible and "why did 12 picks
-- export 40 squares" would have no answer. The label text keeps the colour
-- split even though the highlight no longer does.
local function pickerDraw()
    if not pickerInstance or #queue == 0 then return end
    local player = getPlayer()
    local pSquare = player and player:getCurrentSquare()
    if not pSquare then return end
    local playerNum, playerZ = player:getPlayerNum(), pSquare:getZ()
    local tm = getTextManager()
    for i = 1, #queue do
        local e = queue[i]
        if e.kind == "tile" then
            if e.z == playerZ then
                -- centre of the tile itself
                local sx = isoToScreenX(playerNum, e.x + 0.5, e.y + 0.5, e.z)
                local sy = isoToScreenY(playerNum, e.x + 0.5, e.y + 0.5, e.z)
                local text = ("%d tile"):format(i)
                tm:DrawStringCentre(UIFont.Small, sx + 1, sy + 1, text, 0, 0, 0, 0.8)
                tm:DrawStringCentre(UIFont.Small, sx, sy, text, 0.4, 0.95, 1, 1)
            end
        elseif e.dz == playerZ then
            -- label at the def rect's centre so it does not sit on a wall
            local cx, cy = e.dx + e.dw / 2, e.dy + e.dh / 2
            local sx = isoToScreenX(playerNum, cx, cy, e.dz)
            local sy = isoToScreenY(playerNum, cx, cy, e.dz)
            local text = ("%d %s"):format(i, e.name)
            tm:DrawStringCentre(UIFont.Small, sx + 1, sy + 1, text, 0, 0, 0, 0.8)
            tm:DrawStringCentre(UIFont.Small, sx, sy, text, 0.95, 0.6, 1, 1)
        end
    end
end
-- 50, above the four survey overlays (where 10, container labels 20, barricade
-- 30, plumbing 40) and now the only picker draw - the three old pickers held
-- 50/51/52 and went with them.
DevShared.addOverlayDraw("picker", pickerDraw, 50)

-- ---------------------------------------------------------------------------
-- Export options
-- ---------------------------------------------------------------------------

-- Checklist order is the panel's order. Only "No Config Containers" starts
-- ticked - the common case is "what is here that the config does not have".
local OPTIONS = {
    { key = "explain",   label = "Explain" },
    { key = "plumbing",  label = "Plumbing" },
    { key = "barricade", label = "Barricade" },
    { key = "door",      label = "Door" },
    { key = "noConfig",  label = "No Config Containers", default = true },
    { key = "configd",   label = "Config'd containers" },
    { key = "excluded",  label = "include excluded containers" },
    { key = "baseRoom",  label = "baseRoom" },
}

-- key -> ticked. Lives outside the panel so ticks survive a close/reopen, which
-- is what makes "Close, walk, reopen, carry on" work without re-ticking.
local exportOptions = {}
for i = 1, #OPTIONS do
    exportOptions[OPTIONS[i].key] = OPTIONS[i].default == true
end

-- ---------------------------------------------------------------------------
-- Report sections
-- ---------------------------------------------------------------------------
--
-- Every section sweeps the SAME flatten(true) result, which is the whole point
-- of the rewrite: gathering containers and plumbing for one room used to mean
-- picking that room twice, once per picker.
--
-- Line shapes are lifted verbatim from the exports these replace -
-- DWAPRoomExport, DWAPPlumbExport, DWAPDoorExport and FindUnbarricaded - down
-- to the indentation and the trailing comments. They get pasted straight into a
-- config, so "close enough" is a config that does not parse or, worse, one that
-- parses and addresses the wrong container.
--
-- print() throughout, not dprint(): the dump belongs in console.txt next to the
-- lines it labels, and dprint routes through log(DebugType.Lua) into the
-- DebugLog instead. Only the two "nothing to do" statuses dprint, matching the
-- old exports' early returns.

--- Queue indices that resolved to nothing at all, as a set.
--- flatten counts resolved squares BEFORE the dedupe, so an entry with an empty
--- byEntry list either did not stream or was entirely covered by an earlier
--- pick - two very different answers to "why did my pick export nothing", and
--- this is what tells them apart.
local function missingIndexSet(flat)
    local set = {}
    for i = 1, #flat.missingTiles do set[flat.missingTiles[i].index] = true end
    for i = 1, #flat.missingRooms do set[flat.missingRooms[i].index] = true end
    return set
end

--- The "room, building" tag the survey dumps put in their trailing comments.
local function whereTagFor(square)
    local room = square:getRoom()
    return (room and room:getName() or "outside") .. ", " .. DevShared.bldTag(square:getBuilding())
end

--- "1 room", "2 rooms". The tally line is read as prose, and "1 rooms" reads
--- as a bug in the counter.
local function plural(n, word)
    return ("%d %s%s"):format(n, word, n == 1 and "" or "s")
end

--- Loot entries for every picked container, as ONE table across every pick.
---
--- Entry shape is printLootEntry's, which the deleted DWAPRoomExport also
--- emitted through, so the entries are byte-identical to what the room picker
--- produced for the same square. What differs is the grouping: picks
--- contribute their summary line here and their entries to one shared list,
--- because the destination is a single `loot` table in the config and a table
--- per pick meant a paste per pick.
---
--- No square can contribute twice: flatten() dedupes on the coord hash BEFORE
--- appending to byEntry, so the byEntry lists are disjoint and merging them
--- cannot double-list a container.
local function containerSection(flat, lookup, emitFree, emitClaimed, includeExcluded)
    local scope = {}
    if emitFree then scope[#scope + 1] = "not in config" end
    if emitClaimed then scope[#scope + 1] = "already in config" end
    if includeExcluded then scope[#scope + 1] = "including excluded types" end
    print("")
    print(("--- containers | %s ---"):format(table.concat(scope, ", ")))
    if not lookup then
        print("  no config resolved: every container reads as unclaimed, so nothing "
            .. "can be filtered out as already authored")
    end

    local missing = missingIndexSet(flat)
    local totalFree, totalClaimed, roomCount, tileCount = 0, 0, 0, 0
    -- Every pick's listable containers, in queue order then square order, so
    -- the merged table below is stable between runs of the same picks.
    local rows = {}
    for i = 1, #queue do
        local e = queue[i]
        if e.kind == "tile" then tileCount = tileCount + 1 else roomCount = roomCount + 1 end
        local squares = flat.byEntry[i] or {}
        if missing[i] then
            print(("  %d %s - not streamed right now, walk it to enumerate"):format(i, e.key))
        elseif #squares == 0 then
            -- resolved fine, introduced nothing: an earlier pick already owns
            -- every one of its squares. Silence here reads as a failure.
            print(("  %d %s - every square already listed under an earlier pick"):format(i, e.key))
        else
            local containers = {}
            for s = 1, #squares do
                DevShared.squareLootContainers(squares[s], containers, includeExcluded)
            end
            -- The note's location half. A room pick names its room; a tile pick
            -- asks the square, because tile mode can now be used INSIDE a room
            -- (the old room picker only ever made a tile pick where there was
            -- no room at all, which is why it hardcoded "outside").
            local where = e.name
            if e.kind == "tile" then
                local room = squares[1]:getRoom()
                where = room and room:getName() or "outside"
            end
            -- Collect, do not emit: the summary line carries this pick's
            -- coverage and stays here, the entries all go into `rows`.
            local free, claimed = DevShared.collectPickedContainers(
                containers, where, lookup, emitFree, emitClaimed, rows)
            print(("  %d %s | %d containers: %d listed, %d already in config"):format(
                i, e.key, #containers, free, claimed))
            totalFree = totalFree + free
            totalClaimed = totalClaimed + claimed
        end
    end
    DevShared.emitMergedContainers(rows)
    print(("--- containers TOTAL: %d listed, %d already in config, across %s and %s ---")
        :format(totalFree, totalClaimed, plural(roomCount, "room"), plural(tileCount, "tile")))
end

--- waterTanks / waterFixtures lines, in the shape the deleted DWAPPlumbExport
--- used and FindUnconnectedPlumbing still prints. Squares with no plumbing
--- contribute nothing
--- and say nothing - a room pick sweeps every square in the room, so listing
--- the misses would bury the hits.
local function plumbingSection(flat)
    local tanks, fixtures = {}, {}
    for i = 1, #flat.squares do
        local s = flat.squares[i]
        local objects = s:getObjects()
        local where, x, y, z = nil, s:getX(), s:getY(), s:getZ()
        for j = 0, (objects and objects:size() or 0) - 1 do
            local info = DevShared.plumbingInfo(objects:get(j))
            if info then
                -- resolved lazily: getRoom/getBuilding on every swept square
                -- would cost a room-pick's worth of Java calls for nothing
                where = where or whereTagFor(s)
                local row = { info = info, x = x, y = y, z = z, where = where }
                if info.kind == "tank" then
                    tanks[#tanks + 1] = row
                else
                    fixtures[#fixtures + 1] = row
                end
            end
        end
    end

    print("")
    print(("--- plumbing | %d tank(s), %d fixture(s) ---"):format(#tanks, #fixtures))
    if #tanks > 0 then
        print("    waterTanks = {")
        for i = 1, #tanks do
            local t = tanks[i]
            print(("        { sprite = \"%s\", x = %d, y = %d, z = %d }, -- capacity: %s, current: %s | %s")
                :format(t.info.sprite, t.x, t.y, t.z, tostring(t.info.capacity), tostring(t.info.amount), t.where or ""))
        end
        print("    },")
    end
    if #fixtures > 0 then
        print("    waterFixtures = {")
        for i = 1, #fixtures do
            local f = fixtures[i]
            print(("        { sprite = \"%s\", x = %d, y = %d, z = %d, sourceType=\"tank\", source = wtc, }, -- %s%s")
                :format(f.info.sprite, f.x, f.y, f.z,
                    f.info.isConnected and "CONNECTED already | " or "", f.where or ""))
        end
        print("    },")
    end
    if #tanks == 0 and #fixtures == 0 then
        print("  no tank or fixture on any picked square")
    end
end

--- doorKeys.doors lines, in the deleted DWAPDoorExport's shape. Sprites are read rather
--- than at pick time because clicking a door opens it: an open door cannot
--- report its closed sprite, so the shut name is offered as a comment and never
--- substituted - some map doors ship open by design and there the config has to
--- name what is really on the square.
local function doorSection(flat, config)
    local doors = {}
    for i = 1, #flat.squares do
        local square = flat.squares[i]
        local door = DevShared.doorOnSquare(square)
        if door then doors[#doors + 1] = { square = square, door = door } end
    end

    print("")
    print(("--- doorKeys.doors | %d door(s) ---"):format(#doors))
    if #doors == 0 then
        print("  no door on any picked square")
        return
    end

    local open, orphans = 0, 0
    local buildings, buildingOrder = {}, {}
    for i = 1, #doors do
        local square, door = doors[i].square, doors[i].door
        -- the sprite that is actually on the square, with the shut name
        -- offered alongside when the door is open
        local sprite = door.getSpriteName and door:getSpriteName() or "?"
        local shut = DevShared.shutDoorSpriteHint(door)
        -- double-quoted deliberately: the balance checker strips only
        -- double-quoted strings before splitting lines on "--", so a
        -- literal "--" inside a single-quoted string swallows the rest of
        -- the line and reports phantom paren drift
        local hint = shut and ("  -- OPEN; shut sprite would be \"%s\""):format(shut) or ""
        print(("            { sprite = \"%s\", x = %d, y = %d, z = %d, },%s"):format(
            sprite, square:getX(), square:getY(), square:getZ(), hint))
        -- Each entry keys its door's BUILDING def, so a base needs one per
        -- physical building - a basement with its own outside entrance is a
        -- separate def and never gets keyed without a door of its own.
        -- Tally them so a missed building is obvious from the export.
        local doorSquare = door.getSquare and door:getSquare() or square
        local building = doorSquare and doorSquare:getBuilding()
        local def = building and building.getDef and building:getDef()
        local defId = def and def.getID and def:getID()
        if not building then
            -- BaseKeys only reaches def:setKeyId when square:getBuilding()
            -- resolves; a door on an exterior wall square can miss and fall
            -- to the branch that keys loose objects instead, so this entry
            -- contributes nothing to the building key
            orphans = orphans + 1
            print("            -- ^ square resolves NO building: this door will not set a building key")
        else
            local bkey = defId and tostring(defId) or ("session " .. building:getID())
            if not buildings[bkey] then
                buildings[bkey] = 0
                buildingOrder[#buildingOrder + 1] = bkey
            end
            buildings[bkey] = buildings[bkey] + 1
        end
        if shut then open = open + 1 end
    end
    if open > 0 then
        print(("Door pick: %d of %d are open - keep that sprite if the map ships them open, "
            .. "otherwise swap in the shut name on the line"):format(open, #doors))
    end
    -- distinct building defs covered, against the config's own baseBuildings
    local parts = {}
    for i = 1, #buildingOrder do
        parts[#parts + 1] = ("%s x%d"):format(buildingOrder[i], buildings[buildingOrder[i]])
    end
    if orphans > 0 then
        print(("Door pick: %d door(s) sit on squares with no building - those entries cannot "
            .. "set a building key, which is what the spare doors have been compensating for"):format(orphans))
    end
    local anchors = config and config.baseBuildings and #config.baseBuildings or 0
    print(("Door pick: %d distinct building(s) keyed [%s]; config lists %d baseBuildings"):format(
        #buildingOrder, table.concat(parts, ", "), anchors))
    if anchors > #buildingOrder then
        print("Door pick: fewer buildings than anchors - a building with no door of its own "
            .. "never gets its key set (basements with an outside entrance are the usual one)")
    end
end

--- objectSpawns barricade lines, FindUnbarricaded's shape, scoped to the picked
--- squares instead of a building footprint.
---
--- Three things this has to get right, all of which the footprint scan solved
--- by scanning a whole building and none of which survive being scoped to a
--- square list:
---
---  * PZ stores only NORTH and WEST walls, so a square's SOUTH and EAST
---    openings are objects on the square one step in +y and +x. Scanning only
---    the picked squares would silently drop half of every room's shell.
---    FindUnbarricaded widens its bounds by a tile for exactly this; here the
---    +x/+y neighbours are scanned and the opening is kept only when the side
---    it belongs to is itself picked, which is what stops the widening from
---    dragging in the neighbour's shell.
---  * 42.20 merges window frames into the wall as an overlay, so they never
---    appear in getObjects(). DevShared.barricadeCandidatesOnSquare carries the
---    getWindowFrame/getWindow fallback that finds them.
---  * A ROOM entry means "this room's exterior", so its openings go through
---    the shell rule: isExteriorOpening (exactly one side roomed), and the
---    roomed side owns the opening and must itself be picked. An opening whose
---    room side was never picked is counted and reported rather than left as a
---    mystery. A TILE entry is the opposite - it names one exact square, so
---    the user has already said which opening they mean, and the
---    isExteriorOpening/roomed-side test is skipped entirely: interior doors
---    and fences between two roomless squares are in scope whenever either
---    side of the opening is a tile entry.
---    Note this keys off the ENTRY kind, not the mode the click was made in.
---    Room mode on a roomless square already falls back to a tile entry (see
---    pickerClick), so clicking a yard square in Room mode gets the relaxed
---    treatment - which is the wanted answer, since that click selected one
---    square and nothing else could have been meant by it.
local function barricadeSection(flat)
    local picked = {}
    for i = 1, #flat.squares do
        local s = flat.squares[i]
        picked[DevShared.coordKey(s:getX(), s:getY(), s:getZ())] = true
    end

    -- From the QUEUE, not flat.entryIndex - flatten dedupes with first-entry-
    -- wins, so a tile picked inside an already-queued room resolves to the
    -- room's entry index and would otherwise never get the relaxation below.
    local tilePicked = {}
    for i = 1, #queue do
        local e = queue[i]
        if e.kind == "tile" then
            tilePicked[DevShared.coordKey(e.x, e.y, e.z)] = true
        end
    end

    local unbarricaded, barricaded = {}, {}
    local blocked, skippedInterior, skippedGarage, skippedUnpicked, tileRelaxed = 0, 0, 0, 0, 0
    local seen = {}

    -- Props.lua matches its target by sprite name against the square's object
    -- list, so the coordinates dumped are the SCANNED square's - which for a
    -- south/east opening is the neighbour, where the object really lives
    local function record(obj, square)
        local btype = DevShared.barricadeableType(obj)
        if not btype then return end
        local sprite = obj:getSpriteName() or ""
        local facing = obj:getNorth() and "N" or "W"
        local x, y, z = square:getX(), square:getY(), square:getZ()
        local key = ("%d,%d,%d,%s,%s"):format(x, y, z, sprite, facing)
        if seen[key] then return end
        seen[key] = true
        if DevShared.isGarageOpening(sprite) then
            skippedGarage = skippedGarage + 1
            return
        end
        -- Testing the square the object happens to sit on instead of near/far
        -- would drop every south/east opening, whose object lives on the
        -- unroomed outside square
        local near = obj:getSquare()
        local far = obj.getOppositeSquare and obj:getOppositeSquare()
        local nearKey = near and DevShared.coordKey(near:getX(), near:getY(), near:getZ())
        local farKey = far and DevShared.coordKey(far:getX(), far:getY(), far:getZ())
        local nearIsTilePick = nearKey and tilePicked[nearKey]
        local farIsTilePick = farKey and tilePicked[farKey]
        local inside
        local relaxed = false
        if nearIsTilePick or farIsTilePick then
            -- A tile pick names one exact square, interior or exterior, so the
            -- roomed-side rule below does not apply - attribute the opening to
            -- whichever side was actually tile-picked
            inside = nearIsTilePick and near or far
            relaxed = true
        else
            if not DevShared.isExteriorOpening(obj) then
                skippedInterior = skippedInterior + 1
                return
            end
            -- Exactly one side is roomed (isExteriorOpening guarantees it):
            -- that side owns the opening
            inside = (near and near:getRoom()) and near or far
            if not inside
                or not picked[DevShared.coordKey(inside:getX(), inside:getY(), inside:getZ())] then
                -- the neighbour scan reached an opening whose room side was
                -- never picked; keeping it would export the neighbour's shell
                skippedUnpicked = skippedUnpicked + 1
                return
            end
        end
        local insideBuilding = inside:getBuilding()
        local room = inside:getRoom()
        local whereTag = (room and room:getName() or "outside") .. ", " .. DevShared.bldTag(insideBuilding)
        if not obj:isBarricadeAllowed() then
            blocked = blocked + 1
            return
        end
        -- counted here rather than in the branch above, so the reported number
        -- is what the relaxation actually put in the dump: the interior/garage
        -- skips return, but `blocked` is checked after both branches and would
        -- otherwise be counted twice
        if relaxed then tileRelaxed = tileRelaxed + 1 end
        local entry = {
            sprite = sprite, x = x, y = y, z = z,
            kind = btype.kind, facing = facing, where = whereTag,
        }
        if obj:isBarricaded() then
            barricaded[#barricaded + 1] = entry
        else
            unbarricaded[#unbarricaded + 1] = entry
        end
    end

    for i = 1, #flat.squares do
        local s = flat.squares[i]
        local x, y, z = s:getX(), s:getY(), s:getZ()
        DevShared.barricadeCandidatesOnSquare(s, record)
        DevShared.barricadeCandidatesOnSquare(getSquare(x + 1, y, z), record)
        DevShared.barricadeCandidatesOnSquare(getSquare(x, y + 1, z), record)
    end

    print("")
    print(("--- objectSpawns barricades | %d unbarricaded, %d already barricaded ---"):format(
        #unbarricaded, #barricaded))
    if #unbarricaded > 0 then
        print("    objectSpawns = {")
        for i = 1, #unbarricaded do
            local o = unbarricaded[i]
            print(("        { barricade = \"woodhalf\", enabled = \"Barricade\", target=\"%s\", x = %d, y = %d, z = %d, }, -- %s %s | %s")
                :format(o.sprite, o.x, o.y, o.z, o.kind, o.facing, o.where or ""))
        end
        print("    },")
        print("  barricade = wood | woodhalf | metal | metalbar (nothing else is applied)")
    else
        print("  no unbarricaded opening on the picked squares")
    end
    -- Live state, so anything the mod already barricaded reads as done and
    -- drops out of the block above
    for i = 1, #barricaded do
        local o = barricaded[i]
        print(("  already barricaded: %s %s at %d,%d,%d (%s) -- %s"):format(
            o.kind, o.facing, o.x, o.y, o.z, o.sprite, o.where or ""))
    end
    print(("  skipped: %d interior (room both sides), %d garage (barricades do not stick), "
        .. "%d barricading not allowed"):format(skippedInterior, skippedGarage, blocked))
    if tileRelaxed > 0 then
        print(("  %d opening(s) included by tile pick (interior/exterior check skipped)")
            :format(tileRelaxed))
    end
    if skippedUnpicked > 0 then
        print(("  skipped: %d opening(s) whose ROOM side is not picked. A room pick attributes "
            .. "an opening to its roomed side, so picking the yard tile outside a wall via ROOM "
            .. "mode attributes it to the room within - pick from inside the room, or tile-pick "
            .. "either square directly to export interior or roomless openings"):format(skippedUnpicked))
    end
end

--- Paste-ready baseRooms block, resolved from the picked SQUARES rather than
--- from room picks, so a tile pick inside a room still contributes its room.
---
--- Anchors take the picked square closest to the def rect's centre rather than
--- squares:get(0) as the old export did: get(0) is whichever square streamed
--- first and on an L-shaped room can sit in a wall.
---
--- Squares that resolve to no room are excluded and counted. baseRoomKeys
--- resolves every anchor through square:getRoom(), so a roomless anchor is a
--- broken baseRooms entry for the life of the config, not a harmless one.
local function baseRoomSection(flat)
    local byKey, order, roomless = {}, {}, 0
    for i = 1, #flat.squares do
        local s = flat.squares[i]
        local room = s:getRoom()
        local key = room and DevShared.roomDefKey(room)
        if not key then
            roomless = roomless + 1
        else
            local rec = byKey[key]
            if not rec then
                local def = room:getRoomDef()
                rec = {
                    key = key, name = room:getName() or "?",
                    cx = def:getX() + def:getW() / 2,
                    cy = def:getY() + def:getH() / 2,
                }
                byKey[key] = rec
                order[#order + 1] = rec
            end
            -- +0.5 puts the comparison at the tile's centre, same convention
            -- the overlay labels use, so a 1-wide room does not bias to a corner
            local dx = s:getX() + 0.5 - rec.cx
            local dy = s:getY() + 0.5 - rec.cy
            local d = dx * dx + dy * dy
            if not rec.dist or d < rec.dist then
                rec.dist, rec.anchor = d, s
            end
        end
    end

    print("")
    if #order == 0 and #flat.missingRooms == 0 then
        print("=== baseRooms: nothing to emit, no picked square resolves to a room ===")
        return
    end
    print("=== baseRooms (paste into the config next to baseBuildings) ===")
    print("    baseRooms = {")
    for i = 1, #order do
        local rec = order[i]
        print(("        { x = %d, y = %d, z = %d }, -- %s"):format(
            rec.anchor:getX(), rec.anchor:getY(), rec.anchor:getZ(), rec.name))
    end
    -- A room that was picked but never walked has no square to anchor on. It
    -- stays in the block as a comment rather than being dropped, so a
    -- half-walked base cannot quietly export a subset of its rooms.
    for i = 1, #flat.missingRooms do
        print(("        -- %s: not streamed, walk it and export again"):format(
            flat.missingRooms[i].key))
    end
    print("    },")
    if #flat.missingRooms > 0 then
        print(("  %d room(s) had no streamed square - those lines are comments, not anchors")
            :format(#flat.missingRooms))
    end
    if roomless > 0 then
        print(("  %d picked square(s) are in no room and are NOT anchors - baseRoomKeys "
            .. "resolves anchors through square:getRoom(), so a roomless one never matches")
            :format(roomless))
    end
end

--- DWAPExplainSquare's container half, per picked square. Verbose by design and
--- listed last for that reason: it is several lines per square and a room pick
--- is dozens of squares.
local function explainSection(flat)
    print("")
    print(("--- explain | %d square(s) ---"):format(#flat.squares))
    for i = 1, #flat.squares do
        local s = flat.squares[i]
        print(("  === %d,%d,%d (pick %d) ==="):format(
            s:getX(), s:getY(), s:getZ(), flat.entryIndex[i]))
        DevShared.explainSquareContainers(s)
    end
end

--- Run every ticked report over one forced flatten.
local function pickerExport()
    if #queue == 0 then
        DWAPUtils.dprint("DWAP Picker: nothing picked")
        return
    end
    local ticked = {}
    for i = 1, #OPTIONS do
        if exportOptions[OPTIONS[i].key] then
            ticked[#ticked + 1] = OPTIONS[i].label
        end
    end
    if #ticked == 0 then
        DWAPUtils.dprint("DWAP Picker: nothing ticked - tick at least one report, nothing exported")
        return
    end
    -- force: the highlight is allowed to be up to FLATTEN_TICKS stale, an
    -- export never is
    local flat = flatten(true)

    -- The nearest config is resolved and its lookup built ALWAYS, not only when
    -- an index was passed in as DWAPRoomExport did. That optional path left
    -- isClaimed falsy for every container, which would make both container
    -- checkboxes describe the same set and "Config'd containers" silently emit
    -- nothing extra.
    local index = DWAPNearestConfig(true)
    local configs = DWAPUtils.loadConfigs(true)
    local config = index and configs and configs[index] or nil
    local lookup = config and DevShared.buildContainerLookup(config) or nil

    DevShared.exportHeader("DWAP PICKER", (" | %d pick(s) -> %d square(s) | %s"):format(
        #queue, #flat.squares, table.concat(ticked, ", ")))
    -- A half-walked base has to say so rather than quietly exporting a fraction
    -- of itself.
    for i = 1, #flat.missingTiles do
        print(("  NOT STREAMED tile: %d %s - walk it and export again"):format(
            flat.missingTiles[i].index, flat.missingTiles[i].key))
    end
    for i = 1, #flat.missingRooms do
        print(("  NOT STREAMED room: %d %s - walk it and export again"):format(
            flat.missingRooms[i].index, flat.missingRooms[i].key))
    end

    local emitFree = exportOptions.noConfig == true
    local emitClaimed = exportOptions.configd == true
    if emitFree or emitClaimed then
        containerSection(flat, lookup, emitFree, emitClaimed, exportOptions.excluded == true)
    elseif exportOptions.excluded then
        -- "include excluded" widens the container list, it does not produce one
        print("")
        print("--- containers: 'include excluded containers' is a modifier - tick "
            .. "'No Config Containers' or \"Config'd containers\" as well ---")
    end
    if exportOptions.plumbing then plumbingSection(flat) end
    if exportOptions.door then doorSection(flat, config) end
    if exportOptions.barricade then barricadeSection(flat) end
    if exportOptions.baseRoom then baseRoomSection(flat) end
    -- last: several lines per square, so it would push everything else out of
    -- the console scrollback on a room pick
    if exportOptions.explain then explainSection(flat) end

    print("")
    print(("=== end of picker export (%d not streamed) ==="):format(
        #flat.missingTiles + #flat.missingRooms))
end

-- ---------------------------------------------------------------------------
-- DWAPExplainSquare
-- ---------------------------------------------------------------------------

--- Why did a square not reach the export?
---
--- Console command, unchanged signature: DWAPExplainSquare(8082, 11560, 2)
---
--- It lives here rather than in devTools.lua because its first half is a
--- question about the PICK QUEUE, and the queue is file-local to this module.
--- The three questions it used to ask - is this room key picked, is this tile
--- key picked, is the square in a picked room's getSquares() - had three
--- separate enumerations behind them and could disagree with each other. There
--- is one enumeration now (flatten), so the questions collapse into: is the
--- square in the flattened set, and if not, which step lost it?
---
---   * in the flattened set, and which queue entry introduced it
---   * else: is its room key queued, but the square in no matching IsoRoom's
---     getSquares() - the room is queued and this part of it has not streamed
---   * else: is it queued as a tile flatten could not resolve
---
--- Squares are matched on the coord hash, never on identity: streamed IsoObject
--- and IsoGridSquare instances are recreated as chunks come and go, so == would
--- answer false for the same tile.
---
--- Everything below the pick state - the object list, the specialObjects dump,
--- the container verdicts and the nearest-config line - is unchanged, the last
--- three of them because they are DevShared.explainSquareContainers, which the
--- Explain checkbox above also drives.
function DWAPExplainSquare(x, y, z)
    local cell = getCell()
    local square = cell and cell:getGridSquare(x, y, z)
    if not square then
        print(("DWAPExplain %d,%d,%d: square not loaded"):format(x, y, z))
        return
    end
    print(("=== DWAPExplain %d,%d,%d ==="):format(x, y, z))

    local room = square:getRoom()
    local key = room and DevShared.roomDefKey(room)
    print(("  room: %s   key: %s"):format(
        room and (room:getName() or "?") or "NONE", tostring(key)))

    -- force: the highlight is allowed to be up to FLATTEN_TICKS stale and this
    -- is being asked precisely because something looks wrong, so it answers
    -- against the set an export would produce right now
    local flat = flatten(true)
    local hash = DWAPUtils.hashCoords(x, y, z)
    local at = nil
    for i = 1, #flat.squares do
        local s = flat.squares[i]
        if DWAPUtils.hashCoords(s:getX(), s:getY(), s:getZ()) == hash then
            at = i
            break
        end
    end

    local tkey = tilePickKey(x, y, z)
    if at then
        local entry = queue[flat.entryIndex[at]]
        print(("  in the flattened set: YES - introduced by pick %d (%s) %s"):format(
            flat.entryIndex[at], entry.kind, entry.key))
        -- a tile pick swallowed by a queued room is deduped away, and the
        -- entry above names the room, so say the tile entry exists too
        if entry.kind ~= "tile" and queueKeys[tkey] then
            print(("    a tile pick %s is also queued, and was deduped into the pick above"):format(tkey))
        end
    else
        print(("  in the flattened set: NO - %d pick(s) resolve to %d square(s), none of them this one")
            :format(#queue, #flat.squares))
        if key and queueKeys[key] then
            -- Its room IS queued. flatten collects EVERY IsoRoom carrying the
            -- key, because the cell's room list holds duplicates that each hold
            -- part of the room, so this counts across all of them.
            local matches = flat.roomsByKey[key]
            local held = 0
            for m = 1, matches and #matches or 0 do
                local roomSquares = matches[m]:getSquares()
                held = held + (roomSquares and roomSquares:size() or 0)
            end
            print(("    its room IS queued: %d IsoRoom(s) carry %s, holding %d square(s) between "
                .. "them, and this square is in none of them - that part of the room has not "
                .. "streamed, walk it and ask again"):format(matches and #matches or 0, key, held))
        elseif key then
            print(("    its room is NOT queued (%s), so nothing would sweep this square unless "
                .. "it were picked as a tile"):format(key))
        else
            print("    the square is in no room, so only a tile pick could ever reach it")
        end
        if queueKeys[tkey] then
            -- flatten resolves tile entries with cell:getGridSquare, which is
            -- what answered this square at the top, so the two disagreeing is
            -- worth saying out loud rather than glossing
            print(("    a tile pick %s IS queued but flatten did not resolve it - "
                .. "cell:getGridSquare answered nil for those coords during the sweep, "
                .. "which contradicts the square this command just resolved"):format(tkey))
        else
            print(("    no tile pick at %s either"):format(tkey))
        end
    end

    local objects = square:getObjects()
    print(("  objects on square: %d"):format(objects and objects:size() or 0))
    for i = 0, (objects and objects:size() or 0) - 1 do
        local obj = objects:get(i)
        local n = obj.getContainerCount and obj:getContainerCount() or 0
        print(("    [%d] %s  containerCount=%d  getContainer=%s"):format(
            i, tostring(obj:getSpriteName()), n,
            obj:getContainer() and tostring(obj:getContainer():getType()) or "nil"))
    end
    -- specialObjects are NOT in getObjects(), and getSquareContainers only walks
    -- getObjects() - so a container living here is invisible to the whole chain.
    local specials = square.getSpecialObjects and square:getSpecialObjects()
    if specials and specials:size() > 0 then
        print(("  specialObjects: %d (NOT scanned by getSquareContainers)"):format(specials:size()))
        for i = 0, specials:size() - 1 do
            local o = specials:get(i)
            print(("    [s%d] %s  container=%s"):format(i, tostring(o:getSpriteName()),
                o.getContainer and o:getContainer() and tostring(o:getContainer():getType()) or "nil"))
        end
    end

    -- Everything from here down - the container list, why each reads high, the
    -- skip-list verdicts and the nearest-config check - lives in devShared so
    -- the picker's Explain checkbox prints the identical thing per queued
    -- square. Same output, one copy.
    DevShared.explainSquareContainers(square)
end

-- ---------------------------------------------------------------------------
-- Panel
-- ---------------------------------------------------------------------------

-- Same convention as devPanel.lua: state lives in the background colour, dark
-- enough that the white label still reads. Off values are ISButton's defaults.
local BTN_ON       = { r = 0.13, g = 0.42, b = 0.15 }
local BTN_ON_OVER  = { r = 0.20, g = 0.60, b = 0.22 }
local BTN_OFF      = { r = 0.00, g = 0.00, b = 0.00 }
local BTN_OFF_OVER = { r = 0.30, g = 0.30, b = 0.30 }

DWAPPickerUI = ISCollapsableWindow:derive("DWAPPickerUI")

function DWAPPickerUI:addPairRow(y, pad, rowH, left, right)
    local halfW = math.floor((self.width - pad * 3) / 2)
    local halves = { left, right }
    local made = {}
    for j = 1, 2 do
        local half = halves[j]
        local btn = ISButton:new(pad + (j - 1) * (halfW + pad), y, halfW, rowH, half.label, self, function()
            half.fn()
        end)
        btn:initialise()
        self:addChild(btn)
        made[j] = btn
    end
    return made
end

function DWAPPickerUI:createChildren()
    ISCollapsableWindow.createChildren(self)
    local pad = 6
    local rowH = 22
    local lineH = getTextManager():getFontHeight(UIFont.Small)
    if not lineH or lineH <= 0 then lineH = 14 end
    self.infoLineH = lineH
    self.infoTop = self:titleBarHeight() + pad
    -- picks->squares, the z the projection uses, and the not-streamed line
    self.infoLineCount = 3
    local y = self.infoTop + self.infoLineCount * lineH + pad

    local modeButtons = self:addPairRow(y, pad, rowH,
        { label = "Tile", fn = function() DWAPPickerSetMode("tile") end },
        { label = "Room", fn = function() DWAPPickerSetMode("room") end })
    self.modeButtons = { { btn = modeButtons[1], mode = "tile" }, { btn = modeButtons[2], mode = "room" } }
    y = y + rowH + 4

    -- ISTickBox's height argument is the BOX size, not the widget height, and
    -- addOption recomputes the widget height itself from the option count -
    -- so the rows below can only be placed after reading getHeight() back.
    local tick = ISTickBox:new(pad, y, self.width - pad * 2, 12, "pickerOptions",
        self, DWAPPickerUI.onOptionTicked)
    tick:initialise()
    -- flush against the panel rather than a second dark box inside it
    tick.background = false
    for i = 1, #self.optionDefs do
        tick:addOption(self.optionDefs[i].label)
        tick:setSelected(i, exportOptions[self.optionDefs[i].key] and true or false)
    end
    self:addChild(tick)
    self.tickBox = tick
    y = y + tick:getHeight() + pad

    self:addPairRow(y, pad, rowH,
        { label = "Export + Clear", fn = function()
            pickerExport()
            queueClear()
            DWAPUtils.dprint("DWAP Picker: exported and cleared - still picking")
        end },
        { label = "Export + Close", fn = function()
            pickerExport()
            queueClear()
            self:close()
        end })
    y = y + rowH + 4

    self:addPairRow(y, pad, rowH,
        { label = "Clear", fn = function()
            local held = #queue
            queueClear()
            DWAPUtils.dprint(("DWAP Picker: cleared %d pick(s) - still picking"):format(held))
        end },
        -- The only button that KEEPS the queue, matching the old pickers'
        -- "N picks still held" on toggle-off: get the panel out of the way,
        -- walk somewhere, reopen and carry on. close() prints the held count so
        -- a surviving queue is never a surprise on reopen.
        { label = "Close", fn = function() self:close() end })
    y = y + rowH + 4

    self:setHeight(y + pad)
end

--- ISTickBox callback: method(target, index, selected, arg1, arg2, tickbox),
--- and target is self, so the colon form lines up exactly.
function DWAPPickerUI:onOptionTicked(index, selected)
    local def = self.optionDefs and self.optionDefs[index]
    if not def then return end
    exportOptions[def.key] = selected and true or false
    DWAPUtils.dprint(("DWAP Picker: %s %s"):format(def.label, selected and "ON" or "off"))
end

function DWAPPickerUI:refreshModeColors()
    if not self.modeButtons then return end
    for i = 1, #self.modeButtons do
        local entry = self.modeButtons[i]
        local lit = pickMode == entry.mode
        if lit ~= entry.lit then
            entry.lit = lit
            local bg = lit and BTN_ON or BTN_OFF
            local over = lit and BTN_ON_OVER or BTN_OFF_OVER
            entry.btn:setBackgroundRGBA(bg.r, bg.g, bg.b, 1)
            entry.btn:setBackgroundColorMouseOverRGBA(over.r, over.g, over.b, 1)
        end
    end
end

function DWAPPickerUI:render()
    ISCollapsableWindow.render(self)
    self:refreshModeColors()
    local now = getTimestampMs()
    -- Same once-a-second throttle devPanel uses: flatten walks the cell's room
    -- list, which is not something to do every frame.
    if now - (self.lastInfoUpdate or 0) >= 1000 then
        self.lastInfoUpdate = now
        local flat = flatten()
        local lines = {}
        lines[1] = ("%d picks -> %d squares"):format(#queue, #flat.squares)
        local player = getPlayer()
        local square = player and player:getCurrentSquare()
        -- The projection is at the PLAYER's z, so picks land on the floor you
        -- are standing on - say which one rather than making that a surprise.
        lines[2] = "picking on z = " .. tostring(square and square:getZ() or "?")
        local missing = #flat.missingTiles + #flat.missingRooms
        lines[3] = missing > 0
            and ("%d pick(s) not streamed - walk them"):format(missing)
            or ""
        self.infoLines = lines
    end
    if self.infoLines then
        local pad = 6
        for i = 1, #self.infoLines do
            local ly = self.infoTop + (i - 1) * self.infoLineH
            -- same style as the person overlay: white with a dark shadow
            self:drawText(self.infoLines[i], pad + 1, ly + 1, 0, 0, 0, 0.8, UIFont.Small)
            self:drawText(self.infoLines[i], pad, ly, 1, 1, 1, 1, UIFont.Small)
        end
    end
end

--- The one shutdown path. ISCollapsableWindow:close() only calls
--- setVisible(false) (ISCollapsableWindow.lua:134), which would leave the
--- picker registered on OnMouseDown and eating world clicks behind an
--- invisible window. The title-bar X calls self:close()
--- (ISCollapsableWindow.lua:55) and so do both Close paths, so all three route
--- through here and cannot drift apart.
function DWAPPickerUI:close()
    self:removeFromUIManager()
    pickerInstance = nil
    DevShared.eventRemove("OnMouseDown", pickerClick)
    Events.OnTick.Remove(pickerTick)
    if DWAP_DevToggles then DWAP_DevToggles.picker = false end
    DWAPUtils.dprint(("DWAP Picker: OFF (%d pick(s) still held - reopen to carry on)"):format(#queue))
end

--- Console-settable too, and what the two mode buttons call.
function DWAPPickerSetMode(mode)
    if mode ~= "tile" and mode ~= "room" then
        DWAPUtils.dprint('DWAP Picker: mode must be "tile" or "room"')
        return
    end
    pickMode = mode
    DWAPUtils.dprint(("DWAP Picker: mode = %s"):format(mode))
end

--- Toggle the picker panel. Called from the console and from the dev panel's
--- DWAP Picker button, which reads DWAP_DevToggles.picker for its lit state.
---
--- No mutual exclusion left to do: the plumb, room and door pickers were the
--- other three claimants of the left mouse button and all three are gone, so
--- this is the only thing registered on OnMouseDown.
function DWAPPicker()
    -- devTools.lua creates this table at its own file scope, and it sorts after
    -- this file, so the toggle has to tolerate being the first to touch it. By
    -- the time anything CALLS this, devTools has loaded.
    DWAP_DevToggles = DWAP_DevToggles or {}
    if pickerInstance then
        pickerInstance:close()
        return
    end

    local panel = DWAPPickerUI:new(getCore():getScreenWidth() - 540, 100, 260, 40)
    -- Defs before addToUIManager(), which is the real deadline: initialise()
    -- only allocates bookkeeping (ISUIElement.lua:13-20), and createChildren
    -- runs from instantiate(), reached from addToUIManager() when javaObject is
    -- still nil (ISUIElement.lua:1365-1368, :993-1007). Assigning after
    -- initialise() would look fine and still leave createChildren indexing a nil
    -- optionDefs.
    panel.optionDefs = OPTIONS
    panel:initialise()
    panel:setTitle("DWAP Picker")
    panel:setResizable(false)
    panel:addToUIManager()
    pickerInstance = panel
    DWAP_DevToggles.picker = true

    DevShared.eventRemove("OnMouseDown", pickerClick)
    DevShared.eventAdd("OnMouseDown", pickerClick)
    Events.OnTick.Remove(pickerTick)
    Events.OnTick.Add(pickerTick)
    -- without this there is no render hook, so the labels stay invisible
    ensureDevOverlay()
    invalidate()
    DWAPUtils.dprint(("DWAP Picker: ON - mode %s, %d pick(s) held"):format(pickMode, #queue))
end
