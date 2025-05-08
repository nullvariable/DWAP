DWAP_Props = DWAP_Props or {}
local DWAPUtils = require("DWAPUtils")
local IsoObjectUtils = require("Starlit/IsoObjectUtils")
local hashCoords = DWAPUtils.hashCoords

--- @class objectSpawn
--- @field x number
--- @field y number
--- @field z number
--- @field renderYOffset? number
--- @field sprite? string
--- @field enabled? string Optional Sandbox variable to enable this spawn
--- @field clearExisting? boolean
--- @field isContainer? boolean
--- @field isDoor? boolean
--- @field doorN? boolean
--- @field isFloor? boolean
--- @field isFireplace? boolean
--- @field isStove? boolean
--- @field tunnelZ? number
--- @field replaceWall? boolean
--- @field isLightSwitch? boolean
--- @field room? table coords for the room to attach a square to
--- @field barricade? string barricade type
--- @field target? string barricade object to target
--- @field IsoType? string IsoType

--- @param spawn objectSpawn
--- @return number
local function hashObjectSpawn(spawn)
    local h = 5381
    local str = spawn.sprite or ""
    for i = 1, #str do
       h = h*32 + h + str:byte(i)
    end
    return hashCoords(spawn.x, spawn.y, spawn.z) + h
end

local function canDestroy(object)
    local props = object:getProperties()
	if not props then return false end
	if props:Is(IsoFlagType.vegitation) then return false end
    if props:Is(IsoFlagType.solidfloor) then return false end
    if props:Is(IsoFlagType.transparentFloor) then return false end
    -- if props:Is(IsoFlagType.attachedFloor) then return false end
    if props:Is(IsoFlagType.diamondFloor) then return false end
    if props:Is(IsoFlagType.floorE) then return false end
    if props:Is(IsoFlagType.floorS) then return false end
    if props:Is(IsoFlagType.DoorWallN) then return false end
    if props:Is(IsoFlagType.DoorWallW) then return false end
    if props:Is(IsoFlagType.WallN) then return false end
    if props:Is(IsoFlagType.WallNTrans) then return false end
    if props:Is(IsoFlagType.WallNW) then return false end
    if props:Is(IsoFlagType.WallOverlay) then return false end
    if props:Is(IsoFlagType.WallSE) then return false end
    if props:Is(IsoFlagType.WallW) then return false end
    if props:Is(IsoFlagType.WallWTrans) then return false end
    local spriteName = object:getSprite():getName()
    if spriteName then
        if spriteName == "advertising_01_14" then return false end
        if spriteName == "lighting_outdoor_01_16" then return false end
        if spriteName == "lighting_outdoor_01_17" then return false end
        if luautils.stringStarts(spriteName, 'blends_natural_02') then return false end
        if luautils.stringStarts(spriteName, 'blends_grassoverlays') then return false end
        if luautils.stringStarts(spriteName, 'd_') then return false end
        if luautils.stringStarts(spriteName, 'e_') then return false end
        if luautils.stringStarts(spriteName, 'f_') then return false end
        if luautils.stringStarts(spriteName, 'vegetation_') and not luautils.stringStarts(spriteName, 'vegetation_indoor') then return false end

        if luautils.stringStarts(spriteName, 'street_curbs') then return false end
    end
    return true
end

--- Get an object from a square by sprite name
--- @param objects PZArrayList<IsoObject>
--- @param sprite string
--- @return IsoObject|nil object, number size object and the number of objects on the square
local function getSpriteObject(objects, sprite)
    local size = objects:size() - 1
    if size < 0 then return nil, size end
    for i = 0, size do
        local object = objects:get(i)
        if object and object:getSpriteName() == sprite then
            return object, size
        end
    end
    return nil, size
end

--- clear all objects from a square except for the one with the given sprite
--- @param objects PZArrayList<IsoObject>
--- @param square IsoGridSquare
--- @param sprite string
local function clearObjectsExcluding(objects, square, sprite)
    local size = objects:size() -1
    for j = size, 0, -1 do
        local sqObject = objects:get(j)
        if sqObject and canDestroy(sqObject) and sqObject:getTextureName() ~= sprite then
            DWAPUtils.dprint(("Trying to remove %s"):format(sqObject.getSpriteName and sqObject:getSpriteName() or "nil"))
            square:transmitRemoveItemFromSquare(sqObject)
            square:RemoveTileObject(sqObject)
            sledgeDestroy(sqObject)
        else
            DWAPUtils.dprint(("Not removing %s"):format(sqObject.getSpriteName and sqObject:getSpriteName() or "nil"))
        end
    end
end

local function isWall(object)
    local props = object:getProperties()
    if props:Is(IsoFlagType.DoorWallN) then return true end
    if props:Is(IsoFlagType.DoorWallW) then return true end
    if props:Is(IsoFlagType.WallN) then return true end
    if props:Is(IsoFlagType.WallNTrans) then return true end
    if props:Is(IsoFlagType.WallNW) then return true end
    if props:Is(IsoFlagType.WallOverlay) then return true end
    if props:Is(IsoFlagType.WallSE) then return true end
    if props:Is(IsoFlagType.WallW) then return true end
    if props:Is(IsoFlagType.WallWTrans) then return true end
    return false
end

local function clearWalls(objects, square, sprite)
    local size = objects:size() -1
    for j = size, 0, -1 do
        local sqObject = objects:get(j)
        if sqObject and isWall(sqObject) and sqObject:getTextureName() ~= sprite then
            DWAPUtils.dprint(("Trying to remove %s"):format(sqObject.getSpriteName and sqObject:getSpriteName() or "nil"))
            square:transmitRemoveItemFromSquare(sqObject)
            square:RemoveTileObject(sqObject)
            sledgeDestroy(sqObject)
        else
            DWAPUtils.dprint(("Not removing %s"):format(sqObject.getSpriteName and sqObject:getSpriteName() or "nil"))
        end
    end
end

function DWAP_Props.runHookOnExist(prop, params, attempts)
    if attempts > 30 then
        DWAPUtils.dprint(params)
        error("runHookOnExist: Too many attempts")
        return
    end
    if prop and prop:isExistInTheWorld() then
        DWAPSquareLoaded:RunHook('PropSpawned', params.x, params.y, params.z, params)
        local hash = hashObjectSpawn(params)
        ModData.getOrCreate("DWAP_Props").spawned[hash] = true
    elseif prop then
        -- if attempts is a multiple of 10, defer for an in game minute
        local delay = attempts % 10 == 0
        if delay then
            DWAPUtils.DeferMinute(function()
                DWAP_Props.runHookOnExist(prop, params, attempts + 1)
            end)
        else
            DWAPUtils.Defer(function()
                DWAP_Props.runHookOnExist(prop, params, attempts + 1)
            end)
        end
    end
end

--- Spawn an object on a square if it doesn't already exist
--- @param params objectSpawn
function DWAP_Props.maybeSpawnObject(params)
    DWAPUtils.dprint("DWAP_Props.maybeSpawnObject " .. params.x .. " " .. params.y)
    assert(params.x, "maybeSpawnObject: x is required")
    assert(params.y, "maybeSpawnObject: y is required")
    assert(params.z, "maybeSpawnObject: z is required")
    local square = getSquare(params.x, params.y, params.z)
    if params.tunnelZ then
        square = IsoObjectUtils.getOrCreateSquare(params.x, params.y, params.tunnelZ)
        if params.room then
            local sourceSquare = getSquare(params.room.x, params.room.y, params.room.z)
            if sourceSquare then
                local room = sourceSquare:getRoom()
                local roomDef = room:getRoomDef()
                local roomId = roomDef:getID()
                if room then
                    square:setRoom(room)
                    square:setRoomID(roomId)
                    room:addSquare(square)
                end
            end
        end
    end
    if not square then
        DWAPUtils.dprint(("DWAP_Props: No square found for maybeSpawnObject %s %s %s"):format(params.x, params.y, params.z))
        return
    end
    local existingObjects = square:getObjects()
    if params.clearExisting then
        clearObjectsExcluding(existingObjects, square, params.sprite)
    end
    if params.replaceWall then
        clearWalls(existingObjects, square, params.sprite)
    end
    if params.sprite and (not getSpriteObject(existingObjects, params.sprite) or params.renderYOffset) then
        local prop
        if params.isContainer then
            DWAPUtils.dprint(("DWAP_Props: Adding container %s to %s %s %s"):format(params.sprite, params.x, params.y, params.z))
            local obj = ISWoodenContainer:new(params.sprite, nil)
            prop = IsoThumpable.new(getCell(), square, params.sprite, false, obj)
            buildUtil.setInfo(prop, obj)
            prop:setIsContainer(true)
            prop:getContainer():setType("crate")
            prop:getContainer():setCapacity(50)
            if params.renderYOffset then
                DWAPUtils.dprint(("DWAP_Props: Setting renderYOffset %s"):format(params.renderYOffset))
                local sharedSprite = getSprite(params.sprite)
                if square and sharedSprite and sharedSprite:getProperties():Is("IsStackable") then
                    local props = ISMoveableSpriteProps.new(sharedSprite)
                    prop:setRenderYOffset(props:getTotalTableHeight(square))
                end
                prop:setRenderYOffset(params.renderYOffset)
            end
            square:AddSpecialObject(prop)
            -- DWAPUtils.Defer(function()
                -- local sq = getSquare(params.x, params.y, params.z)
                -- if sq then
                --     local cont = sq:getContainerItem("crate")
                --     DWAPUtils.dprint(("DWAP_Props: Filling container %s"):format(params.sprite))
                --     triggerEvent("onFillContainer", "all", cont:getType(), cont)
                -- end
                DWAPUtils.dprint(("DWAP_Props: Filling container %s %s %s"):format(params.sprite, params.x, params.y))
                -- triggerEvent("OnFillContainer", "Generic", prop:getType(), prop:getContainer())
                local cont = prop:getContainer()
                ItemPickerJava.fillContainer(cont, getPlayer())
            -- end)
        -- @TODO currently this doesn't have a container and so java crashes the whole game.
        -- elseif params.IsoType == "IsoCombinationWasherDryer" then
        --     prop = IsoCombinationWasherDryer.new(getCell(), square, getSprite(params.sprite))

        --     prop:setMovedThumpable(true)
        elseif params.IsoType == "IsoRadio" then
            prop = IsoRadio.new(getCell(), square, getSprite(params.sprite))
            prop:getDeviceData():setIsTurnedOn(true);
            prop:setMovedThumpable(true)
            square:AddTileObject(prop)
        elseif params.isFireplace then
            prop = IsoFireplace.new(getCell(), square, getSprite(params.sprite))
        elseif params.isStove then
            prop = IsoStove.new(getCell(), square, getSprite(params.sprite))
        elseif params.isDoor then
            DWAPUtils.dprint(("DWAP_Props: Adding door %s to %s %s %s"):format(params.sprite, params.x, params.y, params.z))
            prop = IsoDoor.new(getCell(), square, getSprite(params.sprite), params.doorN)
            square:AddSpecialObject(prop)
        elseif params.isFloor then
            local gb = instanceItem("Base.Gravelbag")
            local obj = ISNaturalFloor:new(params.sprite, nil, gb, getPlayer())
            prop = IsoThumpable.new(getCell(), square, params.sprite, false, obj)
            BuildRecipeCode.floor.OnCreate(prop)
        elseif params.isLightSwitch then
            prop = IsoLightSwitch.new(getCell(), square, getSprite(params.sprite), square:getRoomID())
            prop:addLightSourceFromSprite()
        else
            -- local prop = IsoObject.new(square, params.sprite)
            prop = IsoObject.getNew(square, params.sprite, params.sprite, false)
        end
        -- if params.renderYOffset then
        --     prop:setRenderYOffset(params.renderYOffset)
        -- end
        -- square:AddTileObject(prop)
        square:transmitAddObjectToSquare(prop, -1)
        DWAPUtils.dprint(("DWAP_Props: Added %s to %s %s %s"):format(params.sprite, params.x, params.y, params.z))
        -- DWAPUtils.Defer(function()
        --     DWAPUtils.dprint(DWAPSquareLoaded.HookedEvents.PropSpawned)
            -- DWAPSquareLoaded:RunHook('PropSpawned', params.x, params.y, params.z, params)
            DWAP_Props.runHookOnExist(prop, params, 0)
        -- end)
    end
    if params.barricade and params.target then
        for i = 0, existingObjects:size() - 1 do
            local obj = existingObjects:get(i)
            if obj and obj:getSpriteName() == params.target then
                local data = obj:getModData()
                if not data.barricade then
                    data.barricade = true
                else
                    return
                end
                local barricade = IsoBarricade.AddBarricadeToObject(obj, true)
                if not barricade then
                    return
                end
                if params.barricade == "metalbar" then
                    barricade:addMetalBar(nil, nil)
                end
                if params.barricade == "metal" then
                    barricade:addMetal(nil, nil)
                end
                if params.barricade == "wood" then
                    barricade:addPlank(nil, nil)
                    barricade:addPlank(nil, nil)
                    barricade:addPlank(nil, nil)
                    barricade:addPlank(nil, nil)
                end
                if params.barricade == "woodhalf" then
                    barricade:addPlank(nil, nil)
                    barricade:addPlank(nil, nil)
                end
                local barricade2 = IsoBarricade.AddBarricadeToObject(obj, false)
                if params.barricade == "metalbar" then
                    barricade2:addMetalBar(nil, nil)
                end
                if params.barricade == "metal" then
                    barricade2:addMetal(nil, nil)
                end
                if params.barricade == "wood" then
                    barricade2:addPlank(nil, nil)
                    barricade2:addPlank(nil, nil)
                    barricade2:addPlank(nil, nil)
                    barricade2:addPlank(nil, nil)
                end
                if params.barricade == "woodhalf" then
                    barricade2:addPlank(nil, nil)
                    barricade2:addPlank(nil, nil)
                end
                break
            end
        end
    end
end


Events.OnInitGlobalModData.Add(function()
-- Events.OnLoad.Add(function()
    local modData = ModData.getOrCreate("DWAP_Props")
    if not modData or not modData.init then
        modData.init = true
        modData.spawned = {}
    end
    local configs = DWAPUtils.loadConfigs()
    DWAPUtils.dprint("DWAP_Props.OnInitGlobalModData "..#configs)
    for i = 1, #configs do
        local config = configs[i]
        if config and config.objectSpawns then
            for j = 1, #config.objectSpawns do
                --- @type objectSpawn
                local os = config.objectSpawns[j]
                if not os.enabled or (os.enabled and SandboxVars.DWAP[os.enabled]) then
                    local spawnedKey = hashObjectSpawn(os)
                    if not modData.spawned[spawnedKey] then
                        DWAPUtils.dprint(("Adding object spawn %s %s %s"):format(os.sprite or "none", os.x, os.y))
                        DWAPSquareLoaded:AddEvent(
                            DWAP_Props.maybeSpawnObject,
                            os.x,
                            os.y,
                            os.z,
                            true,
                            os
                        )
                    end
                end
            end
        end
    end
    table.wipe(configs)
    -- DWAPUtils.dprint("Objects to spawn:")
    -- DWAPUtils.dprint(objectsToSpawn)
end)
