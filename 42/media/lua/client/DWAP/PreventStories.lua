
local DWAPUtils = require("DWAPUtils")

--- PreventStories
---
--- 42.20 moved randomized building stories out of Lua and into Java
--- (zombie/randomizedWorld/randomizedBuilding). Two gates can veto one:
--- StashSystem.isStashBuilding(def) and def.isAllExplored(). RBShopLooted
--- overrides isValid and keeps ONLY the isAllExplored check, so for any shop
--- - a gas station, say - marking the def explored is the only defence left.
---
--- The roll fires from RandomizedBuildingBase.ChunkLoaded, the moment a
--- building finishes streaming in. Reacting to a square load is therefore a
--- race we lose whenever the building completes on a chunk we are not
--- watching. The metagrid pass below runs at OnLoadMapZones - after the
--- metagrid exists (IsoWorld triggers it mid-init) but before WorldStreamer
--- starts - so the def is already marked before any chunk can roll a story.
--- The square-loaded hook stays on as a fallback.
---
--- Anchors come from baseBuildings (one square per physical building, kept
--- current). doorKeys are deliberately NOT used: they have not been validated
--- against the moved sites yet.

--- BuildingDef IDs of every story-suppressed safehouse. Population inside
--- these is culled so the building stays empty (restoring pre-42.20
--- behaviour). Built up by markBuildingDef from BOTH the metagrid pass (before
--- any chunk streams) and the square-loaded fallback (retroactive), so it is
--- populated ahead of the first spawn on a fresh world and back-filled on a
--- continued one. Keyed by BuildingDef:getID() - a map-stable long, never the
--- streamed IsoBuilding instance, which is recreated per streaming pass.
local protectedDefIds = {}
local protectedCount = 0

--- 42.20 no longer empties a building when its def is marked explored:
--- setAllExplored suppresses only the randomized-building STORIES
--- (RandomizedBuildingBase.ChunkLoaded / isValid), while the ambient indoor
--- population comes from VirtualZombieManager.roomSpotted ->
--- getZombieCountForRoom -> addIndoorZombiesToChunk, gated on the RoomDef
--- public fields spawnCount/doneSpawn and never on explored. Those fields are
--- not writable from Kahlua (the exposer publishes methods and static-field
--- snapshots only, and RoomDef has no spawnCount/doneSpawn setter), so we
--- cannot zero the spawn at the source. Instead we record the def as protected
--- and cull the zombies at runtime (see below).
local function markBuildingDef(def)
    if not def then return false end
    def:setAllExplored(true)
    def:setAlarmed(false)
    local id = def:getID()
    if id and not protectedDefIds[id] then
        protectedDefIds[id] = true
        protectedCount = protectedCount + 1
    end
    return true
end

--- Is this zombie standing inside a protected safehouse? Read-only (no
--- removal), so it is safe to call during OnZombieCreate. Ordered to bail as
--- cheaply as possible: no Java call at all when nothing is protected, and only
--- two getters for the common outdoor / unprotected-building zombie.
--- @param zombie IsoZombie
--- @return boolean
local function zombieInProtectedBuilding(zombie)
    if protectedCount == 0 or not zombie then return false end
    local square = zombie:getSquare()
    if not square then return false end
    local building = square:getBuilding()
    if not building then return false end
    local def = building:getDef()
    if not def then return false end
    local id = def:getID()
    return id ~= nil and protectedDefIds[id] == true
end

--- @param zombie IsoZombie
local function removeCulledZombie(zombie)
    zombie:removeFromWorld()
    zombie:removeFromSquare()
end

--- Deferred cull queue for OnZombieCreate. The event fires from
--- VirtualZombieManager.createRealZombie(Always) at ~332 BEFORE vanilla adds
--- the zombie to the cell zombie list (the add happens right after, in the
--- synchronized block, regardless of what this handler did). Removing
--- synchronously here routes the object into VZM's reusedThisFrame pool and
--- nulls its square, yet vanilla still adds the now-null-square object to the
--- list - leaving an inert zombie in getZombieList() and letting the pool hand
--- the same object back out at another square later. So we only ENQUEUE the
--- reference here and do the real removeFromWorld/removeFromSquare on the next
--- tick, once vanilla has finished registering it.
local pendingCull = {}
local pendingCount = 0

--- Fresh / repopulation spawns: OnZombieCreate fires after the zombie has a
--- square, so we can resolve its building immediately - but we defer the actual
--- removal by one tick (see above). This is the whole story for fresh worlds;
--- roomSpotted/getZombieCountForRoom are server-authoritative (they no-op on
--- GameClient.client), and this client handler enqueues on the
--- host/singleplayer where those spawns happen.
--- @param zombie IsoZombie
local function cullZombieOnCreate(zombie)
    if zombieInProtectedBuilding(zombie) then
        pendingCount = pendingCount + 1
        pendingCull[pendingCount] = zombie
    end
end
Events.OnZombieCreate.Add(cullZombieOnCreate)

--- Continued / already-populated worlds: zombies saved inside a safehouse are
--- restored by IsoZombie.load (added straight to the cell zombie list) and
--- never fire OnZombieCreate, so the create hook cannot see them. Sweep the
--- cell zombie list while the player is standing inside a protected safehouse -
--- the one window where paying to iterate every zombie is justified, and where
--- streaming has brought the building's saved zombies in. Cost off that window
--- is a single counter compare per tick plus one player getBuilding per
--- interval; the full sweep runs only inside a protected base.
local SWEEP_INTERVAL = 60
local sweepCounter = 0

local function cullTick()
    -- Drain the deferred create-culls every tick: vanilla has now finished
    -- registering the freshly created zombie, so a clean removeFromWorld sticks.
    -- Re-verify each ref - it may have been removed or moved out in the interim.
    if pendingCount > 0 then
        local removed = 0
        for i = 1, pendingCount do
            local zombie = pendingCull[i]
            pendingCull[i] = nil
            if zombie and zombieInProtectedBuilding(zombie) then
                removeCulledZombie(zombie)
                removed = removed + 1
            end
        end
        pendingCount = 0
        if removed > 0 then
            DWAPUtils.dprint(("PreventStories: culled %d spawned zombie(s) in a protected safehouse"):format(removed))
        end
    end

    if protectedCount == 0 then return end
    sweepCounter = sweepCounter + 1
    if sweepCounter < SWEEP_INTERVAL then return end
    sweepCounter = 0

    local player = getPlayer()
    if not player then return end
    local psquare = player:getCurrentSquare()
    if not psquare then return end
    local pbuilding = psquare:getBuilding()
    if not pbuilding then return end
    local pdef = pbuilding:getDef()
    if not pdef then return end
    local pid = pdef:getID()
    if not pid or not protectedDefIds[pid] then return end

    local cell = getCell()
    if not cell then return end
    local zombies = cell:getZombieList()
    if not zombies then return end
    local removed = 0
    -- Iterate downward: removeFromWorld may drop the zombie from this same list,
    -- and a downward walk is unaffected by the shift. These are already-
    -- registered saved zombies (not mid-creation), so removing them now is safe.
    for i = zombies:size() - 1, 0, -1 do
        local zombie = zombies:get(i)
        if zombieInProtectedBuilding(zombie) then
            removeCulledZombie(zombie)
            removed = removed + 1
        end
    end
    if removed > 0 then
        DWAPUtils.dprint(("PreventStories: culled %d saved zombie(s) from a protected safehouse"):format(removed))
    end
end
Events.OnTick.Add(cullTick)

--- Has this config opted into stories (and therefore out of population
--- suppression)? Single source of truth for the allowStories resolution.
--- @param config table
--- @param index number config index, for the diagnostic on a bad type
--- @return boolean
local function configAllowsStories(config, index)
    if not config or config.allowStories == nil then return false end
    local t = type(config.allowStories)
    if t == "string" then
        -- walk the dots so a full SandboxVars key works, e.g. DWAP_HWFF.KeepZombies
        local parts = {}
        for part in config.allowStories:gmatch("[^%.]+") do
            parts[#parts + 1] = part
        end
        return (SandboxVars[parts[1]] and SandboxVars[parts[1]][parts[2]]) or false
    elseif t == "boolean" then
        return config.allowStories
    else
        local name = config.doorKeys and config.doorKeys.name or ("Unknown, index " .. index)
        print("DWAP PreventStories: Invalid allowStories type in config " .. name)
        return false
    end
end

--- Every baseBuildings anchor whose config has not opted into stories.
--- @return table array of { x, y, z }
local function antiStoryAnchors()
    local anchors = {}
    local configs = DWAPUtils.loadConfigs()
    if not configs then return anchors end
    for i = 1, #configs do
        local config = configs[i]
        if config and config.baseBuildings and not configAllowsStories(config, i) then
            for j = 1, #config.baseBuildings do
                local anchor = config.baseBuildings[j]
                if anchor and anchor.x and anchor.y then
                    anchors[#anchors + 1] = { x = anchor.x, y = anchor.y, z = anchor.z or 0 }
                end
            end
        end
    end
    return anchors
end

--- Underground (z < 0) coordinates of every story-suppressed config, deduped.
---
--- DWAP safehouse basements are stamped as SEPARATE BuildingDefs - one per
--- basement layout AND per access/generator/water fragment, each with its own
--- unique id (Basements.getBuildingToMergeWith returns null for any def whose
--- minLevel < 0, so basement fragments never merge with the surface building).
--- baseBuildings anchors alone therefore never reach a deeper fragment's def,
--- and its population is never suppressed - the floor -13 bug. We harvest every
--- negative-z coordinate the config already declares (loot containers, the
--- generator control/fuel/fake-generator squares, and the water tanks/fixtures
--- plus their coord sources) and resolve each to its fragment def. A fragment
--- with no config coordinate (a bare access stairwell) is left uncovered; those
--- are small and lootless, an acceptable residual.
--- @return table array of { x, y, z }
local function undergroundProtectedCoords()
    local coords = {}
    local seen = {}
    local configs = DWAPUtils.loadConfigs()
    if not configs then return coords end

    local function add(x, y, z)
        if not x or not y or not z or z >= 0 then return end
        local key = DWAPUtils.hashCoords(x, y, z)
        if seen[key] then return end
        seen[key] = true
        coords[#coords + 1] = { x = x, y = y, z = z }
    end

    for i = 1, #configs do
        local config = configs[i]
        if config and not configAllowsStories(config, i) then
            local loot = config.loot
            if loot then
                for j = 1, #loot do
                    local entry = loot[j] -- placeholders may be false
                    if entry and entry.coords then
                        add(entry.coords.x, entry.coords.y, entry.coords.z)
                    end
                end
            end
            local gens = config.generators
            if gens then
                for j = 1, #gens do
                    local gen = gens[j]
                    if gen then
                        if gen.controls then add(gen.controls.x, gen.controls.y, gen.controls.z) end
                        if gen.fuelTank then add(gen.fuelTank.x, gen.fuelTank.y, gen.fuelTank.z) end
                        local fakes = gen.fakeGenerators
                        if fakes then
                            for k = 1, #fakes do
                                local fake = fakes[k]
                                if fake then add(fake.x, fake.y, fake.z) end
                            end
                        end
                    end
                end
            end
            local fixtures = config.waterFixtures
            if fixtures then
                for j = 1, #fixtures do
                    local fix = fixtures[j]
                    if fix then
                        add(fix.x, fix.y, fix.z)
                        if type(fix.source) == "table" then add(fix.source.x, fix.source.y, fix.source.z) end
                    end
                end
            end
            local tanks = config.waterTanks
            if tanks then
                for j = 1, #tanks do
                    local tank = tanks[j]
                    if tank then
                        add(tank.x, tank.y, tank.z)
                        if type(tank.source) == "table" then add(tank.source.x, tank.source.y, tank.source.z) end
                    end
                end
            end
        end
    end
    return coords
end

--- Fallback path: a square we are watching has streamed in, so the building
--- is real and reachable from it.
--- @param params table Parameters containing the coordinates of the building.
PreventStories = function(params)
    assert(params.coords, "table")
    local coords = params.coords
    local square = getSquare(coords.x, coords.y, coords.z)
    if not square then
        DWAPUtils.dprint("PreventStories: Square not found at " .. coords.x .. "," .. coords.y .. "," .. coords.z)
        return
    end

    local building = square:getBuilding()
    if not building then
        DWAPUtils.dprint("PreventStories: No building found at " .. coords.x .. "," .. coords.y .. "," .. coords.z)
        return
    end
    local def = building:getDef()
    if not def then
        DWAPUtils.dprint("PreventStories: No building definition found at " .. coords.x .. "," .. coords.y .. "," .. coords.z)
        return
    end
    markBuildingDef(def)
    DWAPUtils.dprint("PreventStories: marked building at " .. coords.x .. "," .. coords.y .. "," .. coords.z)
end

--- Primary path: reach the BuildingDefs straight off the metagrid, before a
--- single chunk has streamed. A basement anchor often has no building of its
--- own in the metagrid, so fall back to the surface building on the same
--- column - for a safehouse basement that is the building we want anyway.
local function suppressStoriesFromMetaGrid()
    local world = getWorld()
    local metaGrid = world and world.getMetaGrid and world:getMetaGrid()
    if not metaGrid then
        DWAPUtils.dprint("PreventStories: no metagrid yet, relying on the square-loaded fallback")
        return
    end
    local anchors = antiStoryAnchors()
    local marked, missed = 0, 0
    for i = 1, #anchors do
        local a = anchors[i]
        local def = metaGrid:getBuildingAt(a.x, a.y, a.z)
        if not def and a.z ~= 0 then
            def = metaGrid:getBuildingAt(a.x, a.y, 0)
        end
        if markBuildingDef(def) then
            marked = marked + 1
        else
            missed = missed + 1
            DWAPUtils.dprint(("PreventStories: no building def at anchor %d,%d,%d"):format(a.x, a.y, a.z))
        end
    end
    DWAPUtils.dprint(("PreventStories: marked %d building defs from the metagrid, %d anchors had none"):format(
        marked, missed))

    -- Basement fragments: the negative-z config coords each resolve to their own
    -- stamped fragment def. These are queryable off the metagrid at z < 0 -
    -- getBuildingAt(x, y, z) -> getRoomAt on the metachunk, and basement rooms
    -- are registered at their negative levels (Basements.addBasementBuildingDefs
    -- ToMetaGrid). No z=0 fallback here: an arbitrary loot square that fails to
    -- resolve must NOT mark the unrelated surface building - the square-loaded
    -- watcher below covers it retroactively instead.
    local under = undergroundProtectedCoords()
    local underMarked = 0
    for i = 1, #under do
        local c = under[i]
        if markBuildingDef(metaGrid:getBuildingAt(c.x, c.y, c.z)) then
            underMarked = underMarked + 1
        end
    end
    DWAPUtils.dprint(("PreventStories: marked %d basement-fragment defs from %d underground coords"):format(
        underMarked, #under))
end

Events.OnLoadMapZones.Add(suppressStoriesFromMetaGrid)

Events.OnInitGlobalModData.Add(function()
    local anchors = antiStoryAnchors()
    for i = 1, #anchors do
        local a = anchors[i]
        DWAPSquareLoaded:AddEvent(
            PreventStories,
            a.x, a.y, a.z,
            true,
            {
                coords = { x = a.x, y = a.y, z = a.z },
            }
        )
    end

    -- Retroactive coverage for basement fragments whose def the metagrid probe
    -- could not resolve (or on a save where the fragment streams before the
    -- probe): PreventStories resolves the live streamed building and records the
    -- fragment def when the square loads. One-shot per coord; O(1) per square
    -- load in DWAPSquareLoaded (keyed by coord hash).
    local under = undergroundProtectedCoords()
    for i = 1, #under do
        local c = under[i]
        DWAPSquareLoaded:AddEvent(
            PreventStories,
            c.x, c.y, c.z,
            true,
            {
                coords = { x = c.x, y = c.y, z = c.z },
            }
        )
    end
    DWAPUtils.dprint(("PreventStories: watching %d baseBuildings anchors + %d underground coords as a fallback."):format(
        #anchors, #under))
end)
