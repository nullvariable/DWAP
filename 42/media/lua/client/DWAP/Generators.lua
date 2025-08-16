local DWAPUtils = require("DWAPUtils")
local random = newrandom()
Reflection = require("Starlit/utils/Reflection")

local DWAP_GenData

local SOUNDVOLUME = 3

DWAP_Gen = {
    ---@type IsoCell
    cell = nil,
    chunksByHash = {}, -- controlIndex
    generators = {},
    AutoPowerDone = false,
    emitters = {},
    ready = false,
    pendingChunks = table.newarray(),
}

Events.OnPostMapLoad.Add(function (cell, x, y)
    DWAP_Gen.cell = cell
end)

local hashCoords = DWAPUtils.hashCoords

--- Get a random decay value between 0 0.02
--- @return number
local function getRandDecay()
    local value = random:random(0, 2)
    if value == 0 then
        return 0
    end
    return value / 100
end

local function calculateChunkBounds(wx, wy)
    local startX = wx * 8
    local startY = wy * 8
    local endX = startX + 8 - 1
    local endY = startY + 8 - 1
    return startX, startY, endX, endY
end

local function getCenterFromWXWY(wx, wy)
    local startX, startY, endX, endY = calculateChunkBounds(wx, wy)
    return math.floor((startX + endX) / 2), math.floor((startY + endY) / 2)
end

local function centerKey(wx, wy)
    local x, y = getCenterFromWXWY(wx, wy)
    return ("%s-%s"):format(x, y), x, y
end

local function getChunkCenterXY(chunk)
    local wx = Reflection.getField(chunk, "wx")
    local wy = Reflection.getField(chunk, "wy")
    local x, y = getCenterFromWXWY(wx, wy)
    return x, y, wx, wy
    -- local startX, startY, endX, endY = calculateChunkBounds(wx, wy)
    -- return math.floor((startX + endX) / 2), math.floor((startY + endY) / 2), wx, wy
end

local function powerChunk(chunk)
    local bottom = chunk:getMinLevel()
    local top = chunk:getMaxLevel()
    local x, y, wx, wy = getChunkCenterXY(chunk)
    -- DWAPUtils.dprint(("Adding generator pos %s %s %s-%s %s %s"):format(x, y, bottom, top, wx, wy))
    local interval = SandboxVars.GeneratorVerticalPowerRange or 1
    if interval < 1 then
        interval = 1
    end
    for i = bottom, top, interval do
        chunk:addGeneratorPos(x, y, i)
    end
end

local function unpowerChunk(chunk)
    -- local bottom = chunk:getMinLevel()
    -- local top = chunk:getMaxLevel()
    -- local x, y = getChunkCenterXY(chunk)
    -- for i = bottom, top do
    --     chunk:removeGeneratorPos(x, y, i)
    -- end
    -- chunk:checkForMissingGenerators()
    -- local objs = getCell():getObjectList()
    -- for i = 0, objs:size() - 1 do
    --     local obj = objs:get(i)
    --     if obj then
    --         obj:checkHaveElectricity()
    --     end
    -- end
    local generatorsTouchingThisChunk = Reflection.getField(chunk, "generatorsTouchingThisChunk")
    if generatorsTouchingThisChunk then
        for i = generatorsTouchingThisChunk:size() - 1, 0, -1 do
            local gen = generatorsTouchingThisChunk:get(i)
            if gen then
                local gx, gy, gz = gen:getX(), gen:getY(), gen:getZ()
                chunk:removeGeneratorPos(gx, gy, gz)
            end
        end
    end
end

local function getChunkHash(chunk)
    local wx = Reflection.getField(chunk, "wx")
    local wy = Reflection.getField(chunk, "wy")
    return hashCoords(wx, wy, 0), wx, wy
end

local function powerChunkFromXY(params)
    local wx, wy = params.wx, params.wy
    DWAPUtils.dprint("DWAP_Gen: powerChunkFromXY")
    local chunk = DWAP_Gen.cell:getChunk(wx, wy)
    if chunk then
        powerChunk(chunk)
    end
end

function DWAP_Gen:loadpending()
    for i = 1, #self.pendingChunks do
        DWAPUtils.Repeat(powerChunkFromXY, 10, {wx = self.pendingChunks[i][1], wy = self.pendingChunks[i][2]})
    end
    self.pendingChunks = table.newarray()
end

function DWAP_Gen:chunkLoaded(chunk)
    local hash, wx, wy = getChunkHash(chunk)
    local _centerKey, cx, cy = centerKey(wx, wy)
    self.activeChunks[_centerKey] = {x = cx, y = cy, wx = wx, wy = wy, hash = hash}
    self.activeChunksByHash[hash] = true
    if self.chunksByHash[hash] then
        DWAPUtils.dprint("DWAP_Gen: Chunk with hash loaded")
        local gen = self.generators[self.chunksByHash[hash]]
        if gen and gen.running then
            local x, y = getChunkCenterXY(chunk)
            local z = 0
            -- Annoyingly the chunk runs IsoGenerator.chunkLoaded just before LoadChunk, which causes a race condition
            -- Waiting until the gridcell is loaded and then running seems to be reliable
            DWAPSquareLoaded:AddEvent(
                powerChunkFromXY,
                x,
                y,
                z,
                true,
                {
                    wx = wx,
                    wy = wy
                }
            )
            DWAPUtils.DeferMinute(function ()
                powerChunkFromXY({wx = wx, wy = wy})
            end)
        end
    end
end

-- local refreshRange = 6
local refreshNearbyChunks
function DWAP_Gen:RefreshNearbyChunks()
    -- local pSquare = getPlayer():getCurrentSquare()
    -- local pchunk = pSquare:getChunk()
    -- if pchunk then
    --     local _, wx, wy = getChunkHash(pchunk)
    --     for i = wx -refreshRange, wx + refreshRange do
    --         for j = wy - refreshRange, wy + refreshRange do
    --             local chunk = DWAP_Gen.cell:getChunk(i, j)
    --             if chunk then
    --                 DWAP_Gen:chunkLoaded(chunk)
    --             end
    --         end
    --     end
    -- end
    if self.activeChunks then
        for _, chunk in pairs(self.activeChunks) do
            local gen = self.generators[self.chunksByHash[chunk.hash]]
            if gen and gen.running then
                local wx, wy = chunk.wx, chunk.wy
                local cchunk = DWAP_Gen.cell:getChunk(wx, wy)
                if cchunk then
                    -- powerChunkFromXY
                    powerChunk(cchunk)
                end
            end
        end
    end
end
refreshNearbyChunks = function()
    DWAP_Gen:RefreshNearbyChunks()
end


local unloadSquare
function DWAP_Gen:unloadSquare(square)
    if not square then
        return
    end
    local x, y = square:getX(), square:getY()
    local key = ("%s-%s"):format(x, y)
    if self.activeChunks[key] then
        self.activeChunksByHash[self.activeChunks[key].hash] = nil
        self.activeChunks[key] = nil
    end
end
unloadSquare = function(square)
    return DWAP_Gen:unloadSquare(square)
end



function DWAP_Gen:GetGenerator(index)
    return self.generators[index]
end

function DWAP_Gen:TurnOffGen(genIndex)
    local gen = self.generators[genIndex]
    gen.running = false
    local chunks = gen.chunks
    for i = 1, #chunks do
        for j = chunks[i][1] - 2, chunks[i][1] + 2 do
            for k = chunks[i][2] - 2, chunks[i][2] + 2 do
                local chunk = self.cell:getChunk(j, k)
                if chunk then
                    unpowerChunk(chunk)
                -- else
                --     table.insert(self.pendingChunks, {j, k})
                end
            end
        end
    end
    -- for i = 1, #gen.chunks do
    --     local chunk = self.cell:getChunk(gen.chunks[i][1], gen.chunks[i][2])
    --     if chunk then
    --         unpowerChunk(chunk)
    --     else
    --         DWAPUtils.dprint("Chunk not loaded " .. gen.chunks[i][1] .. " " .. gen.chunks[i][2])
    --     end
    -- end
    self:SaveModData()
    self:ensureSound(genIndex)
end

function DWAP_Gen:TurnOnGen(genIndex)
    local gen = self.generators[genIndex]
    gen.running = true
    for i = 1, #gen.chunks do
        local chunk = self.cell:getChunk(gen.chunks[i][1], gen.chunks[i][2])
        if chunk then
            powerChunk(chunk)
        end
    end
    self:SaveModData()
    self:ensureSound(genIndex)
end

function DWAP_Gen:RepairGen(genIndex, amount)
    local gen = self.generators[genIndex]
    gen.condition = gen.condition + amount
    if gen.condition > 100 then
        gen.condition = 100
    end
    self:SaveModData()
end

function DWAP_Gen:AddFuel(genIndex, amount)
    local gen = self.generators[genIndex]
    gen.fuel = gen.fuel + amount
    if gen.fuel > gen.capacity then
        gen.fuel = gen.capacity
    end
    self:SaveModData()
end

function DWAP_Gen:RemoveFuel(genIndex, amount)
    local gen = self.generators[genIndex]
    gen.fuel = gen.fuel - amount
    if gen.fuel < 0 then
        gen.fuel = 0
    end
    self:SaveModData()
end

function DWAP_Gen:hourlyTick()
    local fuelUsed = SandboxVars.DWAP.GeneratorPerHour or 0.5
    if not self.generators then return end
    if not self.AutoPowerDone and not DWAPUtils.WorldPowerStillAvailable() then
        for i = 1, #self.generators do
            local gen = self.generators[i]
            if not gen.running then
                gen.running = true
                self:TurnOnGen(i)
            end
        end
        self.AutoPowerDone = true
        DWAP_GenData.AutoPowerDone = true
        DWAP_Gen:SaveModData()
        DWAPUtils.dprint("DWAP_Gen: Auto power enabled")
    end
    for i = 1, #self.generators do
        local gen = self.generators[i]
        if gen.running then
            gen.condition = gen.condition - getRandDecay()
            if gen.condition <= 0 then
                gen.condition = 0
                gen.running = false
                self:TurnOffGen(i)
                -- @TODO damage
            end
            gen.fuel = gen.fuel - fuelUsed
            if gen.fuel <= 0 then
                gen.fuel = 0
                gen.running = false
                self:TurnOffGen(i)
            end
        end
    end
end
Events.EveryHours.Add(function()
    if DWAPUtils.getSaveVersion() > 16 then
        return
    end
    DWAP_Gen:hourlyTick()
    DWAP_Gen:SaveModData()
end)
Events.EveryOneMinute.Add(function()
    if DWAPUtils.getSaveVersion() > 16 then
        return
    end
    DWAP_Gen:RefreshNearbyChunks()
end)

function DWAP_Gen:SaveModData()
    local md = ModData.getOrCreate("DWAP_GenData")
    md.generators = self.generators
end


--- Get an object from a square by sprite name
--- @param square IsoGridSquare
--- @param sprite string
--- @return IsoObject|nil objects
local function getSpriteObject(square, sprite)
    local objs = square:getObjects()
    local size = objs:size() - 1
    for i = 0, size do
        local object = objs:get(i)
        if object and object:getSpriteName() == sprite then
            return object
        end
    end
    return nil
end

function DWAP_Gen:ensureSound(index)
    DWAPUtils.dprint("DWAP_Gen: ensureSound")
    if not self.generators[index] then
        error("Generator not found " .. index)
        return
    end

    if not self.ready then
        DWAPUtils.dprint("DWAP_Gen: ensureSound Not ready")
        DWAPUtils.Defer(function()
            local _index = index
            index = nil
            DWAP_Gen:ensureSound(_index)
        end)
        return
    end

    local running = self.generators[index].running
    local coords = {x = self.generators[index].controls.x, y = self.generators[index].controls.y, z = self.generators[index].controls.z}
    if not self.emitters[index] then
        self.emitters[index] = getWorld():getFreeEmitter(coords.x, coords.y, coords.z)
    end
    if running then
        if self.emitters[index]:isPlaying("GeneratorLoop") then
            DWAPUtils.dprint("Already playing sound")
            return
        end
        -- local manager = getWorldSoundManager()
        -- local obj = getSpriteObject(self.cell:getGridSquare(coords.x, coords.y, coords.z), self.generators[index].controls.sprite)
        -- if not obj then
        --     error("Generator control object not found")
        --     return
        -- end
        -- manager:addSoundRepeating(obj, coords.x, coords.y, coords.z, 20.0, 20.0, false)
        DWAPUtils.dprint("Playing sound")
        self.emitters[index]:playSound("GeneratorLoop")
        self.emitters[index]:setVolumeAll(SOUNDVOLUME)
    else
        if self.emitters[index] then
            self.emitters[index]:stopAll()
        end
    end
end

local function controlsSeenWrapper(params)
    DWAPUtils.dprint("DWAP_Gen: controlsSeenWrapper")
    -- DWAPUtils.dprint(params)
    DWAP_Gen:ensureSound(params.controlIndex)
end

function DWAP_Gen:GetControlPoints()
    local points = table.newarray()
    for i = 1, #self.generators do
        local gen = self.generators[i]
        points[i] = gen.controls
    end
    return points
end

function DWAP_Gen:initModData(isNewGame)
    if SandboxVars.DWAP.EnableGenSystem then
        -- Exit early if save version is greater than 16
        if DWAPUtils.getSaveVersion() > 16 then
            return
        end
        Events.ReuseGridsquare.Add(unloadSquare)
        Events.LoadChunk.Add(function(chunk)
            DWAP_Gen:chunkLoaded(chunk)
        end)
        Events.OnExitVehicle.Add(refreshNearbyChunks)
        self.activeChunks = {}
        self.activeChunksByHash = {}
        DWAP_GenData = ModData.getOrCreate("DWAP_GenData")
        -- DWAPUtils.dprint("DWAP_Gen.initModData")
        -- DWAPUtils.dprint({
        --     DWAP_GenData = DWAP_GenData,
        --     isNewGame = isNewGame,
        --     power = DWAPUtils.WorldPowerStillAvailable(),
        -- })
        if not DWAP_GenData or not DWAP_GenData.init or isNewGame then
            local wpStillAvail = DWAPUtils.WorldPowerStillAvailable()
            local configs = DWAPUtils.loadConfigs()
            DWAP_GenData.init = true
            DWAP_GenData.AutoPowerDone = false
            if not SandboxVars.DWAP.AutoPowerGenSystem then
                DWAP_GenData.AutoPowerDone = true
            end
            DWAP_GenData.generators = table.newarray()

            local running = false
            if not wpStillAvail and SandboxVars.DWAP.AutoPowerGenSystem then
                running = true
                DWAP_GenData.AutoPowerDone = true
                self.AutoPowerDone = true
            end
            for i = 1, #configs do
                local config = configs[i]
                if config then
                    if config.generators then
                        for j = 1, #config.generators do
                            local gen = config.generators[j]
                            local genConf = {
                                running = running,
                                fuel = SandboxVars.DWAP.GeneratorFuel or 1000,
                                capacity = SandboxVars.DWAP.GeneratorFuelTank or 2000,
                                condition = SandboxVars.DWAP.GeneratorCondition or 100,
                                controls = gen.controls,
                                chunks = gen.chunks,
                            }
                            local controlIndex = #self.generators + 1
                            self.generators[controlIndex] = genConf
                            self.emitters[controlIndex] = nil
                            for k = 1, #gen.chunks do
                                local chunk = gen.chunks[k]
                                local hash = hashCoords(chunk[1], chunk[2], 0)
                                self.chunksByHash[hash] = controlIndex
                            end
                            DWAPSquareLoaded:AddEvent(
                                controlsSeenWrapper,
                                    gen.controls.x,
                                    gen.controls.y,
                                    gen.controls.z,
                                    false,
                                    {
                                        controlIndex = controlIndex
                                    }
                                )
                        end
                    end
                end
            end
            DWAP_GenData.generators = self.generators
            DWAPUtils.dprint(DWAP_GenData.generators)
            self:SaveModData()
        else
            self.AutoPowerDone = DWAP_GenData.AutoPowerDone
            self.generators = DWAP_GenData.generators
            -- chunksByHash
            for i = 1, #self.generators do
                local gen = self.generators[i]
                for j = 1, #gen.chunks do
                    local chunk = gen.chunks[j]
                    local hash = hashCoords(chunk[1], chunk[2], 0)
                    self.chunksByHash[hash] = i
                end
                DWAPSquareLoaded:AddEvent(
                    controlsSeenWrapper,
                        gen.controls.x,
                        gen.controls.y,
                        gen.controls.z,
                        false,
                        {
                            controlIndex = i
                        }
                    )
            end
        end
    end
end
Events.OnInitGlobalModData.Add(function(isNewGame)
    DWAP_Gen:initModData(isNewGame)
end)

Events.OnLoad.Add(function()
    if DWAPUtils.getSaveVersion() > 16 then
        DWAPUtils.dprint("DWAP_Gen: Save version is greater than 16")
        return
    end
    DWAP_Gen.ready = true
    DWAP_Gen:loadpending()
end)
