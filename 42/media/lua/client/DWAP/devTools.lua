-- Dev tooling: inert outside debug mode so shipping this file is safe.
-- getDebug() is the -debug launch flag - per-launch, never set for normal
-- players, no sandbox UI exposure
if not getDebug() then return end

-- devTools.lua
-- Development tools for the DWAP generator system

local DWAPUtils = require("DWAPUtils")
local Reflection = require("Starlit/utils/Reflection")

-- Live overlay state, displayed by the dev panel button labels
DWAP_DevToggles = DWAP_DevToggles or { elec = false, plumbing = false, containers = false, where = false, barricades = false }

-- The power system's per-object lifecycle trace is the loudest thing in a
-- -debug log (~2800 of 2900 DWAPPowerSystem lines last run), so it ships off
-- and gets turned on only while working on power. Errors and state changes -
-- generator on/off, fuel, breakdowns - are never gated and always print.
function DWAPPowerLog()
    DWAPUtils.verbosePower = not DWAPUtils.verbosePower
    DWAP_DevToggles.powerLog = DWAPUtils.verbosePower
    DWAPUtils.dprint("Power system verbose logging: " .. (DWAPUtils.verbosePower and "on" or "off"))
end

-- Helper function to get table size
local function getTableSize(tbl)
    return DWAPUtils.tableSize(tbl)
end

-- B42 chunks are 8x8 tiles
local CHUNK_SIZE = 8

-- Helper function to get chunk center coordinates
local function getChunkCenterXY(chunk)
    local wx = Reflection.getField(chunk, "wx")
    local wy = Reflection.getField(chunk, "wy")
    local half = math.floor(CHUNK_SIZE / 2)
    return wx * CHUNK_SIZE + half, wy * CHUNK_SIZE + half
end

-- Power reaches a Euclidean disc, see IsoGenerator.isPoweringSquare
local function distanceSquared(x1, y1, x2, y2)
    local dx, dy = x1 - x2, y1 - y2
    return dx * dx + dy * dy
end

-- Only used to break ties toward the middle of the building
local function chebyshev(x1, y1, x2, y2)
    return math.max(math.abs(x1 - x2), math.abs(y1 - y2))
end

-- Interior generators are legal and are what this mod ships, so a square only
-- has to be walkable and dry
local function isValidGeneratorSquare(square)
    if not square then return false end
    if not square:isFree(false) then return false end
    if square:isWaterSquare() then return false end
    return true
end

-- Mirrors IsoGenerator.touchesChunk: does the generator's range reach the chunk
local function generatorTouchesChunk(x, y, range, wx, wy)
    local minX = wx * CHUNK_SIZE
    local minY = wy * CHUNK_SIZE
    local maxX = minX + CHUNK_SIZE - 1
    local maxY = minY + CHUNK_SIZE - 1
    if x - range > maxX then return false end
    if x + range < minX then return false end
    if y - range > maxY then return false end
    return y + range >= minY
end

-- Simple utilities for the new fakeGenerators system
function CreateFakeGeneratorAtPlayer(createTile)
    local pSquare = getPlayer():getCurrentSquare()
    if not pSquare then
        DWAPUtils.dprint("Player square not found")
        return
    end

    local x, y, z = pSquare:getX(), pSquare:getY(), pSquare:getZ()
    DWAPUtils.dprint("Creating fake generator at " ..
        x .. "," .. y .. "," .. z .. " (createTile=" .. tostring(createTile or false) .. ")")

    -- Add to test config
    print("fakeGenerators entry:")
    print("{ x = " .. x .. ", y = " .. y .. ", z = " .. z .. ", createTile = " .. tostring(createTile or false) .. " },")
end

function ValidateSimpleGeneratorSystem()
    if not DWAP_Gen2 then
        DWAPUtils.dprint("DWAP_Gen2 not initialized")
        return false
    end

    DWAPUtils.dprint("=== SIMPLE GENERATOR SYSTEM VALIDATION ===")
    DWAPUtils.dprint("Total generators: " .. #DWAP_Gen2.generators)

    for i = 1, #DWAP_Gen2.generators do
        local gen = DWAP_Gen2.generators[i]
        DWAPUtils.dprint("Generator " .. i .. ":")
        DWAPUtils.dprint("  Position: " .. gen.position.x .. "," .. gen.position.y .. "," .. gen.position.z)
        DWAPUtils.dprint("  Controls: " ..
            (gen.controls and (gen.controls.x .. "," .. gen.controls.y .. "," .. gen.controls.z) or "NONE"))
        DWAPUtils.dprint("  Running: " .. tostring(gen.running))
        DWAPUtils.dprint("  Fuel: " .. gen.fuel .. "/" .. gen.capacity)
        DWAPUtils.dprint("  CreateTile: " .. tostring(gen.createTile or false))

        local isoGen = DWAP_Gen2.isoGenerators[i]
        if isoGen then
            DWAPUtils.dprint("  IsoGenerator: Connected=" .. tostring(isoGen:isConnected()) ..
                ", Fuel=" .. isoGen:getFuel() ..
                ", Condition=" .. isoGen:getCondition())
        else
            DWAPUtils.dprint("  IsoGenerator: NOT LOADED")
        end
        DWAPUtils.dprint("")
    end

    return true
end

function ListNearbyGenerators()
    local pSquare = getPlayer():getCurrentSquare()
    if not pSquare then
        DWAPUtils.dprint("Player square not found")
        return
    end

    local playerX, playerY, playerZ = pSquare:getX(), pSquare:getY(), pSquare:getZ()
    DWAPUtils.dprint("=== NEARBY GENERATORS FROM " .. playerX .. "," .. playerY .. "," .. playerZ .. " ===")

    local nearbyGenerators = {}
    for i = 1, #DWAP_Gen2.generators do
        local gen = DWAP_Gen2.generators[i]
        local distance = math.sqrt((gen.position.x - playerX) ^ 2 + (gen.position.y - playerY) ^ 2)
        if distance <= 100 then -- Within 100 tiles
            table.insert(nearbyGenerators, { index = i, generator = gen, distance = distance })
        end
    end

    if #nearbyGenerators == 0 then
        DWAPUtils.dprint("No generators found within 100 tiles")
        return
    end

    -- Sort by distance
    table.sort(nearbyGenerators, function(a, b) return a.distance < b.distance end)

    DWAPUtils.dprint("Found " .. #nearbyGenerators .. " nearby generators:")
    for i = 1, #nearbyGenerators do
        local entry = nearbyGenerators[i]
        local gen = entry.generator
        DWAPUtils.dprint("Generator " .. entry.index .. " at distance " .. string.format("%.1f", entry.distance))
        DWAPUtils.dprint("  Position: " .. gen.position.x .. "," .. gen.position.y .. "," .. gen.position.z)
        DWAPUtils.dprint("  Status: " .. (gen.running and "RUNNING" or "STOPPED"))

        -- Check if the generator square is loaded and has IsoGenerator
        local genSquare = getSquare(gen.position.x, gen.position.y, gen.position.z)
        if genSquare then
            local isoGen = DWAP_Gen2.isoGenerators[entry.index]
            if isoGen then
                DWAPUtils.dprint("  Status: LOADED & ACTIVE")
            else
                DWAPUtils.dprint("  Status: LOADED but NO ISOGEN")
            end
        else
            DWAPUtils.dprint("  Status: NOT LOADED")
        end
        DWAPUtils.dprint("")
    end
end

function FindOptimalGeneratorSquaresForBuilding()
    local player = getPlayer()
    local pSquare = player and player:getCurrentSquare()
    if not pSquare then
        DWAPUtils.dprint("Player square not found")
        return
    end
    local building = pSquare:getBuilding()
    if not building then
        DWAPUtils.dprint("No building found")
        return
    end

    local playerX, playerY, playerZ = pSquare:getX(), pSquare:getY(), pSquare:getZ()
    local range = SandboxVars.GeneratorTileRange or 20
    local rangeSq = range * range
    local verticalRange = SandboxVars.GeneratorVerticalPowerRange or 3

    -- Group building squares by chunk, tracking the real tile bounds of each
    -- chunk instead of assuming the whole chunk is occupied
    local uniqueChunks = {}
    local chunkBounds = {}
    local occupiedLevels = {}
    local squareCount = 0
    local minX, maxX, minY, maxY

    local function collectLevel(z)
        local found = 0
        for x = playerX - 50, playerX + 50 do
            for y = playerY - 50, playerY + 50 do
                local square = getSquare(x, y, z)
                if square and DWAPUtils.sameBuilding(square:getBuilding(), building) then
                    found = found + 1
                    local chunk = square:getChunk()
                    local wx = Reflection.getField(chunk, "wx")
                    local wy = Reflection.getField(chunk, "wy")
                    local chunkKey = wx .. "_" .. wy

                    local bounds = chunkBounds[chunkKey]
                    if not bounds then
                        uniqueChunks[chunkKey] = { chunk = chunk, wx = wx, wy = wy }
                        bounds = {
                            minX = x,
                            maxX = x,
                            minY = y,
                            maxY = y,
                            minZ = z,
                            maxZ = z,
                            squares = 0
                        }
                        chunkBounds[chunkKey] = bounds
                    end

                    bounds.minX = math.min(bounds.minX, x)
                    bounds.maxX = math.max(bounds.maxX, x)
                    bounds.minY = math.min(bounds.minY, y)
                    bounds.maxY = math.max(bounds.maxY, y)
                    bounds.minZ = math.min(bounds.minZ, z)
                    bounds.maxZ = math.max(bounds.maxZ, z)
                    bounds.squares = bounds.squares + 1

                    minX = minX and math.min(minX, x) or x
                    maxX = maxX and math.max(maxX, x) or x
                    minY = minY and math.min(minY, y) or y
                    maxY = maxY and math.max(maxY, y) or y
                end
            end
        end
        if found > 0 then
            occupiedLevels[#occupiedLevels + 1] = z
        end
        squareCount = squareCount + found
        return found
    end

    -- Basements are frequently larger than the ground footprint, so walk the
    -- z levels out from the player until two empty levels in a row
    local zSearch = 8
    local minLevel, maxLevel = playerZ, playerZ
    collectLevel(playerZ)
    local emptyLevels = 0
    for z = playerZ + 1, playerZ + zSearch do
        if collectLevel(z) > 0 then
            emptyLevels = 0
            maxLevel = z
        else
            emptyLevels = emptyLevels + 1
            if emptyLevels >= 2 then break end
        end
    end
    emptyLevels = 0
    for z = playerZ - 1, playerZ - zSearch, -1 do
        if collectLevel(z) > 0 then
            emptyLevels = 0
            minLevel = z
        else
            emptyLevels = emptyLevels + 1
            if emptyLevels >= 2 then break end
        end
    end

    table.sort(occupiedLevels)

    local totalChunks = getTableSize(uniqueChunks)
    DWAPUtils.dprint(("SquaresInBuilding %d across z %d..%d"):format(squareCount, minLevel, maxLevel))
    DWAPUtils.dprint("UniqueChunks found: " .. totalChunks)
    if totalChunks == 0 then
        DWAPUtils.dprint("No building squares found")
        return
    end

    for chunkKey, chunkData in pairs(uniqueChunks) do
        local bounds = chunkBounds[chunkKey]
        local centerX, centerY = getChunkCenterXY(chunkData.chunk)
        DWAPUtils.dprint(("Chunk %s center %d,%d tiles %d (x %d..%d, y %d..%d, z %d..%d)"):format(
            chunkKey, centerX, centerY, bounds.squares,
            bounds.minX, bounds.maxX, bounds.minY, bounds.maxY, bounds.minZ, bounds.maxZ))
    end

    -- A candidate powers a chunk only when every building tile in that chunk is
    -- inside the generator's disc, so test the corners of the chunk's tile bounds
    local function coversChunk(candidateX, candidateY, candidateZ, bounds)
        if math.abs(candidateZ - bounds.minZ) > verticalRange then return false end
        if math.abs(candidateZ - bounds.maxZ) > verticalRange then return false end
        if distanceSquared(candidateX, candidateY, bounds.minX, bounds.minY) > rangeSq then return false end
        if distanceSquared(candidateX, candidateY, bounds.minX, bounds.maxY) > rangeSq then return false end
        if distanceSquared(candidateX, candidateY, bounds.maxX, bounds.minY) > rangeSq then return false end
        if distanceSquared(candidateX, candidateY, bounds.maxX, bounds.maxY) > rangeSq then return false end
        return true
    end

    -- Collect every valid square within reach of the building, on each level the
    -- building occupies, as a set cover candidate
    DWAPUtils.dprint(("Scanning candidates on %d levels with range %d, vertical %d"):format(
        #occupiedLevels, range, verticalRange))

    local candidates = {}
    local candidateKeys = {}

    for i = 1, #occupiedLevels do
        local z = occupiedLevels[i]
        for x = minX - range, maxX + range do
            for y = minY - range, maxY + range do
                local key = x .. "_" .. y .. "_" .. z
                if not candidates[key] then
                    local square = getSquare(x, y, z)
                    if isValidGeneratorSquare(square) then
                        local coveredChunks = {}
                        local chunkCount = 0
                        for chunkKey, _ in pairs(uniqueChunks) do
                            if coversChunk(x, y, z, chunkBounds[chunkKey]) then
                                coveredChunks[chunkKey] = true
                                chunkCount = chunkCount + 1
                            end
                        end
                        -- squares that cannot power anything are not candidates
                        if chunkCount > 0 then
                            candidates[key] = {
                                x = x,
                                y = y,
                                z = z,
                                coveredChunks = coveredChunks,
                                chunkCount = chunkCount
                            }
                            candidateKeys[#candidateKeys + 1] = key
                        end
                    end
                end
            end
        end
    end

    table.sort(candidateKeys)
    DWAPUtils.dprint("Candidate squares: " .. #candidateKeys)

    -- Select the minimal set greedily; ties go to the candidate nearest the
    -- building center, then to the lowest key, so results are reproducible
    local centerX = math.floor((minX + maxX) / 2)
    local centerY = math.floor((minY + maxY) / 2)

    local selectedSquares = {}
    local coveredChunks = {}
    local coveredCount = 0
    local usedKeys = {}

    while coveredCount < totalChunks do
        local bestSquare, bestKey = nil, nil
        local bestCoverage, bestDistance = 0, math.huge

        for i = 1, #candidateKeys do
            local key = candidateKeys[i]
            if not usedKeys[key] then
                local candidate = candidates[key]
                local newCoverage = 0
                for chunkKey, _ in pairs(candidate.coveredChunks) do
                    if not coveredChunks[chunkKey] then
                        newCoverage = newCoverage + 1
                    end
                end

                if newCoverage > 0 then
                    local distance = chebyshev(candidate.x, candidate.y, centerX, centerY)
                    if newCoverage > bestCoverage or (newCoverage == bestCoverage and distance < bestDistance) then
                        bestSquare = candidate
                        bestKey = key
                        bestCoverage = newCoverage
                        bestDistance = distance
                    end
                end
            end
        end

        if not bestSquare then
            -- No more coverage possible, break to avoid infinite loop
            break
        end

        usedKeys[bestKey] = true
        table.insert(selectedSquares, bestSquare)

        for chunkKey, _ in pairs(bestSquare.coveredChunks) do
            if not coveredChunks[chunkKey] then
                coveredChunks[chunkKey] = true
                coveredCount = coveredCount + 1
            end
        end

        DWAPUtils.dprint(("Selected square %d,%d,%d covering %d new chunks"):format(
            bestSquare.x, bestSquare.y, bestSquare.z, bestCoverage))
    end

    DWAPUtils.dprint(("Optimal solution: %d generator squares covering %d/%d chunks"):format(
        #selectedSquares, coveredCount, totalChunks))

    for chunkKey, _ in pairs(uniqueChunks) do
        if not coveredChunks[chunkKey] then
            DWAPUtils.dprint(("No candidate square can fully power chunk %s"):format(chunkKey))
        end
    end

    return selectedSquares
end

-- Drop the invisible generators into the world so a placement can be tested.
-- haveElectricity() asks the target square's own chunk, so the position has to
-- be registered with every chunk it touches, like IsoGenerator does
function ApplyGeneratorPositions(positions)
    if not positions then
        DWAPUtils.dprint("No generator positions to apply")
        return 0
    end

    local cell = getCell()
    local range = SandboxVars.GeneratorTileRange or 20
    local chunkRange = math.floor(range / CHUNK_SIZE) + 1
    local applied = 0

    for i = 1, #positions do
        local pos = positions[i]
        local square = getSquare(pos.x, pos.y, pos.z)
        if square then
            local originChunk = square:getChunk()
            if originChunk then
                local wx = Reflection.getField(originChunk, "wx")
                local wy = Reflection.getField(originChunk, "wy")
                local touched = 0
                for dy = -chunkRange, chunkRange do
                    for dx = -chunkRange, chunkRange do
                        if generatorTouchesChunk(pos.x, pos.y, range, wx + dx, wy + dy) then
                            local chunk = cell:getChunk(wx + dx, wy + dy)
                            if chunk then
                                chunk:addGeneratorPos(pos.x, pos.y, pos.z)
                                touched = touched + 1
                            end
                        end
                    end
                end
                applied = applied + 1
                DWAPUtils.dprint(("Added generator at %d,%d,%d in %d chunks"):format(
                    pos.x, pos.y, pos.z, touched))
            end
        else
            DWAPUtils.dprint(("Square not loaded for generator at %d,%d,%d"):format(pos.x, pos.y, pos.z))
        end
    end

    DWAPUtils.dprint("Visualization only: these positions have no IsoGenerator, so " ..
        "checkForMissingGenerators drops them on the next chunk load")

    return applied
end

-- Config migration utilities
function GenerateOptimalPositionsForBase(baseName, configFileName)
    -- Load the config
    local config = require("DWAP.configs." .. configFileName)
    if not config or not config.generators then
        DWAPUtils.dprint("No generators found in config: " .. configFileName)
        return
    end

    DWAPUtils.dprint("=== GENERATING OPTIMAL POSITIONS FOR " .. baseName .. " ===")

    for i = 1, #config.generators do
        local gen = config.generators[i]
        DWAPUtils.dprint("Generator " ..
            i .. " - Controls at: " .. gen.controls.x .. "," .. gen.controls.y .. "," .. gen.controls.z)

        -- Aim the operator at the middle of what the config already powers: the
        -- current generator positions, falling back to the control panel
        local centerX, centerY = gen.controls.x, gen.controls.y
        if gen.fakeGenerators and #gen.fakeGenerators > 0 then
            DWAPUtils.dprint("Current fakeGenerators count: " .. #gen.fakeGenerators)
            local totalX, totalY = 0, 0
            for j = 1, #gen.fakeGenerators do
                totalX = totalX + gen.fakeGenerators[j].x
                totalY = totalY + gen.fakeGenerators[j].y
            end
            centerX = math.floor(totalX / #gen.fakeGenerators)
            centerY = math.floor(totalY / #gen.fakeGenerators)
        end

        DWAPUtils.dprint("Building center: " .. centerX .. "," .. centerY)
        DWAPUtils.dprint("To get optimal positions:")
        DWAPUtils.dprint("1. Stand inside the building near " .. centerX .. "," .. centerY .. "," .. gen.controls.z)
        DWAPUtils.dprint("2. Run FindOptimalGeneratorSquaresForBuilding()")
        DWAPUtils.dprint("3. Copy the returned positions to the config")
        DWAPUtils.dprint("")
    end

    return config
end

-- Auto-migrate a config using current player position as building center
function AutoMigrateConfigAtPlayerPosition(baseName, configFileName)
    local pSquare = getPlayer():getCurrentSquare()
    if not pSquare then
        DWAPUtils.dprint("Player square not found")
        return
    end

    local building = pSquare:getBuilding()
    if not building then
        DWAPUtils.dprint("Player is not inside a building")
        return
    end

    DWAPUtils.dprint("=== AUTO-MIGRATING CONFIG FOR " .. baseName .. " ===")

    -- Load old config
    local oldConfig = require("DWAP.configs." .. configFileName)
    if not oldConfig then
        DWAPUtils.dprint("Failed to load config: " .. configFileName)
        return
    end

    -- Generate optimal positions
    local optimalPositions = FindOptimalGeneratorSquaresForBuilding()
    if not optimalPositions or #optimalPositions == 0 then
        DWAPUtils.dprint("No optimal positions found")
        return
    end

    DWAPUtils.dprint("Found " .. #optimalPositions .. " optimal positions")

    -- The finder no longer places anything, so place them here for testing
    ApplyGeneratorPositions(optimalPositions)

    -- Print simple fakeGenerators format
    DWAPUtils.dprint("=== FAKE GENERATORS CONFIG ===")
    print("fakeGenerators = {")
    for i = 1, #optimalPositions do
        local pos = optimalPositions[i]
        print("    { x = " .. pos.x .. ", y = " .. pos.y .. ", z = " .. pos.z .. ", createTile = false },")
    end
    print("},")
    DWAPUtils.dprint("=== END CONFIG ===")

    return optimalPositions
end

local function testSquareForGenerator(square)
    if not square then return false end
    local x, y, z = square:getX(), square:getY(), square:getZ()
    local interval = SandboxVars.GeneratorVerticalPowerRange or 3

    for i = z - interval, z + interval do
        local testSquare = getSquare(x, y, i)
        if testSquare then
            local objects = testSquare:getObjects()
            if objects then
                local size = objects:size() - 1
                for j = size, 0, -1 do
                    local object = objects:get(j)
                    if instanceof(object, "IsoGenerator") or object:getSpriteName() == "dwap_tiles_01_1" then
                        -- let the game decide whether that generator reaches here
                        if IsoGenerator.isPoweringSquare(x, y, i, x, y, z) then
                            return true
                        end
                    end
                end
            end
        end
    end
    return false
end

-- Visualize electricity status of squares around the player
function VisualizeElectricityStatus(radius, generatorLookup)
    local pSquare = getPlayer():getCurrentSquare()
    if not pSquare then
        DWAPUtils.dprint("Player square not found")
        return
    end

    local playerX, playerY, playerZ = pSquare:getX(), pSquare:getY(), pSquare:getZ()
    local playerNum = getPlayer():getPlayerNum()
    radius = radius or 10 -- Default to 10 tile radius

    -- Loop through all squares in the radius
    for x = playerX - radius, playerX + radius do
        for y = playerY - radius, playerY + radius do
            local square = getSquare(x, y, playerZ)
            if square then
                local hasGenerator = testSquareForGenerator(square)
                local hasPower = square:haveElectricity()
                local key = x .. "," .. y .. "," .. playerZ
                local isInConfig = generatorLookup and generatorLookup[key]

                if hasGenerator then
                    if isInConfig then
                        -- Green for generator squares that match the config and have a generator
                        addAreaHighlightForPlayer(playerNum, x, y, x + 1, y + 1, playerZ, 0, 1, 0, 0.7)
                    else
                        -- Purple for generators not in the config
                        addAreaHighlightForPlayer(playerNum, x, y, x + 1, y + 1, playerZ, 0.5, 0, 0.5, 0.7)
                    end
                elseif isInConfig then
                    -- Red if they should have a generator from the config but don't
                    addAreaHighlightForPlayer(playerNum, x, y, x + 1, y + 1, playerZ, 1, 0, 0, 0.7)
                elseif hasPower then
                    -- Blue for powered squares
                    addAreaHighlightForPlayer(playerNum, x, y, x + 1, y + 1, playerZ, 0.2, 0.8, 0.9, 0.5)
                else
                    -- Orange for unpowered squares
                    addAreaHighlightForPlayer(playerNum, x, y, x + 1, y + 1, playerZ, 1, 0.5, 0, 0.4)
                end
            end
        end
    end
end

local poweredSquareCache = {}
local currentGeneratorLookup = nil

function elecTick()
    if currentGeneratorLookup then
        VisualizeElectricityStatus(30, currentGeneratorLookup)
    else
        VisualizeElectricityStatus(30)
    end
end

-- Build a lookup table of generator coordinates from a config
local function buildGeneratorLookup(config)
    local lookup = {}
    if not config or not config.generators then
        return lookup
    end

    for i = 1, #config.generators do
        local gen = config.generators[i]
        if gen and gen.fakeGenerators then
            for j = 1, #gen.fakeGenerators do
                local fakeGen = gen.fakeGenerators[j]
                if fakeGen and fakeGen.x and fakeGen.y and fakeGen.z then
                    local key = fakeGen.x .. "," .. fakeGen.y .. "," .. fakeGen.z
                    lookup[key] = true
                end
            end
        end
    end
    return lookup
end

local showing = false
function ShowElec(index)
    showing = not showing
    if showing then
        local pSquare = getPlayer():getCurrentSquare()
        DWAPUtils.dprint(testSquareForGenerator(pSquare) and "Player square has generator" or
            "Player square does not have generator")

        -- If index is provided, load the config for generator lookup
        if index then
            local configs = DWAPUtils.loadConfigs(true)
            if not configs or #configs == 0 then
                DWAPUtils.dprint("No configs found")
                showing = false
                return
            end

            if index < 1 or index > #configs then
                DWAPUtils.dprint("Invalid index: " .. index .. ". Must be between 1 and " .. #configs)
                showing = false
                return
            end

            local config = configs[index]
            if not config or not config.generators then
                DWAPUtils.dprint("Config at index " .. index .. " has no generator data")
                showing = false
                return
            end

            local configName = "Config " .. index
            if config.doorKeys and config.doorKeys.name then
                configName = config.doorKeys.name
            end

            -- Build generator lookup table
            currentGeneratorLookup = buildGeneratorLookup(config)
            local generatorCount = 0
            for _ in pairs(currentGeneratorLookup) do
                generatorCount = generatorCount + 1
            end

            DWAPUtils.dprint("Electricity visualization enabled for " ..
            configName .. " (" .. generatorCount .. " generators)")
            DWAPUtils.dprint(
            "Green = config generators with generator, Red = missing config generators, Purple = generators not in config, Blue = powered squares, Orange = unpowered squares")
        else
            currentGeneratorLookup = nil
            DWAPUtils.dprint("Electricity visualization enabled (no config)")
            DWAPUtils.dprint("Blue = powered squares, Orange = unpowered squares")
        end

        Events.OnTick.Add(elecTick)
        DWAP_DevToggles.elec = true
    else
        Events.OnTick.Remove(elecTick)
        DWAP_DevToggles.elec = false
        currentGeneratorLookup = nil
        DWAPUtils.dprint("Electricity visualization disabled")
        -- Clear highlights by calling the visualization with radius 0
        -- This is a workaround since removeAllAreaHighlightsForPlayer may not be available
    end
end

-- Check if a square is in any generator's squaresPowered list
local function isSquareInGeneratorList(x, y, z)
    if not DWAP_Gen2 or not DWAP_Gen2.generators then
        return false
    end
    local key = x .. "," .. y .. "," .. z
    if poweredSquareCache[key] ~= nil then
        return poweredSquareCache[key]
    end

    for i = 1, #DWAP_Gen2.generators do
        local gen = DWAP_Gen2.generators[i]
        for j = 1, #gen.squaresPowered do
            if gen.squaresPowered[j] and
                gen.squaresPowered[j].x == x and
                gen.squaresPowered[j].y == y and
                gen.squaresPowered[j].z == z then
                poweredSquareCache[key] = true
                return true
            end
        end
    end
    poweredSquareCache[key] = false
    return false
end

-- Visualize which squares are in the generator's squaresPowered list
function VisualizeGeneratorSquares(radius)
    local pSquare = getPlayer():getCurrentSquare()
    if not pSquare then
        DWAPUtils.dprint("Player square not found")
        return
    end

    local playerX, playerY, playerZ = pSquare:getX(), pSquare:getY(), pSquare:getZ()
    local playerNum = getPlayer():getPlayerNum()
    radius = radius or 30 -- Default to 30 tile radius

    -- Loop through all squares in the radius
    for x = playerX - radius, playerX + radius do
        for y = playerY - radius, playerY + radius do
            local square = getSquare(x, y, playerZ)
            if square then
                local inGeneratorList = isSquareInGeneratorList(x, y, playerZ)

                if inGeneratorList then
                    -- Green for squares in generator's squaresPowered list
                    addAreaHighlightForPlayer(playerNum, x, y, x + 1, y + 1, playerZ, 0, 1, 0, 0.5)
                else
                    -- Red for squares not in generator's squaresPowered list
                    addAreaHighlightForPlayer(playerNum, x, y, x + 1, y + 1, playerZ, 1, 0, 0, 0.3)
                end
            end
        end
    end
end

function generatorSquaresTick()
    VisualizeGeneratorSquares(30)
end

local showingGeneratorSquares = false
function ShowGeneratorSquares()
    poweredSquareCache = {}
    showingGeneratorSquares = not showingGeneratorSquares
    if showingGeneratorSquares then
        if not DWAP_Gen2 then
            DWAPUtils.dprint("DWAP_Gen2 not initialized")
            return
        end

        -- Print summary of generator squares
        local totalSquares = 0
        for i = 1, #DWAP_Gen2.generators do
            local gen = DWAP_Gen2.generators[i]
            if gen.squaresPowered then
                local count = 0
                for _ in pairs(gen.squaresPowered) do
                    count = count + 1
                end
                totalSquares = totalSquares + count
                DWAPUtils.dprint("Generator " .. i .. " has " .. count .. " squares in squaresPowered list")
            else
                DWAPUtils.dprint("Generator " .. i .. " has no squaresPowered list")
            end
        end
        DWAPUtils.dprint("Total squares across all generators: " .. totalSquares)

        Events.OnTick.Add(generatorSquaresTick)
        DWAPUtils.dprint("Generator squares visualization enabled (Green = in list, Red = not in list)")
    else
        Events.OnTick.Remove(generatorSquaresTick)
        DWAPUtils.dprint("Generator squares visualization disabled")
    end
end

-- Check if the target square is in any generator's squaresPowered list
function CheckTargetSquare()
    local targetX, targetY, targetZ = 5583, 9374, -1
    local targetKey = targetX .. "," .. targetY .. "," .. targetZ

    DWAPUtils.dprint("=== CHECKING TARGET SQUARE " .. targetKey .. " ===")

    if not DWAP_Gen2 or not DWAP_Gen2.generators then
        DWAPUtils.dprint("DWAP_Gen2 not initialized")
        return
    end

    local found = false
    for i = 1, #DWAP_Gen2.generators do
        local gen = DWAP_Gen2.generators[i]
        if gen.squaresPowered then
            if gen.squaresPowered[targetKey] then
                DWAPUtils.dprint("Target square found in Generator " .. i .. " squaresPowered list")
                DWAPUtils.dprint("Power drain: " .. tostring(gen.squaresPowered[targetKey]))
                found = true
            end
        end
    end

    if not found then
        DWAPUtils.dprint("Target square NOT found in any generator's squaresPowered list")
    end

    -- Also check if the square has electricity
    local square = getSquare(targetX, targetY, targetZ)
    if square then
        DWAPUtils.dprint("Square exists and has electricity: " .. tostring(square:haveElectricity()))
    else
        DWAPUtils.dprint("Square not found or not loaded")
    end
end

-- After a teleport (or walking into a building) the rooms stream in over
-- many ticks. A single early lightsOn only catches whatever was loaded at
-- that instant, so keep flipping every time the building's light-switch
-- count grows and stop only once it has been stable for a second.
-- Counting SWITCHES rather than rooms matters: a switch streaming into a
-- room that was already counted forces that room's def lightsActive false
-- in its constructor when its square has no power yet (see
-- DWAPUtils.forceSwitchOn), which is how a room ends up switch-on but dark.
-- The room count would not move for that, so no repair pass would run.
-- It never stops while the toggle is on, either: a wing you first walk into
-- an hour later streams its switches in then, and the old fixed 600-tick
-- window had long since given up. Once a building settles the watcher drops
-- to a slow poll instead of quitting.
local AUTOLIGHTS_SETTLED_TICKS = 60 -- stable ticks before easing off
local AUTOLIGHTS_IDLE_POLL = 30     -- ticks between checks after that
-- Hard stop on re-asserts for one building. Without a timeout a watcher that
-- keeps seeing the count move (or keeps hitting an error) re-fires forever;
-- that is how the 2026-08-06 log flood happened. Legitimate settling takes a
-- handful of passes, so anything past this is a fault, not streaming.
local AUTOLIGHTS_MAX_PASSES = 25
local autoLightsLastCount = 0
local autoLightsStableTicks = 0
local autoLightsIdleCountdown = 0
local autoLightsPasses = 0
local function autoLightsAfterTeleport()
    -- the toggle owns the watcher's lifetime now that it has no timeout
    if not DWAP_AutoLightsEnabled then
        Events.OnTick.Remove(autoLightsAfterTeleport)
        return
    end
    local player = getPlayer()
    local square = player and player:getCurrentSquare()
    if not square then return end
    local building = square:getBuilding()
    if not building then
        -- stepping outside clears the tally so coming back re-asserts
        autoLightsLastCount = 0
        autoLightsStableTicks = 0
        return
    end
    if autoLightsStableTicks >= AUTOLIGHTS_SETTLED_TICKS then
        autoLightsIdleCountdown = autoLightsIdleCountdown - 1
        if autoLightsIdleCountdown > 0 then return end
        autoLightsIdleCountdown = AUTOLIGHTS_IDLE_POLL
    end
    local rooms = getCell():getRoomList()
    local switchCount = 0
    for i = 1, rooms:size() do
        local room = rooms:get(i - 1)
        if DWAPUtils.sameBuilding(room:getBuilding(), building) then
            switchCount = switchCount + room:getLightSwitches():size()
        end
    end
    if switchCount == 0 then return end
    -- any CHANGE, not just growth: unloading a wing drops the count, and the
    -- switches rebuilt on the way back in land on the old total, which a
    -- growth-only test would sail past - and those rebuilt switches are
    -- exactly the ones that force their room's def dark
    if switchCount ~= autoLightsLastCount then
        autoLightsLastCount = switchCount
        autoLightsStableTicks = 0
        autoLightsPasses = autoLightsPasses + 1
        if autoLightsPasses > AUTOLIGHTS_MAX_PASSES then
            DWAPUtils.dprint(("AutoLights: %d re-asserts without settling, standing down for this building"):format(
                autoLightsPasses))
            Events.OnTick.Remove(autoLightsAfterTeleport)
            return
        end
        DWAPUtils.lightsOn(square, building)
        return
    end
    if autoLightsStableTicks < AUTOLIGHTS_SETTLED_TICKS then
        autoLightsStableTicks = autoLightsStableTicks + 1
    end
end

function startAutoLightsAfterTeleport()
    autoLightsLastCount = 0
    autoLightsStableTicks = 0
    autoLightsIdleCountdown = 0
    -- a new building gets a fresh pass budget; the cap is per building, not
    -- for the lifetime of the session
    autoLightsPasses = 0
    Events.OnTick.Remove(autoLightsAfterTeleport)
    Events.OnTick.Add(autoLightsAfterTeleport)
end

-- Where am I: sticky readout of coords, room name, and building ID pinned
-- above the player. DWAPWhere() toggles it on/off; the text refreshes
-- whenever you cross onto a new square
local whereShowing = false
local whereLastKey = nil
local whereLines = {}

-- Build the where-readout lines for a square. Shared by the person overlay
-- and the dev panel so both always show the same data the same way
function DWAPWhereLines(square)
    local room = square:getRoom()
    local building = square:getBuilding()
    -- BuildingDef ID is the map-stable one (cellX,cellY#index packed
    -- long); IsoBuilding:getID() is only a per-session streaming counter
    local bldStr = "bld: none"
    if building then
        local def = building.getDef and building:getDef()
        local defId = def and def.getID and def:getID()
        if defId then
            local hi = math.floor(defId / 4294967296)
            local index = defId % 4294967296
            local cellX = hi % 65536
            local cellY = math.floor(hi / 65536)
            bldStr = ("bld: %d,%d#%d (session %d)"):format(cellX, cellY, index, building:getID())
        else
            bldStr = "bld: session " .. tostring(building:getID())
        end
    end
    return {
        ("%d,%d,%d"):format(square:getX(), square:getY(), square:getZ()),
        "room: " .. (room and room:getName() or "outside"),
        bldStr,
    }
end

function whereDraw()
    if not whereShowing then return end
    local player = getPlayer()
    local square = player and player:getCurrentSquare()
    if not square then return end
    local key = square:getX() .. "," .. square:getY() .. "," .. square:getZ()
    if key ~= whereLastKey then
        whereLastKey = key
        whereLines = DWAPWhereLines(square)
    end
    local playerNum = player:getPlayerNum()
    local sx = isoToScreenX(playerNum, player:getX(), player:getY(), player:getZ())
    local sy = isoToScreenY(playerNum, player:getX(), player:getY(), player:getZ())
    local tm = getTextManager()
    local lineH = tm:getFontHeight(UIFont.Small)
    if not lineH or lineH <= 0 then lineH = 14 end
    -- stack upward so the bottom line stays just above the head
    local baseY = sy - 110 - (#whereLines - 1) * lineH
    for i = 1, #whereLines do
        local ly = baseY + (i - 1) * lineH
        tm:DrawStringCentre(UIFont.Small, sx + 1, ly + 1, whereLines[i], 0, 0, 0, 0.8)
        tm:DrawStringCentre(UIFont.Small, sx, ly, whereLines[i], 1, 1, 1, 1)
    end
end

-- Single invisible UI element whose render() hosts all our world-pinned text
-- overlays. TextManager draw calls only render reliably from the UI draw
-- pass: OnPostUIDraw never fires in 42.20 (its trigger is gated behind a
-- main-thread check the threaded renderer fails), so overlays must live on
-- a UI element like vanilla's debug text overlays do
local devOverlay = nil
function ensureDevOverlay()
    if devOverlay then return devOverlay end
    local ui = ISUIElement:new(0, 0, 1, 1)
    ui:initialise()
    ui.render = function()
        whereDraw()
        containerLabelsDraw()
        barricadeLabelsDraw()
        plumbingLabelsDraw()
        plumbPickDraw()
        roomPickDraw()
    end
    ui:addToUIManager()
    devOverlay = ui
    return ui
end

function DWAPWhere()
    whereShowing = not whereShowing
    DWAP_DevToggles.where = whereShowing
    if whereShowing then
        whereLastKey = nil
        ensureDevOverlay()
        DWAPUtils.dprint("DWAPWhere: on")
    else
        DWAPUtils.dprint("DWAPWhere: off")
    end
end

-- Noclip + fast-move off a staircase can wedge the player in a persistent
-- falling state (fractional z, falling flags) that even survives saves.
-- teleportTo doesn't clear any of it, so DWAPGoto does explicitly
local function resetFallState(player)
    if player.setbFalling then player:setbFalling(false) end
    if player.setFallTime then player:setFallTime(0) end
    if player.setLastFallSpeed then player:setLastFallSpeed(0) end
end

-- Teleporting into a not-yet-streamed area leaves the player without a
-- square at the target z, and the fall/snap logic can dump them at ground
-- level before the destination chunk arrives - basements lose their z.
-- Poll until the target square exists, then re-assert the position
local gotoTarget = nil
local gotoTicks = 0
local function reassertGoto()
    gotoTicks = gotoTicks + 1
    local player = getPlayer()
    if not player or not gotoTarget or gotoTicks > 300 then
        Events.OnTick.Remove(reassertGoto)
        return
    end
    local t = gotoTarget
    if getSquare(t.x, t.y, t.z) then
        if player:getCurrentSquare() == nil or math.floor(player:getZ()) ~= t.z then
            player:teleportTo(t.x, t.y, t.z)
        end
        resetFallState(player)
        Events.OnTick.Remove(reassertGoto)
        gotoTarget = nil
    end
end

function DWAPGoto(index)
    local configs = DWAPUtils.loadConfigs(true)
    if not configs or #configs == 0 then
        DWAPUtils.dprint("No configs found")
        return
    end
    if index < 1 or index > #configs then
        DWAPUtils.dprint("Invalid index: " .. index .. ". Must be between 1 and " .. #configs)
        return
    end
    local config = configs[index]
    if not config then
        DWAPUtils.dprint("Config at index " .. index .. " is nil")
        return
    end
    local spawn = config.spawn
    if not spawn and config.doorKeys then
        for i = 1, #config.doorKeys.doors do
            local doorKey = config.doorKeys.doors[i]
            if doorKey and doorKey.x then
                spawn = doorKey
                break
            end
        end
    end
    if not spawn.x or not spawn.y or not spawn.z then
        DWAPUtils.dprint("Spawn data is incomplete for config at index " .. index)
        return
    end
    local player = getPlayer()
    if not player then
        DWAPUtils.dprint("Player not found")
        return
    end
    local x, y, z = spawn.x, spawn.y, spawn.z
    if isClient() then
        SendCommandToServer("/teleportto " .. x .. "," .. y .. "," .. z);
    else
        local numX, numY, numZ = tonumber(x), tonumber(y), tonumber(z)
        if numX and numY and numZ then
            getPlayer():teleportTo(numX, numY, numZ)
        else
            DWAPUtils.dprint("Invalid coordinates: " .. tostring(x) .. "," .. tostring(y) .. "," .. tostring(z))
            return
        end
    end

    resetFallState(player)
    gotoTarget = { x = tonumber(x), y = tonumber(y), z = tonumber(z) }
    gotoTicks = 0
    Events.OnTick.Remove(reassertGoto)
    Events.OnTick.Add(reassertGoto)

    local dest = tostring(index)
    if config and config.doorKeys and config.doorKeys.name then
        dest = config.doorKeys.name
    end
    player:Say("Teleported to: " .. dest)

    if DWAP_AutoLightsEnabled then
        startAutoLightsAfterTeleport()
    end
end

local tlc
function TestLootConfig(index, startFrom, retainedConfig)
    if not retainedConfig then
        retainedConfig = {}
    end
    if not retainedConfig.failedContainers then
        retainedConfig.failedContainers = {}
    end
    if not retainedConfig.distTags then
        retainedConfig.distTags = {}
    end
    if not retainedConfig.specialTags then
        retainedConfig.specialTags = {}
    end
    local configs = DWAPUtils.loadConfigs(true)
    if not configs or #configs == 0 then
        DWAPUtils.dprint("No configs found")
        return
    end
    if index < 1 or index > #configs then
        DWAPUtils.dprint("Invalid index: " .. index .. ". Must be between 1 and " .. #configs)
        return
    end

    local config = configs[index]
    if not config or not config.loot then
        DWAPUtils.dprint("Config at index " .. index .. " has no loot data")
        return
    end

    local lootEntries = config.loot
    local totalEntries = #lootEntries

    -- A wiped table still runs: the baseBuildings coverage pass below is what
    -- produces the unclaimed-container menu, and that menu is the whole point
    -- of auditing a config you have just emptied. The entry loop simply does
    -- nothing when there are no entries.
    if totalEntries == 0 then
        DWAPUtils.dprint("No loot entries in config " .. index .. " - running coverage only")
    end

    local configName = "Config " .. index
    if config.doorKeys and config.doorKeys.name then
        configName = config.doorKeys.name
    end

    -- tile-key sets, always keyed on the integer z (slot/stack carry the
    -- vertical): allTileKeys marks tiles with any entry (coverage check);
    -- baseTileKeys marks tiles with a bottom entry (pairPresent for upper
    -- resolution)
    local allTileKeys = {}
    local baseTileKeys = {}
    for i = 1, totalEntries do
        local e = lootEntries[i]
        if e and e.coords then
            local key = DWAPUtils.hashCoords(e.coords.x, e.coords.y, math.floor(e.coords.z))
            allTileKeys[key] = true
            local isUpper = e.slot == "upper" or (e.coords.z % 1) ~= 0
            if not isUpper and not e.stack and e.slot ~= "freezer" then
                baseTileKeys[key] = true
            end
        end
    end

    DWAPUtils.dprint("=== TESTING LOOT CONFIG: " .. configName .. " ===")
    DWAPUtils.dprint("Total loot entries to test: " .. totalEntries)

    local failedContainers = {}
    if retainedConfig.failedContainers then
        -- If retainedConfig is provided, use its failedContainers
        failedContainers = retainedConfig.failedContainers
    end
    local distTags = {}
    if retainedConfig.distTags then
        -- If retainedConfig is provided, use its distTags
        distTags = retainedConfig.distTags
    end
    local specialTags = {}
    if retainedConfig.specialTags then
        -- If retainedConfig is provided, use its specialTags
        specialTags = retainedConfig.specialTags
    end
    local coordsHashes = {}
    if retainedConfig.coordsHashes then
        -- If retainedConfig is provided, use its coordsHashes
        coordsHashes = retainedConfig.coordsHashes
    end
    local containerDetails = retainedConfig.containerDetails or {}
    local legacyHalfZ = 0
    -- Fill verification is stamp-based by default (works with base-game loot
    -- on or off). fillThreshold is an optional EXTRA check for loot-off
    -- worlds: 0 = fail empty containers, >0 = fail below that fill percent
    local fillThreshold = retainedConfig.fillThreshold
    local lastProgressPrint = 0
    if retainedConfig.lastProgressPrint then
        -- If retainedConfig is provided, use its lastProgressPrint
        lastProgressPrint = retainedConfig.lastProgressPrint
    end
    if startFrom and startFrom > 0 and startFrom <= totalEntries then
        DWAPUtils.dprint("Starting from entry: " .. startFrom)
    else
        startFrom = 1
    end

    for i = startFrom, totalEntries do
        local entry = lootEntries[i]
        local progress = math.floor((i / totalEntries) * 100)

        -- Print progress every 10%
        if progress >= lastProgressPrint + 10 and progress ~= 100 then
            DWAPUtils.dprint("Progress: " .. progress .. "%")
            lastProgressPrint = progress
        end

        -- Check if entry exists (not nil) and process it
        if entry and entry.coords then
            local x, y, z = entry.coords.x, entry.coords.y, entry.coords.z
            local isUpperContainer = entry.slot == "upper" or (z % 1) ~= 0
            if (z % 1) ~= 0 then
                legacyHalfZ = legacyHalfZ + 1
            end
            local member = entry.stack or (isUpperContainer and "upper") or entry.slot or "base"

            -- Duplicates are per tile AND vertical member: a bottom and an
            -- upper entry sharing a tile are legitimate neighbors
            local coordsHash = tostring(DWAPUtils.hashCoords(x, y, math.floor(z))) .. ":" .. tostring(member)
            if coordsHashes[coordsHash] then
                DWAPUtils.dprint("Entry " ..
                    i ..
                    " at " ..
                    x ..
                    "," ..
                    y ..
                    "," ..
                    z ..
                    " - DUPLICATE coordinates found (first seen at entry " .. coordsHashes[coordsHash] .. ") - FAILED")
                table.insert(failedContainers,
                    "Entry " ..
                    i ..
                    " at " ..
                    x ..
                    "," ..
                    y .. "," .. z .. ": Duplicate coordinates (first seen at entry " .. coordsHashes[coordsHash] .. ")")
                -- keep going: the container just gets tested twice
            else
                coordsHashes[coordsHash] = i
            end

            -- A missing square in an otherwise-loaded area means the coord
            -- points at empty air (typo) or an unspawned basement/building -
            -- record it and keep testing the remaining entries
            local square = getSquare(x, y, math.floor(z))
            if not square then
                DWAPUtils.dprint("Square not found at " ..
                    x .. "," .. y .. "," .. math.floor(z) .. " - FAILED")
                table.insert(failedContainers,
                    "Entry " .. i .. " at " .. x .. "," .. y .. "," .. z .. ": Square not found (bad z or unspawned area)")
            end
            if square then

            -- Resolve through the shared source of truth (same logic the
            -- loot fill uses): stack ordinal > flagged upper > order fallbacks
            local pairPresent = false
            if isUpperContainer then
                pairPresent = baseTileKeys[DWAPUtils.hashCoords(x, y, math.floor(z))] == true
            end
            local container = DWAPUtils.resolveLootContainer(square, {
                upper = isUpperContainer,
                stack = entry.stack,
                freezer = entry.slot == "freezer",
                pairPresent = pairPresent,
            })

            if not container then
                -- List what IS on the square so upper/lower mismatches (High /
                -- overhead / renderYOffset conventions) are diagnosable from
                -- the report without revisiting in-game
                local present = {}
                local squareContainers = DWAPUtils.getSquareContainers(square)
                for j = 1, #squareContainers do
                    local sc = squareContainers[j]
                    present[#present + 1] = tostring(sc.container:getType()) ..
                        "(pos=" .. tostring(sc.container:getContainerPosition()) ..
                        ",yoff=" .. tostring(sc.object:getRenderYOffset()) ..
                        (sc.isHigh and ",HIGH" or "") .. ")"
                end
                local presentStr = #present > 0 and table.concat(present, " ") or "no containers on square"
                DWAPUtils.dprint("Entry " ..
                    i .. " at " .. x .. ".*" .. y .. ".*" .. z .. " - Container not found - FAILED")
                table.insert(failedContainers,
                    "Entry " .. i .. " at " .. x .. "," .. y .. "," .. z .. ": Container not found; square has: " .. presentStr)
                -- break
            else
                -- Record what the container is and where it lives, for the
                -- balance audit (detached sheds report their own room name).
                -- The entry's own dist/special/level rides along: pairing what
                -- was authored with the room and container type it actually
                -- landed in is the only place those two facts meet, and it is
                -- what a generator needs to learn "canned food goes in a
                -- kitchen counter, not a warehouse shelf"
                local room = square:getRoom()
                table.insert(containerDetails, {
                    entry = i,
                    x = x, y = y, z = z,
                    containerType = container:getType(),
                    room = room and room:getName() or "outside",
                    dist = entry.dist,
                    special = entry.special,
                    level = entry.level,
                })

                -- Test if container is 80% full
                local capacity = container:getCapacity()
                local usedCapacity = container:getCapacityWeight()
                local fillPercentage = capacity > 0 and (usedCapacity / capacity) * 100 or 0

                -- Primary check: the DWAP fill stamp on the parent object,
                -- valid whether base-game loot is on or off
                local stampState = nil
                local parentObj = container:getParent()
                if parentObj then
                    local stamps = parentObj:getModData().DWAPLoot
                    if stamps then stampState = stamps[tostring(member)] end
                end
                if not stampState then
                    DWAPUtils.dprint("Entry " .. i .. " at " .. x .. "," .. y .. "," .. z ..
                        " - no DWAP fill stamp - FAILED")
                    table.insert(failedContainers, "Entry " .. i .. " at " .. x .. "," .. y .. "," .. z ..
                        ": Not filled (no DWAP stamp)")
                elseif stampState ~= "disabled" and fillThreshold and not entry.special then
                    if fillThreshold <= 0 then
                        if container:getItems():size() == 0 then
                            DWAPUtils.dprint("Entry " .. i .. " at " .. x .. "," .. y .. "," .. z ..
                                " - Container empty - FAILED")
                            table.insert(failedContainers, "Entry " .. i .. " at " .. x .. "," .. y .. "," .. z ..
                                ": Empty")
                        end
                    elseif fillPercentage < fillThreshold then
                        DWAPUtils.dprint("Entry " .. i .. " at " .. x .. ".*" .. y .. ".*" .. z .. " - Container only " ..
                            string.format("%.1f", fillPercentage) .. "% full - FAILED")
                        table.insert(failedContainers, "Entry " .. i .. " at " .. x .. "," .. y .. "," .. z ..
                            ": Only " .. string.format("%.1f", fillPercentage) .. "% full")
                        -- break
                    end
                end

                -- Track distribution tags
                if entry.dist then
                    for j = 1, #entry.dist do
                        local distTag = entry.dist[j]
                        distTags[distTag] = (distTags[distTag] or 0) + 1
                    end
                end

                -- Track special tags
                if entry.special then
                    specialTags[entry.special] = (specialTags[entry.special] or 0) + 1
                end
            end
            end -- if square
        elseif not entry then
            DWAPUtils.dprint("Entry " .. i .. " is nil - SKIPPING")
        elseif not entry.coords then
            DWAPUtils.dprint("Entry " .. i .. " missing coords - FAILED")
            table.insert(failedContainers, "Entry " .. i .. ": Missing coords")
            -- break
        end
    end

    DWAPUtils.dprint("Progress: 100%")

    -- baseBuildings coverage: enumerate every container in each declared
    -- building (rooms -> squares -> containers) and record the ones no loot
    -- entry addresses. Skips stoves/microwaves and trash-class containers,
    -- and dedups buildings in case two anchors resolve to the same one
    local unclaimedContainers = {}
    local anchorProblems = {}
    local trashTypes = {
        bin = true,
        dumpster = true,
        clothingdryer = true,
        clothingdryerbasic = true,
        clothingrack = true,
        clothingwasher = true,
    }
    if config.baseBuildings then
        local seenBuildings = {}
        for b = 1, #config.baseBuildings do
            local anchor = config.baseBuildings[b]
            local aSq = anchor and anchor.x and getSquare(anchor.x, anchor.y, math.floor(anchor.z or 0))
            local building = aSq and aSq:getBuilding()
            if not building then
                anchorProblems[#anchorProblems + 1] = ("anchor %d at %s,%s,%s: %s"):format(
                    b, tostring(anchor and anchor.x), tostring(anchor and anchor.y),
                    tostring(anchor and anchor.z),
                    aSq and "no building on square" or "square not loaded")
            else
                local def = building.getDef and building:getDef()
                -- Story canary: PreventStories marks our buildings explored,
                -- which since 42.20 is the ONLY thing stopping RBShopLooted
                -- (it drops the stash exemption the base class has). If a def
                -- is unmarked, a story may have run here and the loot results
                -- below are suspect - say so rather than let it read as rot
                if def and def.isAllExplored and not def:isAllExplored() then
                    anchorProblems[#anchorProblems + 1] = ("STORY-RISK: anchor %d at %s,%s,%s is not marked explored - a building story may have run here"):format(
                        b, tostring(anchor.x), tostring(anchor.y), tostring(anchor.z))
                end
                local bldKey = def and def:getID() or building:getID()
                if not seenBuildings[bldKey] then
                    seenBuildings[bldKey] = true
                    local rooms = getCell():getRoomList()
                    for i = 1, rooms:size() do
                        local room = rooms:get(i - 1)
                        if DWAPUtils.sameBuilding(room:getBuilding(), building) then
                            local squares = room:getSquares()
                            for s = 0, squares:size() - 1 do
                                local rsq = squares:get(s)
                                local squareContainers = DWAPUtils.getSquareContainers(rsq)
                                for c = 1, #squareContainers do
                                    local sc = squareContainers[c]
                                    local ctype = sc.container:getType()
                                    local skip = ctype == "microwave" or sc.container:isStove()
                                    if not skip then
                                        local props = sc.object.getProperties and sc.object:getProperties()
                                        if props then
                                            if props:has("GroupName") and props:get("GroupName") == "Garbage" then
                                                skip = true
                                            elseif props:has("container") and trashTypes[props:get("container")] then
                                                skip = true
                                            end
                                        end
                                    end
                                    if not skip then
                                        local cx, cy, cz = rsq:getX(), rsq:getY(), rsq:getZ()
                                        if not allTileKeys[DWAPUtils.hashCoords(cx, cy, cz)] then
                                            unclaimedContainers[#unclaimedContainers + 1] = {
                                                x = cx, y = cy, z = cz,
                                                ctype = ctype,
                                                room = room:getName() or "?",
                                            }
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        DWAPUtils.dprint(("baseBuildings coverage: %d unclaimed containers, %d anchor problems"):format(
            #unclaimedContainers, #anchorProblems))
    end

    -- Print results
    if #failedContainers > 0 then
        DWAPUtils.dprint("=== TEST FAILED ===")
        DWAPUtils.dprint("Failed containers:")
        for i = 1, #failedContainers do
            DWAPUtils.dprint("  " .. failedContainers[i])
        end
    else
        DWAPUtils.dprint("=== TEST PASSED ===")
        DWAPUtils.dprint("All " .. totalEntries .. " containers found and properly filled!")
    end

    -- Print distribution tags summary
    local distTagCount = 0
    for _ in pairs(distTags) do distTagCount = distTagCount + 1 end

    if distTagCount > 0 then
        DWAPUtils.dprint("=== DISTRIBUTION TAGS USED (" .. distTagCount .. " unique) ===")
        local sortedDist = {}
        for tag, count in pairs(distTags) do
            table.insert(sortedDist, { tag = tag, count = count })
        end
        table.sort(sortedDist, function(a, b) return a.count > b.count end)

        for i = 1, #sortedDist do
            DWAPUtils.dprint("  " .. sortedDist[i].tag .. ": " .. sortedDist[i].count .. " times")
        end
    end

    -- Print special tags summary
    local specialTagCount = 0
    for _ in pairs(specialTags) do specialTagCount = specialTagCount + 1 end

    if specialTagCount > 0 then
        DWAPUtils.dprint("=== SPECIAL TAGS USED (" .. specialTagCount .. " unique) ===")
        local sortedSpecial = {}
        for tag, count in pairs(specialTags) do
            table.insert(sortedSpecial, { tag = tag, count = count })
        end
        table.sort(sortedSpecial, function(a, b) return a.count > b.count end)

        for i = 1, #sortedSpecial do
            DWAPUtils.dprint("  " .. sortedSpecial[i].tag .. ": " .. sortedSpecial[i].count .. " times")
        end
    end

    DWAPUtils.dprint("=== TEST COMPLETE ===")

    return {
        totalEntries = totalEntries,
        failedContainers = failedContainers,
        distTags = distTags,
        specialTags = specialTags,
        containerDetails = containerDetails,
        unclaimedContainers = unclaimedContainers,
        anchorProblems = anchorProblems,
        legacyHalfZ = legacyHalfZ,
    }
end

tlc = TestLootConfig

-- Systems audit: the loot pass only ever looks at containers, so a config can
-- read PASS while its generator, tank or plumbing is broken. This walks the
-- power and water declarations and reports only what is WRONG, so the output
-- is a to-do list rather than an inventory. Opt-in: it costs a square lookup
-- and an object scan per declared part.
local function systemsObjectAt(x, y, z, sprite)
    local square = getSquare(x, y, math.floor(z or 0))
    if not square then return nil, "square not loaded (bad z or unstreamed)" end
    local objects = square:getObjects()
    if objects then
        for i = 0, objects:size() - 1 do
            local obj = objects:get(i)
            if obj and (not sprite or obj:getSpriteName() == sprite) then
                return obj, nil
            end
        end
    end
    -- ghost generators live in the special-objects list once converted
    local specials = square:getSpecialObjects()
    if specials then
        for i = 0, specials:size() - 1 do
            local obj = specials:get(i)
            if obj and (not sprite or obj:getSpriteName() == sprite) then
                return obj, nil
            end
        end
    end
    return nil, sprite and ("no object with sprite " .. sprite) or "no object on square"
end

-- Solar is the ISA mod's. Without it active - or with the sandbox option off -
-- the powerbank and panels are never spawned at all, so checking them would
-- manufacture problems. Same condition DWAPPowerSystem uses to decide whether
-- it can touch solar.
local function solarSystemActive()
    if not getActivatedMods():contains("\\ISA") then return false end
    return SandboxVars.DWAP and SandboxVars.DWAP.EnableGenSystemSolar and true or false
end

--- @return table array of problem strings, empty when everything checks out
function CheckConfigSystems(config)
    local problems = {}
    local function report(fmt, ...)
        problems[#problems + 1] = string.format(fmt, ...)
    end

    -- power: control panel, fuel tank, solar powerbank/panels, ghost generators
    if config.generators then
        for i = 1, #config.generators do
            local gen = config.generators[i]
            local function checkPart(part, label, wantModData)
                if not part or not part.x then return end
                local obj, err = systemsObjectAt(part.x, part.y, part.z, part.sprite)
                if not obj then
                    report("gen %d %s at %d,%d,%d: %s", i, label, part.x, part.y, part.z or 0, err)
                elseif wantModData then
                    local md = obj:getModData()
                    if not md or not md.DWAPObjectType then
                        report("gen %d %s at %d,%d,%d: present but not converted (no DWAPObjectType)",
                            i, label, part.x, part.y, part.z or 0)
                    end
                end
            end
            checkPart(gen.controls, "controls", true)
            checkPart(gen.fuelTank, "fuelTank", true)
            if gen.solar and solarSystemActive() then
                checkPart(gen.solar.powerbank, "solar powerbank", false)
                if gen.solar.panels then
                    for p = 1, #gen.solar.panels do
                        local panel = gen.solar.panels[p]
                        if panel and panel.spawn ~= false then
                            checkPart(panel, "solar panel " .. p, false)
                        end
                    end
                end
            end
            if gen.fakeGenerators then
                for f = 1, #gen.fakeGenerators do
                    local fake = gen.fakeGenerators[f]
                    if fake and fake.x then
                        local obj, err = systemsObjectAt(fake.x, fake.y, fake.z, nil)
                        if not obj then
                            report("gen %d ghost %d at %d,%d,%d: %s", i, f, fake.x, fake.y, fake.z or 0, err)
                        elseif not instanceof(obj, "IsoGenerator") then
                            report("gen %d ghost %d at %d,%d,%d: never converted to IsoGenerator",
                                i, f, fake.x, fake.y, fake.z or 0)
                        end
                    end
                end
            end
        end
    end

    -- water: tanks need a fluid container, fixtures need the objectType stamp
    if config.waterTanks then
        for i = 1, #config.waterTanks do
            local tank = config.waterTanks[i]
            if tank and tank.x then
                local obj, err = systemsObjectAt(tank.x, tank.y, tank.z, tank.sprite)
                if not obj then
                    report("waterTank %d at %d,%d,%d: %s", i, tank.x, tank.y, tank.z or 0, err)
                elseif not obj:hasFluid() then
                    report("waterTank %d at %d,%d,%d: present but has no fluid container",
                        i, tank.x, tank.y, tank.z or 0)
                end
            end
        end
    end
    if config.waterFixtures then
        for i = 1, #config.waterFixtures do
            local fix = config.waterFixtures[i]
            if fix and fix.x then
                local obj, err = systemsObjectAt(fix.x, fix.y, fix.z, fix.sprite)
                if not obj then
                    report("waterFixture %d at %d,%d,%d: %s", i, fix.x, fix.y, fix.z or 0, err)
                else
                    local md = obj:getModData()
                    if not md or not md.objectType then
                        report("waterFixture %d at %d,%d,%d: present but not converted (no objectType)",
                            i, fix.x, fix.y, fix.z or 0)
                    end
                end
            end
        end
    end
    return problems
end

-- Drive TestLootConfig across every config in one debug session: teleport to
-- each base with DWAPGoto, wait for its loot squares to stream in (jumping to
-- stragglers to force-load them), run the test, and write a combined report
-- to Zomboid/Lua/DWAP_loot_audit.txt. Call DWAPAudit() to start, call it
-- again to abort. DWAPAudit(n) starts from config n.
local allLootState = nil
local allLootTick
local ALLLOOT_WAIT_TICKS = 300 -- chunk-streaming grace before jumping/giving up
-- Squares existing does NOT mean the loot fill has run: the fill lands on
-- later ticks, so verifying the moment chunks are in reported containers as
-- unfilled that were about to be filled - 521 of 633 failures in the
-- 2026-08-06 run, and config 37 flipped from 68 failures to PASS purely by
-- being revisited. Hold after streaming until the number of stamped squares
-- stops growing, rather than guessing a fixed delay.
local ALLLOOT_FILL_POLL = 10    -- ticks between stamp counts
local ALLLOOT_FILL_STABLE = 6   -- unchanged polls (~1s) before trusting the count
local ALLLOOT_FILL_MAX = 900    -- absolute cap, for configs that never fill
local ALLLOOT_SETTLE_TICKS = 120 -- pause between bases: back-to-back teleports can
-- race the world streamer's vehicle chunk unload (BaseVehicle.update NPE)

local function allLootTeleport(x, y, z)
    if isClient() then
        SendCommandToServer("/teleportto " .. x .. "," .. y .. "," .. z)
    else
        getPlayer():teleportTo(x, y, z)
    end
end

local function allLootWrite(line)
    if allLootState and allLootState.writer then
        allLootState.writer:write(line .. "\r\n")
    end
end

local function allLootConfigName(index, config)
    local name = string.format("%02d", index)
    if config and config.doorKeys and config.doorKeys.name then
        name = name .. " " .. config.doorKeys.name
    end
    return name
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

local function allLootStop(summary)
    if not allLootState then return end
    if summary then allLootWrite(summary) end
    if allLootState.writer then allLootState.writer:close() end
    Events.OnTick.Remove(allLootTick)
    allLootState = nil
    DWAPUtils.dprint("Loot audit report: Zomboid/Lua/DWAP_loot_audit.txt")
end

local function allLootFinishConfig(unloaded, badZ)
    local st = allLootState
    local config = st.configs[st.index]
    local name = allLootConfigName(st.index, config)
    local result = TestLootConfig(st.index, nil, { fillThreshold = st.fillThreshold })

    allLootWrite(("=== %s: %d loot entries ==="):format(name, result and result.totalEntries or 0))
    if unloaded > 0 then
        allLootWrite(("  STALE?: %d squares in chunks that never streamed in - building/basement missing from this save; results below are unreliable"):format(
            unloaded))
    end
    if badZ and badZ > 0 then
        allLootWrite(("  BAD-Z: %d coords have no square at their z level (unspawned basement, moved building, or typo) - see Square-not-found lines"):format(
            badZ))
    end
    if result then
        if (result.totalEntries or 0) == 0 then
            -- A wiped table has nothing to fail, so the PASS branch below
            -- would call it healthy. Say what it is instead, and keep it out
            -- of the pass tally - the unclaimed list further down is the
            -- rebuild menu for exactly these
            allLootWrite("  EMPTY (no loot entries - rebuild from the unclaimed list)")
            st.skipped = st.skipped + 1
        elseif #result.failedContainers == 0 then
            allLootWrite("  PASS")
            st.passed = st.passed + 1
        else
            allLootWrite(("  FAIL (%d):"):format(#result.failedContainers))
            for i = 1, #result.failedContainers do
                allLootWrite("    " .. result.failedContainers[i])
            end
            st.failed = st.failed + 1
        end

        if result.legacyHalfZ and result.legacyHalfZ > 0 then
            allLootWrite(("  legacy +0.5 entries: %d (convert to slot = \"upper\")"):format(result.legacyHalfZ))
        end
        local special = allLootTallyString(result.specialTags)
        if special ~= "" then allLootWrite("  special: " .. special) end
        local dist = allLootTallyString(result.distTags)
        if dist ~= "" then allLootWrite("  dist: " .. dist) end

        -- container type per room, e.g. "filingcabinet@office=2"
        local typeRooms = {}
        for i = 1, #result.containerDetails do
            local d = result.containerDetails[i]
            local key = d.containerType .. "@" .. d.room
            typeRooms[key] = (typeRooms[key] or 0) + 1
        end
        local typeRoomStr = allLootTallyString(typeRooms)
        if typeRoomStr ~= "" then allLootWrite("  containers: " .. typeRoomStr) end

        -- One line per RESOLVED entry, joining what was authored to where it
        -- landed: "containers:" and "dist:" above are separate histograms, so
        -- the pairing exists nowhere else. Only resolved entries appear -
        -- an entry whose container was not found proves nothing about which
        -- loot suits which room. Format is fixed and greppable on purpose:
        --   <containerType>@<room> | <level|-> | <dist,dist|special:name|->
        if #result.containerDetails > 0 then
            allLootWrite(("  entry-map (%d):"):format(#result.containerDetails))
            for i = 1, #result.containerDetails do
                local d = result.containerDetails[i]
                local tags = "-"
                if d.special then
                    tags = "special:" .. tostring(d.special)
                elseif d.dist and #d.dist > 0 then
                    tags = table.concat(d.dist, ",")
                end
                allLootWrite(("    %s@%s | %s | %s"):format(
                    d.containerType, d.room, tostring(d.level or "-"), tags))
            end
        end

        -- opt-in systems pass: only prints what is broken, so an empty section
        -- means power and water are fine for this config
        if st.checkSystems and config then
            local sys = CheckConfigSystems(config)
            if #sys > 0 then
                allLootWrite(("  SYSTEMS (%d):"):format(#sys))
                for i = 1, #sys do
                    allLootWrite("    " .. sys[i])
                end
                st.systemsFlagged = (st.systemsFlagged or 0) + #sys
            end
        end

        -- baseBuildings coverage: containers no loot entry addresses
        if result.anchorProblems then
            for i = 1, #result.anchorProblems do
                allLootWrite("  BASEBUILDING: " .. result.anchorProblems[i])
            end
        end
        if config and config.baseBuildings and #config.baseBuildings > 0 and result.unclaimedContainers then
            local list = result.unclaimedContainers
            if #list == 0 then
                allLootWrite("  baseBuildings: all containers claimed")
            else
                local tally = {}
                for i = 1, #list do
                    local u = list[i]
                    local key = u.ctype .. "@" .. u.room
                    tally[key] = (tally[key] or 0) + 1
                end
                allLootWrite(("  unclaimed containers: %d"):format(#list))
                allLootWrite("  unclaimed: " .. allLootTallyString(tally))
                local cap = 250
                for i = 1, math.min(#list, cap) do
                    local u = list[i]
                    allLootWrite(("    %d,%d,%d %s@%s"):format(u.x, u.y, u.z, u.ctype, u.room))
                end
                if #list > cap then
                    allLootWrite(("    ...and %d more (raise the cap in allLootFinishConfig to see them)"):format(#list - cap))
                end
            end
        end
    else
        allLootWrite("  SKIPPED (no loot data)")
        st.skipped = st.skipped + 1
    end

    -- level keys and explicit-item entries aren't tallied by TestLootConfig
    local levels, itemEntries, skeletons = {}, 0, {}
    if config and config.loot then
        for i = 1, #config.loot do
            local e = config.loot[i]
            if e then
                if e.level ~= nil then
                    local key = tostring(e.level)
                    levels[key] = (levels[key] or 0) + 1
                end
                if e.items then itemEntries = itemEntries + 1 end
                -- An entry with coords but nothing to spawn still gets stamped
                -- "filled" by the fill (Events.lua stamps unconditionally), so
                -- stamp verification calls it a pass. Count them separately or
                -- a config freshly picked from rooms reads as green while every
                -- container it names stays empty.
                if e.coords and not e.dist and not e.items and not e.special then
                    skeletons[#skeletons + 1] = i
                end
            end
        end
    end
    local levelStr = allLootTallyString(levels)
    if levelStr ~= "" then allLootWrite("  levels: " .. levelStr) end
    if itemEntries > 0 then allLootWrite("  explicit-item entries: " .. itemEntries) end
    if #skeletons > 0 then
        allLootWrite(("  SKELETON: %d entries define no loot yet (coords only) - entries %s"):format(
            #skeletons, table.concat(skeletons, ",")))
        st.skeletonTotal = (st.skeletonTotal or 0) + #skeletons
    end
    allLootWrite("")

    st.index = st.index + 1
    st.phase = "settle"
    st.ticksWaited = 0
end

-- Progress proxy for the fill: squares holding at least one object the fill
-- has stamped. Cheaper than resolving every entry's container, and it only
-- has to detect "still working" versus "done"
local function allLootStampedSquares(config)
    local n = 0
    if not config or not config.loot then return n end
    for i = 1, #config.loot do
        local e = config.loot[i]
        if e and e.coords then
            local square = getSquare(e.coords.x, e.coords.y, math.floor(e.coords.z))
            local objects = square and square:getObjects()
            if objects then
                local stamped = false
                for j = 0, objects:size() - 1 do
                    local obj = objects:get(j)
                    local md = obj and obj:getModData()
                    if md and md.DWAPLoot then stamped = true end
                end
                if stamped then n = n + 1 end
            end
        end
    end
    return n
end

-- Hand off from streaming to the fill wait, carrying the counts the report
-- needs so they survive the extra phase
local function allLootBeginFillWait(st, unstreamed, badZ)
    st.phase = "fill"
    st.ticksWaited = 0
    st.pendingUnstreamed = unstreamed
    st.pendingBadZ = badZ
    st.stampCount = -1
    st.stampStable = 0
end

allLootTick = function()
    local st = allLootState
    if not st then return end
    if st.index > #st.configs then
        allLootStop(("=== DONE: %d passed, %d failed, %d skipped%s%s ==="):format(
            st.passed, st.failed, st.skipped,
            (st.skeletonTotal or 0) > 0 and (", " .. st.skeletonTotal .. " skeleton entries awaiting loot") or "",
            st.checkSystems and (", " .. (st.systemsFlagged or 0) .. " systems problems") or ""))
        return
    end

    local config = st.configs[st.index]
    if st.phase == "settle" then
        st.ticksWaited = st.ticksWaited + 1
        if st.ticksWaited >= ALLLOOT_SETTLE_TICKS then
            st.phase = "teleport"
        end
    elseif st.phase == "teleport" then
        -- An emptied config still has a coverage pass worth running: the
        -- unclaimed-container list is the menu you rebuild it from, and
        -- skipping here meant a wiped table produced nothing at all
        local hasLoot = config and config.loot and #config.loot > 0
        local hasAnchors = config and config.baseBuildings and #config.baseBuildings > 0
        if not config or (not hasLoot and not hasAnchors) then
            allLootWrite("=== " .. allLootConfigName(st.index, config) .. ": no loot entries, skipped ===")
            allLootWrite("")
            st.skipped = st.skipped + 1
            st.index = st.index + 1
            return
        end
        DWAPUtils.dprint(("Loot audit %d/%d: %s"):format(st.index, #st.configs, allLootConfigName(st.index, config)))
        DWAPGoto(st.index)
        st.phase = "load"
        st.ticksWaited = 0
        st.jumped = {}
    elseif st.phase == "load" then
        st.ticksWaited = st.ticksWaited + 1

        -- Sort absent squares into truly unstreamed chunks (ground square at
        -- z=0 absent too) vs bad-z coords (chunk is in, that z just has no
        -- square: unspawned basement, moved building, or typo). Only
        -- unstreamed chunks are worth jumping to; bad-z gets recorded by
        -- TestLootConfig as Square-not-found
        local unstreamed, badZ = 0, 0
        for i = 1, #config.loot do
            local e = config.loot[i]
            if e and e.coords and not getSquare(e.coords.x, e.coords.y, math.floor(e.coords.z)) then
                if getSquare(e.coords.x, e.coords.y, 0) then
                    badZ = badZ + 1
                else
                    unstreamed = unstreamed + 1
                end
            end
        end
        -- baseBuildings anchors need their areas streamed too, so their
        -- buildings' rooms are in the cell list for the coverage pass
        if config.baseBuildings then
            for i = 1, #config.baseBuildings do
                local a = config.baseBuildings[i]
                if a and a.x and not getSquare(a.x, a.y, math.floor(a.z or 0)) then
                    if getSquare(a.x, a.y, 0) then
                        badZ = badZ + 1
                    else
                        unstreamed = unstreamed + 1
                    end
                end
            end
        end

        if unstreamed == 0 then
            allLootBeginFillWait(st, 0, badZ)
        elseif st.ticksWaited >= ALLLOOT_WAIT_TICKS then
            -- Count force-load jumps whose chunk STILL isn't in: three of
            -- those means the area can't stream in this save - stop grinding
            -- instead of visiting every dead coordinate
            local failedJumps = 0
            local jumpTo = nil
            for i = 1, #config.loot do
                local e = config.loot[i]
                if e and e.coords
                    and not getSquare(e.coords.x, e.coords.y, math.floor(e.coords.z))
                    and not getSquare(e.coords.x, e.coords.y, 0) then
                    local key = e.coords.x .. "," .. e.coords.y
                    if st.jumped[key] then
                        failedJumps = failedJumps + 1
                    elseif not jumpTo then
                        jumpTo = e
                    end
                end
            end
            if config.baseBuildings then
                for i = 1, #config.baseBuildings do
                    local a = config.baseBuildings[i]
                    if a and a.x
                        and not getSquare(a.x, a.y, math.floor(a.z or 0))
                        and not getSquare(a.x, a.y, 0) then
                        local key = a.x .. "," .. a.y
                        if st.jumped[key] then
                            failedJumps = failedJumps + 1
                        elseif not jumpTo then
                            jumpTo = { coords = { x = a.x, y = a.y, z = a.z or 0 } }
                        end
                    end
                end
            end
            if failedJumps >= 3 or not jumpTo then
                -- whatever DID stream still deserves the fill wait
                allLootBeginFillWait(st, unstreamed, badZ)
            else
                st.jumped[jumpTo.coords.x .. "," .. jumpTo.coords.y] = true
                allLootTeleport(jumpTo.coords.x, jumpTo.coords.y, math.floor(jumpTo.coords.z))
                st.ticksWaited = 0
            end
        end
    elseif st.phase == "fill" then
        st.ticksWaited = st.ticksWaited + 1
        if st.ticksWaited % ALLLOOT_FILL_POLL == 0 then
            local stamped = allLootStampedSquares(config)
            if stamped > st.stampCount then
                st.stampCount = stamped
                st.stampStable = 0
            else
                st.stampStable = st.stampStable + 1
            end
        end
        if st.stampStable >= ALLLOOT_FILL_STABLE or st.ticksWaited >= ALLLOOT_FILL_MAX then
            if st.ticksWaited >= ALLLOOT_FILL_MAX then
                DWAPUtils.dprint("Loot audit: fill wait hit its cap, verifying anyway")
            end
            allLootFinishConfig(st.pendingUnstreamed or 0, st.pendingBadZ)
        end
    end
end

-- Verification is stamp-based by default (the fill marks parent-object
-- modData), so audits work in normal loot-on worlds. fillThreshold is an
-- optional extra for loot-off worlds: 0 = fail empty containers, >0 = fail
-- below that fill percent.
-- checkSystems (3rd arg, off by default) adds the power/water pass: keeps the
-- normal run light, and gives a combined fix list when you want one
--- Whether an audit is currently running, for the dev panel's toggle state.
--- allLootState is file-local, so the panel cannot read it directly.
--- @return boolean
function DWAPAuditRunning()
    return allLootState ~= nil
end

function DWAPAudit(startIndex, fillThreshold, checkSystems)
    if allLootState then
        DWAPUtils.dprint("Loot audit already running - aborting it")
        allLootStop("=== ABORTED at config " .. allLootState.index .. " ===")
        return
    end
    local configs = DWAPUtils.loadConfigs(true)
    if not configs or #configs == 0 then
        DWAPUtils.dprint("No configs found")
        return
    end
    -- resuming mid-list appends to the existing report instead of truncating it
    local resuming = (startIndex or 1) > 1
    allLootState = {
        configs = configs,
        index = startIndex or 1,
        phase = "teleport",
        ticksWaited = 0,
        jumped = {},
        writer = getFileWriter("DWAP_loot_audit.txt", true, resuming),
        passed = 0,
        failed = 0,
        skipped = 0,
        fillThreshold = fillThreshold,
        checkSystems = checkSystems and true or false,
    }
    if resuming then
        allLootWrite("--- resumed at config " .. startIndex .. " ---")
    else
        allLootWrite("DWAP loot audit - " .. #configs .. " configs, verification: " ..
            (fillThreshold and ("stamp + fill threshold " .. fillThreshold .. "%") or "stamp-based") ..
            (checkSystems and ", systems pass ON" or ", loot only"))
    end
    -- state what the systems pass is NOT covering, so a quiet report is not
    -- mistaken for solar being healthy
    if checkSystems and not solarSystemActive() then
        allLootWrite("  (solar checks skipped: ISA mod inactive or EnableGenSystemSolar off)")
    end
    allLootWrite("")
    DWAPUtils.dprint("Starting loot audit across " .. #configs .. " configs")
    Events.OnTick.Add(allLootTick)
end

local currentContainerLookup = nil

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
            local z = math.floor(entry.coords.z)
            local key = DWAPUtils.hashCoords(x, y, z)
            local record = lookup[key]
            if not record then
                record = { slots = {}, hasBase = false, hasUpper = false }
                lookup[key] = record
            end

            -- legacy +0.5 coords still mean upper
            local isUpper = entry.slot == "upper" or entry.coords.z % 1 ~= 0
            local value = 1
            if not entry.dist and not entry.items and not entry.special then
                value = 0 -- nothing to spawn: an authoring error
            elseif entry.special then
                value = 2
            end

            record.slots[#record.slots + 1] = {
                entry = i,
                upper = isUpper,
                freezer = entry.slot == "freezer",
                stack = entry.stack,
                value = value,
            }
            if isUpper then
                record.hasUpper = true
            elseif not entry.stack and entry.slot ~= "freezer" then
                record.hasBase = true
            end
        end
    end
    return lookup
end

-- Status of one square: what the config asks for there, and whether the
-- shared resolver can actually find it. Resolution goes through
-- DWAPUtils.resolveLootContainer - the same call the loot fill and the audit
-- make - so the overlay cannot disagree with them about which container an
-- entry owns. Reimplementing the High/overhead/ordering rules here is what
-- used to paint correctly-filled squares red.
local function checkSquareContainers(square, containerLookup)
    local status = { totalContainers = 0, foundContainers = 0, errorContainers = 0,
        specialContainers = 0, missingContainers = 0 }
    if not square then return status end

    local x, y, z = square:getX(), square:getY(), square:getZ()
    local record = containerLookup[DWAPUtils.hashCoords(x, y, z)]

    -- Count what is physically here, minus the things the loot fill never
    -- touches. Trash containers only count when the square is configured,
    -- otherwise every bin in town lights up as unclaimed
    local containers = DWAPUtils.getSquareContainers(square)
    for i = 1, #containers do
        local entry = containers[i]
        local container = entry.container
        local containerType = container:getType()
        if not (containerType == "microwave" or container:isStove()) then
            local isTrash = false
            local properties = entry.object:getProperties()
            if properties:has("GroupName") and properties:get("GroupName") == "Garbage" then
                isTrash = true
            elseif properties:has("container") then
                local trashTypes = {
                    bin = true,
                    dumpster = true,
                    clothingdryer = true,
                    clothingdryerbasic = true,
                    clothingrack = true,
                    clothingwasher = true,
                }
                isTrash = trashTypes[properties:get("container")] == true
            end
            if not isTrash or record then
                status.totalContainers = status.totalContainers + 1
            end
        end
    end

    if not record then return status end

    for i = 1, #record.slots do
        local slot = record.slots[i]
        local container = DWAPUtils.resolveLootContainer(square, {
            upper = slot.upper,
            stack = slot.stack,
            freezer = slot.freezer,
            -- an upper entry only has to yield to a base entry when one is
            -- actually configured on the same square
            pairPresent = slot.upper and record.hasBase or false,
        })
        if not container then
            status.missingContainers = status.missingContainers + 1
        elseif slot.value == 0 then
            status.errorContainers = status.errorContainers + 1
        elseif slot.value == 2 then
            status.specialContainers = status.specialContainers + 1
        else
            status.foundContainers = status.foundContainers + 1
        end
    end

    return status
end

function VisualizeContainersStatus(radius, containerLookup)
    local pSquare = getPlayer():getCurrentSquare()
    if not pSquare then
        DWAPUtils.dprint("Player square not found")
        return
    end

    local playerX, playerY, playerZ = pSquare:getX(), pSquare:getY(), pSquare:getZ()
    local playerNum = getPlayer():getPlayerNum()
    radius = radius or 30 -- Default to 30 tile radius

    -- Loop through all squares in the radius
    for x = playerX - radius, playerX + radius do
        for y = playerY - radius, playerY + radius do
            local square = getSquare(x, y, playerZ)
            if square then
                local containerStatus = checkSquareContainers(square, containerLookup)

                -- Check if we should highlight this square
                local shouldHighlight = containerStatus.totalContainers > 0 or containerStatus.missingContainers > 0

                if shouldHighlight then
                    -- Priority order: error containers or missing containers (red) > special (blue) > normal logic
                    if containerStatus.errorContainers > 0 or containerStatus.missingContainers > 0 then
                        -- Red for squares with error containers (lookup value 0) or missing containers (config but no container)
                        addAreaHighlightForPlayer(playerNum, x, y, x + 1, y + 1, playerZ, 1, 0, 0, 0.7)
                    elseif containerStatus.specialContainers > 0 then
                        -- Blue for squares with special containers (lookup value 2)
                        addAreaHighlightForPlayer(playerNum, x, y, x + 1, y + 1, playerZ, 0.2, 0.2, 0.8, 0.5)
                    elseif containerStatus.totalContainers > 0 and containerStatus.foundContainers == 0 then
                        -- Orange for squares with containers but not in config
                        addAreaHighlightForPlayer(playerNum, x, y, x + 1, y + 1, playerZ, 1, 0.5, 0, 0.5)
                    elseif containerStatus.foundContainers < containerStatus.totalContainers then
                        -- Purple for squares with some but not all containers in config
                        addAreaHighlightForPlayer(playerNum, x, y, x + 1, y + 1, playerZ, 0.5, 0, 0.5, 0.5)
                    else
                        -- Green for squares with all containers in config
                        addAreaHighlightForPlayer(playerNum, x, y, x + 1, y + 1, playerZ, 0, 1, 0, 0.5)
                    end
                end
                -- No highlight if there are no containers and no missing containers
            end
        end
    end
end

function containersTick()
    if currentContainerLookup then
        VisualizeContainersStatus(30, currentContainerLookup)
    end
end

local currentContainerLabels = nil

-- One label per loot entry: its 1-based entry number, with "^" appended for
-- upper (+0.5 z) containers so stacked pairs on one tile stay readable
local function buildContainerLabels(config)
    local labels = {}
    if not config or not config.loot then return labels end
    for i = 1, #config.loot do
        local entry = config.loot[i]
        if entry and entry.coords then
            local z = entry.coords.z
            local isUpper = z % 1 ~= 0 or entry.slot == "upper"
            -- draw-height offset in z units so co-tile labels separate at
            -- their containers' rough heights (zoom-aware via projection):
            -- uppers at wall-cabinet height, stacks a third of a level per
            -- crate, bottom on the floor
            local rise = 0
            if isUpper then
                rise = 0.66
            elseif entry.slot == "freezer" then
                rise = 0.4
            elseif entry.stack then
                rise = (entry.stack - 1) * 0.33
            end
            labels[#labels + 1] = {
                x = entry.coords.x,
                y = entry.coords.y,
                z = math.floor(z),
                rise = rise,
                text = tostring(i) .. (entry.stack and ("s" .. entry.stack) or "")
                    .. (isUpper and "^" or "") .. (entry.slot == "freezer" and "f" or ""),
            }
        end
    end
    return labels
end

-- Draw entry numbers pinned to their squares (same pattern the foraging
-- icons use: isoToScreenX/Y + TextManager during UI draw)
function containerLabelsDraw()
    if not currentContainerLabels then return end
    local player = getPlayer()
    local pSquare = player and player:getCurrentSquare()
    if not pSquare then return end
    local playerNum = player:getPlayerNum()
    local playerX, playerY, playerZ = pSquare:getX(), pSquare:getY(), pSquare:getZ()
    local tm = getTextManager()
    for i = 1, #currentContainerLabels do
        local l = currentContainerLabels[i]
        if l.z == playerZ and math.abs(l.x - playerX) <= 30 and math.abs(l.y - playerY) <= 30 then
            local drawZ = l.z + (l.rise or 0)
            local sx = isoToScreenX(playerNum, l.x + 0.5, l.y + 0.5, drawZ)
            local sy = isoToScreenY(playerNum, l.x + 0.5, l.y + 0.5, drawZ)
            tm:DrawStringCentre(UIFont.Small, sx + 1, sy + 1, l.text, 0, 0, 0, 0.8)
            tm:DrawStringCentre(UIFont.Small, sx, sy, l.text, 1, 1, 0.2, 1)
        end
    end
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

-- Barricade overlay: for each objectSpawns barricade entry, draw its entry
-- number with the barricade type underneath, green when an IsoBarricade is
-- actually present on the square and red when it is missing. Openings that
-- could take a barricade but are in neither state - what FindUnbarricaded
-- dumps - draw orange underneath, so gaps are visible without leaving the game
local currentBarricadeLabels = nil
local currentOpenLabels = nil

local function squareHasBarricade(square)
    if not square then return false end
    local lists = { square:getObjects(), square:getSpecialObjects() }
    for l = 1, 2 do
        local objects = lists[l]
        if objects then
            for j = 0, objects:size() - 1 do
                if instanceof(objects:get(j), "IsoBarricade") then return true end
            end
        end
    end
    return false
end

local function buildBarricadeLabels(config)
    local labels = {}
    if not config or not config.objectSpawns then return labels end
    for i = 1, #config.objectSpawns do
        local e = config.objectSpawns[i]
        if e and e.barricade and e.x then
            labels[#labels + 1] = {
                x = e.x,
                y = e.y,
                z = e.z or 0,
                num = tostring(i),
                btype = tostring(e.barricade),
                -- Props.lua matches its target by sprite name; keeping it
                -- lets the open-opening scan tell a covered opening from a
                -- second one sharing the square
                target = e.target,
            }
        end
    end
    return labels
end

local BARRICADE_SCAN_RADIUS = 30 -- matches the label draw cutoff below
local BARRICADE_SCAN_INTERVAL = 30 -- ticks; the scan is far too heavy per frame
local barricadeScanCountdown = 0

-- An opening the config already addresses: same square, and the same sprite
-- when the entry names a target (so a window and a door sharing one square
-- stay distinguishable)
local function openingIsConfigured(x, y, z, sprite)
    if not currentBarricadeLabels then return false end
    for i = 1, #currentBarricadeLabels do
        local l = currentBarricadeLabels[i]
        if l.x == x and l.y == y and l.z == z and (not l.target or l.target == sprite) then
            return true
        end
    end
    return false
end

-- Rebuild the list of shell openings around the player that could take a
-- barricade and have none. Same filters FindUnbarricaded applies - exterior
-- facing, no garage doors - so the overlay and the dump agree; anything the
-- config already covers is left to its own red/green label
local function rescanOpenBarricades()
    local player = getPlayer()
    local pSquare = player and player:getCurrentSquare()
    if not pSquare then return end
    local playerX, playerY, playerZ = pSquare:getX(), pSquare:getY(), pSquare:getZ()
    local found, seen = {}, {}
    local function consider(obj, x, y)
        local btype = barricadeableType(obj)
        if not btype then return end
        local sprite = obj:getSpriteName() or ""
        local facing = obj:getNorth() and "N" or "W"
        local key = ("%d,%d,%s,%s"):format(x, y, sprite, facing)
        if seen[key] then return end
        seen[key] = true
        if isGarageOpening(sprite) or not isExteriorOpening(obj) then return end
        if not obj:isBarricadeAllowed() or obj:isBarricaded() then return end
        if openingIsConfigured(x, y, playerZ, sprite) then return end
        found[#found + 1] = {
            x = x, y = y, z = playerZ,
            text = btype.tag .. " " .. facing,
        }
    end
    for x = playerX - BARRICADE_SCAN_RADIUS, playerX + BARRICADE_SCAN_RADIUS do
        for y = playerY - BARRICADE_SCAN_RADIUS, playerY + BARRICADE_SCAN_RADIUS do
            local square = getSquare(x, y, playerZ)
            if square then
                local objects = square:getObjects()
                if objects then
                    for j = 0, objects:size() - 1 do
                        consider(objects:get(j), x, y)
                    end
                end
                -- 42.20 overlay-merged window frames never appear as their
                -- own object; same fallback Props.lua and the dump use
                consider(square:getWindowFrame(true), x, y)
                consider(square:getWindowFrame(false), x, y)
                consider(square:getWindow(true), x, y)
                consider(square:getWindow(false), x, y)
            end
        end
    end
    currentOpenLabels = found
end

function barricadesTick()
    barricadeScanCountdown = barricadeScanCountdown - 1
    if barricadeScanCountdown <= 0 then
        barricadeScanCountdown = BARRICADE_SCAN_INTERVAL
        rescanOpenBarricades()
    end
end

-- A barricade belongs to the opening in the wall, not to the floor of the
-- tile, so lift the labels half a level to sit against the window or door.
-- Offset in z rather than screen pixels, the way the container labels do it,
-- so it stays put as you zoom
local BARRICADE_LABEL_RISE = 0.5

function barricadeLabelsDraw()
    if not currentBarricadeLabels and not currentOpenLabels then return end
    local player = getPlayer()
    local pSquare = player and player:getCurrentSquare()
    if not pSquare then return end
    local playerNum = player:getPlayerNum()
    local playerX, playerY, playerZ = pSquare:getX(), pSquare:getY(), pSquare:getZ()
    local tm = getTextManager()
    local lineH = tm:getFontHeight(UIFont.Small)
    if not lineH or lineH <= 0 then lineH = 14 end
    for i = 1, currentBarricadeLabels and #currentBarricadeLabels or 0 do
        local l = currentBarricadeLabels[i]
        if l.z == playerZ and math.abs(l.x - playerX) <= 30 and math.abs(l.y - playerY) <= 30 then
            local seen = squareHasBarricade(getSquare(l.x, l.y, l.z))
            local r, g, b = 1, 0.25, 0.25
            if seen then r, g, b = 0.25, 1, 0.25 end
            local drawZ = l.z + BARRICADE_LABEL_RISE
            local sx = isoToScreenX(playerNum, l.x + 0.5, l.y + 0.5, drawZ)
            local sy = isoToScreenY(playerNum, l.x + 0.5, l.y + 0.5, drawZ)
            tm:DrawStringCentre(UIFont.Small, sx + 1, sy + 1, l.num, 0, 0, 0, 0.8)
            tm:DrawStringCentre(UIFont.Small, sx, sy, l.num, r, g, b, 1)
            tm:DrawStringCentre(UIFont.Small, sx + 1, sy + lineH + 1, l.btype, 0, 0, 0, 0.8)
            tm:DrawStringCentre(UIFont.Small, sx, sy + lineH, l.btype, r, g, b, 1)
        end
    end
    -- Unconfigured gaps, orange to match the containers overlay's
    -- "here but not in the config" colour. Drawn a line lower than a config
    -- label would sit so the two never collide on a shared square
    for i = 1, currentOpenLabels and #currentOpenLabels or 0 do
        local l = currentOpenLabels[i]
        if l.z == playerZ and math.abs(l.x - playerX) <= 30 and math.abs(l.y - playerY) <= 30 then
            local drawZ = l.z + BARRICADE_LABEL_RISE
            local sx = isoToScreenX(playerNum, l.x + 0.5, l.y + 0.5, drawZ)
            local sy = isoToScreenY(playerNum, l.x + 0.5, l.y + 0.5, drawZ) + lineH * 2
            tm:DrawStringCentre(UIFont.Small, sx + 1, sy + 1, l.text, 0, 0, 0, 0.8)
            tm:DrawStringCentre(UIFont.Small, sx, sy, l.text, 1, 0.55, 0.1, 1)
        end
    end
end

local showingBarricades = false

function ShowBarricades(index)
    showingBarricades = not showingBarricades
    DWAP_DevToggles.barricades = showingBarricades
    if showingBarricades then
        local configs = DWAPUtils.loadConfigs(true)
        if not configs or #configs == 0 then
            DWAPUtils.dprint("No configs found")
            showingBarricades = false
            DWAP_DevToggles.barricades = false
            return
        end
        if not index or index < 1 or index > #configs then
            DWAPUtils.dprint("Invalid index: " .. tostring(index) .. ". Must be between 1 and " .. #configs)
            showingBarricades = false
            DWAP_DevToggles.barricades = false
            return
        end
        local config = configs[index]
        local labels = buildBarricadeLabels(config)
        local configName = "Config " .. index
        if config.doorKeys and config.doorKeys.name then
            configName = config.doorKeys.name
        end
        currentBarricadeLabels = labels
        -- A config with no barricades yet is exactly when the gap markers are
        -- worth having, so an empty list no longer refuses to turn on
        if #labels == 0 then
            DWAPUtils.dprint("Config " .. index .. " has no barricade objectSpawns - showing open ones only")
        end
        currentOpenLabels = nil
        barricadeScanCountdown = 0
        Events.OnTick.Remove(barricadesTick)
        Events.OnTick.Add(barricadesTick)
        ensureDevOverlay()
        DWAPUtils.dprint("Barricade overlay enabled for " .. configName .. " (" .. #labels .. " barricades)")
        DWAPUtils.dprint("Green = barricade present, Red = missing, Orange = exterior opening not in config")
    else
        Events.OnTick.Remove(barricadesTick)
        currentBarricadeLabels = nil
        currentOpenLabels = nil
        DWAPUtils.dprint("Barricade overlay disabled")
    end
end

local showingContainers = false

function ShowContainers(index)
    showingContainers = not showingContainers

    if showingContainers then
        -- Load the config
        local configs = DWAPUtils.loadConfigs(true)
        if not configs or #configs == 0 then
            DWAPUtils.dprint("No configs found")
            showingContainers = false
            return
        end

        if index < 1 or index > #configs then
            DWAPUtils.dprint("Invalid index: " .. index .. ". Must be between 1 and " .. #configs)
            showingContainers = false
            return
        end

        local config = configs[index]
        if not config or not config.loot then
            DWAPUtils.dprint("Config at index " .. index .. " has no loot data")
            showingContainers = false
            return
        end

        local configName = "Config " .. index
        if config.doorKeys and config.doorKeys.name then
            configName = config.doorKeys.name
        end

        -- Build container lookup table
        currentContainerLookup = buildContainerLookup(config)
        currentContainerLabels = buildContainerLabels(config)
        -- the lookup is keyed by square now, so count the entries inside it
        local containerCount = 0
        for _, record in pairs(currentContainerLookup) do
            containerCount = containerCount + #record.slots
        end

        Events.OnTick.Add(containersTick)
        DWAP_DevToggles.containers = true
        ensureDevOverlay()
        DWAPUtils.dprint("Container visualization enabled for " .. configName .. " (" .. containerCount .. " containers)")
        DWAPUtils.dprint(
        "Red = config errors or missing containers, Orange = containers not in config, Purple = partial config, Blue = special containers, Green = all containers in config")
        DWAPUtils.dprint("Squares are labeled with their loot entry number; ^ marks an upper (+0.5 z) entry")
    else
        Events.OnTick.Remove(containersTick)
        DWAP_DevToggles.containers = false
        currentContainerLookup = nil
        currentContainerLabels = nil
        DWAPUtils.dprint("Container visualization disabled")
    end
end

function CompareLootConfigs(index)
    local configs = DWAPUtils.loadConfigs(true)
    if not configs or #configs == 0 then
        DWAPUtils.dprint("No configs found")
        return
    end

    if index < 1 or index > #configs then
        DWAPUtils.dprint("Invalid index: " .. index .. ". Must be between 1 and " .. #configs)
        return
    end

    local targetConfig = configs[index]
    if not targetConfig or not targetConfig.loot then
        DWAPUtils.dprint("Config at index " .. index .. " has no loot data")
        return
    end

    local configName = "Config " .. index
    if targetConfig.doorKeys and targetConfig.doorKeys.name then
        configName = targetConfig.doorKeys.name
    end

    DWAPUtils.dprint("=== COMPARING LOOT CONFIG: " .. configName .. " ===")

    -- Collect all distribution tags and gunlocker from all configs (excluding target)
    local allDistTags = {}
    local configCount = 0

    for i = 1, #configs do
        if i ~= index then -- Exclude the target config
            local config = configs[i]
            if config and config.loot then
                configCount = configCount + 1

                for j = 1, #config.loot do
                    local entry = config.loot[j]
                    if entry then
                        -- Count distribution tags
                        if entry.dist then
                            for k = 1, #entry.dist do
                                local distTag = entry.dist[k]
                                allDistTags[distTag] = (allDistTags[distTag] or 0) + 1
                            end
                        end

                        -- Only count gunlocker special tags
                        if entry.special and entry.special == "gunlocker" then
                            allDistTags["gunlocker"] = (allDistTags["gunlocker"] or 0) + 1
                        end
                    end
                end
            end
        end
    end

    -- Collect tags from target config
    local targetDistTags = {}

    for i = 1, #targetConfig.loot do
        local entry = targetConfig.loot[i]
        if entry then
            -- Count distribution tags
            if entry.dist then
                for j = 1, #entry.dist do
                    local distTag = entry.dist[j]
                    targetDistTags[distTag] = (targetDistTags[distTag] or 0) + 1
                end
            end

            -- Only count gunlocker special tags
            if entry.special and entry.special == "gunlocker" then
                targetDistTags["gunlocker"] = (targetDistTags["gunlocker"] or 0) + 1
            end
        end
    end

    -- Create results table with filtered tags
    local results = {}

    -- Add distribution tags from other configs (only if they occur more than once OR exist in target)
    for tag, count in pairs(allDistTags) do
        if count > 1 or targetDistTags[tag] then
            local average = count / configCount
            local targetCount = targetDistTags[tag] or 0
            local flag = ""

            if count == 0 and targetCount > 0 then
                flag = "UNIQUE"
            elseif targetCount == 0 and average >= 0.8 then
                flag = "MISSING"
            elseif targetCount > average + 1.2 then
                flag = "HIGH"
            end

            table.insert(results, {
                tag = tag,
                average = average,
                target = targetCount,
                flag = flag
            })
        end
    end

    -- Add distribution tags that are only in target
    for tag, count in pairs(targetDistTags) do
        if not allDistTags[tag] then
            table.insert(results, {
                tag = tag,
                average = 0,
                target = count,
                flag = "UNIQUE"
            })
        end
    end

    -- Sort by highest average, then by tag name
    table.sort(results, function(a, b)
        if a.average == b.average then
            return a.tag < b.tag
        end
        return a.average > b.average
    end)

    -- Print table header
    DWAPUtils.dprint("=== DISTRIBUTION COMPARISON TABLE ===")
    DWAPUtils.dprint(string.format("| %-30s | %-8s | %-15s | %-6s |", "Tag", "Average", configName, "Flag"))
    DWAPUtils.dprint(string.format("|%s|%s|%s|%s|",
        string.rep("-", 32),
        string.rep("-", 10),
        string.rep("-", 17),
        string.rep("-", 8)))

    -- Print results
    for i = 1, #results do
        local result = results[i]
        if result.average > 0.1 or result.target > 0 then
            DWAPUtils.dprint(string.format("| %-30s | %-8.1f | %-15d | %-6s |",
                result.tag,
                result.average,
                result.target,
                result.flag))
        end
    end

    DWAPUtils.dprint("=== END COMPARISON ===")
    DWAPUtils.dprint("Compared against " .. configCount .. " other configs")

    -- Summary statistics
    local uniqueCount = 0
    local totalTargetEntries = 0
    for i = 1, #results do
        if results[i].flag == "UNIQUE" then
            uniqueCount = uniqueCount + 1
        end
        totalTargetEntries = totalTargetEntries + results[i].target
    end

    DWAPUtils.dprint("Summary:")
    DWAPUtils.dprint("  Unique tags in " .. configName .. ": " .. uniqueCount)
    DWAPUtils.dprint("  Total tag instances in " .. configName .. ": " .. totalTargetEntries)
    DWAPUtils.dprint("  Total unique tags: " .. #results)

    return results
end

local currentPlumbingLookup = nil

-- Build a lookup table of plumbing coordinates from a config
local function buildPlumbingLookup(config)
    local lookup = {}
    local tankLookup = {}

    if not config then
        return lookup, tankLookup
    end

    -- Add water tanks to lookup
    if config.waterTanks then
        for i = 1, #config.waterTanks do
            local tank = config.waterTanks[i]
            if tank and tank.x and tank.y and tank.z then
                local key = tank.x .. "," .. tank.y .. "," .. tank.z
                lookup[key] = true
                tankLookup[key] = true -- Mark as water tank
            end
        end
    end

    -- Add water fixtures to lookup
    if config.waterFixtures then
        for i = 1, #config.waterFixtures do
            local fixture = config.waterFixtures[i]
            if fixture and fixture.x and fixture.y and fixture.z then
                local key = fixture.x .. "," .. fixture.y .. "," .. fixture.z
                lookup[key] = true
                -- Don't mark fixtures as tanks
            end
        end
    end

    return lookup, tankLookup
end

local currentPlumbingLabels = nil

-- Fixtures sit at counter/wall height rather than on the floor, same reason
-- the barricade labels lift: offset in z so it survives zooming
local PLUMBING_LABEL_RISE = 0.5

-- One label per config entry, so a square's colour can be traced back to the
-- line that put it there. Tanks are numbered separately with a T prefix,
-- matching how waterTanks and waterFixtures are separate lists in the config
local function buildPlumbingLabels(config)
    local labels = {}
    if not config then return labels end
    if config.waterTanks then
        for i = 1, #config.waterTanks do
            local tank = config.waterTanks[i]
            if tank and tank.x and tank.y and tank.z then
                labels[#labels + 1] = {
                    x = tank.x, y = tank.y, z = math.floor(tank.z),
                    text = "T" .. i, tank = true,
                }
            end
        end
    end
    if config.waterFixtures then
        for i = 1, #config.waterFixtures do
            local fixture = config.waterFixtures[i]
            if fixture and fixture.x and fixture.y and fixture.z then
                labels[#labels + 1] = {
                    x = fixture.x, y = fixture.y, z = math.floor(fixture.z),
                    text = tostring(i),
                }
            end
        end
    end
    return labels
end

-- Same draw pattern as the container and barricade labels: isoToScreenX/Y
-- during the UI pass, dark shadow under white-ish text
function plumbingLabelsDraw()
    if not currentPlumbingLabels then return end
    local player = getPlayer()
    local pSquare = player and player:getCurrentSquare()
    if not pSquare then return end
    local playerNum = player:getPlayerNum()
    local playerX, playerY, playerZ = pSquare:getX(), pSquare:getY(), pSquare:getZ()
    local tm = getTextManager()
    for i = 1, #currentPlumbingLabels do
        local l = currentPlumbingLabels[i]
        if l.z == playerZ and math.abs(l.x - playerX) <= 30 and math.abs(l.y - playerY) <= 30 then
            local drawZ = l.z + PLUMBING_LABEL_RISE
            local sx = isoToScreenX(playerNum, l.x + 0.5, l.y + 0.5, drawZ)
            local sy = isoToScreenY(playerNum, l.x + 0.5, l.y + 0.5, drawZ)
            local r, g, b = 0.4, 0.85, 1
            if l.tank then r, g, b = 0.4, 0.6, 1 end
            tm:DrawStringCentre(UIFont.Small, sx + 1, sy + 1, l.text, 0, 0, 0, 0.8)
            tm:DrawStringCentre(UIFont.Small, sx, sy, l.text, r, g, b, 1)
        end
    end
end

-- Check plumbing fixtures on a square and return their status
local function checkSquarePlumbing(square, plumbingLookup, tankLookup)
    if not square then
        return { totalFixtures = 0, foundFixtures = 0, fixtures = {} }
    end

    local x, y, z = square:getX(), square:getY(), square:getZ()
    local totalFixtures = 0
    local foundFixtures = 0
    local fixtures = {}

    -- Plumbing fixture names to look for
    local plumbingNames = {
        ["Bath"] = true,
        ["Shower"] = true,
        ["Toilet"] = true,
        ["Combo Washer Dryer"] = true,
        ["Gallery Toilet"] = true,
        ["Sink"] = true,
        ["Soda Machine"] = true,
        ["Washing Machine"] = true
    }

    local objects = square:getObjects()
    if objects then
        for j = 0, objects:size() - 1 do
            local obj = objects:get(j)
            local isPlumbingFixture = false
            local customNameStr = "Unknown"

            -- Check if object has fluid
            if obj and obj:hasFluid() then
                isPlumbingFixture = true
            else
                local objectSprite = obj and obj:getSprite()
                if objectSprite then
                    local props = objectSprite and objectSprite:getProperties()

                    local customName = props and props:has("CustomName") and props:get("CustomName")
                    if customName and plumbingNames[customName] then
                        isPlumbingFixture = true
                        customNameStr = customName
                    end
                    if obj:isFloor() then
                        isPlumbingFixture = false
                    end
                end
            end

            if isPlumbingFixture then
                totalFixtures = totalFixtures + 1

                local key = x .. "," .. y .. "," .. z
                local isInConfig = plumbingLookup[key]
                local isTank = tankLookup[key]
                local fluid = 0

                -- Try to get fluid amount if object supports it
                if obj:hasFluid() and obj.getFluidAmount then
                    fluid = obj:getFluidAmount() or 0
                end

                if isInConfig then
                    foundFixtures = foundFixtures + 1
                end

                table.insert(fixtures, {
                    obj = obj,
                    fluid = fluid,
                    isInConfig = isInConfig,
                    isTank = isTank,
                    key = key,
                    customName = customNameStr
                })
            end
        end
    end

    return { totalFixtures = totalFixtures, foundFixtures = foundFixtures, fixtures = fixtures }
end

-- Visualize plumbing status around the player
function VisualizePlumbingStatus(radius, plumbingLookup, tankLookup)
    local pSquare = getPlayer():getCurrentSquare()
    if not pSquare then
        DWAPUtils.dprint("Player square not found")
        return
    end

    local playerX, playerY, playerZ = pSquare:getX(), pSquare:getY(), pSquare:getZ()
    local playerNum = getPlayer():getPlayerNum()
    radius = radius or 30 -- Default to 30 tile radius

    -- Loop through all squares in the radius
    for x = playerX - radius, playerX + radius do
        for y = playerY - radius, playerY + radius do
            local square = getSquare(x, y, playerZ)
            if square then
                local plumbingStatus = checkSquarePlumbing(square, plumbingLookup, tankLookup)

                if plumbingStatus.totalFixtures > 0 then
                    for i = 1, #plumbingStatus.fixtures do
                        local fixture = plumbingStatus.fixtures[i]

                        -- Check for specific sprite names for purple highlighting
                        local spriteName = fixture.obj and fixture.obj:getSprite() and fixture.obj:getSprite():getName()
                        if spriteName == "industry_02_73" or spriteName == "industry_02_72" then
                            -- Purple for industry_02_73 and industry_02_72
                            addAreaHighlightForPlayer(playerNum, x, y, x + 1, y + 1, playerZ, 0.5, 0, 0.5, 0.7)
                        elseif fixture.isTank then
                            -- Water tank logic
                            if fixture.fluid > 0 then
                                -- Blue for water tank with fluid
                                addAreaHighlightForPlayer(playerNum, x, y, x + 1, y + 1, playerZ, 0.2, 0.8, 0.9, 0.7)
                            else
                                -- Red for water tank with no fluid
                                addAreaHighlightForPlayer(playerNum, x, y, x + 1, y + 1, playerZ, 1, 0, 0, 0.7)
                            end
                        elseif not fixture.isInConfig then
                            -- Red for fixtures not in config
                            addAreaHighlightForPlayer(playerNum, x, y, x + 1, y + 1, playerZ, 1, 0, 0, 0.5)
                        elseif fixture.fluid < 100 then
                            -- Red for fixtures with less than 100 fluid
                            addAreaHighlightForPlayer(playerNum, x, y, x + 1, y + 1, playerZ, 1, 0, 0, 0.5)
                        else
                            -- Green for fixtures in config with >100 fluid
                            addAreaHighlightForPlayer(playerNum, x, y, x + 1, y + 1, playerZ, 0, 1, 0, 0.5)
                        end
                        break -- Only highlight once per square even if multiple fixtures
                    end
                end
                -- No highlight if there are no plumbing fixtures
            end
        end
    end
end

function plumbingTick()
    if currentPlumbingLookup then
        VisualizePlumbingStatus(30, currentPlumbingLookup.lookup, currentPlumbingLookup.tankLookup)
    end
end

local showingPlumbing = false
function ShowPlumbing(index)
    showingPlumbing = not showingPlumbing

    if showingPlumbing then
        -- Load the config
        local configs = DWAPUtils.loadConfigs(true)
        if not configs or #configs == 0 then
            DWAPUtils.dprint("No configs found")
            showingPlumbing = false
            return
        end

        if not index or index < 1 or index > #configs then
            DWAPUtils.dprint("Invalid index: " .. tostring(index or "nil") .. ". Must be between 1 and " .. #configs)
            showingPlumbing = false
            return
        end

        local config = configs[index]
        if not config or (not config.waterTanks and not config.waterFixtures) then
            DWAPUtils.dprint("Config at index " .. index .. " has no water system data (waterTanks or waterFixtures)")
            showingPlumbing = false
            return
        end

        local configName = "Config " .. index
        if config.doorKeys and config.doorKeys.name then
            configName = config.doorKeys.name
        end

        -- Build plumbing lookup tables
        local plumbingLookup, tankLookup = buildPlumbingLookup(config)
        local fixtureCount = 0
        local tankCount = 0
        for _ in pairs(plumbingLookup) do
            fixtureCount = fixtureCount + 1
        end
        for _ in pairs(tankLookup) do
            tankCount = tankCount + 1
        end

        currentPlumbingLookup = {
            lookup = plumbingLookup,
            tankLookup = tankLookup
        }
        currentPlumbingLabels = buildPlumbingLabels(config)

        Events.OnTick.Add(plumbingTick)
        DWAP_DevToggles.plumbing = true
        ensureDevOverlay()
        DWAPUtils.dprint("Plumbing visualization enabled for " ..
            configName .. " (" .. fixtureCount .. " total fixtures, " .. tankCount .. " tanks)")
        DWAPUtils.dprint(
            "Purple = industry_02_73/72, Red = not in config or <100 fluid, Blue = water tank with fluid, Green = fixture in config with >100 fluid")
    else
        Events.OnTick.Remove(plumbingTick)
        DWAP_DevToggles.plumbing = false
        currentPlumbingLookup = nil
        currentPlumbingLabels = nil
        DWAPUtils.dprint("Plumbing visualization disabled")
    end
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

-- Bounds for the survey tools: inside a building scan its actual footprint
-- (def bounds) so neighbouring houses can't leak in; outside take a small
-- grab around the player
local function surveyBounds(building, playerX, playerY)
    if building then
        local def = building.getDef and building:getDef()
        if def then
            local minX, maxX, minY, maxY = def:getX(), def:getX2(), def:getY(), def:getY2()
            DWAPUtils.dprint(("Scanning building footprint %d,%d - %d,%d"):format(minX, minY, maxX, maxY))
            return minX, maxX, minY, maxY
        end
        DWAPUtils.dprint("No building def; falling back to 50-tile radius")
        return playerX - 50, playerX + 50, playerY - 50, playerY + 50
    end
    DWAPUtils.dprint("Standing outside: scanning 10-tile radius")
    return playerX - 10, playerX + 10, playerY - 10, playerY + 10
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

-- Find unconnected plumbing fixtures in the same building and floor as the player
function FindUnconnectedPlumbing()
    local pSquare = getPlayer():getCurrentSquare()
    if not pSquare then
        DWAPUtils.dprint("Player square not found")
        return
    end

    local building = pSquare:getBuilding()
    local playerX, playerY, playerZ = pSquare:getX(), pSquare:getY(), pSquare:getZ()
    DWAPUtils.dprint("=== FINDING UNCONNECTED PLUMBING FIXTURES ===")
    DWAPUtils.dprint("Player position: " .. playerX .. "," .. playerY .. "," .. playerZ)

    local minX, maxX, minY, maxY = surveyBounds(building, playerX, playerY)

    local unconnectedFixtures = {}
    local connectedFixtures = {}
    local waterTanks = {}

    -- Search all squares in the bounds on the same floor
    for x = minX, maxX do
        for y = minY, maxY do
            local square = getSquare(x, y, playerZ)
            if square then
                -- Inside a building only its own squares count; outside
                -- (small radius) everything counts
                local squareBuilding = square:getBuilding()
                if not building or DWAPUtils.sameBuilding(squareBuilding, building) then
                    local room = square:getRoom()
                    local whereTag = (room and room:getName() or "outside") .. ", " .. bldTag(squareBuilding)
                    local objects = square:getObjects()
                    if objects then
                        for j = 0, objects:size() - 1 do
                            local info = plumbingInfo(objects:get(j))
                            if info and info.kind == "tank" then
                                table.insert(waterTanks, {
                                    sprite = info.sprite,
                                    x = x,
                                    y = y,
                                    z = playerZ,
                                    capacity = info.capacity,
                                    amount = info.amount,
                                    where = whereTag
                                })
                            elseif info then
                                local fixtureData = {
                                    sprite = info.sprite,
                                    x = x,
                                    y = y,
                                    z = playerZ,
                                    customName = info.customName,
                                    isConnected = info.isConnected,
                                    where = whereTag
                                }
                                if info.isConnected then
                                    table.insert(connectedFixtures, fixtureData)
                                else
                                    table.insert(unconnectedFixtures, fixtureData)
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    -- Print results in config format
    DWAPUtils.dprint("=== WATER TANKS FOUND (" .. #waterTanks .. ") ===")
    if #waterTanks > 0 then
        print("    waterTanks = {")
        for i = 1, #waterTanks do
            local tank = waterTanks[i]
            print("        { sprite = \"" ..
            tank.sprite ..
            "\", x = " ..
            tank.x ..
            ", y = " ..
            tank.y .. ", z = " .. tank.z .. " }, -- capacity: " .. tank.capacity .. ", current: " .. tank.amount .. " | " .. (tank.where or ""))
        end
        print("    },")
    else
        print("    waterTanks = {},")
    end

    DWAPUtils.dprint("=== UNCONNECTED FIXTURES FOUND (" .. #unconnectedFixtures .. ") ===")
    if #unconnectedFixtures > 0 then
        print("    waterFixtures = {")
        for i = 1, #unconnectedFixtures do
            local fixture = unconnectedFixtures[i]
            print("        { sprite = \"" ..
            fixture.sprite ..
            "\", x = " ..
            fixture.x .. ", y = " .. fixture.y .. ", z = " .. fixture.z .. ", sourceType=\"tank\", source = wtc, }, -- " .. (fixture.where or ""))
        end
        print("    },")
    else
        DWAPUtils.dprint("No unconnected fixtures found!")
    end

    if #connectedFixtures > 0 then
        DWAPUtils.dprint("=== CONNECTED FIXTURES FOUND (" .. #connectedFixtures .. ") ===")
        for i = 1, #connectedFixtures do
            local fixture = connectedFixtures[i]
            DWAPUtils.dprint("  " ..
            fixture.sprite ..
            " at " .. fixture.x .. "," .. fixture.y .. "," .. fixture.z .. " (" .. fixture.customName .. ") -- " .. (fixture.where or ""))
        end
    end

    DWAPUtils.dprint("=== SUMMARY ===")
    DWAPUtils.dprint("Water tanks: " .. #waterTanks)
    DWAPUtils.dprint("Unconnected fixtures: " .. #unconnectedFixtures)
    DWAPUtils.dprint("Connected fixtures: " .. #connectedFixtures)
    DWAPUtils.dprint("Total fixtures: " .. (#unconnectedFixtures + #connectedFixtures))

    return {
        waterTanks = waterTanks,
        unconnectedFixtures = unconnectedFixtures,
        connectedFixtures = connectedFixtures
    }
end

-- Find barricadeable openings with no barricade on them, in the same building
-- and floor as the player. Counterpart to FindUnconnectedPlumbing: same
-- footprint-bounded scan, same paste-ready dump - objectSpawns lines this
-- time. Only shell openings are dumped: interior doors and garage doors are
-- counted in the summary but never listed. Note this reads LIVE state, so
-- barricades the mod already spawned read as done and drop out of the dump;
-- with the Barricade sandbox option off, every opening looks like a gap.
function FindUnbarricaded()
    local pSquare = getPlayer():getCurrentSquare()
    if not pSquare then
        DWAPUtils.dprint("Player square not found")
        return
    end

    local building = pSquare:getBuilding()
    local playerX, playerY, playerZ = pSquare:getX(), pSquare:getY(), pSquare:getZ()
    DWAPUtils.dprint("=== FINDING UNBARRICADED OPENINGS ===")
    DWAPUtils.dprint("Player position: " .. playerX .. "," .. playerY .. "," .. playerZ)

    local minX, maxX, minY, maxY = surveyBounds(building, playerX, playerY)
    -- PZ only stores north and west walls, so a building's SOUTH and EAST
    -- shell openings live on the outside square one tile past the footprint.
    -- Widen by a tile to reach them; ownership is settled per opening below
    if building then
        minX, maxX, minY, maxY = minX - 1, maxX + 1, minY - 1, maxY + 1
    end

    local unbarricaded, barricaded, blocked = {}, {}, 0
    local skippedInterior, skippedGarage = 0, 0
    local seen = {}

    -- Props.lua matches its target by sprite name against the square's object
    -- list, so that is the name worth dumping
    local function record(obj, x, y)
        local btype = barricadeableType(obj)
        if not btype then return end
        local sprite = obj:getSpriteName() or ""
        local facing = obj:getNorth() and "N" or "W"
        local key = ("%d,%d,%d,%s,%s"):format(x, y, playerZ, sprite, facing)
        if seen[key] then return end
        seen[key] = true
        if isGarageOpening(sprite) then
            skippedGarage = skippedGarage + 1
            return
        end
        if not isExteriorOpening(obj) then
            skippedInterior = skippedInterior + 1
            return
        end
        -- Exactly one side is roomed (isExteriorOpening guarantees it): that
        -- side owns the opening. Testing the square the object happens to sit
        -- on instead would drop every south/east opening, whose object lives
        -- on the unroomed outside square
        local near = obj:getSquare()
        local far = obj.getOppositeSquare and obj:getOppositeSquare()
        local inside = (near and near:getRoom()) and near or far
        local insideBuilding = inside and inside:getBuilding()
        if building and not DWAPUtils.sameBuilding(insideBuilding, building) then
            return -- a neighbour's shell, pulled in by the widened bounds
        end
        local room = inside and inside:getRoom()
        local whereTag = (room and room:getName() or "outside") .. ", " .. bldTag(insideBuilding)
        if not obj:isBarricadeAllowed() then
            blocked = blocked + 1
            return
        end
        local entry = {
            sprite = sprite, x = x, y = y, z = playerZ,
            kind = btype.kind, facing = facing, where = whereTag,
        }
        if obj:isBarricaded() then
            barricaded[#barricaded + 1] = entry
        else
            unbarricaded[#unbarricaded + 1] = entry
        end
    end

    for x = minX, maxX do
        for y = minY, maxY do
            local square = getSquare(x, y, playerZ)
            if square then
                local objects = square:getObjects()
                if objects then
                    for j = 0, objects:size() - 1 do
                        record(objects:get(j), x, y)
                    end
                end
                -- 42.20 can merge a window frame into the wall as an
                -- overlay, so it never shows up in the object list as its
                -- own barricadeable object - same fallback Props.lua uses
                record(square:getWindowFrame(true), x, y)
                record(square:getWindowFrame(false), x, y)
                record(square:getWindow(true), x, y)
                record(square:getWindow(false), x, y)
            end
        end
    end

    DWAPUtils.dprint("=== UNBARRICADED OPENINGS FOUND (" .. #unbarricaded .. ") ===")
    if #unbarricaded > 0 then
        print("    objectSpawns = {")
        for i = 1, #unbarricaded do
            local o = unbarricaded[i]
            print(("        { barricade = \"woodhalf\", enabled = \"Barricade\", target=\"%s\", x = %d, y = %d, z = %d, }, -- %s %s | %s")
                :format(o.sprite, o.x, o.y, o.z, o.kind, o.facing, o.where or ""))
        end
        print("    },")
        DWAPUtils.dprint("barricade = wood | woodhalf | metal | metalbar (nothing else is applied)")
    else
        DWAPUtils.dprint("No unbarricaded openings found!")
    end

    if #barricaded > 0 then
        DWAPUtils.dprint("=== ALREADY BARRICADED (" .. #barricaded .. ") ===")
        for i = 1, #barricaded do
            local o = barricaded[i]
            DWAPUtils.dprint(("  %s %s at %d,%d,%d (%s) -- %s"):format(
                o.kind, o.facing, o.x, o.y, o.z, o.sprite, o.where or ""))
        end
    end

    DWAPUtils.dprint("=== SUMMARY ===")
    DWAPUtils.dprint("Unbarricaded: " .. #unbarricaded)
    DWAPUtils.dprint("Already barricaded: " .. #barricaded)
    DWAPUtils.dprint("Barricading not allowed: " .. blocked)
    DWAPUtils.dprint("Skipped, interior (room on both sides): " .. skippedInterior)
    DWAPUtils.dprint("Skipped, garage door (barricades do not stick): " .. skippedGarage)
    DWAPUtils.dprint("Total openings: "
        .. (#unbarricaded + #barricaded + blocked + skippedInterior + skippedGarage))

    return {
        unbarricaded = unbarricaded,
        barricaded = barricaded,
    }
end

--- Nearest config by spawn distance to the player. Shared by the dev panel
--- and the export dumps so they cannot disagree about what "nearest" means.
--- @param useCache boolean|nil
--- @return number|nil index, string|nil name
function DWAPNearestConfig(useCache)
    local player = getPlayer()
    if not player then return nil end
    local px, py = player:getX(), player:getY()
    local configs = DWAPUtils.loadConfigs(not useCache)
    if not configs then return nil end
    local best, bestDist
    for i = 1, #configs do
        local config = configs[i]
        local spawn = config and config.spawn
        if spawn and spawn.x then
            local dx, dy = spawn.x - px, spawn.y - py
            local d = dx * dx + dy * dy
            if not bestDist or d < bestDist then
                best, bestDist = i, d
            end
        end
    end
    if not best then return nil end
    local config = configs[best]
    return best, (config and config.doorKeys and config.doorKeys.name) or ("Config " .. best)
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

-- Plumbing picker: click tiles to build an export by hand. The footprint scan
-- is all-or-nothing, which is unusable in something like Rosewood where the
-- config only wants a few rooms out of a huge building. Selection is per
-- square (every fixture on it) and toggles, so clicking a picked tile again
-- drops it.
local plumbPickedSquares = {} -- ordered: { x, y, z, key, entries = { info... } }
local plumbPickedKeys = {}    -- key -> true, for the toggle test

local function plumbPickKey(x, y, z)
    return x .. "," .. y .. "," .. z
end

local function plumbPickRemove(key)
    for i = 1, #plumbPickedSquares do
        if plumbPickedSquares[i].key == key then
            table.remove(plumbPickedSquares, i)
            break
        end
    end
    plumbPickedKeys[key] = nil
end

-- Named function: an anonymous handler could never be removed from the event
function plumbPickClick(tile)
    if not DWAP_DevToggles.plumbPick then return end
    local square = tile and tile.getSquare and tile:getSquare()
    if not square then return end
    local x, y, z = square:getX(), square:getY(), square:getZ()
    local key = plumbPickKey(x, y, z)
    if plumbPickedKeys[key] then
        plumbPickRemove(key)
        DWAPUtils.dprint(("Plumb pick: removed %s (%d left)"):format(key, #plumbPickedSquares))
        return
    end

    local entries = {}
    local objects = square:getObjects()
    if objects then
        for j = 0, objects:size() - 1 do
            local info = plumbingInfo(objects:get(j))
            if info then entries[#entries + 1] = info end
        end
    end
    if #entries == 0 then
        DWAPUtils.dprint("Plumb pick: no tank or fixture on " .. key)
        return
    end

    local room = square:getRoom()
    plumbPickedKeys[key] = true
    plumbPickedSquares[#plumbPickedSquares + 1] = {
        x = x, y = y, z = z, key = key, entries = entries,
        where = (room and room:getName() or "outside") .. ", " .. bldTag(square:getBuilding()),
    }
    DWAPUtils.dprint(("Plumb pick: added %s (%d fixture(s), %d picked)"):format(
        key, #entries, #plumbPickedSquares))
end

function plumbPickTick()
    local player = getPlayer()
    local pSquare = player and player:getCurrentSquare()
    if not pSquare then return end
    local playerNum = player:getPlayerNum()
    local playerZ = pSquare:getZ()
    for i = 1, #plumbPickedSquares do
        local p = plumbPickedSquares[i]
        if p.z == playerZ then
            addAreaHighlightForPlayer(playerNum, p.x, p.y, p.x + 1, p.y + 1, p.z, 0.2, 0.9, 0.9, 0.6)
        end
    end
end

-- Pick order is the export order, so the numbers double as a preview of the
-- lines you are about to get
function plumbPickDraw()
    if not DWAP_DevToggles.plumbPick or #plumbPickedSquares == 0 then return end
    local player = getPlayer()
    local pSquare = player and player:getCurrentSquare()
    if not pSquare then return end
    local playerNum = player:getPlayerNum()
    local playerZ = pSquare:getZ()
    local tm = getTextManager()
    for i = 1, #plumbPickedSquares do
        local p = plumbPickedSquares[i]
        if p.z == playerZ then
            local drawZ = p.z + PLUMBING_LABEL_RISE
            local sx = isoToScreenX(playerNum, p.x + 0.5, p.y + 0.5, drawZ)
            local sy = isoToScreenY(playerNum, p.x + 0.5, p.y + 0.5, drawZ)
            tm:DrawStringCentre(UIFont.Small, sx + 1, sy + 1, tostring(i), 0, 0, 0, 0.8)
            tm:DrawStringCentre(UIFont.Small, sx, sy, tostring(i), 0.2, 1, 1, 1)
        end
    end
end

function DWAPPlumbPick()
    DWAP_DevToggles.plumbPick = not DWAP_DevToggles.plumbPick
    if DWAP_DevToggles.plumbPick then
        Events.OnObjectLeftMouseButtonDown.Remove(plumbPickClick)
        Events.OnObjectLeftMouseButtonDown.Add(plumbPickClick)
        Events.OnTick.Remove(plumbPickTick)
        Events.OnTick.Add(plumbPickTick)
        ensureDevOverlay()
        DWAPUtils.dprint("Plumb pick: ON - left click tiles to add/remove, then Export")
        DWAPUtils.dprint("Left click is also attack, so expect the odd swing at air")
    else
        Events.OnObjectLeftMouseButtonDown.Remove(plumbPickClick)
        Events.OnTick.Remove(plumbPickTick)
        DWAPUtils.dprint(("Plumb pick: OFF (%d squares still held - Export or Clear)"):format(
            #plumbPickedSquares))
    end
end

function DWAPPlumbClear()
    plumbPickedSquares = {}
    plumbPickedKeys = {}
    DWAPUtils.dprint("Plumb pick: cleared")
end

-- Same line shapes FindUnconnectedPlumbing emits, so picked output can be
-- pasted into a config the same way
function DWAPPlumbExport()
    if #plumbPickedSquares == 0 then
        DWAPUtils.dprint("Plumb pick: nothing picked")
        return
    end
    local tanks, fixtures = {}, {}
    for i = 1, #plumbPickedSquares do
        local p = plumbPickedSquares[i]
        for j = 1, #p.entries do
            local info = p.entries[j]
            local row = { info = info, x = p.x, y = p.y, z = p.z, where = p.where }
            if info.kind == "tank" then
                tanks[#tanks + 1] = row
            else
                fixtures[#fixtures + 1] = row
            end
        end
    end

    exportHeader("PICKED PLUMBING", (" | %d squares, %d tanks, %d fixtures"):format(
        #plumbPickedSquares, #tanks, #fixtures))
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
end

-- Room picker: click a tile to take its whole room. Buildings like Rosewood
-- share walls across several businesses, so a footprint-wide pass grabs rooms
-- that are not ours; picking rooms narrows the target set before any loot is
-- authored. Rooms are identified by their RoomDef rect rather than the live
-- IsoRoom, which churns with streaming.
local roomPicked = {}     -- ordered: { key, name, dx, dy, dz, dw, dh }
local roomPickedKeys = {} -- key -> true

local function roomKey(room)
    local def = room and room.getRoomDef and room:getRoomDef()
    if not def then return nil end
    return ("%s@%d,%d,%d"):format(room:getName() or "?", def:getX(), def:getY(), def:getZ())
end

-- Every container in a room, through the shared resolver so the picker counts
-- exactly what the loot fill and the audit would see. Trash and appliances the
-- fill never touches are left out, matching the audit's coverage pass.
-- Container types we never author loot into: bins and laundry appliances the
-- fill already ignores, plus composters, which read as containers but are
-- garden fixtures. They still highlight with their room in the picker - this
-- only keeps them out of the exported table.
local ROOM_SKIP_TYPES = {
    bin = true, dumpster = true, clothingdryer = true, clothingdryerbasic = true,
    clothingrack = true, clothingwasher = true, composter = true,
}
local function roomContainers(room)
    local out = {}
    local squares = room:getSquares()
    if not squares then return out end
    for i = 0, squares:size() - 1 do
        local square = squares:get(i)
        if square then
            local list = DWAPUtils.getSquareContainers(square)
            -- Two containers on one square need DIFFERENT addressing or their
            -- entries share coords and neither resolves - that is where the 75
            -- duplicate-coordinate failures came from. Mirror what
            -- resolveLootContainer can actually target: the freezer
            -- compartment, the wall-mounted container, the plain base entry
            -- for the first floor container, and stack = n (index in object
            -- order, matching opts.stack) for anything still ambiguous.
            local usedUpper, usedFreezer, usedBase = false, false, false
            for j = 1, #list do
                local container = list[j].container
                local ctype = container:getType()
                local isSkipped = ROOM_SKIP_TYPES[ctype] == true
                if not isSkipped and ctype ~= "microwave" and not container:isStove() then
                    local slot, stack = nil, nil
                    if ctype == "freezer" and #list > 1 and not usedFreezer then
                        -- a lone freezer unit satisfies a base entry, so only
                        -- claim the freezer slot when it shares the square
                        slot = "freezer"
                        usedFreezer = true
                    elseif list[j].isHigh and not usedUpper then
                        slot = "upper"
                        usedUpper = true
                    elseif not list[j].isHigh and ctype ~= "freezer" and not usedBase then
                        usedBase = true
                    else
                        stack = j
                    end
                    out[#out + 1] = {
                        x = square:getX(), y = square:getY(), z = square:getZ(),
                        ctype = ctype, isHigh = list[j].isHigh,
                        slot = slot, stack = stack,
                    }
                end
            end
        end
    end
    return out
end

-- Whether a config entry already addresses this exact container, rather than
-- just its square: a square with a claimed fridge and a free upper cabinet
-- must still offer the cabinet.
local function containerClaimed(record, c)
    if not record then return false end
    for i = 1, #record.slots do
        local s = record.slots[i]
        if c.stack then
            if s.stack == c.stack then return true end
        elseif c.slot == "upper" then
            if s.upper then return true end
        elseif c.slot == "freezer" then
            if s.freezer then return true end
        elseif not s.upper and not s.freezer and not s.stack then
            return true
        end
    end
    return false
end

function roomPickClick(tile)
    if not DWAP_DevToggles.roomPick then return end
    local square = tile and tile.getSquare and tile:getSquare()
    local room = square and square:getRoom()
    if not room then
        DWAPUtils.dprint("Room pick: that tile is not in a room")
        return
    end
    local key = roomKey(room)
    if not key then
        DWAPUtils.dprint("Room pick: room has no def, cannot identify it")
        return
    end
    if roomPickedKeys[key] then
        for i = 1, #roomPicked do
            if roomPicked[i].key == key then
                table.remove(roomPicked, i)
                break
            end
        end
        roomPickedKeys[key] = nil
        DWAPUtils.dprint(("Room pick: removed %s (%d left)"):format(key, #roomPicked))
        return
    end
    local def = room:getRoomDef()
    roomPickedKeys[key] = true
    roomPicked[#roomPicked + 1] = {
        key = key, name = room:getName() or "?",
        dx = def:getX(), dy = def:getY(), dz = def:getZ(),
        dw = def:getW(), dh = def:getH(),
    }
    DWAPUtils.dprint(("Room pick: added %s (%d containers streamed, %d rooms picked)"):format(
        key, #roomContainers(room), #roomPicked))
end

-- Rooms are found live each tick: getSquares() only holds what has streamed,
-- so a room keeps filling in as you walk it
local function pickedRoomObjects()
    local out = {}
    local rooms = getCell():getRoomList()
    if not rooms then return out end
    for i = 1, rooms:size() do
        local room = rooms:get(i - 1)
        local key = roomKey(room)
        if key and roomPickedKeys[key] then out[#out + 1] = room end
    end
    return out
end

function roomPickTick()
    local player = getPlayer()
    local pSquare = player and player:getCurrentSquare()
    if not pSquare then return end
    local playerNum, playerZ = player:getPlayerNum(), pSquare:getZ()
    local rooms = pickedRoomObjects()
    for i = 1, #rooms do
        local squares = rooms[i]:getSquares()
        if squares then
            for j = 0, squares:size() - 1 do
                local s = squares:get(j)
                if s and s:getZ() == playerZ then
                    addAreaHighlightForPlayer(playerNum, s:getX(), s:getY(), s:getX() + 1, s:getY() + 1,
                        playerZ, 0.9, 0.5, 1, 0.35)
                end
            end
        end
    end
end

function roomPickDraw()
    if not DWAP_DevToggles.roomPick or #roomPicked == 0 then return end
    local player = getPlayer()
    local pSquare = player and player:getCurrentSquare()
    if not pSquare then return end
    local playerNum, playerZ = player:getPlayerNum(), pSquare:getZ()
    local tm = getTextManager()
    for i = 1, #roomPicked do
        local r = roomPicked[i]
        if r.dz == playerZ then
            -- label at the def rect's centre so it does not sit on a wall
            local cx, cy = r.dx + r.dw / 2, r.dy + r.dh / 2
            local sx = isoToScreenX(playerNum, cx, cy, r.dz)
            local sy = isoToScreenY(playerNum, cx, cy, r.dz)
            local text = ("%d %s"):format(i, r.name)
            tm:DrawStringCentre(UIFont.Small, sx + 1, sy + 1, text, 0, 0, 0, 0.8)
            tm:DrawStringCentre(UIFont.Small, sx, sy, text, 0.95, 0.6, 1, 1)
        end
    end
end

function DWAPRoomPick()
    DWAP_DevToggles.roomPick = not DWAP_DevToggles.roomPick
    if DWAP_DevToggles.roomPick then
        -- both pickers claim left click, so they cannot both be live
        if DWAP_DevToggles.plumbPick then DWAPPlumbPick() end
        Events.OnObjectLeftMouseButtonDown.Remove(roomPickClick)
        Events.OnObjectLeftMouseButtonDown.Add(roomPickClick)
        Events.OnTick.Remove(roomPickTick)
        Events.OnTick.Add(roomPickTick)
        ensureDevOverlay()
        DWAPUtils.dprint("Room pick: ON - left click a tile to take/drop its whole room")
    else
        Events.OnObjectLeftMouseButtonDown.Remove(roomPickClick)
        Events.OnTick.Remove(roomPickTick)
        DWAPUtils.dprint(("Room pick: OFF (%d rooms still held)"):format(#roomPicked))
    end
end

function DWAPRoomClear()
    roomPicked = {}
    roomPickedKeys = {}
    DWAPUtils.dprint("Room pick: cleared")
end

--- Include containers the config already addresses in the export. Off by
--- default so a dump can be pasted alongside existing entries; on when you
--- are replacing a room's entries wholesale and want the full set.
function DWAPRoomExportAll()
    DWAP_DevToggles.roomExportAll = not DWAP_DevToggles.roomExportAll
    DWAPUtils.dprint("Room export: " .. (DWAP_DevToggles.roomExportAll
        and "ALL containers, including ones already in the config"
        or "only containers not yet in the config"))
end

--- Inventory of the picked rooms, split by whether a loot entry already
--- addresses the square. `claimed` is the work already done, `free` is what a
--- generator would have to fill. Pass a config index to compare against, or
--- omit it to just list what is there.
function DWAPRoomExport(index)
    if #roomPicked == 0 then
        DWAPUtils.dprint("Room pick: nothing picked")
        return
    end
    local lookup = nil
    if index then
        local configs = DWAPUtils.loadConfigs(true)
        local config = configs and configs[index]
        if not config then
            DWAPUtils.dprint("Room pick: no config at index " .. tostring(index))
            return
        end
        lookup = buildContainerLookup(config)
        exportHeader("PICKED ROOMS", (" | compared against config %02d%s"):format(
            index,
            DWAP_DevToggles.roomExportAll and " | INCLUDING already-configured containers" or ""))
    else
        exportHeader("PICKED ROOMS", " | no config compared")
    end

    local rooms = pickedRoomObjects()
    local byKey = {}
    for i = 1, #rooms do byKey[roomKey(rooms[i])] = rooms[i] end

    local totalFree, totalClaimed = 0, 0
    for i = 1, #roomPicked do
        local r = roomPicked[i]
        local room = byKey[r.key]
        if not room then
            print(("  %d %s - not streamed right now, walk it to enumerate"):format(i, r.key))
        else
            local containers = roomContainers(room)
            local free, claimed, tally = {}, 0, {}
            for j = 1, #containers do
                local c = containers[j]
                local isClaimed = lookup
                    and containerClaimed(lookup[DWAPUtils.hashCoords(c.x, c.y, c.z)], c)
                if isClaimed then claimed = claimed + 1 end
                -- Claimed containers are normally left out, so an export can be
                -- pasted alongside what is already there. With roomExportAll on
                -- they are listed anyway: reworking a whole room means replacing
                -- its entries, not filling around them. They still count as
                -- claimed so the summary shows what is being superseded.
                if not isClaimed or DWAP_DevToggles.roomExportAll then
                    free[#free + 1] = c
                    tally[c.ctype] = (tally[c.ctype] or 0) + 1
                end
            end
            totalFree = totalFree + #free
            totalClaimed = totalClaimed + claimed
            print(("  %d %s | %d containers: %d listed, %d already in config"):format(
                i, r.key, #containers, #free, claimed))
            if #free > 0 then
                print("     " .. allLootTallyString(tally))
                for j = 1, #free do
                    local c = free[j]
                    local qualifier = ""
                    if c.slot then
                        qualifier = (' slot = "%s",'):format(c.slot)
                    elseif c.stack then
                        qualifier = (' stack = %d,'):format(c.stack)
                    end
                    print(("        { type = 'container', coords = {x=%d,y=%d,z=%d},%s }, -- %s @ %s")
                        :format(c.x, c.y, c.z, qualifier, c.ctype, r.name))
                end
            end
        end
    end
    print(("=== TOTAL: %d listed, %d already in config, across %d rooms ==="):format(
        totalFree, totalClaimed, #roomPicked))
end

local sourceConfig = 1
local destConfig = 43
local coords = {
    old = { x = 5575, y = 9365, z = -1 },
    new = { x = 10264, y = 8717, z = -1 }
}
function copyConfig()
    local pSquare = getPlayer():getCurrentSquare()
    if not pSquare then
        DWAPUtils.dprint("Player square not found")
        return
    end
    local targetZ = pSquare:getZ()
    local targetRoom = pSquare:getRoom()

    DWAPUtils.dprint("=== COPYING LOOT CONFIG FROM SOURCE " .. sourceConfig .. " ===")
    DWAPUtils.dprint("Old coordinates: " .. coords.old.x .. "," .. coords.old.y .. "," .. coords.old.z)
    DWAPUtils.dprint("New coordinates: " .. coords.new.x .. "," .. coords.new.y .. "," .. coords.new.z)
    DWAPUtils.dprint("Player Z level: " .. targetZ)
    if targetRoom then
        DWAPUtils.dprint("Player room: " .. tostring(targetRoom:getName() or "Unnamed Room"))
    else
        DWAPUtils.dprint("Player room: None (outdoor)")
    end

    -- Load configs
    local configs = DWAPUtils.loadConfigs(true)
    if not configs or #configs == 0 then
        DWAPUtils.dprint("No configs found")
        return
    end

    if sourceConfig > #configs then
        DWAPUtils.dprint("Source config " .. sourceConfig .. " not found (only " .. #configs .. " configs available)")
        return
    end

    local config = configs[sourceConfig]
    if not config or not config.loot then
        DWAPUtils.dprint("Source config " .. sourceConfig .. " has no loot section")
        return
    end

    -- Calculate coordinate offset
    local offsetX = coords.new.x - coords.old.x
    local offsetY = coords.new.y - coords.old.y
    local offsetZ = coords.new.z - coords.old.z

    DWAPUtils.dprint("Coordinate offset: " .. offsetX .. "," .. offsetY .. "," .. offsetZ)

    local copiedContainers = {}
    local skippedContainers = {}

    -- Process each loot container
    for i = 1, #config.loot do
        local lootItem = config.loot[i]

        if lootItem and lootItem.coords then
            -- Only process containers on the same Z level as the reference coordinates
            if lootItem.coords.z == targetZ then
                -- Calculate new coordinates
                local newX = lootItem.coords.x + offsetX
                local newY = lootItem.coords.y + offsetY
                local newZ = lootItem.coords.z + offsetZ

                -- Check if container physically exists at new coordinates
                local square = getSquare(newX, newY, math.floor(newZ))
                if not square then
                    table.insert(skippedContainers, {
                        originalCoords = { x = lootItem.coords.x, y = lootItem.coords.y, z = lootItem.coords.z },
                        newCoords = { x = newX, y = newY, z = newZ },
                        reason = "Square not found at new coordinates"
                    })
                else
                    -- Check if the new coordinates are in the same room as the player
                    local squareRoom = square:getRoom()
                    if not targetRoom or not squareRoom or squareRoom ~= targetRoom then
                        table.insert(skippedContainers, {
                            originalCoords = { x = lootItem.coords.x, y = lootItem.coords.y, z = lootItem.coords.z },
                            newCoords = { x = newX, y = newY, z = newZ },
                            reason = "New coordinates not in same room as player"
                        })
                    else
                    -- Check if there's a physical container at the new coordinates
                    local physicalContainer = nil
                    local needsUpperContainer = (newZ % 1) ~= 0 -- Check if target z has decimal part (0.5 offset)
                    
                    local objects = square:getObjects()
                    if objects then
                        for j = 0, objects:size() - 1 do
                            local obj = objects:get(j)
                            if obj and obj:getContainer() then
                                local objContainer = obj:getContainer()
                                local containerType = objContainer:getType()
                                
                                -- Skip stoves and microwaves (similar to Events.lua logic)
                                if not (containerType == "microwave" or objContainer:isStove()) then
                                    -- Use the same logic as Events.lua onFillContainer
                                    local isHighContainer = objContainer:getContainerPosition() == "High"
                                    
                                    if needsUpperContainer and isHighContainer then
                                        -- Found upper container for upper loot config
                                        physicalContainer = obj
                                        break
                                    elseif not needsUpperContainer and not isHighContainer then
                                        -- Found normal container for normal loot config
                                        physicalContainer = obj
                                        break
                                    end
                                end
                            end
                        end
                    end
                    
                    if not physicalContainer then
                        table.insert(skippedContainers, {
                            originalCoords = { x = lootItem.coords.x, y = lootItem.coords.y, z = lootItem.coords.z },
                            newCoords = { x = newX, y = newY, z = newZ },
                            reason = "No physical container found at new coordinates"
                        })
                    else
                        -- Check if destination config already has a loot entry for this coordinate
                        local destConfigHasLoot = false
                        if destConfig <= #configs and configs[destConfig] and configs[destConfig].loot then
                            local destLoot = configs[destConfig].loot
                            for k = 1, #destLoot do
                                local destEntry = destLoot[k]
                                if destEntry and destEntry.coords and
                                   destEntry.coords.x == newX and
                                   destEntry.coords.y == newY and
                                   destEntry.coords.z == newZ then
                                    destConfigHasLoot = true
                                    break
                                end
                            end
                        end
                        
                        if destConfigHasLoot then
                            table.insert(skippedContainers, {
                                originalCoords = { x = lootItem.coords.x, y = lootItem.coords.y, z = lootItem.coords.z },
                                newCoords = { x = newX, y = newY, z = newZ },
                                reason = "Destination config already has loot entry for this coordinate"
                            })
                        else
                            -- Create a copy of the loot item with new coordinates
                            local newLootItem = {}
                            for key, value in pairs(lootItem) do
                                if key == 'coords' then
                                    newLootItem.coords = { x = newX, y = newY, z = newZ }
                                else
                                    newLootItem[key] = value
                                end
                            end
                            table.insert(copiedContainers, newLootItem)
                        end
                    end
                    end -- end of room check
                end -- end of square check
            end -- end of targetZ check
        end -- end of lootItem check
    end -- end of for loop

    -- Print results in config format
    DWAPUtils.dprint("=== COPIED CONTAINERS (" .. #copiedContainers .. ") ===")
    if #copiedContainers > 0 then
        print("    loot = {")
        for i = 1, #copiedContainers do
            local container = copiedContainers[i]
            local coordsStr = "coords = {x=" ..
            container.coords.x .. ", y=" .. container.coords.y .. ", z=" .. container.coords.z .. "},"

            print("        {")
            print("            type = 'container',")
            if container.sprite then
                print("            sprite = '" .. container.sprite .. "',")
            end
            print("            " .. coordsStr)
            if container.dist then
                local distStr = "{"
                for j = 1, #container.dist do
                    distStr = distStr .. "\"" .. container.dist[j] .. "\""
                    if j < #container.dist then
                        distStr = distStr .. ", "
                    end
                end
                distStr = distStr .. "}"
                print("            dist = " .. distStr .. ",")
            end
            if container.items then
                print("            items = {")
                for j = 1, #container.items do
                    local item = container.items[j]
                    local itemStr = "                { name = \"" .. item.name .. "\""
                    if item.count then
                        itemStr = itemStr .. ", count = {" .. item.count[1] .. ", " .. item.count[2] .. "}"
                    end
                    if item.chance then
                        itemStr = itemStr .. ", chance = " .. item.chance
                    end
                    itemStr = itemStr .. " },"
                    print(itemStr)
                end
                print("            },")
            end
            if container.special then
                print("            special = \"" .. container.special .. "\",")
            end
            if container.distIncludeJunk ~= nil then
                print("            distIncludeJunk = " .. tostring(container.distIncludeJunk) .. ",")
            end
            if container.randUntilFull ~= nil then
                print("            randUntilFull = " .. tostring(container.randUntilFull) .. ",")
            end
            if container.level then
                print("            level = \"" .. container.level .. "\",")
            end
            if container.sandboxEnable then
                print("            sandboxEnable = \"" .. container.sandboxEnable .. "\",")
            end
            print("        },")
        end
        print("    },")
    else
        print("    loot = {},")
    end

    if #skippedContainers > 0 then
        DWAPUtils.dprint("=== SKIPPED CONTAINERS (" .. #skippedContainers .. ") ===")
        -- for i = 1, #skippedContainers do
        --     local skipped = skippedContainers[i]
        --     DWAPUtils.dprint("  " ..
        --         skipped.originalCoords.x .. "," .. skipped.originalCoords.y .. "," .. skipped.originalCoords.z ..
        --         " -> " .. skipped.newCoords.x .. "," .. skipped.newCoords.y .. "," .. skipped.newCoords.z ..
        --         " (" .. skipped.reason .. ")")
        -- end
    end

    DWAPUtils.dprint("=== SUMMARY ===")
    DWAPUtils.dprint("Source config: " .. sourceConfig)
    DWAPUtils.dprint("Total containers in source: " .. #config.loot)
    DWAPUtils.dprint("Copied containers: " .. #copiedContainers)
    DWAPUtils.dprint("Skipped containers: " .. #skippedContainers)
    DWAPUtils.dprint("Coordinate transformation: (" .. offsetX .. "," .. offsetY .. "," .. offsetZ .. ")")

    return {
        copiedContainers = copiedContainers,
        skippedContainers = skippedContainers,
        sourceConfig = sourceConfig,
        offset = { x = offsetX, y = offsetY, z = offsetZ }
    }
end

-- Old name kept as an alias: it is in CLAUDE.md, the handoff notes and a lot
-- of muscle memory. Drop it once those have caught up.
TestAllLootConfigs = DWAPAudit
