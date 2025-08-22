
if isClient() then return end

require "DWAP/DWAPWaterSystem_server"
local DWAPUtils = require("DWAPUtils")
local DWAPWaterObject = require "DWAP/DWAPWaterObject_server"
local hashCoords = DWAPUtils.hashCoords
local hashedObjects = {}
local tankSprites = {}
local fixtureSprites = {}
local PRIORITY = 37

local function onNewWithSprite(isoObject)
    local sprite = isoObject:getSprite()
    if not sprite then return end
    local spriteName = sprite:getName()
    local hashed = hashCoords(isoObject:getX(), isoObject:getY(), isoObject:getZ())
    -- DWAPWaterSystem.instance:noise("DWAPWaterSystem onNewWithSprite: " .. tostring(spriteName) .. " at " .. tostring(hashed))

    if hashedObjects[hashed] then
        local objectData = hashedObjects[hashed]
        if objectData.type == "tank" and tankSprites[spriteName] then
            DWAPWaterObject.onNewTankObject(isoObject, objectData, DWAPWaterSystem.instance)
        elseif objectData.type == "fixture" and fixtureSprites[spriteName] then
            DWAPWaterObject.onNewFixtureObject(isoObject, objectData, DWAPWaterSystem.instance)
        end
    end
end

local function onLoadWithSprite(isoObject)
    if not DWAPWaterSystem.instance then
        DWAPUtils.dprint("DWAPWaterSystem instance not found, cannot load water object")
        return
    end
    pcall(function()
        DWAPWaterSystem.instance:loadIsoObject(isoObject)
    end)
end

Events.OnInitGlobalModData.Add(function()
    if DWAPUtils.getSaveVersion() < 17 or not SandboxVars.DWAP.EnableWaterSystem then
        return
    end

    local configs = DWAPUtils.loadConfigs()
    for i = 1, #configs do
        local config = configs[i]
        if config then
            if config.waterTanks then
                for j = 1, #config.waterTanks do
                    local tank = config.waterTanks[j]
                    if tank then
                        local hashed = hashCoords(tank.x, tank.y, tank.z)
                        hashedObjects[hashed] = {type = "tank", sprite = tank.sprite, x = tank.x, y = tank.y, z = tank.z}
                        if tank.source then
                            local x,y,z
                            if type(tank.source) == "number" then
                                x, y, z = config.generators[tank.source].controls.x,
                                          config.generators[tank.source].controls.y,
                                          config.generators[tank.source].controls.z
                            else
                                x, y, z = tank.source.x, tank.source.y, tank.source.z
                            end
                            hashedObjects[hashed].source = {x = x, y = y, z = z}
                        end
                        tankSprites[tank.sprite] = true
                    end
                end
                for j = 1, #config.waterFixtures do
                    local fixture = config.waterFixtures[j]
                    if fixture and fixture.sprite then
                        local hashed = hashCoords(fixture.x, fixture.y, fixture.z)
                        hashedObjects[hashed] = {type = "fixture", sprite = fixture.sprite, x = fixture.x, y = fixture.y, z = fixture.z}
                        if type(fixture.source) == "number" then
                            hashedObjects[hashed].source = {
                                x = config.waterTanks[fixture.source].x,
                                y = config.waterTanks[fixture.source].y,
                                z = config.waterTanks[fixture.source].z
                            }
                        else
                            hashedObjects[hashed].source = {
                                x = fixture.source.x,
                                y = fixture.source.y,
                                z = fixture.source.z
                            }
                        end
                        fixtureSprites[fixture.sprite] = true
                    end
                end
            end
        end
    end
    for sprite in pairs(tankSprites) do
        MapObjects.OnNewWithSprite(sprite, onNewWithSprite, PRIORITY)
        MapObjects.OnLoadWithSprite(sprite, onLoadWithSprite, PRIORITY)
    end
    for sprite in pairs(fixtureSprites) do
        MapObjects.OnNewWithSprite(sprite, onNewWithSprite, PRIORITY)
        MapObjects.OnLoadWithSprite(sprite, onLoadWithSprite, PRIORITY)
    end
end)