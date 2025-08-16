-- devTools.lua
-- Development tools for the DWAP generator system

local DWAPUtils = require("DWAPUtils")
local Reflection = require("Starlit/utils/Reflection")

-- Helper function to get table size
local function getTableSize(tbl)
    return DWAPUtils.tableSize(tbl)
end

-- Helper function to get chunk center coordinates
local function getChunkCenterXY(chunk)
    local wx = Reflection.getField(chunk, "wx")
    local wy = Reflection.getField(chunk, "wy")
    local startX = wx * 10
    local startY = wy * 10
    local endX = startX + 10 - 1
    local endY = startY + 10 - 1
    return math.floor((startX + endX) / 2), math.floor((startY + endY) / 2)
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

function FindOptimalExteriorSquaresForBuilding()
    local pSquare = getPlayer():getCurrentSquare()
    local building = pSquare:getBuilding()
    if not building then
        DWAPUtils.dprint("No building found")
        return
    end

    local playerX, playerY, playerZ = pSquare:getX(), pSquare:getY(), pSquare:getZ()
    local squaresInBuilding = {}

    -- Find all squares in the building (expanded search area)
    for x = playerX - 50, playerX + 50 do
        for y = playerY - 50, playerY + 50 do
            local square = getSquare(x, y, playerZ)
            if square then
                local building2 = square:getBuilding()
                if building2 and building2 == building then
                    squaresInBuilding[#squaresInBuilding + 1] = square
                end
            end
        end
    end

    DWAPUtils.dprint("SquaresInBuilding " .. #squaresInBuilding)

    -- Group squares by chunk and find chunk boundaries
    local uniqueChunks = {}
    local chunkBounds = {}

    for i = 1, #squaresInBuilding do
        local square = squaresInBuilding[i]
        local chunk = square:getChunk()
        local wx = Reflection.getField(chunk, "wx")
        local wy = Reflection.getField(chunk, "wy")
        local chunkKey = wx .. "_" .. wy

        if not uniqueChunks[chunkKey] then
            uniqueChunks[chunkKey] = {
                chunk = chunk,
                wx = wx,
                wy = wy,
                squares = {}
            }
            chunkBounds[chunkKey] = {
                minX = square:getX(),
                maxX = square:getX(),
                minY = square:getY(),
                maxY = square:getY()
            }
        end

        table.insert(uniqueChunks[chunkKey].squares, square)

        -- Update chunk bounds for building squares
        local bounds = chunkBounds[chunkKey]
        bounds.minX = math.min(bounds.minX, square:getX())
        bounds.maxX = math.max(bounds.maxX, square:getX())
        bounds.minY = math.min(bounds.minY, square:getY())
        bounds.maxY = math.max(bounds.maxY, square:getY())
    end

    DWAPUtils.dprint("UniqueChunks found: " .. getTableSize(uniqueChunks))

    -- Find nearest exterior square for each chunk
    local chunkExteriorSquares = {}

    for chunkKey, chunkData in pairs(uniqueChunks) do
        local bounds = chunkBounds[chunkKey]
        local nearestExterior = nil
        local minDistance = math.huge

        -- Search around the chunk bounds to find exterior squares
        local searchRadius = 5
        for x = bounds.minX - searchRadius, bounds.maxX + searchRadius do
            for y = bounds.minY - searchRadius, bounds.maxY + searchRadius do
                local square = getSquare(x, y, playerZ)
                if square then
                    local squareBuilding = square:getBuilding()
                    -- Check if this is an exterior square (no building or different building)
                    if not squareBuilding or squareBuilding ~= building then
                        -- Calculate distance to chunk center
                        local chunkCenterX, chunkCenterY = getChunkCenterXY(chunkData.chunk)
                        local distance = math.sqrt((x - chunkCenterX) ^ 2 + (y - chunkCenterY) ^ 2)

                        if distance < minDistance then
                            minDistance = distance
                            nearestExterior = { x = x, y = y, z = playerZ, distance = distance }
                        end
                    end
                end
            end
        end

        if nearestExterior then
            chunkExteriorSquares[chunkKey] = nearestExterior
            DWAPUtils.dprint(("Chunk %s nearest exterior: %d,%d (distance: %.2f)"):format(
                chunkKey, nearestExterior.x, nearestExterior.y, nearestExterior.distance))
        else
            DWAPUtils.dprint(("No exterior square found for chunk %s"):format(chunkKey))
        end
    end

    -- Now optimize to find minimal set of exterior squares that cover maximum chunks
    local exteriorCoverage = {}
    local coverageRadius = 25 -- Generator power range

    -- For each potential exterior square, calculate which chunks it can cover
    for chunkKey, exteriorSquare in pairs(chunkExteriorSquares) do
        local exteriorKey = exteriorSquare.x .. "_" .. exteriorSquare.y

        if not exteriorCoverage[exteriorKey] then
            exteriorCoverage[exteriorKey] = {
                x = exteriorSquare.x,
                y = exteriorSquare.y,
                z = exteriorSquare.z,
                coveredChunks = {},
                chunkCount = 0
            }
        end

        -- Check which chunks this exterior square can cover
        for otherChunkKey, otherChunkData in pairs(uniqueChunks) do
            local chunkCenterX, chunkCenterY = getChunkCenterXY(otherChunkData.chunk)
            local distance = math.sqrt((exteriorSquare.x - chunkCenterX) ^ 2 + (exteriorSquare.y - chunkCenterY) ^ 2)

            if distance <= coverageRadius then
                if not exteriorCoverage[exteriorKey].coveredChunks[otherChunkKey] then
                    exteriorCoverage[exteriorKey].coveredChunks[otherChunkKey] = true
                    exteriorCoverage[exteriorKey].chunkCount = exteriorCoverage[exteriorKey].chunkCount + 1
                end
            end
        end
    end

    -- Select optimal exterior squares using greedy algorithm
    local selectedExteriors = {}
    local coveredChunks = {}
    local totalChunks = getTableSize(uniqueChunks)

    while getTableSize(coveredChunks) < totalChunks do
        local bestExterior = nil
        local bestCoverage = 0
        local bestKey = nil

        -- Find exterior square that covers the most uncovered chunks
        for exteriorKey, coverage in pairs(exteriorCoverage) do
            local newCoverage = 0
            for chunkKey, _ in pairs(coverage.coveredChunks) do
                if not coveredChunks[chunkKey] then
                    newCoverage = newCoverage + 1
                end
            end

            if newCoverage > bestCoverage then
                bestCoverage = newCoverage
                bestExterior = coverage
                bestKey = exteriorKey
            end
        end

        if bestExterior and bestCoverage > 0 then
            table.insert(selectedExteriors, bestExterior)

            -- Mark chunks as covered
            for chunkKey, _ in pairs(bestExterior.coveredChunks) do
                coveredChunks[chunkKey] = true
            end

            -- Remove this exterior from consideration
            if bestKey then
                exteriorCoverage[bestKey] = nil
            end

            DWAPUtils.dprint(("Selected exterior %d,%d covering %d chunks"):format(
                bestExterior.x, bestExterior.y, bestCoverage))
        else
            -- No more coverage possible, break to avoid infinite loop
            break
        end
    end

    DWAPUtils.dprint(("Optimal solution: %d exterior squares covering %d/%d chunks"):format(
        #selectedExteriors, getTableSize(coveredChunks), totalChunks))

    -- Optional: Add generator positions for testing
    for i = 1, #selectedExteriors do
        local exterior = selectedExteriors[i]
        local square = getSquare(exterior.x, exterior.y, exterior.z)
        if square then
            local chunk = square:getChunk()
            chunk:addGeneratorPos(exterior.x, exterior.y, exterior.z)
            DWAPUtils.dprint(("Added generator at %d,%d,%d"):format(exterior.x, exterior.y, exterior.z))
        end
    end

    return selectedExteriors
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

        if gen.chunks then
            DWAPUtils.dprint("Original chunks count: " .. #gen.chunks)

            -- Calculate building center from chunks
            local totalX, totalY = 0, 0
            for j = 1, #gen.chunks do
                local worldX = gen.chunks[j][1] * 10 + 5
                local worldY = gen.chunks[j][2] * 10 + 5
                totalX = totalX + worldX
                totalY = totalY + worldY
            end
            local centerX = math.floor(totalX / #gen.chunks)
            local centerY = math.floor(totalY / #gen.chunks)

            DWAPUtils.dprint("Building center: " .. centerX .. "," .. centerY)
            DWAPUtils.dprint("To get optimal positions:")
            DWAPUtils.dprint("1. Stand inside the building near " .. centerX .. "," .. centerY .. "," .. gen.controls.z)
            DWAPUtils.dprint("2. Run FindOptimalExteriorSquaresForBuilding()")
            DWAPUtils.dprint("3. Copy the returned positions to the config")
            DWAPUtils.dprint("")
        end
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
    local optimalPositions = FindOptimalExteriorSquaresForBuilding()
    if not optimalPositions or #optimalPositions == 0 then
        DWAPUtils.dprint("No optimal positions found")
        return
    end

    DWAPUtils.dprint("Found " .. #optimalPositions .. " optimal positions")

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
    local interval = SandboxVars.GeneratorVerticalPowerRange or 1
    local zMin = z - interval
    local zMax = z + interval

    for i = zMin, zMax do
        local testSquare = getSquare(x, y, i)
        if testSquare then
            local objects = square:getObjects()
            if objects then
                local size = objects:size() - 1
                for j = size, 0, -1 do
                    local object = objects:get(j)
                    if instanceof(object, "IsoGenerator") or object:getSpriteName() == "dwap_tiles_01_1" then
                        return true
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

            DWAPUtils.dprint("Electricity visualization enabled for " .. configName .. " (" .. generatorCount .. " generators)")
            DWAPUtils.dprint("Green = config generators with generator, Red = missing config generators, Purple = generators not in config, Blue = powered squares, Orange = unpowered squares")
        else
            currentGeneratorLookup = nil
            DWAPUtils.dprint("Electricity visualization enabled (no config)")
            DWAPUtils.dprint("Blue = powered squares, Orange = unpowered squares")
        end

        Events.OnTick.Add(elecTick)
    else
        Events.OnTick.Remove(elecTick)
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
    if not config or not config.spawn then
        DWAPUtils.dprint("Config at index " .. index .. " has no spawn data")
        return
    end
    local spawn = config.spawn
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

    local dest = tostring(index)
    if config and config.doorKeys and config.doorKeys.name then
        dest = config.doorKeys.name
    end
    player:Say("Teleported to: " .. dest)
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
                break
            else
                coordsHashes[coordsHash] = i
            end

            -- Check if square exists, teleport if not
            local square = getSquare(x, y, math.floor(z))
            if not square then
                DWAPUtils.dprint("Square not found at " ..
                    x .. "," .. y .. "," .. math.floor(z) .. " - FAILED")
                table.insert(failedContainers,
                    "Entry " .. i .. " at " .. x .. "," .. y .. "," .. z .. ": Square not found")
                break
            end

            -- Find container at coordinates (handle upper containers with +0.5 z)
            local container = nil
            local isUpperContainer = (z % 1) ~= 0 -- Check if z has decimal part

            local objects = square:getObjects()
            if objects then
                for j = 0, objects:size() - 1 do
                    local obj = objects:get(j)
                    if obj and obj:getContainer() then
                        local objContainer = obj:getContainer()
                        if isUpperContainer then
                            -- For upper containers, check if object has "High" position or renderYOffset
                            if objContainer:getContainerPosition() == "High" or
                                (obj:getRenderYOffset() and obj:getRenderYOffset() > 32) then
                                container = objContainer
                                break
                            end
                        else
                            -- For lower containers, check for normal position
                            if objContainer:getContainerPosition() ~= "High" and
                                (not obj:getRenderYOffset() or obj:getRenderYOffset() == 0) then
                                container = objContainer
                                break
                            end
                        end
                    end
                end
            end

            if not container then
                DWAPUtils.dprint("Entry " ..
                    i .. " at " .. x .. ".*" .. y .. ".*" .. z .. " - Container not found - FAILED")
                table.insert(failedContainers,
                    "Entry " .. i .. " at " .. x .. ".*" .. y .. ".*" .. z .. ": Container not found")
                -- break
            else
                -- Test if container is 80% full
                local capacity = container:getCapacity()
                local usedCapacity = container:getCapacityWeight()
                local fillPercentage = capacity > 0 and (usedCapacity / capacity) * 100 or 0

                if not entry.special and fillPercentage < 80 then
                    DWAPUtils.dprint("Entry " .. i .. " at " .. x .. ".*" .. y .. ".*" .. z .. " - Container only " ..
                        string.format("%.1f", fillPercentage) .. "% full - FAILED")
                    table.insert(failedContainers, "Entry " .. i .. " at " .. x .. "," .. y .. "," .. z ..
                        ": Only " .. string.format("%.1f", fillPercentage) .. "% full")
                    -- break
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
end

tlc = TestLootConfig

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
                    if properties:Is("GroupName") and properties:Val("GroupName") == "Garbage" then
                        isTrashContainer = true
                    elseif properties:Is("container") then
                        local containerName = properties:Val("container")
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
        local containerCount = 0
        for _ in pairs(currentContainerLookup) do
            containerCount = containerCount + 1
        end

        Events.OnTick.Add(containersTick)
        DWAPUtils.dprint("Container visualization enabled for " .. configName .. " (" .. containerCount .. " containers)")
        DWAPUtils.dprint("Red = config errors or missing containers, Orange = containers not in config, Purple = partial config, Blue = special containers, Green = all containers in config")
    else
        Events.OnTick.Remove(containersTick)
        currentContainerLookup = nil
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

                    local customName = props and props:Is("CustomName") and props:Val("CustomName")
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

                        if fixture.isTank then
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
        DWAPUtils.dprint("Plumbing visualization enabled for " ..
            configName .. " (" .. fixtureCount .. " total fixtures, " .. tankCount .. " tanks)")
        DWAPUtils.dprint(
            "Red = not in config or <100 fluid, Blue = water tank with fluid, Green = fixture in config with >100 fluid")
    else
        Events.OnTick.Remove(plumbingTick)
        currentPlumbingLookup = nil
        DWAPUtils.dprint("Plumbing visualization disabled")
    end
end
