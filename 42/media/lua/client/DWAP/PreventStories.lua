
local DWAPUtils = require("DWAPUtils")

--- PreventStories
--- This function is used to prevent the generation of stories in a building by setting the building's alarmed state to false and marking the first room as explored.
--- @param params table: Parameters containing the coordinates of the building.
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
    def:setAlarmed(false)

    -- local roomDef = def:getFirstRoom()
    -- if not roomDef then
    --     DWAPUtils.dprint("PreventStories: No room definition found for building at " .. coords.x .. "," .. coords.y .. "," .. coords.z)
    --     return
    -- end
    -- roomDef:setExplored(true)
    DWAPUtils.dprint("PreventStories: Preventing stories for building at " .. coords.x .. "," .. coords.y .. "," .. coords.z)
    def:setAllExplored(true)

    local DWAPAntiStoryCoords = ModData.getOrCreate("DWAPAntiStoryCoords")
    if not DWAPAntiStoryCoords then
        DWAPAntiStoryCoords = {}
    end
    local hash = DWAPUtils.hashCoords(coords.x, coords.y, coords.z)
    DWAPAntiStoryCoords[hash] = nil
end

Events.OnInitGlobalModData.Add(function()
    local DWAPAntiStoryCoords = ModData.getOrCreate("DWAPAntiStoryCoords")
    if not DWAPAntiStoryCoords.coords then
        DWAPAntiStoryCoords.coords = {}
        local configs = DWAPUtils.loadConfigs()
        for i = 1, #configs do
            local config = configs[i]
            if config and config.doorKeys and not config.allowStories then
                for j = 1, #config.doorKeys.doors do
                    local door = config.doorKeys.doors[j]
                    local hash = DWAPUtils.hashCoords(door.x, door.y, door.z)
                    if not DWAPAntiStoryCoords.coords[hash] then
                        DWAPAntiStoryCoords.coords[hash] = { x = door.x, y = door.y, z = door.z }
                    end
                end
            end
        end
        table.wipe(configs)
    end
    local debugCount = 0
    for _, coords in pairs(DWAPAntiStoryCoords.coords) do
        debugCount = debugCount + 1
        DWAPSquareLoaded:AddEvent(
            PreventStories,
            coords.x, coords.y, coords.z,
            true,
            {
                coords = {x = coords.x, y = coords.y, z = coords.z},
            }
        )
    end
    DWAPUtils.dprint("PreventStories: Loaded " .. debugCount .. " anti-story coordinates.")
end)
