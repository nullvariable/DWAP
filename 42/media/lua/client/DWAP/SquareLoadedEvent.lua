local DWAPUtils = require("DWAPUtils")
local table = table
local setmetatable = setmetatable
local assert = assert
local getSquare = getSquare
local ModData = ModData
local newrandom = newrandom


--- Main Event function
--- @param square IsoGridSquare
function DWAPLoadGridSquare(square)
    if not square then return end
    if not DWAPSquareLoaded then return end
    DWAPSquareLoaded:RunCoord(square:getX(), square:getY(), square:getZ())
end

Events.LoadGridsquare.Add(DWAPLoadGridSquare)

local pendingReadyEvents = table.newarray()

-- if not DWAPSquareLoaded then
local random = newrandom()
DWAPSquareLoaded = {
    Events = table.newarray(),
    EventsByXYZ = {},
    HookedEvents = {},
    ready = false,
    needsSave = false, -- currently unused, @see DWAPSquareLoaded:Save

    --- Turn a set of coords into a hash
    --- @return number
    hashCoords = DWAPUtils.hashCoords,
}

--- Run a hook event
--- @param name string
--- @param x number
--- @param y number
--- @param z number
--- @param _params? table
function DWAPSquareLoaded:RunHook(name, x, y, z, _params)
    if not self.HookedEvents[name] then
        DWAPUtils.dprint(("DWAPSquareLoaded:RunHook %s no events"):format(name))
        return
    end
    local coordKey = self.hashCoords(x, y, z)
    if not self.HookedEvents[name][coordKey] then
        DWAPUtils.dprint(("DWAPSquareLoaded:RunHook %s %s %s no events"):format(name, x, y))
        return
    end

    DWAPUtils.dprint(("DWAPSquareLoaded:RunHook running %s %s %s %s %s"):format(name, x, y, coordKey,
        #self.HookedEvents[name][coordKey]))
    DWAPUtils.dprint(self.HookedEvents[name])
    for i = 1, #self.HookedEvents[name][coordKey] do
        local event = self.HookedEvents[name][coordKey][i]
        if event then
            local params = {}
            if event.params then
                params = event.params
            end
            if _params then
                for k, v in pairs(_params) do
                    params[k] = v
                end
            end
            -- DWAPUtils.dprint(params)
            self:AddEvent(event.cb, x, y, z, event.once, params)
        end
    end
    self.HookedEvents[name][coordKey] = nil
    DWAPUtils.dprint(("DWAPSquareLoaded:RunHook %s %s %s %s done"):format(name, coordKey, x, y))
    self.needsSave = true
end

--- Allows us to add square loaded events that are only triggered after a hook event is triggered
--- @param name string The name of the hook event
--- @param cb function
--- @param x number
--- @param y number
--- @param z number
--- @param once boolean Run this event only once, or every time we see this square? (once the hook is triggered, the event will always run on this square)
--- @param params? table
--- @return number|nil
function DWAPSquareLoaded:AddHookEvent(name, cb, x, y, z, once, params)
    -- if not self.ready then
    --     DWAPUtils.dprint("DWAPSquareLoaded:AddHookEvent not ready, deffering "..x.." "..y)
    --     DWAPUtils.Defer(function()
    --         self:AddHookEvent(name, cb, x, y, z, once, params)
    --     end)
    --     return
    -- end
    DWAPUtils.dprint(("DWAPSquareLoaded:AddHookEvent %s %s %s %s"):format(name, x, y, z))
    assert(name, "DWAPSquareLoaded:AddHookEvent: name is required")
    assert(cb, "DWAPSquareLoaded:AddHookEvent: cb is required")
    assert(x, "DWAPSquareLoaded:AddHookEvent: x is required")
    assert(y, "DWAPSquareLoaded:AddHookEvent: y is required")
    assert(z, "DWAPSquareLoaded:AddHookEvent: z is required")
    once = once or true

    if not self.HookedEvents[name] then
        self.HookedEvents[name] = setmetatable({}, {
            __index = function(t, k)
                t[k] = {}
                return t[k]
            end
        })
    end
    -- DWAPUtils.dprint("DWAPSquareLoaded:AddHookEvent here")

    local coordKey = self.hashCoords(x, y, z)
    -- DWAPUtils.dprint("DWAPSquareLoaded:AddHookEvent here2")
    -- DWAPUtils.dprint(self.HookedEvents[name][coordKey])

    local callbackKey = #self.HookedEvents[name][coordKey] + 1
    -- DWAPUtils.dprint("DWAPSquareLoaded:AddHookEvent here3")

    DWAPUtils.dprint(("DWAPSquareLoaded:AddHookEvent %s (%s %s) %s %s"):format(name, coordKey, callbackKey, x, y))
    local event = {
        cb = cb,
        x = x,
        y = y,
        z = z,
        once = once,
        params = params,
    }
    self.HookedEvents[name][coordKey][callbackKey] = event
    -- DWAPUtils.dprint(self.HookedEvents[name])
    -- DWAPUtils.dprint(self.HookedEvents[name][coordKey])
    self.needsSave = true
    return callbackKey
end

--- Add an event to the SquareLoaded event
--- @param cb function
--- @param x number
--- @param y number
--- @param z number
--- @param _once boolean Run this event only once, or every time we see this square?
--- @param params? table
--- @return number
function DWAPSquareLoaded:AddEvent(cb, x, y, z, _once, params)
    assert(cb, "DWAPSquareLoaded:AddEvent: cb is required")
    assert(x, "DWAPSquareLoaded:AddEvent: x is required")
    assert(y, "DWAPSquareLoaded:AddEvent: y is required")
    assert(z, "DWAPSquareLoaded:AddEvent: z is required")
    local once = _once
    if _once == nil then
        once = true
    end
    if not self.ready then
        pendingReadyEvents[#pendingReadyEvents + 1] = {cb = cb, x = x, y = y, z = z, once = once, params = params}
        return -1
    end
    -- DWAPUtils.dprint(("DWAPSquareLoaded:AddEvent %s %s"):format(x, y))

    local callbackKey = random:random(1000000)
    while self.Events[callbackKey] do
        callbackKey = random:random(1000000)
    end
    local coordKey = self.hashCoords(x, y, z)
    if not self.EventsByXYZ[coordKey] then
        self.EventsByXYZ[coordKey] = table.newarray()
    end
    self.EventsByXYZ[coordKey][#self.EventsByXYZ[coordKey] + 1] = callbackKey
    local settings = {
        callback = cb,
        coordKey = coordKey,
        once = once,
        params = params,
    }
    self.Events[callbackKey] = settings
    self.needsSave = true
    -- if type(getSquare) == "function" then -- should be handled by self.ready now
    local square = getSquare(x, y, z)
    if square then
        self:RunCoord(x, y, z)
        return -1
    end
    -- else
    --     DWAPUtils.Defer(function()
    --         local square = getSquare(x, y, z)
    --         if square then
    --             self:RunCoord(x, y, z)
    --             return nil
    --         end
    --     end)
    -- end
    return callbackKey
end

--- Remove an event by key
--- @unused
--- @param callbackKey number
function DWAPSquareLoaded:RemoveEvent(callbackKey)
    if self.Events[callbackKey] then
        if self.Events[callbackKey].coordKey then
            self.EventsByXYZ[self.Events[callbackKey].coordKey][callbackKey] = nil
        end
        self.Events[callbackKey] = nil
        -- ModData.getOrCreate("DWAP_PersistEvents")[callbackKey] = nil
    end
end

--[[
    --- Clear all events for a given coord
    --- @param x number
    --- @param y number
    --- @param z number
    function DWAPSquareLoaded:ClearCoord(x, y, z)
        local coordKey = ("%d_%d_%d"):format(x, y, z)
        if self.EventsByXYZ[coordKey] then
            for callbackKey,_ in pairs(self.EventsByXYZ[coordKey]) do
                self:RemoveEvent(callbackKey)
            end
        end
    end]] --

--- Run all the functions for a given coord
--- @param x number
--- @param y number
--- @param z number
function DWAPSquareLoaded:RunCoord(x, y, z)
    local coordKey = self.hashCoords(x, y, z)
    if self.EventsByXYZ[coordKey] then
        -- DWAPUtils.dprint(("DWAPSquareLoaded:RunCoord %s %s"):format(coordKey, tostring(#self.EventsByXYZ[coordKey])))
        for i = 1, #self.EventsByXYZ[coordKey] do
            local callbackKey = self.EventsByXYZ[coordKey][i]
            local event = self.Events[callbackKey]
            if event then
                if event.params then
                    event.callback(event.params)
                else
                    event.callback()
                end
                if event.once == true then
                    self:RemoveEvent(callbackKey)
                end
            end
        end
    end
end

local function recursiveMerge(table1, table2)
    for k, v in pairs(table2) do
        if type(v) == "table" then
            if not table1[k] then
                table1[k] = {}
            end
            recursiveMerge(table1[k], v)
        else
            table1[k] = v
        end
    end
    return table1
end

function DWAPSquareLoaded:Init()
    self.persist = ModData.getOrCreate("DWAP_PersistEvents")
    if self.persist then
        if self.persist.Events then
            self.Events = recursiveMerge(self.Events, self.persist.Events or {})
        end
        if self.persist.EventsByXYZ then
            self.EventsByXYZ = recursiveMerge(self.EventsByXYZ, self.persist.EventsByXYZ or {})
        end
        if self.persist.HookedEvents then
            recursiveMerge(self.HookedEvents, self.persist.HookedEvents or {})
        end
    end
    DWAPUtils.dprint("DWAPSquareLoaded:Init")
    -- DWAPUtils.dprint(self.HookedEvents)
end


--- Originally I had hoped to make these persistent, but I think that serializing the functions into
--- ModData breaks things and isn't worth sorting out currently. Just need to manage state on init for now.
--- save our mod data on the OnSave event if something has changed
function DWAPSquareLoaded:Save()
    if self.needsSave then
        self.persist.Events = self.Events
        self.persist.EventsByXYZ = self.EventsByXYZ
        self.persist.HookedEvents = self.HookedEvents
        self.needsSave = false
    end
end

-- end

Events.OnInitGlobalModData.Add(function()
    DWAPSquareLoaded:Init()
    DWAPUtils.Defer(function()
        DWAPSquareLoaded.ready = true
        for i = 1, #pendingReadyEvents do
            local event = pendingReadyEvents[i]
            DWAPSquareLoaded:AddEvent(event.cb, event.x, event.y, event.z, event.once, event.params)
        end
        pendingReadyEvents = table.newarray()
    end)
end)

-- Events.OnSave.Add(function()
--     DWAPSquareLoaded:Save()
-- end)

-- Events.EveryTenMinutes.Add(function()
--     DWAPSquareLoaded:Save()
-- end)

function DWAPSquareLoaded:Inspect()
    DWAPUtils.dprint("DWAPSquareLoaded:Inspect")
    DWAPUtils.dprint("*** Events ***")
    DWAPUtils.dprint(self.Events)
    DWAPUtils.dprint("*** EventsByXYZ ***")
    DWAPUtils.dprint(self.EventsByXYZ)
    DWAPUtils.dprint("*** HookedEvents ***")
    DWAPUtils.dprint(self.HookedEvents)
end
