if isClient() then return end

require("DWAP/DWAPPowerSystem_server")
local DWAPPowerObject = require("DWAP/DWAPPowerObject_server")
local ghostGeneratorSpriteName = "dwap_tiles_01_1"
local controlSpriteName = "industry_02_67" -- at some point we might want to use others, but for now this is the only one we're using
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

MapObjects.OnNewWithSprite(controlSpriteName, function(object)
    DWAPPowerSystem.instance:noise("Control panel found at " .. tostring(object:getX()) .. ", " .. tostring(object:getY()) .. ", " .. tostring(object:getZ()))
    DWAPPowerSystem.instance:maybeConfigureControlPanel(object)
end, PRIORITY)

MapObjects.OnLoadWithSprite(controlSpriteName, function(object)
    DWAPPowerSystem.instance:noise("Loading control panel at " .. tostring(object:getX()) .. ", " .. tostring(object:getY()) .. ", " .. tostring(object:getZ()))
    DWAPPowerSystem.instance:maybeConfigureControlPanel(object)
    DWAPPowerSystem.instance:loadIsoObject(object)
end, PRIORITY)
