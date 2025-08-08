require "Map/CGlobalObject"
local DWAPUtils = require("DWAPUtils")

---@class DWAPWaterObject_Client : CGlobalObject
---@field luaSystem DWAPWaterSystem_Client
local DWAPWaterObject = CGlobalObject:derive("DWAPWaterObject")

function DWAPWaterObject:new(luaSystem, globalObject)
    return CGlobalObject.new(self, luaSystem, globalObject)
end

function DWAPWaterObject:fromModData(modData)
    -- Only use new system if save version is 17 or newer
    if DWAPUtils.getSaveVersion() < 17 then
        return
    end

    self.objectType = modData["objectType"] or "tank"
    self.connection = modData["connection"] or { x = nil, y = nil, z = nil }
end

---Check if this is a tank object
function DWAPWaterObject:isTank()
    return self.objectType == "tank"
end

---Check if this is a fixture object
function DWAPWaterObject:isFixture()
    return self.objectType == "fixture"
end

---Check if fixture is connected to a tank
function DWAPWaterObject:isConnected()
    local isoObject = self:getIsoObject()
    if not isoObject then return false end
    return isoObject:getUsesExternalWaterSource() and isoObject:hasExternalWaterSource()
end

return DWAPWaterObject
