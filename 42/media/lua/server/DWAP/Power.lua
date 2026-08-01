if isClient() then return end

require("DWAP/DWAPPowerSystem_server")
local DWAPUtils = require("DWAPUtils")
local DWAPPowerObject = require("DWAP/DWAPPowerObject_server")
local ghostGeneratorSpriteName = "dwap_tiles_01_1"
local PRIORITY = 37


MapObjects.OnNewWithSprite(ghostGeneratorSpriteName, function(object)
    DWAPPowerSystem.instance:noise("New Ghost generator found at " .. tostring(object:getX()) .. ", " .. tostring(object:getY()) .. ", " .. tostring(object:getZ()))
    local generator = DWAPPowerObject.convertToIsoGenerator(object)
    if generator then
        DWAPPowerSystem.instance:noise("Ghost generator IsoGenerator found/created")
        DWAPPowerSystem.instance:configureGhostGenerator(generator)
    else
        DWAPPowerSystem.instance:noise("Failed to convert ghost generator")
    end
end, PRIORITY)

MapObjects.OnLoadWithSprite(ghostGeneratorSpriteName, function(object)
    if not object then return end
    DWAPPowerSystem.instance:noise("Loading ghost generator at " .. tostring(object:getX()) .. ", " .. tostring(object:getY()) .. ", " .. tostring(object:getZ()))

    DWAPPowerSystem.instance:configureGhostGenerator(object)
    local generator = DWAPPowerObject.convertToIsoGenerator(object)

    DWAPPowerSystem.instance:loadIsoObject(generator)
end, PRIORITY)

local registeredControlSprites = {}
local function registerControlSprite(spriteName)
    if registeredControlSprites[spriteName] then return end
    registeredControlSprites[spriteName] = true
    MapObjects.OnNewWithSprite(spriteName, function(object)
        DWAPPowerSystem.instance:noise("Control panel found at " .. tostring(object:getX()) .. ", " .. tostring(object:getY()) .. ", " .. tostring(object:getZ()))
        DWAPPowerSystem.instance:maybeConfigureControlPanel(object)
    end, PRIORITY)
    MapObjects.OnLoadWithSprite(spriteName, function(object)
        DWAPPowerSystem.instance:noise("Loading control panel at " .. tostring(object:getX()) .. ", " .. tostring(object:getY()) .. ", " .. tostring(object:getZ()))
        DWAPPowerSystem.instance:maybeConfigureControlPanel(object)
        DWAPPowerSystem.instance:loadIsoObject(object)
    end, PRIORITY)
end

local registeredTankSprites = {}
local function registerTankSprite(spriteName)
    if registeredTankSprites[spriteName] then return end
    registeredTankSprites[spriteName] = true
    MapObjects.OnNewWithSprite(spriteName, function(object)
        DWAPPowerSystem.instance:noise("Fuel tank found at " .. tostring(object:getX()) .. ", " .. tostring(object:getY()) .. ", " .. tostring(object:getZ()))
        DWAPPowerSystem.instance:maybeConfigureFuelTank(object)
    end, PRIORITY)
    MapObjects.OnLoadWithSprite(spriteName, function(object)
        if not object then return end
        DWAPPowerSystem.instance:noise("Loading fuel tank at " .. tostring(object:getX()) .. ", " .. tostring(object:getY()) .. ", " .. tostring(object:getZ()))
        local modData = object:getModData()
        if modData.DWAPObjectType ~= "fuelTank" then
            -- never converted, the chunk was saved before the tank existed
            DWAPPowerSystem.instance:maybeConfigureFuelTank(object)
            return
        end
        -- the mirror kept draining while the chunk was unloaded, so it wins
        DWAPPowerSystem.instance:pushTankFuel(modData.DWAPGeneratorIndex)
        DWAPPowerSystem.instance:loadIsoObject(object)
    end, PRIORITY)
end

Events.OnInitGlobalModData.Add(function()
    if DWAPUtils.getSaveVersion() < 17 or not SandboxVars.DWAP.EnableGenSystem then return end
    local configs = DWAPUtils.loadConfigs()
    if not configs then return end
    for i = 1, #configs do
        local config = configs[i]
        if config and config.generators then
            for j = 1, #config.generators do
                local gen = config.generators[j]
                if gen.controls and gen.controls.sprite then
                    registerControlSprite(gen.controls.sprite)
                end
                if gen.fuelTank and gen.fuelTank.sprite then
                    registerTankSprite(gen.fuelTank.sprite)
                end
            end
        end
    end
end)
