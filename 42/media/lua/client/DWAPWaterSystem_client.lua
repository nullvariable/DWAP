require "Map/CGlobalObjectSystem"
local DWAPUtils = require("DWAPUtils")

local DWAPWaterObject = require "DWAPWaterObject_client"

local DWAPWaterSystem = CGlobalObjectSystem:derive("DWAPWaterSystem")

function DWAPWaterSystem:noise(message)
    if self.wantNoise then
        if type(message) == "string" then
            print(self.systemName .. ': ' .. message)
        else
            DWAPUtils.dprint(message)
        end
    end
end

function DWAPWaterSystem:new()
    return CGlobalObjectSystem.new(self, "DWAPWaterSystem")
end

function DWAPWaterSystem:initSystem()
    self:noise("Client system initialized")
end

function DWAPWaterSystem:newLuaObject(globalObject)
    return DWAPWaterObject:new(self, globalObject)
end

CGlobalObjectSystem.RegisterSystemClass(DWAPWaterSystem)

return DWAPWaterSystem
