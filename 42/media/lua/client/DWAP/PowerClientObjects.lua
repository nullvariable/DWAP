if not isClient() then return end

local DWAPUtils = require("DWAPUtils")

-- The invisible generators are kept out of the cell's process list so vanilla
-- update() never drains them or plays GeneratorLoop at the ghost tile. That
-- removal happens in DWAPPowerObject_server, which MP clients never load, so
-- every client was running the vanilla loop sound on top of the mod's own
-- control panel emitter. Do the same removal client side.
local ghostGeneratorSpriteName = "dwap_tiles_01_1"
local PRIORITY = 37

local function removeFromProcessList(object)
    if not object then return end
    if object:getModData().DWAPObjectType ~= "generator" then return end
    local cell = getCell()
    if not cell then return end
    cell:addToProcessIsoObjectRemove(object)
    DWAPUtils.dprint(("DWAP: client removed ghost generator at %s,%s,%s from the process list")
        :format(object:getX(), object:getY(), object:getZ()))
end

MapObjects.OnNewWithSprite(ghostGeneratorSpriteName, removeFromProcessList, PRIORITY)
MapObjects.OnLoadWithSprite(ghostGeneratorSpriteName, removeFromProcessList, PRIORITY)
