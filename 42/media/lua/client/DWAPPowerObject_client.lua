require "Map/CGlobalObject"
local DWAPUtils = require("DWAPUtils")

---@class DWAPPowerObject_Client : CGlobalObject
---@field luaSystem DWAPPowerSystem
local DWAPPowerObject = CGlobalObject:derive("DWAPPowerObject")

function DWAPPowerObject:new(luaSystem, globalObject)
    return CGlobalObject.new(self, luaSystem, globalObject)
end

function DWAPPowerObject:fromModData(modData)
    -- Only use new system if save version is 17 or newer
    if DWAPUtils.getSaveVersion() < 17 then
        return
    end

    self.DWAPObjectType = modData["DWAPObjectType"] or "generator"
    self.DWAPGeneratorIndex = modData["DWAPGeneratorIndex"] or -1
end

---Check if this is a tank object
function DWAPPowerObject:isGhostGenerator()
    return self.DWAPObjectType == "generator"
end

---Check if this is a control panel object
function DWAPPowerObject:isControlPanel()
    return self.DWAPObjectType == "controlPanel"
end

return DWAPPowerObject
