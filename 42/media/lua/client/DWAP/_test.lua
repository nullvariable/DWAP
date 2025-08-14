local DWAPUtils = require("DWAPUtils")
local random = newrandom()

function DWAPTest1()
    DWAPUtils.dprint("DWAPTest1")
    local saveFile = getLatestSave()
    local savePath = saveFile[2] .. "\\" .. saveFile[1]
    DWAPUtils.dprint(savePath)
    manipulateSavefile(savePath, "DeleteMapBasementsBin")
end

function DWAPTest2()
    DWAPUtils.dprint("DWAPTest2")
    local basements = {
        lot_basement_coldwar_bunker_01 = { width=61, height=52, stairx=0, stairy=24, stairDir="N" },
    }
    local locations = {
        {x=14179, y=2651, stairDir="N", choices={"lot_basement_coldwar_bunker_01"}},
    }
    local access = {}

    local api = Basements.getAPIv1()
    api:addAccessDefinitions('Muldraugh, KY', access)
    api:addBasementDefinitions('Muldraugh, KY', basements)
    api:addSpawnLocations('Muldraugh, KY', locations)
end


-- if getDebug() then
--     local lastBuilding = nil
--     Events.OnTick.Add(function()
--         local ply = getPlayer()
--         local square = ply:getCurrentSquare()
--         if not square then return end
--         local building = square:getBuilding()
--         local bn = building and building or nil
--         if bn ~= lastBuilding then
--             DWAPUtils.dprint("Building changed "..tostring(bn))
--             if building then
--                 DWAPUtils.lightsOn(square)
--             end
--             lastBuilding = bn
--         end
--     end)
-- end

local lastBuilding = nil
function DoAutoLights()
    Events.OnTick.Add(function()
        local ply = getPlayer()
        local square = ply:getCurrentSquare()
        if not square then return end
        local building = square:getBuilding()
        local bn = building and building or nil
        if bn ~= lastBuilding then
            DWAPUtils.dprint("Building changed "..tostring(bn))
            if building then
                DWAPUtils.lightsOn(square)
            end
            lastBuilding = bn
        end
    end)
end

require "ISUI/ISCollapsableWindow"

NVDebug = ISCollapsableWindow:derive("NVDebug")

local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)

function NVDebug:createChildren()
	ISCollapsableWindow.createChildren(self)
	
	local th = self:titleBarHeight()
	local rh = self:resizeWidgetHeight()
	local textBox = ISTextEntryBox:new("", 0, 0 + th, self.width, self.height - th - rh)
	textBox:initialise()
	textBox:setAnchorRight(true)
	textBox:setAnchorBottom(true)
	self:addChild(textBox)
	textBox:setEditable(false)
	textBox:setMultipleLine(true)
	textBox:addScrollBars()
	self.textBox = textBox
end

function NVDebug:refresh()
	local text = DWAP_Gen.getActivePurgeString()
	self.textBox:setText(text)
end

function NVDebug:prerender()
    self:refresh()
	ISCollapsableWindow.prerender(self)
end

function NVDebug:new(x, y, width, height)
	local o = ISCollapsableWindow.new(self, x, y, width, height)
	o.title = "Purge"
	return o
end

function seedTest()
    local seedString = WGParams.instance:getSeedString()
    DWAPUtils.dprint(seedString)
    -- convert to an int
    local seed = seedString
    DWAPUtils.dprint(seed)
    random:seed(seed)
    local randomNum = random:random(1,9)
    DWAPUtils.dprint(tostring(randomNum))
end

local Reflection = require("Starlit/utils/Reflection")
ITest = function()
    local skillBooks = table.newarray()

    
    local sm = getScriptManager()
    local testItem = sm:FindItem("BookFarming1")

    -- local rawItems = getScriptManager():getItemsByType("Clothing")
    local rawItems = getScriptManager():getAllItems()
    DWAPUtils.dprint("Found "..tostring(rawItems:size()).." items")
    for i=0, rawItems:size()-1 do
        local item = rawItems:get(i)
        -- if item and not testItem and item:getName():find("BookFarming1") then
        --     testItem = item
        -- end
        if item and item:getDisplayCategory() == "SkillBook" then
            skillBooks[#skillBooks+1] = {
                name = item:getName(),
                -- hidden = item:isHidden(),
                -- obsolete = item:getObsolete(),
                -- pages = item:getNumberOfPages(),
                -- module = item:getModuleName(),
                -- readType = item:getReadType(),
                -- skillTrained = item:getSkillTrained(),
                -- skillLevelTrained = item:getLevelSkillTrained(),
                -- type = item:getTypeString(),
                -- lootType = item:getLootType(),
            }
        end
        -- name contains BagSeed but not Empty
        if item and item:getName():find("BagSeed") and not item:getName():find("Empty") then
            DWAPUtils.dprint("Seed found")
            DWAPUtils.dprint(item:getName())
        end
    end
    if testItem then
        DWAPUtils.dprint("testItem")
        DWAPUtils.dprint(testItem)
        DWAPUtils.dprint("testItem:getType()")
        local _type = testItem:getType()

        DWAPUtils.dprint("testItem:getDisplayCategory()")
        DWAPUtils.dprint(testItem:getDisplayCategory())
        DWAPUtils.dprint("testItem:getLootType()")
        DWAPUtils.dprint(testItem:getLootType())
        DWAPUtils.dprint("testItem:getReadType()")
        DWAPUtils.dprint(testItem:getReadType())
        DWAPUtils.dprint("testItem:getSkillTrained()")
        DWAPUtils.dprint(testItem:getSkillTrained())
        DWAPUtils.dprint("testItem:getLevelSkillTrained()")
        DWAPUtils.dprint(testItem:getLevelSkillTrained())
        DWAPUtils.dprint("testItem:getNumberOfPages()")
        DWAPUtils.dprint(testItem:getNumberOfPages())
        DWAPUtils.dprint("testItem:getObsolete()")
        DWAPUtils.dprint(testItem:getObsolete())
        DWAPUtils.dprint("testItem:isHidden()")
        DWAPUtils.dprint(testItem:isHidden())
        DWAPUtils.dprint("testItem:getModuleName()")
        DWAPUtils.dprint(testItem:getModuleName())
    end

    DWAPUtils.dprint("Skillbooks "..#skillBooks)

    -- local allItems = {}

    -- local items = getAllItems()
    -- for i=0, items:size()-1 do
    --     local item = items:get(i);
    --     if item and not item:getObsolete() and not item:isHidden() then
    --         if item:getDisplayCategory() == "SkillBook" then
    --             -- DWAPUtils.dprint(("SkillBook %s found"):format(item:getName()))
    --             table.insert(allItems, item)
    --         end
    --     end
    -- end
    -- local first = allItems[1] or nil

    -- DWAPUtils.dprint("first")
    -- local cn = Reflection.getClassName(first)
    -- DWAPUtils.dprint("Classname: "..cn)
    -- local fieldNames = Reflection.getClassFieldNames(cn)
    -- -- for i = 1, #fieldNames do
    -- --     DWAPUtils.dprint(fieldNames[i])
    -- -- end

end

local allSkillBooks = table.newarray()
local allSeeds = table.newarray()
local allMaps = table.newarray()

function TESTPopulateItems()
    -- local items = getScriptManager():getAllItems()
    local items = getAllItems()

    -- local testItem = items:get(0)
    -- DWAPUtils.dprint(Reflection.getClassName(testItem))
    -- DWAPUtils.dprint(Reflection.getClassFieldNames(Reflection.getClassName(testItem)))
    -- DWAPUtils.dprint(Reflection.getField(testItem, "type"))
    for i = 0, items:size()-1 do
        local item = items:get(i)
        if item and not item:getObsolete() and not item:isHidden() then
            --- @type string
            local name = item:getName()
            --- @type string
            local module = item:getModuleName()
            --- @type string
            local category = item:getDisplayCategory()
            if category == "SkillBook" and not (name:find("Set")) and not item:getLuaCreate() then
                -- DWAPUtils.dprint({name, item:getCategory()})
                table.insert(allSkillBooks, module .. "." .. name)
            elseif name:find("Seed") and not name:find("Empty") then
                table.insert(allSeeds, module .. "." .. name)
            elseif name ~= "Map" and name:find("Map") and category == "Cartography" then
                table.insert(allMaps, module .. "." .. name)
            end
        end
    end
    -- DWAPUtils.dprint("Skillbooks "..#allSkillBooks)
    -- DWAPUtils.dprint("Seeds "..#allSeeds)
    DWAPUtils.dprint("Maps "..#allMaps)
    -- DWAPUtils.dprint("Items "..items:size())
    -- DWAPUtils.dprint(allSkillBooks)
    -- DWAPUtils.dprint(allSeeds)
    DWAPUtils.dprint(allMaps)
end


--- Handle Custom Loot Spawns
--- @param roomType string
--- @param containerType string
--- @param container ItemContainer
local function onFillContainer2(roomType, containerType, container)
    if isMultiplayer() and isClient() then return end
    DWAPUtils.dprint(("onFillContainer2: %s %s %s"):format(roomType, containerType, Reflection.getClassName(container)))
    local square = container:getSourceGrid()
    if square then
        DWAPUtils.dprint({square:getX(), square:getY(), square:getZ()})
    end
end

-- Events.OnFillContainer.Add(onFillContainer2)

--- Main Event function
--- @param square IsoGridSquare
function GSTest(square)
    if not square then return end
    local coords = {square:getX(), square:getY(), square:getZ()}
    if coords[1] == 9956 and coords[2] == 12604 and coords[3] == -4 then
        local objs = square:getObjects()
        DWAPUtils.dprint("GSTest ".. tostring(objs:size()))
        for i=0, objs:size()-1 do
            --- @type IsoObject
            local obj = objs:get(i)
            DWAPUtils.dprint(obj:getSpriteName() .. " " .. tostring(obj:hasExternalWaterSource()) .. " " .. tostring(obj:getUsesExternalWaterSource()))
        end
    end
end
-- Events.LoadGridsquare.Add(GSTest)

-- Events.OnWaterAmountChange.Add(function(object, currentAmount)
--     DWAPUtils.dprint(("OnWaterAmountChange %s"):format(object:getSpriteName()))
-- end)

-- Events.ReuseGridsquare.Add(function(square)
--     if not square then
--         DWAPUtils.dprint("ReuseGridsquare nil")
--         return
--     end
--     local coords = {square:getX(), square:getY(), square:getZ()}
--     if coords[1] == 9956 and coords[2] == 12604 and coords[3] == -4 then
--         local objs = square:getObjects()
--         DWAPUtils.dprint("ReuseGridsquare ".. tostring(objs:size()))
--         for i=0, objs:size()-1 do
--             --- @type IsoObject
--             local obj = objs:get(i)
--             DWAPUtils.dprint(obj:getSpriteName())
--             DWAPUtils.dprint(tostring(obj:hasExternalWaterSource()) .. " " .. tostring(obj:getUsesExternalWaterSource()))
--         end
--     end
-- end)

-- Events.OnAmbientSound.Add(function(name, x, y)
--     DWAPUtils.dprint(("OnAmbientSound %s %s %s"):format(name, x, y))
-- end)

--[[
    private boolean touchesChunk(IsoChunk isoChunk) {
        IsoGridSquare isoGridSquare = this.getSquare();

        assert isoGridSquare != null;

        if (isoGridSquare == null) {
            return false;
        } else {
            int int0 = isoChunk.wx * 8;
            int int1 = isoChunk.wy * 8;
            int int2 = int0 + 8 - 1;
            int int3 = int1 + 8 - 1;
            if (isoGridSquare.x - 20 > int2) {
                return false;
            } else if (isoGridSquare.x + 20 < int0) {
                return false;
            } else {
                return isoGridSquare.y - 20 > int3 ? false : isoGridSquare.y + 20 >= int1;
            }
        }
    }
]]


--- Test if a chunk is within 20 units of a given set of coords
--- @param chunk IsoChunk
local function isChunkTouching(chunk, x, y, z)
    local cx = chunk:getWorldX()
    local cy = chunk:getWorldY()
    local cz = chunk:getWorldZ()
    return (math.abs(cx - x) <= 20) and (math.abs(cy - y) <= 20) and (math.abs(cz - z) <= 20)
end

Reflection = require("Starlit/utils/Reflection")

local be
local toggle = false
function sound_test()
    toggle = not toggle
    if toggle then
        local x, y, z = getPlayer():getX(), getPlayer():getY(), getPlayer():getZ()
        be = getWorld():getFreeEmitter(x, y, z)
        be:playSound("GeneratorLoop")
        be:setVolumeAll(0.4)
    else
        be:stopAll()
        -- be:stopSoundByName("GeneratorLoop")
    end
end

local stestCoords = {}
local sound
local obj
local baseEmitter
function stest()
    local square = getPlayer():getCurrentSquare()

    stestCoords = {square:getX(), square:getY(), square:getZ()}

    local cell = getCell()
    if not cell then
        DWAPUtils.dprint("Cell not found")
        return
    end
    local size = getCellSizeInChunks()
    local sqSize = getCellSizeInSquares()
    local w = tostring(cell:getWidth())
    DWAPUtils.dprint(("Cell %s %s %s"):format(size, sqSize, w))
    -- for i = 0, 3 do
    --     local chunkMap = cell:getChunkMap(i)
    --     DWAPUtils.dprint("ChunkMap "..tostring(i) .. " " .. tostring(chunkMap:getWorldXMinTiles()))
    --     if chunkMap then
    --         local chunks = chunkMap:getChunks()
    --         DWAPUtils.dprint("Chunks "..tostring(type(chunks)))
    --         DWAPUtils.dprint(getmetatable(chunks))
    --         -- DWAPUtils.dprint(type(chunks))
    --         -- DWAPUtils.dprint(chunks)
    --         -- DWAPUtils.dprint(chunks:size())
    --         -- DWAPUtils.dprint(Reflection.getClassName(chunks))
    --         -- DWAPUtils.dprint(Reflection.getClassFieldNames(Reflection.getClassName(chunks)))
    --         -- DWAPUtils.dprint("Chunks "..tostring(chunks:size()))
    --         -- for j = 0, chunks:size()-1 do
    --         --     local chunk = chunks:get(j)
    --         --     DWAPUtils.dprint(chunk:getLoadID())
    --         -- end
    --     end
    -- end
    -- local chunks = DataCell.getallChunks()
    -- DWAPUtils.dprint("Chunks "..tostring(Reflection.getClassName(chunks)))


    obj = IsoObject.getNew(square, "furniture_seating_indoor_02_4", "furniture_seating_indoor_02_4", false)
    square:AddTileObject(obj)
    square:transmitAddObjectToSquare(obj, obj:getObjectIndex())
    -- local worldInstance = getWorld()
    -- baseEmitter = worldInstance:getFreeEmitter(stestCoords[1], stestCoords[2], stestCoords[3])
    -- sound = baseEmitter:playSound("GeneratorLoop")
    -- local manager = getWorldSoundManager()

    -- sound = addSoundRepeatingaddSoundRepeating(obj, square:getX(), square:getY(), square:getZ(), 20.0, 20.0, false)

    local chunk = square:getChunk()
    -- DWAPUtils.dprint(chunk:getWorldX())
    chunk:addGeneratorPos(stestCoords[1], stestCoords[2], stestCoords[3])
end

function stest2()
    -- stopSound(sound)
    sledgeDestroy(obj)
    -- baseEmitter:stopSound(sound)
    local chunk = getSquare(stestCoords[1], stestCoords[2], stestCoords[3]):getChunk()
    chunk:removeGeneratorPos(stestCoords[1], stestCoords[2], stestCoords[3])
    baseEmitter = nil
    sound = nil
    obj = nil
end

--[[
for (int int2 = -2; int2 <= 2; int2++) {
                for (int int3 = -2; int3 <= 2; int3++) {
                    IsoChunk isoChunk = GameServer.bServer
                        ? ServerMap.instance.getChunk(int0 + int3, int1 + int2)
                        : IsoWorld.instance.CurrentCell.getChunk(int0 + int3, int1 + int2);
                    if (isoChunk != null && this.touchesChunk(isoChunk)) {
                        if (this.isActivated()) {
                            isoChunk.addGeneratorPos(this.square.x, this.square.y, this.square.z);
                        } else {
                            isoChunk.removeGeneratorPos(this.square.x, this.square.y, this.square.z);
                        }
                    }
                }
            }
]]

function calculateChunkBounds(wx, wy)
    local startX = wx * 8
    local startY = wy * 8
    local endX = startX + 8 - 1
    local endY = startY + 8 - 1
    return startX, startY, endX, endY
end

function stest3()
    local square = getPlayer():getCurrentSquare()

    local stestCoords2 = {square:getX(), square:getY(), square:getZ()}
    local cell = getCell()
    if not cell then
        DWAPUtils.dprint("Cell not found")
        return
    end
    local startChunk = square:getChunk()

    local wx = Reflection.getField(startChunk, "wx")
    local wx2 = IsoUtils.XToIso(stestCoords2[1], stestCoords2[2], stestCoords2[3])
    local wy = Reflection.getField(startChunk, "wy")
    local wy2 = IsoUtils.YToIso(stestCoords2[1], stestCoords2[2], stestCoords2[3])
    DWAPUtils.dprint(("Chunk %s %s"):format(wx, wy))
    DWAPUtils.dprint(("Chunk2 %s %s | %s %s"):format(wx2, wy2, math.floor(wx2 / 8), math.floor(wy2 / 8)))
    local startX, startY, endX, endY = calculateChunkBounds(wx, wy)
    DWAPUtils.dprint(("Chunk3 %s %s %s %s"):format(startX, startY, endX, endY))
    local start, finish = -2, 2
    -- for i = start, finish do
    --     for j = start, finish do
    --         local chunk = cell:getChunk(wx + j, wy + i)
    --         if chunk then
    --             -- chunk:addGeneratorPos(stestCoords2[1], stestCoords2[2], stestCoords2[3])
    --             DWAPUtils.dprint("Added")
    --         else
    --             DWAPUtils.dprint("Chunk not found")
    --         end
    --     end
    -- end
end

-- Events.OnRenderTick.Add(function()
--     local square = getPlayer():getCurrentSquare()
--     local startChunk = square:getChunk()
--     renderIsoRect(square:getX()+1, square:getY()+1, square:getZ(), 3, getCore():getGoodHighlitedColor():getR(),getCore():getGoodHighlitedColor():getG(),getCore():getGoodHighlitedColor():getB(), 0.5, 1)
-- end)


local function LoadChunk(chunk)
    local wx = Reflection.getField(chunk, "wx")
    local wy = Reflection.getField(chunk, "wy")
    DWAPUtils.dprint("LoadChunk "..tostring(wx).." "..tostring(wy))
    if wx == 1240 and wy == 1578 then
        local startX, startY, endX, endY = calculateChunkBounds(wx, wy)
        DWAPUtils.dprint(("Chunk3 %s %s %s %s"):format(startX, startY, endX, endY))
        chunk:addGeneratorPos(startX, startY, 0)
    end
end

local function getChunkCenterXY(chunk)
    local wx = Reflection.getField(chunk, "wx")
    local wy = Reflection.getField(chunk, "wy")
    local startX, startY, endX, endY = calculateChunkBounds(wx, wy)
    return math.floor((startX + endX) / 2), math.floor((startY + endY) / 2)
end

-- Events.LoadChunk.Add(LoadChunk)

function ShowChunkXYForLightSwitches()
    local square = getPlayer():getCurrentSquare()

    local switches = {}
    local building = square:getBuilding()
    if not building then
        DWAPUtils.dprint("No building found")
        return
    end
    local rooms = getCell():getRoomList()
    for i = 0, rooms:size()-1 do
        local room = rooms:get(i)
        if room:getBuilding() == building then
            local lightSwitches = room:getLightSwitches()
            for j = 0, lightSwitches:size()-1 do
                local lightSwitch = lightSwitches:get(j)
                local x, y, z = lightSwitch:getSquare():getX(), lightSwitch:getSquare():getY(), lightSwitch:getSquare():getZ()
                switches[#switches+1] = {switch = lightSwitch, x=x, y=y, z=z}
            end
        end
    end
    DWAPUtils.dprint("LightSwitches "..#switches)

    local uniqueChunks = {}
    for i = 1, #switches do
        local switch = switches[i]
        local chunk = switch.switch:getSquare():getChunk()
        local wx = Reflection.getField(chunk, "wx")
        local wy = Reflection.getField(chunk, "wy")
        DWAPUtils.dprint(("LightSwitch %s %s %s %s %s"):format(wx, wy, switch.x, switch.y, switch.z))
        uniqueChunks[wx.."_"..wy] = {chunk = chunk, x=switch.x, y=switch.y, z=switch.z}
    end
    for k, uchunk in pairs(uniqueChunks) do
        DWAPUtils.dprint(("UniqueChunk %s"):format(k))
        local x, y = getChunkCenterXY(uchunk.chunk)
        uchunk.chunk:addGeneratorPos(x, y, uchunk.z)
    end
    for i = 1, #switches do
        local switch = switches[i]
        switch.switch:setActive(true)
    end
end

function FindChunksForRoom()
    local pSquare = getPlayer():getCurrentSquare()
    local room = pSquare:getRoom()
    if not room then
        DWAPUtils.dprint("No room found")
        return
    end
    local playerX, playerY, playerZ = pSquare:getX(), pSquare:getY(), pSquare:getZ()
    local squaresInRoom = {}
    -- search 20 squares around the player
    for x = playerX - 20, playerX + 20 do
        for y = playerY - 20, playerY + 20 do
            local square = getSquare(x, y, playerZ)
            if square then
                local room2 = square:getRoom()
                if room2 and room2 == room then
                    squaresInRoom[#squaresInRoom+1] = square
                end
            end
        end
    end
    DWAPUtils.dprint("SquaresInRoom "..#squaresInRoom)
    local uniqueChunks = {}
    for i = 1, #squaresInRoom do
        local square = squaresInRoom[i]
        local chunk = square:getChunk()
        local wx = Reflection.getField(chunk, "wx")
        local wy = Reflection.getField(chunk, "wy")
        -- DWAPUtils.dprint(("Square %s %s %s %s"):format(wx, wy, square:getX(), square:getY()))
        uniqueChunks[wx.."_"..wy] = {chunk = chunk, wx = wx, wy = wy}
    end
    for _, uchunk in pairs(uniqueChunks) do
        local x, y = getChunkCenterXY(uchunk.chunk)
        DWAPUtils.dprint(("UniqueChunk %s %s center: %s %s"):format(uchunk.wx, uchunk.wy, x, y))
        uchunk.chunk:addGeneratorPos(x, y, playerZ)
    end
    DWAPUtils.lightsOn(pSquare)
end

function printSandboxVert()
    DWAPUtils.dprint(("SandboxVars.GeneratorVerticalPowerRange %s"):format(SandboxVars.GeneratorVerticalPowerRange))
end

function GetChunkXYFromPlayer()
    local pSquare = getPlayer():getCurrentSquare()
    local chunk = pSquare:getChunk()
    local wx = Reflection.getField(chunk, "wx")
    local wy = Reflection.getField(chunk, "wy")
    local x, y = getChunkCenterXY(chunk)
    local hash = DWAPSquareLoaded.hashCoords(wx, wy, 0)
    DWAPUtils.dprint(("Chunk %s %s %s %s %s"):format(hash, wx, wy, x, y))
end

function ListChunksForBuilding()
    local pSquare = getPlayer():getCurrentSquare()
    local building = pSquare:getBuilding()
    if not building then
        DWAPUtils.dprint("No building found")
        return
    end
    local playerX, playerY, playerZ = pSquare:getX(), pSquare:getY(), pSquare:getZ()
    local squaresInBuilding = {}
    -- search 20 squares around the player
    for x = playerX - 30, playerX + 30 do
        for y = playerY - 20, playerY + 20 do
            local square = getSquare(x, y, playerZ)
            if square then
                local building2 = square:getBuilding()
                if building2 and building2 == building then
                    squaresInBuilding[#squaresInBuilding+1] = square
                end
            end
        end
    end
    DWAPUtils.dprint("SquaresInBuilding "..#squaresInBuilding)
    local uniqueChunks = {}
    for i = 1, #squaresInBuilding do
        local square = squaresInBuilding[i]
        local chunk = square:getChunk()
        local wx = Reflection.getField(chunk, "wx")
        local wy = Reflection.getField(chunk, "wy")
        -- DWAPUtils.dprint(("Square %s %s %s %s"):format(wx, wy, square:getX(), square:getY()))
        uniqueChunks[wx.."_"..wy] = {chunk = chunk, wx = wx, wy = wy}
    end
    for _, uchunk in pairs(uniqueChunks) do
        local x, y = getChunkCenterXY(uchunk.chunk)
        local hash = DWAPSquareLoaded.hashCoords(uchunk.wx, uchunk.wy, 0)
        DWAPUtils.dprint(("UniqueChunk %s %s %s center: %s %s"):format(hash, uchunk.wx, uchunk.wy, x, y))
        -- uchunk.chunk:addGeneratorPos(x, y, playerZ)
    end
    -- DWAPUtils.lightsOn(pSquare)
end

local testConfig = {
    -- [108015909] = true,
    [51662962] = true,
    [51638369] = true,
    [51687526] = true,
}
function DoTestConfig()
    local pSquare = getPlayer():getCurrentSquare()
    local cell = getCell()
    if not cell then
        DWAPUtils.dprint("No cell found")
        return
    end
    local pChunk = pSquare:getChunk()
    local startWX, startWY = Reflection.getField(pChunk, "wx"), Reflection.getField(pChunk, "wy")
    for i = startWX - 10, startWX + 10 do
        for j = startWY - 10, startWY + 10 do
            local chunk = cell:getChunk(i, j)
            if chunk then
                local wx = Reflection.getField(chunk, "wx")
                local wy = Reflection.getField(chunk, "wy")
                local hash = DWAPSquareLoaded.hashCoords(wx, wy, 0)
                if testConfig[hash] then
                    local x, y = getChunkCenterXY(chunk)
                    DWAPUtils.dprint(("Chunk %s %s %s %s %s"):format(i, j, hash, x, y))
                    chunk:addGeneratorPos(x, y, -4)
                    chunk:addGeneratorPos(x, y, 0)
                end
            end
        end
    end
    DWAPUtils.Defer(function()
        DWAPUtils.lightsOn(pSquare)
    end)
end


local function powerChunk(chunk)
    local bottom = chunk:getMinLevel()
    local top = chunk:getMaxLevel()
    local x, y = getChunkCenterXY(chunk)
    for i = bottom, top do
        DWAPUtils.dprint(("Adding generator pos %s %s %s"):format(x, y, i))
        chunk:addGeneratorPos(x, y, i)
    end
end


function powerTest1()
    local pSquare = getPlayer():getCurrentSquare()
    local pChunk = pSquare:getChunk()
    powerChunk(pChunk)
end

function sound_test2()
    DWAPUtils.Defer(function()
        DWAP_Gen:ensureSound(1)
    end)
end

function debugChunk()
    local pSquare = getPlayer():getCurrentSquare()
    local pChunk = pSquare:getChunk()
    local wx = Reflection.getField(pChunk, "wx")
    local wy = Reflection.getField(pChunk, "wy")
    local x, y = getChunkCenterXY(pChunk)
    DWAPUtils.dprint(("Chunk %s %s %s %s"):format(wx, wy, x, y))
    local className = Reflection.getClassName(pChunk)
    DWAPUtils.dprint(className)
    DWAPUtils.dprint(Reflection.getField(pChunk, "minLevel"))
    DWAPUtils.dprint(Reflection.getField(pChunk, "maxLevel"))
    local generatorsTouchingThisChunk = Reflection.getField(pChunk, "generatorsTouchingThisChunk")
    if generatorsTouchingThisChunk then
        DWAPUtils.dprint("GeneratorsTouchingThisChunk " .. generatorsTouchingThisChunk:size())
        for i = 0, generatorsTouchingThisChunk:size()-1 do
            local generator = generatorsTouchingThisChunk:get(i)
            local gx = Reflection.getField(generator, "x")
            local gy = Reflection.getField(generator, "y")
            local gz = Reflection.getField(generator, "z")
            DWAPUtils.dprint(("Generator %s %s %s %s"):format(gx, gy, gz, Reflection.getClassName(generator)))
        end
    end
end

function unpowerTest()
    local pSquare = getPlayer():getCurrentSquare()
    local pChunk = pSquare:getChunk()
    local generatorsTouchingThisChunk = Reflection.getField(pChunk, "generatorsTouchingThisChunk")
    DWAPUtils.dprint("GeneratorsTouchingThisChunk " .. generatorsTouchingThisChunk:size())
    for i = 0, generatorsTouchingThisChunk:size()-1 do
        local generator = generatorsTouchingThisChunk:get(i)
        local gx = Reflection.getField(generator, "x")
        local gy = Reflection.getField(generator, "y")
        local gz = Reflection.getField(generator, "z")
        DWAPUtils.dprint(("Remove Generator %s %s %s %s"):format(gx, gy, gz, Reflection.getClassName(generator)))
        pChunk:removeGeneratorPos(gx, gy, gz)
    end
end

function listObjects(x,y,z)
    local square = getSquare(x, y, z)
    if not square then
        DWAPUtils.dprint("Square not found")
        return
    end
    local objs = square:getObjects()
    DWAPUtils.dprint("Objects "..tostring(objs:size()))
    for i=0, objs:size()-1 do
        local object = objs:get(i)
        local props = {
            objtype = Reflection.getClassName(object),
            spriteModelName = Reflection.getField(object, "spriteModelName"),
            usesExternalWaterSource = Reflection.getField(object, "usesExternalWaterSource"),
            name = Reflection.getField(object, "name"),
            lastObjectIndex = Reflection.getField(object, "lastObjectIndex"),
            getSpriteName = object:getSpriteName(),
            getName = object:getName(),
        }
        DWAPUtils.dprint(props)
    end
end

function mdTest()
    local md = ModData.getOrCreate("DWAP_Loot")
    DWAPUtils.dprint(md.allVHS)
end

local testRVConfig = {
    wallW = "industry_trucks_01_4",
    wallN = "industry_trucks_01_5",
    floor = "floors_exterior_street_01_16",
    grid = {
        [1] = {
            [1] = {
                { sprite = "security_01_5" },
                { sprite = "security_01_1" },
            },
            [2] = {
                { sprite = "security_01_5" },
                { sprite = "appliances_com_01_53" },
            },
        },
        [2] = {
            [1] = {
                { sprite = "furniture_seating_indoor_01_48" },
            },
            [2] = {
                { sprite = "furniture_seating_indoor_01_48" },
            },
        },
        [3] = {
            [1] = {
            },
            [2] = {
            },
        }
    }
}

local IsoObjectUtils = require("Starlit/IsoObjectUtils")
function rvtest1()
    local player = getPlayer()
    local psquare = player:getCurrentSquare()
    local coords = {psquare:getX(), psquare:getY(), psquare:getZ()}

    local startX, startY = coords[1], coords[2]
    local grid = testRVConfig.grid
    local endX, endY = startX + #grid - 1, startY + #grid[1] - 1
    local targetZ = coords[3] - 1
    -- floor.
    for i = startX-1, endX+1 do
        for j = startY-1, endY+1 do
            local square = IsoObjectUtils.getOrCreateSquare(i, j, targetZ)
            -- local floor = IsoObject.getNew(square, "floors_exterior_street_01_16", "", false)
            local floor = IsoObject.getNew(square, testRVConfig.floor, "", false)
            square:transmitAddObjectToSquare(floor, -1)
        end
    end
    -- walls.
    for i = startX, endX do
        for j = startY, endY do
            if j == startY then
                local square = IsoObjectUtils.getOrCreateSquare(i, j, targetZ)
                local wall = IsoObject.getNew(square, testRVConfig.wallN, "", false)
                square:transmitAddObjectToSquare(wall, -1)
            end
            if j == endY then
                local square = IsoObjectUtils.getOrCreateSquare(i, j+1, targetZ)
                local wall = IsoObject.getNew(square, testRVConfig.wallN, "", false)
                square:transmitAddObjectToSquare(wall, -1)
            end
            if i == startX then
                local square = IsoObjectUtils.getOrCreateSquare(i, j, targetZ)
                local wall = IsoObject.getNew(square, testRVConfig.wallW, "", false)
                square:transmitAddObjectToSquare(wall, -1)
            end
            if i == endX then
                local square = IsoObjectUtils.getOrCreateSquare(i+1, j, targetZ)
                local wall = IsoObject.getNew(square, testRVConfig.wallW, "", false)
                square:transmitAddObjectToSquare(wall, -1)
            end
        end
    end
    -- grid.
    for i = 1, #grid do
        for j = 1, #grid[i] do
            local gridTile = grid[i][j]
            if gridTile then
                for k = 1, #gridTile do
                    local gridItem = gridTile[k]
                    local x, y = startX + i - 1, startY + j - 1
                    DWAPUtils.dprint(("Grid %s %s %s | x %s y %s"):format(i, j, gridItem.sprite, tostring(x), tostring(y)))
                    local square = IsoObjectUtils.getOrCreateSquare(x, y, targetZ)
                    local isoObj = IsoObject.getNew(square, gridItem.sprite, "", false)
                    square:transmitAddObjectToSquare(isoObj, -1)
                    local cell = getCell()
                    if cell then
                        local lightSource = IsoLightSource.new(x, y, targetZ, 0.0, 0.0, 1.0, 1.0)
                        cell:addLamppost(lightSource)
                        IsoGridSquare.RecalcLightTime = -1
                        DWAPUtils.dprint("Added light source")
                        lightSource:setR(0.5)
                        lightSource:setG(0.5)
                        lightSource:setB(0.5)
                    end
                end
            end
        end
    end

    -- for i = coords[1], coords[1] + 3 do
    --     for j = coords[2], coords[2] + 2 do
    --         local square = IsoObjectUtils.getOrCreateSquare(i, j, coords[3] - 1)
    --         local obj2 = IsoObject.getNew(square, "floors_exterior_street_01_16", "", false)
    --         square:transmitAddObjectToSquare(obj2, -1)
    --         -- if north then add north wall
    --         if j == coords[2] + 1 then
    --             local obj3 = IsoObject.getNew(square, "industry_trucks_01_5", "", false)
    --             square:transmitAddObjectToSquare(obj3, -1)
    --             local cell = getCell()
    --             if cell then
    --                 local lightSource = IsoLightSource.new(i, j, coords[3] - 1, 0.0, 0.0, 1.0, 1.0)
    --                 cell:addLamppost(lightSource)
    --                 IsoGridSquare.RecalcLightTime = -1
    --                 DWAPUtils.dprint("Added light source")
    --                 lightSource:setR(0.3)
    --                 lightSource:setG(0.3)
    --                 lightSource:setB(0.3)
    --             end
    --         end
    --         -- if west then add west wall
    --         if i == coords[1] then
    --             local obj4 = IsoObject.getNew(square, "industry_trucks_01_4", "", false)
    --             square:transmitAddObjectToSquare(obj4, -1)
    --         end
    --     end
    -- end
    DWAPUtils.Defer(function()
        -- player:teleportTo(coords[1], coords[2], coords[3] - 1)
        player:setX(coords[1])
        player:setY(coords[2])
        player:setZ(coords[3] - 1)
    end)
end

local ignoreFlags ={
    IsoFlagType.doorN,
    IsoFlagType.doorW,
    IsoFlagType.DoorWallN,
    IsoFlagType.DoorWallW,
    IsoFlagType.DoubleDoor1,
    IsoFlagType.DoubleDoor2,
    IsoFlagType.invisible,
    IsoFlagType.WallN,
    IsoFlagType.WallNW,
    IsoFlagType.WallOverlay,
    IsoFlagType.WallSE,
    IsoFlagType.WallW,
    IsoFlagType.windowN,
    IsoFlagType.windowW,
    IsoFlagType.diamondFloor,
}
--[[
local Serialise = require("Starlit/serialise/Serialise")
function serializeItems(container)
    if not container then
        return nil
    end
    local items = container:getItems()
    local serializedItems = {}
    for i = 0, items:size()-1 do
        local item = items:get(i)
        -- @TODO if it's a container then recursively serialize it
        local itemData = Serialise.serialiseInventoryItem(item)
        serializedItems[#serializedItems+1] = itemData
    end
    return serializedItems
end
]]--

function serializeContainer(container)
    local saveContainer = {
        items = serializeItems(container),
        isDevice = container:isIsDevice(),
        ageFactor = container:getAgeFactor(),
        CookingFactor = container:getCookingFactor(),
        type = container:getType(),
        containerPosition = container:getContainerPosition(),
        freezerPosition = container:getFreezerPosition(),
        Capacity = container:getCapacity(),
    }
    return saveContainer
end

function unserializeItems(container, items)
    if not items then
        return
    end
    for i = 1, #items do
        local itemData = items[i]
        local item = Serialise.deserialiseInventoryItem(itemData)
        container:AddItem(item)
    end
end

function unserializeContainer(container, saveContainer)
    if not saveContainer then
        return
    end
    unserializeItems(container, saveContainer.items)
    container:setIsDevice(saveContainer.isDevice)
    container:setAgeFactor(saveContainer.ageFactor)
    container:setCookingFactor(saveContainer.CookingFactor)
    container:setType(saveContainer.type)
    container:setContainerPosition(saveContainer.containerPosition)
    container:setFreezerPosition(saveContainer.freezerPosition)
    container:setCapacity(saveContainer.Capacity)
end

function getAllObjects(square)
    local objects = square:getWorldObjects()
    local returnObjects = table.newarray()
    local objSize = objects:size() - 1
    for i = 0, objSize do
        local object = objects:get(i)
        returnObjects[#returnObjects+1] = {obj = object, textureName = object:getTextureName(), container = object:getItemContainer(), modData = object:getModData()}
        DWAPUtils.dprint(("Object %s %s"):format(object:getSpriteName(), object:getTextureName()))
    end
    local objects2 = square:getLuaTileObjectList()
    for i = 1, #objects2 do
        local object = objects2[i]
        local objFlags = object:getProperties():getFlagsList()
        local ignore = false
        for j = 1, #ignoreFlags do
            if objFlags:contains(ignoreFlags[j]) then
                ignore = true
                break
            end
        end
        if not ignore then
            local container = object:getItemContainer()
            local saveContainer
            if container then
                saveContainer = serializeContainer(container)
            end
            returnObjects[#returnObjects+1] = {obj = object, textureName = object:getTextureName(), name = object:getObjectName(), container = saveContainer, modData = object:getModData()}
            DWAPUtils.dprint(("Object2 %s %s"):format(object:getSpriteName(), object:getTextureName()))
        end
    end
    return returnObjects
end

function testTeleport()
    local objectsToMove = {}
    local player = getPlayer()
    local pSquare = player:getCurrentSquare()
    local x, y, z = 5100, 1000, pSquare:getZ()
    --- @type IsoGridSquare
    local startSquare = getSquare(x, y, z)
    if not startSquare then
        DWAPUtils.dprint("Start square not found")
        return
    end
    local targetX, targetY, targetZ = x - 1000, y, z
    local objectsOnSourceSquare = startSquare:getObjects()
    for i = 0, objectsOnSourceSquare:size()-1 do
        local object = objectsOnSourceSquare:get(i)
        if not object:isFloor() then
            objectsToMove[#objectsToMove+1] = object
        end
    end
    DWAPUtils.dprint("Objects to move "..#objectsToMove)
    for i = 1, #objectsToMove do
        local object = objectsToMove[i]
        local objIndex = object:getObjectIndex()
        DWAPUtils.dprint(("Moving object %s %s %s"):format(object:getSpriteName(), startSquare:getX(), startSquare:getY()))
        startSquare:transmitRemoveItemFromSquare(object)
        startSquare:RemoveTileObject(object)
    end
    player:teleportTo(targetX, targetY, targetZ)
    local gridSquareLoaded
    gridSquareLoaded = function(square)
        local loadedX, loadedY, loadedZ = square:getX(), square:getY(), square:getZ()
        if not (loadedX == targetX and loadedY == targetY and loadedZ == targetZ) then
            return
        end
        for i = 1, #objectsToMove do
            local object = objectsToMove[i]
            -- if object:isContainer() then
            --     ItemPickerJava.updateOverlaySprite(object:getParent())
            -- end
            local objIndex = -1
            DWAPUtils.dprint(("Moving object %s %s %s"):format(object:getSpriteName(), loadedX, loadedY))
            square:AddSpecialObject(object)
            square:transmitAddObjectToSquare(object, objIndex)
            object:transmitUpdatedSprite()
        end
        square:fixPlacedItemRenderOffsets()
        Events.LoadGridsquare.Remove(gridSquareLoaded)
    end
    Events.LoadGridsquare.Add(gridSquareLoaded)
end

function _testModData()
    DWAPUtils.dprint("Testing ModData")
    local md = ModData.getOrCreate("DWAP_Testing")
    local pSquare = getPlayer():getCurrentSquare()
    if md.objects then
        DWAPUtils.dprint("Restoring objects")
        for i = 1, #md.objects do
            local object = md.objects[i]
            local objSrc = object.textureName
            local tmp  = pSquare:addTileObject(objSrc)
            if tmp then
                if object.container then
                    local container = tmp:getItemContainer()
                    if container then
                        unserializeContainer(container, object.container)
                    end
                end
                tmp:setModData(object.modData)
                if tmp:getObjectName() ~= object.name then
                    tmp:setObjectName(object.name)
                end
            end
        end
        pSquare:FixStackableObjects()
        md.objects = nil
    else
        DWAPUtils.dprint("Saving objects")
        local objects = getAllObjects(pSquare)
        md.objects = objects
        for i = 1, #objects do
            local object = objects[i]
            object.obj:removeFromSquare()
        end
        DWAPUtils.dprint(#objects .. " Objects removed")
    end
end
-- square:FixStackableObjects()

function resetModData()
    local md = ModData.getOrCreate("DWAP_Testing")
    md.objects = nil
    DWAPUtils.dprint("ModData reset")
end

--- Get an object from a square by sprite name
--- @param square IsoGridSquare
--- @param sprite string
--- @return IsoObject|nil object, number size object and the number of objects on the square
local function getSpriteObject(square, sprite)
    local tankObjects = square:getObjects()
    local size = tankObjects:size() - 1
    for i = 0, size do
        local object = tankObjects:get(i)
        if object and object:getSpriteName() == sprite then
            return object, size
        end
    end
    return nil, -1
end

function watertest()
    -- local fixtureSquare = getSquare(10092, 8252, 0)
    -- local fixtureSquare = getSquare(10093, 8252, 0)
    -- local fixtureSquare = getSquare(10093, 8260, 0)
    local fixtureSquare = getSquare(10093, 8261, 0)
    if not fixtureSquare then
        DWAPUtils.dprint("Fixture square not found")
        return
    end
    -- local fixtureObj = getSpriteObject(fixtureSquare, "fixtures_sinks_01_33")
    -- local fixtureObj = getSpriteObject(fixtureSquare, "fixtures_sinks_01_17")
    -- local fixtureObj = getSpriteObject(fixtureSquare, "fixtures_sinks_01_13")
    local fixtureObj = getSpriteObject(fixtureSquare, "appliances_laundry_01_5")
    if not fixtureObj then
        DWAPUtils.dprint("DWAP_WaterSystem: InitWellFixture: Fixture object not found")
        return
    end

    -- local moveSquare = IsoObjectUtils.getOrCreateSquare(10109, 8262, 0 - 1)
    -- local moveSquare = IsoObjectUtils.getOrCreateSquare(10116, 8251, 0 - 1)
    local moveSquare = IsoObjectUtils.getOrCreateSquare(10093, 8261, 1)

    if not moveSquare then
        DWAPUtils.dprint("Move square not found")
        return
    end
    
    local thumpable = IsoThumpable.new(fixtureObj:getCell(), moveSquare, "crafted_01_11", false)
    --- @type FluidContainer annoyingly umbrella doesn't have this class yet
    local fluidContainer = ComponentType.FluidContainer:CreateComponent();
    fluidContainer:setCapacity(10000)
    fluidContainer:addFluid(FluidType.Water, 10000)
    fluidContainer:setContainerName("Well")
    GameEntityFactory.AddComponent(thumpable, true, fluidContainer);
    moveSquare:AddTileObject(thumpable)
    moveSquare:AddSpecialObject(thumpable)
    moveSquare:transmitAddObjectToSquare(thumpable, -1)
    fixtureObj:getModData().canBeWaterPiped = false
    fixtureObj:setUsesExternalWaterSource(true)
    fixtureObj:transmitModData()
    fixtureObj:sendObjectChange('usesExternalWaterSource', { value = true })
    fixtureObj:doFindExternalWaterSource()
    fixtureObj:transmitModData()
    fixtureSquare:transmitModdata()
    fixtureSquare:setSquareChanged()

    local sprite = thumpable:getSprite()
    local sf = Reflection.getField(sprite, "solidfloor")
    DWAPUtils.dprint("solidfloor: "..tostring(sf))

    -- fixtureObj:setSquare(moveSquare)
    -- fixtureObj:getModData().canBeWaterPiped = false
    -- fixtureObj:setUsesExternalWaterSource(true)
    -- fixtureObj:transmitModData()
    -- fixtureObj:sendObjectChange('usesExternalWaterSource', { value = true })
    -- fixtureObj:doFindExternalWaterSource()
    -- fixtureObj:setSquare(fixtureSquare)
    -- fixtureObj:transmitModData()
    -- fixtureSquare:transmitModdata()
    -- fixtureSquare:setSquareChanged()

end

function dwap_rt()
    local x = 2946
    local y = 12536
    local z = -1
    local metaGrid = getWorld():getMetaGrid()
    local cell = getCell()
    local square = getSquare(x, y, z)
    local building = square:getBuilding()
    if not building then
        DWAPUtils.dprint("No building found")
        return
    end
    local buildingDef = building:getDef()
    if not buildingDef then
        DWAPUtils.dprint("No building def found")
        return
    end
    local buildingDefX = buildingDef and buildingDef:getX() or 0
    local buildingDefY = buildingDef and buildingDef:getY() or 0
    if type(buildingDefX) ~= "number" then
        DWAPUtils.dprint("buildingDefX is not a number: " .. tostring(buildingDefX))
        buildingDefX = 0
    end
    if type(buildingDefY) ~= "number" then
        DWAPUtils.dprint("buildingDefY is not a number: " .. tostring(buildingDefY))
        buildingDefY = 0
    end

    DWAPUtils.dprint("CellSizeInSquares "..tostring(cell.CellSizeInSquares))
    buildingDefX = buildingDefX / cell.CellSizeInSquares
    DWAPUtils.dprint("buildingDefX "..tostring(buildingDefX))
    buildingDefY = buildingDefY / cell.CellSizeInSquares
    local metacell = metaGrid and metaGrid:getCellData(buildingDefX, buildingDefY)
    if not metacell then
        DWAPUtils.dprint("No metacell found")
        return
    end
    local rooms = buildingDef:getRooms()
    metacell:addRooms(rooms, buildingDefX * cell.CellSizeInSquares, buildingDefY * cell.CellSizeInSquares)
    metaGrid:addRoomsToAdjacentCells(buildingDef, rooms)
end

function bag_test()
    local ii = instanceItem("Bag_BigHikingBag")
    DWAPUtils.dprint("InstanceItem")
    DWAPUtils.dprint(Reflection.getClassName(ii))
    DWAPUtils.dprint(ii:getType())
    DWAPUtils.dprint(ii:getCategory())

    local ii2 = instanceItem("Bag_Satchel_Fishing")
    DWAPUtils.dprint("InstanceItem2")
    DWAPUtils.dprint(Reflection.getClassName(ii2))
    DWAPUtils.dprint(ii2:getType())
    DWAPUtils.dprint(ii2:getCategory())


    -- for i = 1, #fieldNames do
    --     local fieldName = fieldNames[i]
    --     local fieldValue = Reflection.getField(instanceItem, fieldName)
    --     DWAPUtils.dprint(("Field %s: %s"):format(fieldName, tostring(fieldValue)))
    -- end
end

function RecipeTest()
    local recipes = CraftRecipeManager.getRecipesForTag("Farming")
    DWAPUtils.dprint("Recipes "..recipes:size())
    for i = 0, recipes:size()-1 do
        local recipe = recipes:get(i)
        DWAPUtils.dprint("Recipe "..i.." "..recipe:getName())
        if recipe and recipe:getName() == "OpenPacketOfSeeds" then
            DWAPUtils.dprint(tostring(recipe:canUseItem("OnionBagSeed")))
            DWAPUtils.dprint(tostring(recipe:canUseItem("CabbageBagSeed2_Empty")))
            -- DWAPUtils.dprint("Recipe found")
            -- -- reflection
            -- DWAPUtils.dprint(Reflection.getClassName(recipe))
            -- local inputs = recipe:getInputs()
            -- DWAPUtils.dprint("Inputs "..inputs:size())
            -- for j = 0, inputs:size()-1 do
            --     local input = inputs:get(j)
            --     DWAPUtils.dprint("Input "..j.." "..Reflection.getClassName(input))
            --     local getPossibleInputItemsList = input:getPossibleInputItems()()
            --     DWAPUtils.dprint("PossibleInputItems "..getPossibleInputItemsList:size())
            --     for k = 0, getPossibleInputItemsList:size()-1 do
            --         local item = getPossibleInputItemsList:get(k)
            --         DWAPUtils.dprint("Item "..k.." "..Reflection.getClassName(item))
            --     end
            -- end
            -- -- local fields = Reflection.getClassFieldNames(Reflection.getClassName(recipe))
            -- -- DWAPUtils.dprint(fields)
            -- -- for j = 1, #fields do
            -- --     local fieldName = fields[j]
            -- --     local fieldValue = Reflection.getField(recipe, fieldName)
            -- --     DWAPUtils.dprint(("Field %s: %s"):format(fieldName, tostring(fieldValue)))
            -- -- end
            break
        end
    end
end


-- Events.OnPostMapLoad.Add(function()
--     DWAPUtils.dprint("DWAPEvents OnPostMapLoad")
-- end)

-- Events.OnPreMapLoad.Add(function()
--     DWAPUtils.dprint("DWAPEvents OnPreMapLoad")
-- end)

-- Events.OnGameTimeLoaded.Add(function()
--     DWAPUtils.dprint("DWAPEvents OnGameTimeLoaded")
-- end)

-- Events.OnLoad.Add(function()
--     DWAPUtils.dprint("DWAPEvents OnLoad")
-- end)

-- Events.OnInitWorld.Add(function()
--     DWAPUtils.dprint("DWAPEvents OnInitWorld")
-- end)

-- Events.OnInitGlobalModData.Add(function()
--     DWAPUtils.dprint("DWAPEvents OnInitGlobalModData")
-- end)

-- Events.OnInitRecordedMedia.Add(function()
--     DWAPUtils.dprint("DWAPEvents OnInitRecordedMedia")
-- end)

function vhs_test()
    local item = DWAP_LootSpawning.nameMediaItem("VHS_Retail")
    local player = getPlayer()
    player:getInventory():AddItem(item)
end

function fix_19_gen()
    local DWAP_GenData = ModData.getOrCreate("DWAP_GenData")
    DWAP_GenData.init = false
    DWAPUtils.dprint("DWAP_GenData init set to false")
end

function showbexiting()
    DWAPUtils.dprint(Core.bExiting)
end

function TestClientConn()
    local conf = { sprite = "fixtures_sinks_01_9", x = 12835, y = 1610, z = 0, sourceType="tank", source = {x = 12835, y = 1614, z = 1} }
    local square = getCell():getGridSquare(conf.x, conf.y, conf.z)
    if not square then
        DWAPUtils.dprint("TestClientConn: No square found at " .. conf.x .. "," .. conf.y .. "," .. conf.z)
        return
    end
    local count = square:getObjects():size()
    local targetObj = nil
    for i = 1, count do
        local obj = square:getObjects():get(i - 1)
        if obj and obj:getSprite() and obj:getSprite():getName() == conf.sprite then
            targetObj = obj
            break
        end
    end

    if not targetObj then
        DWAPUtils.dprint("TestClientConn: No object found with sprite " .. conf.sprite)
        return
    end
    DWAPUtils.connectWaterTank(targetObj, {
        x = conf.source.x,
        y = conf.source.y,
        z = conf.source.z,
    })
end

function TestFindWaterSourceOnSquare()
    local square = getCell():getGridSquare(12835, 1614, 1)
    if not square then
        DWAPUtils.dprint("TestFindWaterSourceOnSquare: No square found at 12835,1614,1")
        return
    end
    local objects = square:getObjects()
    local count = objects:size()
    for i = 0, count - 1 do
        local obj = objects:get(i)
        if obj and obj:getSprite() then
            DWAPUtils.dprint(("TestFindWaterSourceOnSquare: Object %s found on square %s,%s,%s"):format(obj:getSprite():getName(), square:getX(), square:getY(), square:getZ()))
        end
    end
    local foundObject = IsoObject.FindWaterSourceOnSquare(square)
    if not foundObject then
        DWAPUtils.dprint("TestFindWaterSourceOnSquare: No water source found on square")
        return
    end
    DWAPUtils.dprint("TestFindWaterSourceOnSquare: Found water source on square")
    DWAPUtils.dprint(("TestFindWaterSourceOnSquare: Water source %s found"):format(foundObject:getSprite():getName()))
end
