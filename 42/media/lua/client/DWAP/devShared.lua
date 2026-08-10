-- Dev tooling shared between devTools.lua and the pickers: the event shim, the
-- world-pinned overlay, and the container/plumbing/barricade helpers that more
-- than one dev file needs.
--
-- Inert outside debug mode, like every other dev file: the getDebug() gate is
-- FIRST, before the require, so nothing below it runs for a normal player.
-- Living under client/ is a convention signal, not a gate - LoadDirBase("client")
-- runs for every client and only that getDebug() line stops this file.
--
-- Reached with require() rather than by load order. devTools.lua sorts after
-- devPanel.lua and devPicker.lua, so file-scope order cannot be relied on, but
-- require does not care: it resolves the name against LuaManager.paths and calls
-- RunLua (LuaManager.java:4917-4934), and RunLuaInternal returns the memoised
-- value when `loaded.contains(filename)` (LuaManager.java:1344-1345). The module
-- body therefore executes exactly once, at whichever file reaches it first, and
-- every requirer gets the identical table.
--
-- That single-instance property is what the event shim below depends on: its
-- capture of Events[name] has to happen ONCE, at boot, before anything can have
-- orphaned the Lua entry. A second copy of the shim would hold a second capture
-- registry, DWAPCheckEvents would only ever report one of them, and handlers
-- registered through the other would be invisible to it.
if not getDebug() then return end

local DWAPUtils = require("DWAPUtils")

local M = {}

-- Loud rather than silent if this file is ever executed twice - a copy-pasted
-- shim, or a second module wrapping the same code. See the header: two capture
-- registries is exactly the failure the single-instance guarantee prevents.
if DWAP_DevEventShimLoaded then
    print("DWAP devShared: executed twice - two capture registries, DWAPCheckEvents can only see one of them")
end
DWAP_DevEventShimLoaded = true

-- Event registration that survives a visit to the in-game chunk debugger.
--
-- DebugChunkState.saveGameUI (DebugChunkState.java:472-473) snapshots the event
-- registry and installs EMPTY containers:
--     LuaEventManager.getEvents(this.eventList, this.eventMap);
--     LuaEventManager.setEvents(new ArrayList<>(), new HashMap<>());
-- With EventMap empty, the debugger's own input triggers miss in
-- LuaEventManager.checkEvent (LuaEventManager.java:214-219), which prints
-- `LuaEventManager: adding unknown event "OnMouseDown"` and calls AddEvent
-- (:559-575). AddEvent builds a NEW Event and calls Event.register, whose last
-- act is `environment.rawset(this.name, table)` (Event.java:79-84) - it
-- OVERWRITES Events.OnMouseDown in the Lua environment with a table whose
-- Add/Remove close over that throwaway Event. restoreGameUI
-- (DebugChunkState.java:476-487) puts the original Event objects back into
-- EventMap, and nothing ever puts the original table back into Lua.
--
-- From then on Events.OnMouseDown.Add(fn) appends to an Event that
-- triggerEvent never reaches, because dispatch looks the name up in EventMap
-- and gets the original. No error, no warning, permanent until the Lua state is
-- rebuilt by a world reload. Symptom: a picker toggles ON, prints its ON line,
-- and then clicks do nothing - not even its own "no square under the cursor"
-- miss path.
--
-- The fix: capture the live table ONCE here. File scope runs during
-- LuaManager.LoadDirBase at boot, when the entry is still the registry's own,
-- and the restored snapshot always contains that original Event - so a
-- boot-time reference stays correct across any number of debugger visits.
--
-- Only the events the debugger triggers are affected: OnMouseDown, OnMouseUp,
-- OnMouseMove, OnObjectLeftMouseButtonDown, OnObjectLeftMouseButtonUp,
-- OnKeyPressed, OnKeyStartPressed, OnKeyKeepPressed, OnPreUIDraw,
-- OnPostUIDraw, OnRenderTick, OnCustomUIKey, OnCustomUIKeyReleased,
-- RenderOpaqueObjectsInWorld. OnTick is NOT among them, which is why the room
-- picker's highlight kept working while its clicks were dead - that asymmetry
-- is the fingerprint. OnTick registrations here are deliberately left direct.
--
-- Of that set this file only ever registers OnMouseDown (the three pickers).
local DEV_ORPHANABLE_EVENTS = { "OnMouseDown" }
-- name -> the Events[name] table as it was at file load
local devEventTables = {}
-- name -> the replacement table already reported, so each orphaning prints once
local devEventOrphan = {}
-- name -> set of our handlers currently registered, for DWAPCheckEvents
local devEventHandlers = {}
-- capture order, so DWAPCheckEvents can report without a fixed list
local devEventNames = {}

--- Memoise Events[name] as it stands right now. Safe when the event does not
--- exist: returns nil and the callers degrade to a printed complaint.
--- @param name string
--- @return table|nil
local function devEventCapture(name)
    local captured = devEventTables[name]
    if captured then return captured end
    local live = Events[name]
    if type(live) ~= "table" then return nil end
    devEventTables[name] = live
    devEventHandlers[name] = {}
    devEventNames[#devEventNames + 1] = name
    return live
end

-- Capture at load, not on first use: a picker may well be toggled on for the
-- first time only after a debugger visit, by which point Events[name] is
-- already the orphan.
for i = 1, #DEV_ORPHANABLE_EVENTS do
    devEventCapture(DEV_ORPHANABLE_EVENTS[i])
end

--- The captured table, announcing each time the live entry has been swapped out
--- from under us. One line per orphaning, not per call - a repeat debugger visit
--- installs a different table, which is worth its own line.
--- @param name string
--- @return table|nil
local function devEventTable(name)
    local captured = devEventCapture(name)
    if not captured then return nil end
    if Events[name] ~= captured and devEventOrphan[name] ~= Events[name] then
        devEventOrphan[name] = Events[name]
        print(("DWAP: Events.%s was replaced - the in-game chunk debugger orphans the Lua entry for every event it triggers (DebugChunkState.saveGameUI). Registering through the table captured at load instead; run DWAPCheckEvents() for detail."):format(name))
    end
    return captured
end

--- Add a handler through the captured table. Handlers must stay named globals
--- or locals; an inline closure can never be removed.
--- @param name string
--- @param fn function
local function devEventAdd(name, fn)
    local t = devEventTable(name)
    if not t then
        print(("DWAP: cannot register %s - Events.%s does not exist"):format(name, name))
        return
    end
    t.Add(fn)
    devEventHandlers[name][fn] = true
end

--- Remove a handler through the same captured table. Both halves must go
--- through the helpers or a toggle-off removes from the wrong table and leaves
--- the handler live.
--- @param name string
--- @param fn function
local function devEventRemove(name, fn)
    local t = devEventTable(name)
    if not t then return end
    t.Remove(fn)
    devEventHandlers[name][fn] = nil
end

--- Report whether our input events still point at the registry's own Event, and
--- how many of our handlers we hold on each. Ten-second answer to "the picker
--- lights up but clicks do nothing".
function DWAPCheckEvents()
    print("DWAP event check (input events the chunk debugger can orphan):")
    if #devEventNames == 0 then
        print("  nothing captured - no orphanable event is registered from devShared.lua")
        return
    end
    for i = 1, #devEventNames do
        local name = devEventNames[i]
        local captured = devEventTables[name]
        local count = 0
        local set = devEventHandlers[name]
        if set then
            for _ in pairs(set) do count = count + 1 end
        end
        if Events[name] == captured then
            print(("  %s: HEALTHY - live table is the one captured at load, %d DWAP handler(s) registered")
                :format(name, count))
        else
            print(("  %s: ORPHANED - Events.%s is no longer the registry's table; the in-game chunk debugger replaced it (DebugChunkState.saveGameUI empties EventMap, the debugger's own triggers make LuaEventManager.AddEvent build a new Event, and Event.register rawsets it over the Lua entry)")
                :format(name, name))
            print(("    Our %d handler(s) still fire: devEventAdd registered them on the table captured at load, which is the Event restoreGameUI put back. Any code calling Events.%s.Add directly is dead until a world reload rebuilds the Lua state.")
                :format(count, name))
        end
    end
end

-- Single invisible UI element whose render() hosts all our world-pinned text
-- overlays. TextManager draw calls only render reliably from the UI draw
-- pass: OnPostUIDraw never fires in 42.20 (its trigger is gated behind a
-- main-thread check the threaded renderer fails), so overlays must live on
-- a UI element like vanilla's debug text overlays do
--
-- The element is built once but re-added on every call, because the local only
-- tracks that we made one - not that UIManager still holds it. AddUI queues into
-- toRemove and toAdd (UIManager.java:112-117) and update() drains removes before
-- adds (:505-516), so re-adding is idempotent and cannot duplicate. Guarding the
-- add behind the local instead loses the overlay for the rest of the session:
-- entering the chunk debugger between the add and the next frame's drain leaves
-- the element out of DebugChunkState's snapshot (DebugChunkState.java:466) and
-- restoreGameUI's UI.clear()/addAll(gameUi) (:479-480) then discards it, while
-- the non-nil local makes every later call return early. Same silent-dead-tool
-- shape as the orphaned event tables above.

-- Draws hosted by that element, ordered. Registered by name so a re-register
-- replaces rather than duplicates, and by an explicit order number so which
-- file loads first can never reshuffle label z-order.
local overlayDraws = {}

--- Register a world-pinned draw with the shared overlay.
--- @param name string unique key; re-registering the same name replaces it
--- @param fn function called every UI draw pass, gates itself
--- @param order number ascending draw order (later = on top)
function M.addOverlayDraw(name, fn, order)
    -- Registration is where a bad entry can still be blamed on its caller. Past
    -- the loop below it is an anonymous nil call inside the render pass, one
    -- frame's remaining draws lost with it, and the stack points at the overlay
    -- rather than at whoever registered.
    if type(fn) ~= "function" then
        print(("DWAP overlay: %s registered a %s, not a function - ignored"):format(
            tostring(name), type(fn)))
        return
    end
    for i = 1, #overlayDraws do
        if overlayDraws[i].name == name then
            table.remove(overlayDraws, i)
            break
        end
    end
    local at = #overlayDraws + 1
    for i = 1, #overlayDraws do
        if overlayDraws[i].order > order then
            at = i
            break
        end
    end
    table.insert(overlayDraws, at, { name = name, fn = fn, order = order })
end

local devOverlay = nil
function ensureDevOverlay()
    if not devOverlay then
        local ui = ISUIElement:new(0, 0, 1, 1)
        ui:initialise()
        ui.render = function()
            for i = 1, #overlayDraws do
                overlayDraws[i].fn()
            end
        end
        devOverlay = ui
    end
    devOverlay:addToUIManager()
    return devOverlay
end

-- Container types no loot entry ever addresses, keyed on ItemContainer:getType().
-- One table so the ShowContainers overlay, the room picker's export and
-- DWAPExplainSquare cannot drift into disagreeing about what an unclaimed
-- container is.
--
-- Keyed on the container TYPE, not the sprite's `container` property: IsoCompost
-- sets "composter" on the container in its constructor
-- (IsoCompost.java:64-65) whatever the tile def carries, and the type is what
-- resolveLootContainer and the loot fill both read.
--
-- ItemContainer.isStove() (ItemContainer.java:3607-3609) is exactly
-- stove|toaster|coffeemaker, so testing it misses woodstove and stonefurnace.
-- The woodstove tiles are CustomName = Oven, including the craftable B42
-- wood-fired oven (crafted_05_4..7), and woodstove appears in the unclaimed
-- lists of our own audit reports - so this is a live gap, not a hypothetical
-- one. isStove's own three are listed here too, so this table is the whole
-- answer and callers do not have to test both.
local NON_LOOT_CONTAINER_TYPES = {
    -- trash and laundry
    bin = true, dumpster = true, clothingdryer = true, clothingdryerbasic = true,
    clothingrack = true, clothingwasher = true,
    -- cooking appliances
    stove = true, woodstove = true, stonefurnace = true, barbecue = true,
    barbecuepropane = true, toaster = true, coffeemaker = true, microwave = true,
    -- fireplaces
    fireplace = true, campfire = true, brazier = true,
    -- yard and animal fixtures
    doghouse = true, composter = true, trough = true,
}

-- Stable identity for a room, shared by the audit's coverage pass and the room
-- picker further down. Keyed on the RoomDef rect rather than the live IsoRoom,
-- which churns with streaming, and rather than the name, which is not unique:
-- an apartment complex has one "kitchen" per unit (config 09 reports 101).
-- Defined up here because TestLootConfig closes over it.
local function roomDefKey(room)
    local def = room and room.getRoomDef and room:getRoomDef()
    if not def then return nil end
    return ("%s@%d,%d,%d"):format(room:getName() or "?", def:getX(), def:getY(), def:getZ())
end

-- Render a {key = count} table as "key=count, ..." sorted by count desc
local function allLootTallyString(tbl)
    local sorted = {}
    for tag, count in pairs(tbl) do
        sorted[#sorted + 1] = { tag = tag, count = count }
    end
    table.sort(sorted, function(a, b)
        if a.count == b.count then return a.tag < b.tag end
        return a.count > b.count
    end)
    local parts = {}
    for i = 1, #sorted do
        parts[i] = sorted[i].tag .. "=" .. sorted[i].count
    end
    return table.concat(parts, ", ")
end

-- Build a lookup table of container coordinates from a config
-- One record per square, holding every loot entry that addresses it. The old
-- flat coord->value map could only express two states per square (z and
-- z+0.5), so a fridge + freezer + upper cabinet collapsed into one key and
-- slot/stack entries were invisible to the overlay.
local function buildContainerLookup(config)
    local lookup = {}
    if not config or not config.loot then
        return lookup
    end

    for i = 1, #config.loot do
        local entry = config.loot[i]
        if entry and entry.coords then
            local x, y = entry.coords.x, entry.coords.y
            local rawZ = entry.coords.z
            local z = math.floor(rawZ)
            local key = DWAPUtils.hashCoords(x, y, z)
            local record = lookup[key]
            if not record then
                record = { slots = {}, hasBase = false, hasUpper = false,
                    members = {}, duplicateEntries = 0 }
                lookup[key] = record
            end

            -- The key the loot fill REGISTERS this entry under, derived by the
            -- same rule setLootConfigValue uses (LootSpawning/Events.lua): stack
            -- ordinal first, then legacy fractional z as upper, then the slot
            -- name, then base. It reads the UNFLOORED z, so it has to be taken
            -- before z is floored for the square key above.
            --
            -- Two entries on one square sharing a member key are a config error,
            -- not a pair. Registration is `slot[member] = index` with no
            -- collision check, so the second entry silently overwrites the first
            -- and only one of the square's containers is ever filled. The
            -- resolution below cannot see it: each entry resolves independently,
            -- both land on the same container, and two claims against two
            -- physical containers read as fully claimed - green on a square
            -- where one entry is dead.
            --
            -- An ordinal stays a number, as it is over there: Lua keys carry
            -- their type, so t[2] and t["2"] are already distinct buckets and
            -- prefixing would only invent a key space registration does not use.
            local member
            if entry.stack then
                member = entry.stack
            elseif rawZ % 1 ~= 0 then
                member = "upper"
            else
                member = entry.slot or "base"
            end

            -- legacy +0.5 coords still mean upper
            local isUpper = entry.slot == "upper" or rawZ % 1 ~= 0
            local value = 1
            if not entry.dist and not entry.items and not entry.special then
                value = 0 -- nothing to spawn: an authoring error
            elseif entry.special then
                value = 2
            end

            local slot = {
                entry = i,
                upper = isUpper,
                freezer = entry.slot == "freezer",
                stack = entry.stack,
                value = value,
                member = member,
            }
            record.slots[#record.slots + 1] = slot
            -- Keyed, so this is one pass rather than a scan over the square's
            -- other slots. Both sides get marked: the label pass has to name the
            -- pair, and which one survives is registration order rather than
            -- anything the author chose. duplicateEntries counts the DEAD ones
            -- (three entries on one member = two lost).
            local first = record.members[member]
            if first then
                record.slots[first].duplicate = true
                slot.duplicate = true
                record.duplicateEntries = record.duplicateEntries + 1
            else
                record.members[member] = #record.slots
            end
            if isUpper then
                record.hasUpper = true
            elseif not entry.stack and entry.slot ~= "freezer" then
                record.hasBase = true
            end
        end
    end
    return lookup
end

-- Everything IsoBarricade can attach to. All four implement BarricadeAble,
-- so they all answer isBarricadeAllowed/isBarricaded/getNorth. Shared by the
-- barricade overlay and FindUnbarricaded
local BARRICADEABLE_TYPES = {
    { class = "IsoWindow",      kind = "window", tag = "win" },
    { class = "IsoWindowFrame", kind = "frame",  tag = "frm" },
    { class = "IsoDoor",        kind = "door",   tag = "door" },
    { class = "IsoThumpable",   kind = "thumpable", tag = "thmp" },
}

local function barricadeableType(obj)
    if not obj then return nil end
    for i = 1, #BARRICADEABLE_TYPES do
        if instanceof(obj, BARRICADEABLE_TYPES[i].class) then
            return BARRICADEABLE_TYPES[i]
        end
    end
    return nil
end

-- Garage doors report as barricadeable but a barricade will not stick to
-- them, so they are never a real target. Matched on the sprite rather than
-- the class: the same door can come through as IsoDoor or IsoThumpable
local function isGarageOpening(sprite)
    return sprite:sub(1, 12) == "walls_garage"
end

-- Only the building shell is worth barricading. An opening separates two
-- squares (itself and getOppositeSquare, per its N/W facing); a shell
-- opening has a room on exactly one of them. Rooms on both sides means an
-- interior door, no room on either means it is not an entry into anything.
-- A missing square counts as open air, which is what map edges look like.
local function isExteriorOpening(obj)
    if not obj.getOppositeSquare then return false end
    local near, far = obj:getSquare(), obj:getOppositeSquare()
    local nearInside = near ~= nil and near:getRoom() ~= nil
    local farInside = far ~= nil and far:getRoom() ~= nil
    return nearInside ~= farInside
end

--- Every object on a square that could be a barricade target, handed to `sink`
--- one at a time. The sink does the filtering (barricadeableType, garage,
--- interior, already-barricaded) and its own dedupe - callers disagree about
--- all of that, and none of them disagree about WHICH objects to look at.
---
--- The four extra calls after the object list are the whole reason this exists:
--- 42.20 can merge a window frame into the wall as an overlay, so the frame
--- never appears in getObjects() as its own barricadeable object and a scan
--- that only walks the object list misses exactly the openings that need
--- barricading. getWindowFrame/getWindow(north) are the same fallback Props.lua
--- uses when it applies a barricade, so a scan without them reports gaps the
--- spawner can fill and vice versa. It was copy-pasted into FindUnbarricaded
--- and rescanOpenBarricades before the picker needed a third copy; all three
--- go through here now, so the overlay, the dump and the export cannot end up
--- scanning different objects.
---
--- sink is passed the square as well as the object: every caller tags its
--- findings with the coordinates of the square being SCANNED, which for a
--- south/east opening is not obj:getSquare()'s square.
--- @param square IsoGridSquare|nil
--- @param sink fun(obj: IsoObject|nil, square: IsoGridSquare)
local function barricadeCandidatesOnSquare(square, sink)
    if not square then return end
    local objects = square:getObjects()
    if objects then
        for j = 0, objects:size() - 1 do
            sink(objects:get(j), square)
        end
    end
    -- sinks all tolerate nil, which is what these return on a square with no
    -- window on that facing
    sink(square:getWindowFrame(true), square)
    sink(square:getWindowFrame(false), square)
    sink(square:getWindow(true), square)
    sink(square:getWindow(false), square)
end

-- short stable building tag for the dump comments, shared by the survey tools
local function bldTag(b)
    if not b then return "outside" end
    local def = b.getDef and b:getDef()
    local defId = def and def.getID and def:getID()
    if not defId then return "bld?" end
    local hi = math.floor(defId / 4294967296)
    return ("bld %d,%d#%d"):format(hi % 65536, math.floor(hi / 65536), defId % 4294967296)
end

-- Plumbing fixture names to look for
local PLUMBING_FIXTURE_NAMES = {
    ["Bath"] = true,
    ["Shower"] = true,
    ["Toilet"] = true,
    ["Combo Washer Dryer"] = true,
    ["Gallery Toilet"] = true,
    ["Sink"] = true,
    ["Soda Machine"] = true,
    ["Washing Machine"] = true,
}

local function plumbingConnected(obj)
    if obj.getUsesExternalWaterSource and obj.hasExternalWaterSource then
        return obj:getUsesExternalWaterSource() and obj:hasExternalWaterSource()
    end
    if obj:hasFluid() and obj.getFluidAmount then
        -- fluid-backed fixtures count as connected once they hold something
        return (obj:getFluidAmount() or 0) > 50
    end
    return false
end

--- Classify one object as a water tank, a plumbing fixture, or neither.
--- Shared by the footprint scan and the click picker so both dump the same
--- lines for the same object.
--- @param obj IsoObject|nil
--- @return table|nil info { kind = "tank"|"fixture", sprite, customName, isConnected, capacity, amount }
local function plumbingInfo(obj)
    if not obj then return nil end
    local sprite = obj:getSpriteName() or ""
    if obj:hasFluid() then
        local fluidContainer = obj:getFluidContainer()
        if fluidContainer and fluidContainer:getCapacity() > 1000 then
            return { kind = "tank", sprite = sprite,
                capacity = fluidContainer:getCapacity(), amount = fluidContainer:getAmount() }
        end
        return { kind = "fixture", sprite = sprite, customName = "Unknown",
            isConnected = plumbingConnected(obj) }
    end
    if obj:isFloor() then return nil end
    local objectSprite = obj:getSprite()
    local props = objectSprite and objectSprite:getProperties()
    local customName = props and props:has("CustomName") and props:get("CustomName")
    if customName and PLUMBING_FIXTURE_NAMES[customName] then
        return { kind = "fixture", sprite = sprite, customName = customName,
            isConnected = plumbingConnected(obj) }
    end
    return nil
end

-- Exports land in a long console and are easy to lose. Stamp each dump with
-- the config it belongs to so it can be found - and pasted into the right
-- file - long after the fact.
-- print(), NOT dprint(): dprint goes through log(DebugType.Lua, ...) into the
-- DebugLog, while the dump itself is print()ed to console.txt. A header in a
-- different file to the lines it labels is no header at all.
local function exportHeader(what, extra)
    local index, name = DWAPNearestConfig(true)
    print(("=== %s | nearest config: %s %s%s ==="):format(
        what,
        index and ("%02d"):format(index) or "??",
        name or "unknown",
        extra or ""))
end

--- The square under a screen pixel, projected onto the PLAYER'S z plane.
---
--- screenToIsoX/Y (LuaManager.java:3532, :3540) take unscaled screen coords and
--- apply the zoom themselves, which is the space Mouse.getXA() reports and the
--- space OnMouseDown hands over (UIManager.java:533 sets mx, :732 passes it).
---
--- This is a flat projection: it answers which GROUND tile sits under the
--- pixel, not which sprite was drawn there. Screen Y up means a smaller x + y,
--- so clicking high on a tall sprite resolves to a square behind the one the
--- sprite belongs to. Callers that need an object use the picker instead and
--- keep this for miss messages and last-resort fallbacks.
--- @return IsoGridSquare|nil square, number wx, number wy, number z
local function devScreenSquare(screenX, screenY)
    local player = getPlayer()
    local pSquare = player and player:getCurrentSquare()
    if not pSquare then return nil, 0, 0, 0 end
    local z = pSquare:getZ()
    local playerNum = player:getPlayerNum()
    local wx = math.floor(screenToIsoX(playerNum, screenX, screenY, z))
    local wy = math.floor(screenToIsoY(playerNum, screenX, screenY, z))
    local cell = getCell()
    if not cell then return nil, wx, wy, z end
    return cell:getGridSquare(wx, wy, z), wx, wy, z
end

local function coordKey(x, y, z)
    return x .. "," .. y .. "," .. z
end

--- What a door's sprite WOULD be if shut, as a hint only - nil when it is
--- already shut or cannot be worked out.
---
--- IsoDoor keeps closedSprite private, but the relationship is fixed: the open
--- sprite sits openSpriteOffset indices above the closed one, and the offset is
--- 2 normally, 4 for a DoubleDoor and 8 for a GarageDoor. A garage door is
--- several tiles wide and each tile is its own sprite, but the offset applies
--- per tile - walls_garage_01_11,12,13 open map back to _3,4,5.
---
--- The derived name is checked against IsoSpriteManager before being offered:
--- if the offset was wrong for this door, the name it produces will not resolve
--- to a real sprite, and no hint beats a misleading one.
---
--- Deliberately NOT substituted into the exported line. Clicking a door opens
--- it, so an open door is often just one we picked - but some map doors are
--- placed open by design, and there the config has to name the sprite that is
--- actually on the square or the key will not match. Only the picker knows
--- which case it is, so emit what is really there and offer the shut name
--- alongside.
--- @return string|nil
local function shutDoorSpriteHint(door)
    if not (door.isOpen and door:isOpen()) then return nil end
    local name = door.getSpriteName and door:getSpriteName() or "?"
    local sprite = door.getSprite and door:getSprite()
    local props = sprite and sprite:getProperties()
    local offset = 2
    if props then
        if props:has("GarageDoor") then
            offset = 8
        elseif props:has("DoubleDoor") then
            offset = 4
        end
    end
    local base, index = name:match("^(.*)_(%d+)$")
    if not base then return nil end
    local closed = tonumber(index) - offset
    if closed < 0 then return nil end
    local candidate = ("%s_%d"):format(base, closed)
    if not getSprite(candidate) then return nil end
    return candidate
end

local function doorOnSquare(square)
    local objects = square:getObjects()
    for i = 0, (objects and objects:size() or 0) - 1 do
        local obj = objects:get(i)
        -- garage doors are IsoDoor too, so this covers them; IsoThumpable is
        -- the player-built//custom case and answers isDoor
        if instanceof(obj, "IsoDoor") then return obj end
        if instanceof(obj, "IsoThumpable") and obj.isDoor and obj:isDoor() then return obj end
    end
    return nil
end

-- Every container on one square, through the shared resolver so the picker
-- counts exactly what the loot fill and the audit would see. Appends to `out`
-- so a room can union its squares into one list. Types we never author loot
-- into (NON_LOOT_CONTAINER_TYPES) are left out by default, matching the audit's
-- coverage pass; they still highlight with their room or tile in the picker,
-- this only keeps them out of the exported table. includeExcluded lists them
-- anyway, for the square where the composter IS the thing worth authoring.
--
-- Both pick kinds enumerate through here: a tile pick is one square and a room
-- pick is many, and the slot/stack decision is per square either way, so a
-- fridge+cabinet tile gets the same distinct addressing whichever way it was
-- picked.
--
-- @param includeExcluded boolean|nil also list NON_LOOT_CONTAINER_TYPES
local function squareLootContainers(square, out, includeExcluded)
    if not square then return out end
    local list = DWAPUtils.getSquareContainers(square)
    -- Two containers on one square need DIFFERENT addressing or their entries
    -- share coords and neither resolves - that is where the 75
    -- duplicate-coordinate failures came from. Mirror what resolveLootContainer
    -- can actually target: the freezer compartment, the wall-mounted container,
    -- the plain base entry for the first floor container, and stack = n (index
    -- in object order, matching opts.stack) for anything still ambiguous.
    --
    -- The slot/stack state machine runs over the WHOLE list, excluded types
    -- included, and the filter happens only at the emit below. Two reasons, and
    -- the second is a correctness bug the first would otherwise hide:
    --
    --  * it makes includeExcluded purely additive. Were the state machine
    --    skipped for excluded containers, ticking the box would let a composter
    --    claim the base or upper slot and every OTHER container on that square
    --    would export with a different slot/stack than it does with the box
    --    off - a silently wrong config entry, and one you would only find by
    --    diffing two exports of the same room.
    --  * DWAPUtils.resolveLootContainer does not know NON_LOOT_CONTAINER_TYPES
    --    exists. Its base branch returns the first non-high, non-freezer
    --    container in object order whatever its type, so on a [stove, crate]
    --    square a plain entry fills the STOVE. Skipping the stove here used to
    --    hand the crate a plain base entry that resolves to the stove; running
    --    the machine over the full list gives the crate `stack = 2`, which is
    --    what actually reaches it.
    --
    -- stack = j already indexes the full getSquareContainers list (j is the raw
    -- loop index, never a count of what was emitted), so that half always
    -- matched opts.stack and needs no change.
    local usedUpper, usedFreezer, usedBase = false, false, false
    for j = 1, #list do
        local ctype = list[j].container:getType()
        local slot, stack = nil, nil
        if ctype == "freezer" and #list > 1 and not usedFreezer then
            -- a lone freezer unit satisfies a base entry, so only claim the
            -- freezer slot when it shares the square
            slot = "freezer"
            usedFreezer = true
        elseif list[j].isHigh and not usedUpper then
            slot = "upper"
            usedUpper = true
        elseif not list[j].isHigh and (ctype ~= "freezer" or #list == 1) and not usedBase then
            -- mirrors resolveLootContainer's base-branch fallback: a lone
            -- freezer-type container satisfies a plain base entry, so the
            -- export must claim it as base too or it re-lists a container
            -- the config already owns via a plain entry
            usedBase = true
        else
            stack = j
        end
        if includeExcluded or not NON_LOOT_CONTAINER_TYPES[ctype] then
            out[#out + 1] = {
                x = square:getX(), y = square:getY(), z = square:getZ(),
                ctype = ctype, isHigh = list[j].isHigh,
                slot = slot, stack = stack,
                -- not emitted, read by containerClaimed: the position in object
                -- order a `stack = n` entry would name, and whether this is the
                -- container a plain entry resolves to. Those are the same thing
                -- only when the first container is floor-level, so neither can
                -- be inferred from the other.
                index = j, isBase = not slot and not stack,
            }
        end
    end
    return out
end

-- Whether a config entry already addresses this exact container, rather than
-- just its square: a square with a claimed fridge and a free upper cabinet
-- must still offer the cabinet.
--
-- An entry with no stack usually means the first container, which is what
-- `stack = 1` names explicitly, and reading those two forms as distinct is what
-- re-listed a container the config already owned. But they are only the same
-- container when the first one is floor-level: resolveLootContainer's base rule
-- skips high containers, while stack = n indexes object order raw, so on a
-- square whose list starts with a wall cabinet a plain entry and stack = 1
-- resolve to different things. Assuming the equivalence there would report a
-- container claimed that nothing fills - it would vanish from the export and
-- the gap would never get authored.
--
-- So match on what the pick already knows: its position in object order and
-- whether it is the container a plain entry resolves to. An upper or freezer
-- entry names a container by position rather than index, so it never takes part
-- in either comparison.
local function containerClaimed(record, c)
    if not record then return false end
    for i = 1, #record.slots do
        local s = record.slots[i]
        if c.slot == "upper" then
            if s.upper then return true end
        elseif c.slot == "freezer" then
            if s.freezer then return true end
        elseif not s.upper and not s.freezer then
            if s.stack then
                if s.stack == c.index then return true end
            elseif c.isBase then
                return true
            end
        end
    end
    return false
end

--- The container half of DWAPExplainSquare: every container the square holds,
--- why each reads high, whether the export filter skips it, and whether the
--- nearest config already has an entry at these coords.
---
--- Split out because the picker's Explain checkbox wants exactly this, once per
--- queued square, and a second copy would drift from the one the console
--- command prints - which is the tool people reach for when the export and the
--- overlay disagree. Prints no coordinate header of its own: the console
--- command already printed one and the picker prints a per-square banner, and
--- putting it in here would double it up in both.
--- @param square IsoGridSquare|nil
local function explainSquareContainers(square)
    if not square then return end
    local x, y, z = square:getX(), square:getY(), square:getZ()

    -- The export filter and the overlay's count answer different questions about
    -- a skip-listed fixture: the export never emits an entry for one, but the
    -- overlay counts it once an entry has resolved onto it. Resolve the nearest
    -- config's entries up here so each container line can report both, and tally
    -- how many landed on each skip-listed TYPE - the same test
    -- checkSquareContainers makes on the resolver's answer.
    --
    -- By type, not by container: the resolver hands back a container, and
    -- comparing that against the ones in the physical list would mean identity
    -- on streamed objects. So on a square holding two composters with one entry
    -- between them, this knows one is claimed but not which, and the verdict
    -- below says so rather than marking both.
    local claimedSkipTypes = {}
    local index = DWAPNearestConfig(true)
    local rec = nil
    if index then
        local configs = DWAPUtils.loadConfigs(true)
        local config = configs and configs[index]
        local lookup = config and buildContainerLookup(config)
        rec = lookup and lookup[DWAPUtils.hashCoords(x, y, z)]
    end
    for i = 1, rec and #rec.slots or 0 do
        local s = rec.slots[i]
        local hit = DWAPUtils.resolveLootContainer(square, {
            upper = s.upper,
            stack = s.stack,
            freezer = s.freezer,
            pairPresent = s.upper and rec.hasBase or false,
        })
        local hitType = hit and hit:getType()
        if hitType and NON_LOOT_CONTAINER_TYPES[hitType] then
            claimedSkipTypes[hitType] = (claimedSkipTypes[hitType] or 0) + 1
        end
    end

    local list = DWAPUtils.getSquareContainers(square)
    -- How many of each skip-listed type are physically here, to compare against
    -- the claims above: fewer claims than fixtures means the overlay counts only
    -- some of them, and the per-line verdict cannot name which
    local skipTypeCount = {}
    for i = 1, #list do
        local t = list[i].container:getType()
        if NON_LOOT_CONTAINER_TYPES[t] then
            skipTypeCount[t] = (skipTypeCount[t] or 0) + 1
        end
    end
    print(("  getSquareContainers: %d"):format(#list))
    for i = 1, #list do
        local cont = list[i].container
        local ctype = cont:getType()
        local skipped = NON_LOOT_CONTAINER_TYPES[ctype] == true
        -- Say WHY it reads high. "upper" is not about stacking height - it is
        -- the raised/wall-mounted slot versus the floor-level one - and a
        -- cardboardbox sitting on a counter qualifies via renderYOffset, which
        -- is not obvious from the exported entry alone.
        local why = "-"
        if ctype == "overhead" then
            why = "type=overhead"
        elseif cont:getContainerPosition() == "High" then
            why = "ContainerPosition=High (runtime)"
        else
            local sprite = list[i].object.getSprite and list[i].object:getSprite()
            local props = sprite and sprite:getProperties()
            local yoff = list[i].object.getRenderYOffset and list[i].object:getRenderYOffset()
            if props and props:get("ContainerPosition") == "High" then
                why = "ContainerPosition=High (tile def)"
            elseif yoff and yoff > 32 then
                why = ("renderYOffset=%s (>32, drawn raised)"):format(tostring(yoff))
            end
        end
        local verdict = "exportable, and counted by the overlay"
        if skipped then
            local claims = claimedSkipTypes[ctype] or 0
            local present = skipTypeCount[ctype] or 1
            if claims == 0 then
                verdict = "SKIPPED by the export filter, and no entry resolves onto it, "
                    .. "so the overlay does not count it either"
            elseif claims >= present then
                verdict = "SKIPPED by the export filter, but an entry resolves onto it, "
                    .. "so the overlay counts it"
            else
                verdict = ("SKIPPED by the export filter; %d of the %d %s here are claimed, "
                    .. "and this is tracked by type, so it cannot say which"):format(
                    claims, present, ctype)
            end
        end
        print(("    %d. %s  isHigh=%s [%s]  %s"):format(i, ctype, tostring(list[i].isHigh), why,
            verdict))
    end

    if index then
        print(("  nearest config %02d: %s"):format(index,
            rec and "already has an entry at these coords" or "no entry at these coords"))
    end
end

-- One loot entry in the config's own shape: multiline, one field per line, and
-- the descriptor as a note FIELD rather than a trailing comment - `type` was
-- never read and the note is what the tools can actually see at runtime. No
-- E-marker here; paste it in and the stamper numbers the whole table.
--
-- Kept as its own function, with one caller, because it is the definition of
-- the shape: every future emitter goes through here rather than formatting its
-- own, since a table that differs by a field name parses fine and addresses
-- nothing.
local function printLootEntry(c, where)
    print("        {")
    print(('            note = "%s @ %s",'):format(c.ctype, where))
    print(("            coords = { x = %d, y = %d, z = %d },"):format(c.x, c.y, c.z))
    if c.slot then
        print(('            slot = "%s",'):format(c.slot))
    elseif c.stack then
        print(("            stack = %d,"):format(c.stack))
    end
    print("        },")
end

-- Classify one pick's containers against the config and APPEND the ones that
-- should be listed to `rows`, printing nothing. Collection runs PER PICK - each
-- pick has its own `where` and its own summary line, which the caller prints -
-- while emission runs ONCE across every pick, because the destination is a
-- single `loot` table in the config. Two granularities, so two functions:
-- everything gathered here goes out through emitMergedContainers below.
--
-- emitFree/emitClaimed are explicit arguments rather than a read of picker
-- state from in here. The two container checkboxes are INDEPENDENT - "config'd
-- containers only" is a real thing to ask for when auditing what a config
-- already owns - and one hidden flag cannot express that. Passing them also
-- means this function has no opinion about which caller is driving it.
--
-- Each row carries its own `where`, so a merged table still notes every entry
-- with the room it was really found in rather than with the first pick's name -
-- the note is the only record of where an entry came from once it is pasted.
-- The claimed flag rides along for the grouping; recomputing it at emit time
-- would mean a second lookup pass over the same containers.
-- @param rows table sink, appended to in discovery order
-- @return number listed, number already claimed
local function collectPickedContainers(containers, where, lookup, emitFree, emitClaimed, rows)
    local listed, claimed = 0, 0
    for j = 1, #containers do
        local c = containers[j]
        local isClaimed = (lookup
            and containerClaimed(lookup[DWAPUtils.hashCoords(c.x, c.y, c.z)], c)) or false
        if isClaimed then claimed = claimed + 1 end
        -- Claimed containers are normally left out so an export can be pasted
        -- alongside what is already there, and are listed anyway when the
        -- caller is reworking a room rather than filling around it. They count
        -- as claimed either way, so the summary shows what is being superseded.
        if (isClaimed and emitClaimed) or (not isClaimed and emitFree) then
            listed = listed + 1
            rows[#rows + 1] = { c = c, where = where, claimed = isClaimed }
        end
    end
    return listed, claimed
end

-- Emit ONE loot table for rows gathered across every pick, already-configured
-- entries first. Two tables meant two paste operations for what is one `loot`
-- table in the config, which is the whole reason this exists.
--
-- Order within each group is the order rows were collected - queue order, then
-- square order within a pick - so two exports of the same picks produce the
-- same block and can be diffed.
--
-- The two groups are separated by Lua comments, and ONLY when both are actually
-- present: a lone header over a table that is all one kind says nothing and
-- would still have to be deleted by hand. They are legal inside a table
-- constructor, so they survive the paste, which is the point - the reader can
-- still see which half the config already covered after the block has moved.
-- @param rows table from collectPickedContainers
-- @return number listed
local function emitMergedContainers(rows)
    if #rows == 0 then return 0 end
    local tally = {}
    local anyClaimed, anyFree = false, false
    for i = 1, #rows do
        local ctype = rows[i].c.ctype
        tally[ctype] = (tally[ctype] or 0) + 1
        if rows[i].claimed then anyClaimed = true else anyFree = true end
    end
    print("     " .. allLootTallyString(tally))
    local label = anyClaimed and anyFree
    -- Two passes rather than a sort: table.sort here is a non-stable quicksort,
    -- so it would shuffle the discovery order inside each group.
    for pass = 1, 2 do
        local wantClaimed = pass == 1
        local first = true
        for i = 1, #rows do
            local row = rows[i]
            if row.claimed == wantClaimed then
                if first and label then
                    print(wantClaimed and "        -- already in the config"
                        or "        -- not in the config yet")
                end
                first = false
                printLootEntry(row.c, row.where)
            end
        end
    end
    return #rows
end

-- Exported surface. The shim internals (the capture tables and
-- devEventCapture/devEventTable) stay private: registering through anything but
-- these two would defeat the whole point of the capture.
M.eventAdd = devEventAdd
M.eventRemove = devEventRemove

M.NON_LOOT_CONTAINER_TYPES = NON_LOOT_CONTAINER_TYPES
M.roomDefKey = roomDefKey
M.allLootTallyString = allLootTallyString
M.buildContainerLookup = buildContainerLookup
M.barricadeableType = barricadeableType
M.isGarageOpening = isGarageOpening
M.isExteriorOpening = isExteriorOpening
M.barricadeCandidatesOnSquare = barricadeCandidatesOnSquare
M.bldTag = bldTag
M.plumbingInfo = plumbingInfo
M.exportHeader = exportHeader
M.devScreenSquare = devScreenSquare
M.coordKey = coordKey
M.shutDoorSpriteHint = shutDoorSpriteHint
M.doorOnSquare = doorOnSquare
M.squareLootContainers = squareLootContainers
M.explainSquareContainers = explainSquareContainers
M.collectPickedContainers = collectPickedContainers
M.emitMergedContainers = emitMergedContainers

return M
