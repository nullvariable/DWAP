-- devTools.lua
-- Development tools for the DWAP generator system

local DWAPUtils = require("DWAPUtils")
local Reflection = require("Starlit/utils/Reflection")

-- Live overlay state, displayed by the dev panel button labels
DWAP_DevToggles = DWAP_DevToggles or { elec = false, plumbing = false, containers = false, where = false, barricades = false }

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
-- that instant, so keep flipping every time the building's switch-room
-- count grows and stop only once it has been stable for a second.
local autoLightsTicks = 0
local autoLightsLastCount = 0
local autoLightsStableTicks = 0
local function autoLightsAfterTeleport()
    autoLightsTicks = autoLightsTicks + 1
    if autoLightsTicks > 600 then
        Events.OnTick.Remove(autoLightsAfterTeleport)
        return
    end
    local player = getPlayer()
    local square = player and player:getCurrentSquare()
    if not square then return end
    local building = square:getBuilding()
    if not building then return end
    local rooms = getCell():getRoomList()
    local switchRooms = 0
    for i = 1, rooms:size() do
        local room = rooms:get(i - 1)
        if DWAPUtils.sameBuilding(room:getBuilding(), building) and room:getLightSwitches():size() > 0 then
            switchRooms = switchRooms + 1
        end
    end
    if switchRooms == 0 then return end
    if switchRooms > autoLightsLastCount then
        autoLightsLastCount = switchRooms
        autoLightsStableTicks = 0
        DWAPUtils.lightsOn(square, building)
        return
    end
    autoLightsStableTicks = autoLightsStableTicks + 1
    if autoLightsStableTicks >= 60 then
        Events.OnTick.Remove(autoLightsAfterTeleport)
    end
end

function startAutoLightsAfterTeleport()
    autoLightsTicks = 0
    autoLightsLastCount = 0
    autoLightsStableTicks = 0
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

    if totalEntries == 0 then
        DWAPUtils.dprint("No loot entries found in config " .. index)
        return
    end

    local configName = "Config " .. index
    if config.doorKeys and config.doorKeys.name then
        configName = config.doorKeys.name
    end

    -- coord-key set so upper entries can tell whether their lower half is
    -- also configured (drives resolveLootContainer's pairPresent fallback)
    local allCoordKeys = {}
    for i = 1, totalEntries do
        local e = lootEntries[i]
        if e and e.coords then
            allCoordKeys[DWAPUtils.hashCoords(e.coords.x, e.coords.y, e.coords.z)] = true
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
    -- fill check: default 80%%; pass fillThreshold = 0 for worlds created with
    -- base-game loot disabled, where any item at all proves the DWAP fill ran
    local fillThreshold = retainedConfig.fillThreshold or 80
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

            -- Check for duplicate coordinates using hash function
            local coordsHash = DWAPUtils.hashCoords(x, y, z)
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
            local isUpperContainer = (z % 1) ~= 0
            local pairPresent = false
            if isUpperContainer then
                pairPresent = allCoordKeys[DWAPUtils.hashCoords(x, y, math.floor(z))] == true
            end
            local container = DWAPUtils.resolveLootContainer(square, {
                upper = isUpperContainer,
                stack = entry.stack,
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
                -- balance audit (detached sheds report their own room name)
                local room = square:getRoom()
                table.insert(containerDetails, {
                    entry = i,
                    x = x, y = y, z = z,
                    containerType = container:getType(),
                    room = room and room:getName() or "outside",
                })

                -- Test if container is 80% full
                local capacity = container:getCapacity()
                local usedCapacity = container:getCapacityWeight()
                local fillPercentage = capacity > 0 and (usedCapacity / capacity) * 100 or 0

                if not entry.special then
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
    }
end

tlc = TestLootConfig

-- Drive TestLootConfig across every config in one debug session: teleport to
-- each base with DWAPGoto, wait for its loot squares to stream in (jumping to
-- stragglers to force-load them), run the test, and write a combined report
-- to Zomboid/Lua/DWAP_loot_audit.txt. Call TestAllLootConfigs() to start,
-- call it again to abort. TestAllLootConfigs(n) starts from config n.
local allLootState = nil
local allLootTick
local ALLLOOT_WAIT_TICKS = 300 -- chunk-streaming grace before jumping/giving up
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
        if #result.failedContainers == 0 then
            allLootWrite("  PASS")
            st.passed = st.passed + 1
        else
            allLootWrite(("  FAIL (%d):"):format(#result.failedContainers))
            for i = 1, #result.failedContainers do
                allLootWrite("    " .. result.failedContainers[i])
            end
            st.failed = st.failed + 1
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
    else
        allLootWrite("  SKIPPED (no loot data)")
        st.skipped = st.skipped + 1
    end

    -- level keys and explicit-item entries aren't tallied by TestLootConfig
    local levels, itemEntries = {}, 0
    if config and config.loot then
        for i = 1, #config.loot do
            local e = config.loot[i]
            if e then
                if e.level ~= nil then
                    local key = tostring(e.level)
                    levels[key] = (levels[key] or 0) + 1
                end
                if e.items then itemEntries = itemEntries + 1 end
            end
        end
    end
    local levelStr = allLootTallyString(levels)
    if levelStr ~= "" then allLootWrite("  levels: " .. levelStr) end
    if itemEntries > 0 then allLootWrite("  explicit-item entries: " .. itemEntries) end
    allLootWrite("")

    st.index = st.index + 1
    st.phase = "settle"
    st.ticksWaited = 0
end

allLootTick = function()
    local st = allLootState
    if not st then return end
    if st.index > #st.configs then
        allLootStop(("=== DONE: %d passed, %d failed, %d skipped ==="):format(st.passed, st.failed, st.skipped))
        return
    end

    local config = st.configs[st.index]
    if st.phase == "settle" then
        st.ticksWaited = st.ticksWaited + 1
        if st.ticksWaited >= ALLLOOT_SETTLE_TICKS then
            st.phase = "teleport"
        end
    elseif st.phase == "teleport" then
        if not config or not config.loot or #config.loot == 0 then
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

        if unstreamed == 0 then
            allLootFinishConfig(0, badZ)
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
            if failedJumps >= 3 or not jumpTo then
                allLootFinishConfig(unstreamed, badZ)
            else
                st.jumped[jumpTo.coords.x .. "," .. jumpTo.coords.y] = true
                allLootTeleport(jumpTo.coords.x, jumpTo.coords.y, math.floor(jumpTo.coords.z))
                st.ticksWaited = 0
            end
        end
    end
end

-- fillThreshold: percent a container must be filled to pass (default 80).
-- Pass 0 when the world was created with base-game loot disabled - then any
-- item at all proves the DWAP fill ran, so only truly empty containers fail.
function TestAllLootConfigs(startIndex, fillThreshold)
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
    }
    if resuming then
        allLootWrite("--- resumed at config " .. startIndex .. " ---")
    else
        allLootWrite("DWAP loot audit - " .. #configs .. " configs, fill threshold " ..
            tostring(fillThreshold or 80) .. "%")
    end
    allLootWrite("")
    DWAPUtils.dprint("Starting loot audit across " .. #configs .. " configs")
    Events.OnTick.Add(allLootTick)
end

local currentContainerLookup = nil

-- Build a lookup table of container coordinates from a config
local function buildContainerLookup(config)
    local lookup = {}
    if not config or not config.loot then
        return lookup
    end

    for i = 1, #config.loot do
        local entry = config.loot[i]
        if entry and entry.coords then
            local x, y, z = entry.coords.x, entry.coords.y, entry.coords.z
            local key = DWAPUtils.hashCoords(x, y, z)
            lookup[key] = 1
            if not entry.dist and not entry.items and not entry.special then
                lookup[key] = 0 -- highlight as an error since there's nothing to spawn
            elseif entry.special then
                lookup[key] = 2 -- special containers
            end
        end
    end
    return lookup
end

-- Check containers on a square and return their status
local function checkSquareContainers(square, containerLookup)
    if not square then
        return { totalContainers = 0, foundContainers = 0, errorContainers = 0, specialContainers = 0, missingContainers = 0 }
    end

    local x, y, z = square:getX(), square:getY(), square:getZ()
    local totalContainers = 0
    local foundContainers = 0
    local errorContainers = 0
    local specialContainers = 0
    local missingContainers = 0

    -- First, check if there are containers in the config for this square that are missing
    local expectedContainers = {}

    -- Check for normal container at this z level
    local normalKey = DWAPUtils.hashCoords(x, y, z)
    if containerLookup[normalKey] then
        expectedContainers[normalKey] = containerLookup[normalKey]
    end

    -- Check for upper container at z + 0.5
    local upperKey = DWAPUtils.hashCoords(x, y, z + 0.5)
    if containerLookup[upperKey] then
        expectedContainers[upperKey] = containerLookup[upperKey]
    end

    -- Track which expected containers we find
    local foundExpectedContainers = {}

    local objects = square:getObjects()
    if objects then
        for j = 0, objects:size() - 1 do
            local obj = objects:get(j)
            if obj and obj:getContainer() then
                local objContainer = obj:getContainer()
                local containerType = objContainer:getType()

                -- Skip stoves and microwaves (similar to Events.lua logic)
                if not (containerType == "microwave" or objContainer:isStove()) then
                    -- Check if it's an upper container (similar to TestLootConfig logic)
                    local containerZ = z
                    if objContainer:getContainerPosition() == "High" or
                        (obj:getRenderYOffset() and obj:getRenderYOffset() > 32) then
                        containerZ = z + 0.5
                    end

                    local key = DWAPUtils.hashCoords(x, y, containerZ)
                    local lookupValue = containerLookup[key]

                    -- Check if this is a trash container
                    local isTrashContainer = false
                    local properties = obj:getProperties()
                    if properties:has("GroupName") and properties:get("GroupName") == "Garbage" then
                        isTrashContainer = true
                    elseif properties:has("container") then
                        local containerName = properties:get("container")
                        local list = {
                            bin = true,
                            dumpster = true,
                            clothingdryer = true,
                            clothingdryerbasic = true,
                            clothingrack = true,
                            clothingwasher = true,
                        }
                        isTrashContainer = list[containerName] == true
                    end

                    -- Only count trash containers if they're in the config, count all other containers
                    local shouldCount = not isTrashContainer or lookupValue ~= nil

                    if shouldCount then
                        totalContainers = totalContainers + 1

                        if lookupValue == 0 then
                            errorContainers = errorContainers + 1
                        elseif lookupValue == 1 then
                            foundContainers = foundContainers + 1
                            foundExpectedContainers[key] = true
                        elseif lookupValue == 2 then
                            specialContainers = specialContainers + 1
                            foundExpectedContainers[key] = true
                            -- Early return for special containers - we found what we need
                            return {
                                totalContainers = totalContainers,
                                foundContainers = foundContainers,
                                errorContainers = errorContainers,
                                specialContainers = specialContainers,
                                missingContainers = missingContainers
                            }
                        end
                    end
                end
            end
        end
    end

    -- Check for missing containers (in config but not found on square)
    for expectedKey, expectedValue in pairs(expectedContainers) do
        if not foundExpectedContainers[expectedKey] and expectedValue > 0 then
            missingContainers = missingContainers + 1
        end
    end

    return {
        totalContainers = totalContainers,
        foundContainers = foundContainers,
        errorContainers = errorContainers,
        specialContainers = specialContainers,
        missingContainers = missingContainers
    }
end

-- Visualize containers status around the player
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
            labels[#labels + 1] = {
                x = entry.coords.x,
                y = entry.coords.y,
                z = z,
                text = tostring(i) .. (entry.stack and ("s" .. entry.stack) or "") .. ((z % 1 ~= 0) and "^" or ""),
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
        if math.floor(l.z) == playerZ and math.abs(l.x - playerX) <= 30 and math.abs(l.y - playerY) <= 30 then
            local sx = isoToScreenX(playerNum, l.x + 0.5, l.y + 0.5, l.z)
            local sy = isoToScreenY(playerNum, l.x + 0.5, l.y + 0.5, l.z)
            tm:DrawStringCentre(UIFont.Small, sx + 1, sy + 1, l.text, 0, 0, 0, 0.8)
            tm:DrawStringCentre(UIFont.Small, sx, sy, l.text, 1, 1, 0.2, 1)
        end
    end
end

-- Barricade overlay: for each objectSpawns barricade entry, draw its entry
-- number with the barricade type underneath, green when an IsoBarricade is
-- actually present on the square and red when it is missing
local currentBarricadeLabels = nil

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
            }
        end
    end
    return labels
end

function barricadeLabelsDraw()
    if not currentBarricadeLabels then return end
    local player = getPlayer()
    local pSquare = player and player:getCurrentSquare()
    if not pSquare then return end
    local playerNum = player:getPlayerNum()
    local playerX, playerY, playerZ = pSquare:getX(), pSquare:getY(), pSquare:getZ()
    local tm = getTextManager()
    local lineH = tm:getFontHeight(UIFont.Small)
    if not lineH or lineH <= 0 then lineH = 14 end
    for i = 1, #currentBarricadeLabels do
        local l = currentBarricadeLabels[i]
        if l.z == playerZ and math.abs(l.x - playerX) <= 30 and math.abs(l.y - playerY) <= 30 then
            local seen = squareHasBarricade(getSquare(l.x, l.y, l.z))
            local r, g, b = 1, 0.25, 0.25
            if seen then r, g, b = 0.25, 1, 0.25 end
            local sx = isoToScreenX(playerNum, l.x + 0.5, l.y + 0.5, l.z)
            local sy = isoToScreenY(playerNum, l.x + 0.5, l.y + 0.5, l.z)
            tm:DrawStringCentre(UIFont.Small, sx + 1, sy + 1, l.num, 0, 0, 0, 0.8)
            tm:DrawStringCentre(UIFont.Small, sx, sy, l.num, r, g, b, 1)
            tm:DrawStringCentre(UIFont.Small, sx + 1, sy + lineH + 1, l.btype, 0, 0, 0, 0.8)
            tm:DrawStringCentre(UIFont.Small, sx, sy + lineH, l.btype, r, g, b, 1)
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
        if #labels == 0 then
            DWAPUtils.dprint("Config " .. index .. " has no barricade objectSpawns")
            showingBarricades = false
            DWAP_DevToggles.barricades = false
            return
        end
        local configName = "Config " .. index
        if config.doorKeys and config.doorKeys.name then
            configName = config.doorKeys.name
        end
        currentBarricadeLabels = labels
        ensureDevOverlay()
        DWAPUtils.dprint("Barricade overlay enabled for " .. configName .. " (" .. #labels .. " barricades)")
        DWAPUtils.dprint("Green = barricade present, Red = missing")
    else
        currentBarricadeLabels = nil
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
        local containerCount = 0
        for _ in pairs(currentContainerLookup) do
            containerCount = containerCount + 1
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

        Events.OnTick.Add(plumbingTick)
        DWAP_DevToggles.plumbing = true
        DWAPUtils.dprint("Plumbing visualization enabled for " ..
            configName .. " (" .. fixtureCount .. " total fixtures, " .. tankCount .. " tanks)")
        DWAPUtils.dprint(
            "Purple = industry_02_73/72, Red = not in config or <100 fluid, Blue = water tank with fluid, Green = fixture in config with >100 fluid")
    else
        Events.OnTick.Remove(plumbingTick)
        DWAP_DevToggles.plumbing = false
        currentPlumbingLookup = nil
        DWAPUtils.dprint("Plumbing visualization disabled")
    end
end

-- Find unconnected plumbing fixtures in the same building and floor as the player
function FindUnconnectedPlumbing()
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

    local playerX, playerY, playerZ = pSquare:getX(), pSquare:getY(), pSquare:getZ()
    DWAPUtils.dprint("=== FINDING UNCONNECTED PLUMBING FIXTURES ===")
    DWAPUtils.dprint("Player position: " .. playerX .. "," .. playerY .. "," .. playerZ)

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

    local unconnectedFixtures = {}
    local connectedFixtures = {}
    local waterTanks = {}
    local searchRadius = 50 -- Search in a larger area to cover the building

    -- Search all squares in the radius on the same floor
    for x = playerX - searchRadius, playerX + searchRadius do
        for y = playerY - searchRadius, playerY + searchRadius do
            local square = getSquare(x, y, playerZ)
            if square then
                -- Only check squares that are part of the same building
                local squareBuilding = square:getBuilding()
                if DWAPUtils.sameBuilding(squareBuilding, building) then
                    local objects = square:getObjects()
                    if objects then
                        for j = 0, objects:size() - 1 do
                            local obj = objects:get(j)
                            local isPlumbingFixture = false
                            local customNameStr = "Unknown"
                            local spriteName = ""

                            if obj then
                                spriteName = obj:getSpriteName() or ""

                                -- Check if object has fluid (tanks)
                                if obj:hasFluid() then
                                    local fluidContainer = obj:getFluidContainer()
                                    if fluidContainer and fluidContainer:getCapacity() > 1000 then
                                        -- This is likely a water tank
                                        table.insert(waterTanks, {
                                            sprite = spriteName,
                                            x = x,
                                            y = y,
                                            z = playerZ,
                                            capacity = fluidContainer:getCapacity(),
                                            amount = fluidContainer:getAmount()
                                        })
                                    else
                                        isPlumbingFixture = true
                                    end
                                else
                                    local objectSprite = obj:getSprite()
                                    if objectSprite then
                                        local props = objectSprite:getProperties()
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
                                    -- Check if the fixture is connected to water
                                    local isConnected = false
                                    if obj.getUsesExternalWaterSource and obj.hasExternalWaterSource then
                                        isConnected = obj:getUsesExternalWaterSource() and obj:hasExternalWaterSource()
                                    elseif obj:hasFluid() and obj.getFluidAmount then
                                        -- For fluid-based fixtures, check if they have water
                                        local fluidAmount = obj:getFluidAmount() or 0
                                        isConnected = fluidAmount > 50 -- Consider connected if has significant water
                                    end

                                    local fixtureData = {
                                        sprite = spriteName,
                                        x = x,
                                        y = y,
                                        z = playerZ,
                                        customName = customNameStr,
                                        isConnected = isConnected
                                    }

                                    if isConnected then
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
            tank.y .. ", z = " .. tank.z .. " }, -- capacity: " .. tank.capacity .. ", current: " .. tank.amount)
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
            fixture.x .. ", y = " .. fixture.y .. ", z = " .. fixture.z .. ", sourceType=\"tank\", source = #, }, ")
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
            " at " .. fixture.x .. "," .. fixture.y .. "," .. fixture.z .. " (" .. fixture.customName .. ")")
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
