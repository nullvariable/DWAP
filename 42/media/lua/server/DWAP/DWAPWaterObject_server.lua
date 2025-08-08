if isClient() then return end

require "Map/SGlobalObject"
local DWAPUtils = require("DWAPUtils")

---@class DWAPWaterObject_Server : SGlobalObject
---@field luaSystem DWAPWaterSystem_Server
local DWAPWaterObject = SGlobalObject:derive("DWAPWaterObject")

function DWAPWaterObject:new(luaSystem, globalObject)
    return SGlobalObject.new(self, luaSystem, globalObject)
end

function DWAPWaterObject:initNew()
    self.objectType = "tank" -- "tank" or "fixture"
    self.connection = { x = nil, y = nil, z = nil }
end

---called from loadIsoObject function when making new globalObject & luaObject
function DWAPWaterObject:stateFromIsoObject(isoObject)
    self:initNew()

    -- Load data from modData that was set by Water.lua
    self:fromModData(isoObject:getModData())

    -- If this is a fixture and has a connection, establish the plumbing connection
    if self.objectType == "fixture" and self.connection.x and self.connection.y and self.connection.z then
        DWAPUtils.connectWaterTank(isoObject, {
            x = self.connection.x,
            y = self.connection.y,
            z = self.connection.z
        })
    end

    -- Sync with clients if needed
    if isServer() then
        isoObject:transmitModData()
    end
end

---called from loadIsoObject function when luaObject exists
function DWAPWaterObject:stateToIsoObject(isoObject)
    -- Sync lua object state to iso object
    self:toModData(isoObject:getModData())

    -- If this is a fixture and has a connection, ensure plumbing connection is active
    if self.objectType == "fixture" and self.connection.x and self.connection.y and self.connection.z then
        DWAPUtils.connectWaterTank(isoObject, {
            x = self.connection.x,
            y = self.connection.y,
            z = self.connection.z
        })
    end

    if isServer() then
        isoObject:transmitModData()
    end
end

function DWAPWaterObject:fromModData(modData)
    self.objectType = modData.objectType or modData["objectType"] or "tank"
    self.connection = modData.connection or modData["connection"] or { x = nil, y = nil, z = nil }
end

function DWAPWaterObject:toModData(modData)
    modData.objectType = self.objectType
    modData.connection = self.connection
end

function DWAPWaterObject:isFixture()
    return self.objectType == "fixture"
end

function DWAPWaterObject:isTank()
    return self.objectType == "tank"
end

function DWAPWaterObject:setConnection(x, y, z)
    self.connection = { x = x, y = y, z = z }
    self:saveData(true)
end

function DWAPWaterObject:clearConnection()
    self.connection = { x = nil, y = nil, z = nil }
    self:saveData(true)
end

function DWAPWaterObject:saveData(transmit)
    local isoObject = self:getIsoObject()
    if not isoObject then return end
    self:toModData(isoObject:getModData())
    if transmit and isServer() then
        isoObject:transmitModData()
    end
end

--- Static method to handle new fixture objects created by MapObjects
--- @param isoObject IsoObject The fixture object
--- @param data table Object data from config
--- @param waterSystem DWAPWaterSystem The water system instance
function DWAPWaterObject.onNewFixtureObject(isoObject, data, waterSystem)
    if not waterSystem.active then return end
    waterSystem:noise("Setting up fixture at " .. data.x .. "," .. data.y .. "," .. data.z)

    local modData = isoObject:getModData()
    modData.objectType = "fixture"
    modData.waterSource = data.source or nil

    -- Set connection if there's a source
    if data.source then
        modData.connection = {
            x = data.source.x,
            y = data.source.y,
            z = data.source.z
        }

        -- If water is already shut off, connect immediately
        if waterSystem.waterIsShutoff then
            DWAPUtils.Defer(function()
                DWAPUtils.connectWaterTank(isoObject, {
                    x = data.source.x,
                    y = data.source.y,
                    z = data.source.z
                })
            end)
        end
    else
        modData.connection = { x = nil, y = nil, z = nil }
    end

    -- Transmit mod data to clients
    isoObject:transmitModData()
end

--- Static method to handle new tank objects created by MapObjects
--- @param isoObject IsoObject The tank object
--- @param data table Object data from config
--- @param waterSystem DWAPWaterSystem The water system instance
function DWAPWaterObject.onNewTankObject(isoObject, data, waterSystem)
    if not waterSystem.active then return end
    waterSystem:noise("Setting up fluid container for tank at " .. data.x .. "," .. data.y .. "," .. data.z)

    -- Set up mod data first
    local modData = isoObject:getModData()
    modData.objectType = "tank"
    modData.connection = { x = nil, y = nil, z = nil }
    modData.waterSource = data.source or nil

    -- Replace the object with a thumpable
    local square = getCell():getGridSquare(data.x, data.y, data.z)
    if not square then
        waterSystem:noise("No square found at " .. data.x .. "," .. data.y .. "," .. data.z)
        return
    end
    local index = isoObject:getObjectIndex()
    local thumpable = IsoThumpable.new(isoObject:getCell(), square, data.sprite, false)

    -- Copy mod data to new thumpable object
    local thumpableModData = thumpable:getModData()
    thumpableModData.objectType = "tank"
    thumpableModData.connection = { x = nil, y = nil, z = nil }
    thumpableModData.waterSource = data.source or nil

    -- Create and add fluid container
    local fluidContainer = ComponentType.FluidContainer:CreateComponent()
    if fluidContainer then
        -- Use pcall to safely attempt fluid container setup
        pcall(function()
            if fluidContainer.setCapacity then
                fluidContainer:setCapacity(SandboxVars.DWAP.WaterTankCapacity or 4000)
            end
            if fluidContainer.addFluid then
                fluidContainer:addFluid(FluidType.Water, SandboxVars.DWAP.WaterLevel or 2000)
            end
        end)
        GameEntityFactory.AddComponent(thumpable, true, fluidContainer)
    end

    square:AddTileObject(thumpable)
    square:transmitRemoveItemFromSquare(isoObject)
    square:RemoveTileObject(isoObject)
    square:transmitAddObjectToSquare(thumpable, index)

    waterSystem:noise("Fluid container added to tank at " .. data.x .. "," .. data.y .. "," .. data.z)
end

return DWAPWaterObject
