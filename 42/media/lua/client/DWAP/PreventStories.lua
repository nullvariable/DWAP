
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

local function markBuildingDef(def)
    if not def then return false end
    def:setAllExplored(true)
    def:setAlarmed(false)
    return true
end

--- Every baseBuildings anchor whose config has not opted into stories.
--- @return table array of { x, y, z }
local function antiStoryAnchors()
    local anchors = {}
    local configs = DWAPUtils.loadConfigs()
    if not configs then return anchors end
    for i = 1, #configs do
        local config = configs[i]
        local allowStories = false
        if config and config.allowStories ~= nil then
            if type(config.allowStories) == "string" then
                -- walk the dots so a full SandboxVars key works, e.g. DWAP_HWFF.KeepZombies
                local parts = {}
                for part in config.allowStories:gmatch("[^%.]+") do
                    parts[#parts + 1] = part
                end
                allowStories = SandboxVars[parts[1]] and SandboxVars[parts[1]][parts[2]]
            elseif type(config.allowStories) == "boolean" then
                allowStories = config.allowStories
            else
                local name = config.doorKeys and config.doorKeys.name or ("Unknown, index " .. i)
                print("DWAP PreventStories: Invalid allowStories type in config " .. name)
            end
        end
        if config and config.baseBuildings and not allowStories then
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
    DWAPUtils.dprint("PreventStories: watching " .. #anchors .. " baseBuildings anchors as a fallback.")
end)
