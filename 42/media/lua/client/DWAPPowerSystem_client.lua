require "Map/CGlobalObjectSystem"
local DWAPUtils = require("DWAPUtils")
local GeneratorWindow = require("GeneratorWindow")
local DWAPPowerObject = require "DWAPPowerObject_client"
local DWAPPowerSystem = CGlobalObjectSystem:derive("DWAPPowerSystem")

function DWAPPowerSystem:noise(message)
    if self.wantNoise then
        if type(message) == "string" then
            print(self.systemName .. ': ' .. message)
        else
            DWAPUtils.dprint(message)
        end
    end
end

function DWAPPowerSystem:new()
    return CGlobalObjectSystem.new(self, "DWAPPowerSystem")
end

function DWAPPowerSystem:initSystem()
    self:noise("Client system initialized")
    if getActivatedMods():contains("\\ISA") and SandboxVars.DWAP.EnableGenSystemSolar then
        self.canUseSolar = true
        self.ISA = require "ImmersiveSolarArrays/Utilities"
    end
end

function DWAPPowerSystem:newLuaObject(globalObject)
    return DWAPPowerObject:new(self, globalObject)
end

function DWAPPowerSystem:getGeneratorInfo(index)

    if not self.generators or not self.generators[index] then
        return nil
    end
    local generator = self.generators[index]
    if not generator then
        return nil
    end
    local combinedData = {
        running = generator.running,
        fuel = generator.fuel,
        capacity = generator.capacity,
        condition = generator.condition,
        solarEnabled = generator.solarEnabled or false,
        hasSolar = generator.solar and generator.solar.powerbank ~= nil,
        totalPowerUsing = 0,
        itemsPowered = {},
    }

    local itemCounts = {}
    local totalItems = 0
    -- DWAPUtils.dprint("Generator " .. index .. " data:")
    -- DWAPUtils.dprint(generator)
    -- DWAPUtils.dprint(generator.objectsPowered)
    for _, squareData in pairs(generator.objectsPowered) do
        -- Add up the power drain from this chunk
        combinedData.totalPowerUsing = combinedData.totalPowerUsing + (squareData.drain or 0)

        -- Consolidate items
        if squareData.items then
            -- Split the comma-separated string into individual items
            for itemName in string.gmatch(squareData.items, "([^,]+)") do
                itemName = itemName:trim() -- Remove any whitespace
                if itemCounts[itemName] then
                    itemCounts[itemName] = itemCounts[itemName] + 1
                else
                    itemCounts[itemName] = 1
                end
                totalItems = totalItems + 1
            end
        end
    end

    if self.canUseSolar and combinedData.hasSolar then
        combinedData.connectedPanels = 0
        combinedData.batteryCharge = 0
        combinedData.batteryMaxCapacity = 0
        local powerbankConfig = generator.solar.powerbank
        local powerbank = self.ISA.PBSystem_Client:getLuaObjectAt(powerbankConfig.x, powerbankConfig.y, powerbankConfig.z)
        if powerbank then
            combinedData.connectedPanels = powerbank.npanels or 0
            combinedData.batteryCharge = powerbank.charge or 0
            combinedData.batteryMaxCapacity = powerbank.maxcapacity or 0
        end
    end

    -- Convert itemCounts to the display format
    for itemName, count in pairs(itemCounts) do
        if count > 1 then
            table.insert(combinedData.itemsPowered, itemName .. " x" .. count)
        else
            table.insert(combinedData.itemsPowered, itemName)
        end
    end

    combinedData.totalPowerUsing = luautils.round(combinedData.totalPowerUsing, 3)
    self:noise("Generator " .. index .. " total power using: " .. combinedData.totalPowerUsing .. " by " .. totalItems .. " items")
    return combinedData
end

function DWAPPowerSystem:OnServerCommand(command, args)
    if command == "refreshGenData" then
        self:noise("Received refreshGenData command")
        if args and args.generatorIndex then
            for key, value in pairs(args.data) do
                self.generators[args.generatorIndex][key] = value
            end
            self:noise("Updated generator data for index " .. args.generatorIndex)
        else
            self:noise("refreshGenData command missing generatorIndex or data")
        end
        if GeneratorWindow and GeneratorWindow.instance then
            GeneratorWindow.instance:updateGeneratorData()
        end
    else
        self:noise("Unknown command received: " .. command)
    end
end

CGlobalObjectSystem.RegisterSystemClass(DWAPPowerSystem)

return DWAPPowerSystem
