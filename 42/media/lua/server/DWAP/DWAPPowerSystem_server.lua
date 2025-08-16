if isClient() then return end

require "Map/SGlobalObjectSystem"
local DWAPUtils = require("DWAPUtils")
local random = newrandom()

local SOUNDVOLUME = 1

---@class DWAPPowerSystem : SGlobalObjectSystem
DWAPPowerSystem = SGlobalObjectSystem:derive("DWAPPowerSystem")
local DWAPPowerObject = require "DWAP/DWAPPowerObject_server"

function DWAPPowerSystem:noise(message)
    if self.wantNoise then
        if type(message) == "string" then
            print(self.systemName .. '[S]: ' .. message)
        else
            DWAPUtils.dprint(message)
        end
    end
end

function DWAPPowerSystem:new()
    local o = SGlobalObjectSystem.new(self, "DWAPPowerSystem")
    setmetatable(o, self)
    self.__index = self
    return o
end

function DWAPPowerSystem:loadGenerators()
    local configs = DWAPUtils.loadConfigs()
    local generators = {}
    local running = not DWAPUtils.WorldPowerStillAvailable() and SandboxVars.DWAP.AutoPowerGenSystem
    for i = 1, #configs do
        local config = configs[i]
        if config and config.generators then
            for j = 1, #config.generators do
                local gen = config.generators[j]
                if gen then
                    gen.running = running
                    gen.solarEnabled = false
                    gen.fuel = SandboxVars.DWAP.GeneratorFuel or 1000
                    gen.capacity = SandboxVars.DWAP.GeneratorFuelTank or 2000
                    gen.condition = SandboxVars.DWAP.GeneratorCondition or 100
                    gen.lastUpdate = getGameTime():getWorldAgeHours()
                    gen.objectsPowered = {}
                    gen.squaresLastValidated = -1
                    gen.autoPowerDone = running or not SandboxVars.DWAP.AutoPowerGenSystem
                    if not self.canUseSolar then
                        gen.solar = nil
                    end
                    generators[#generators + 1] = gen
                end
            end
        end
    end
    return generators
end

function DWAPPowerSystem:initSystem()
    SGlobalObjectSystem.initSystem(self)
    DWAPUtils.dprint("System initialized")
    self.system:setModDataKeys({ 'setupDone', 'generators', 'haveWorldPower' })
    self.system:setObjectModDataKeys({ 'DWAPObjectType', 'DWAPGeneratorIndex', 'DWAPEmitter' })
    self.system:setObjectSyncKeys({ 'DWAPObjectType', 'DWAPGeneratorIndex', 'DWAPEmitter' })
    if DWAPUtils.getSaveVersion() < 17 or not SandboxVars.DWAP.EnableGenSystem then
        self.active = false
        DWAPUtils.dprint("Skipping initialization due to save version or sandbox settings")
        return
    else
        self.active = true
    end
    self.canUseSolar = getActivatedMods():contains("\\ISA") and SandboxVars.DWAP.EnableGenSystemSolar or false
    if self.canUseSolar then
        self.PbSystem = require "ImmersiveSolarArrays/Powerbank/PowerBankSystem_Server"
    end
    if not self.setupDone then
        self:noise("Setting up power system")
        self.haveWorldPower = DWAPUtils.WorldPowerStillAvailable()
        local generators = self:loadGenerators()
        self.generators = generators

        self.ghostHashToIndex, self.controlHashToIndex = {}, {}
        for i = 1, #generators do
            local gen = generators[i]
            if gen and gen.fakeGenerators then
                for j = 1, #gen.fakeGenerators do
                    local fakeGen = gen.fakeGenerators[j]
                    if fakeGen then
                        local hash = DWAPUtils.hashCoords(fakeGen.x, fakeGen.y, fakeGen.z)
                        self.ghostHashToIndex[hash] = i
                    end
                end
            end
            if gen and gen.controls then
                local hash = DWAPUtils.hashCoords(gen.controls.x, gen.controls.y, gen.controls.z)
                self.controlHashToIndex[hash] = i
            end
        end
        self:noise("Loaded " .. #generators .. " generator configurations")
        self.setupDone = true
    else
        self:noise("Power system already set up")
    end
end

function DWAPPowerSystem:configureGhostGenerator(isoGenerator)
    local modData = isoGenerator:getModData()

    local x, y, z = isoGenerator:getX(), isoGenerator:getY(), isoGenerator:getZ()
    local hash = DWAPUtils.hashCoords(x, y, z)
    local genIndex = self.ghostHashToIndex[hash]
    if genIndex then
        modData.DWAPObjectType = "generator"
        modData.DWAPGeneratorIndex = genIndex
    end
end

function DWAPPowerSystem:maybeConfigureControlPanel(isoObject)
    local modData = isoObject:getModData()

    local x, y, z = isoObject:getX(), isoObject:getY(), isoObject:getZ()
    local hash = DWAPUtils.hashCoords(x, y, z)
    local genIndex = self.controlHashToIndex[hash]
    if genIndex then
        modData.DWAPObjectType = "controlPanel"
        modData.DWAPGeneratorIndex = genIndex
    end
end

function DWAPPowerSystem:isValidIsoObject(isoObject)
    if not isoObject then return false end

    -- Check if this object has DWAP power system mod data
    local modData = isoObject:getModData()
    return modData.DWAPObjectType ~= nil
end

function DWAPPowerSystem:newLuaObject(globalObject)
    self:noise("DWAPPowerSystem:newLuaObject")
    return DWAPPowerObject:new(self, globalObject)
end

function DWAPPowerSystem:getInitialStateForClient()
    self:noise("DWAPPowerSystem:getInitialStateForClient")
    return {
        generators = self.generators,
        active = self.active,
        canUseSolar = self.canUseSolar
    }
end

function DWAPPowerSystem:refreshClientGeneratorData(index)
    local generator = self.generators[index]
    if not generator then
        self:noise("Generator index " .. index .. " not found")
        return
    end
    self:sendCommand("refreshGenData", {
        generatorIndex = index,
        data = {
            running = generator.running,
            fuel = generator.fuel,
            solarEnabled = generator.solarEnabled,
            condition = generator.condition,
            objectsPowered = generator.objectsPowered,
        },
    })
end

function DWAPPowerSystem:OnClientCommand(command, playerObj, args)
    if command == "refreshGenData" then
        self:noise("Received refreshGenData command")
        if args and args.generatorIndex then
            self:refreshClientGeneratorData(args.generatorIndex)
        else
            self:noise("refreshGenData command missing generatorIndex or data")
        end
    elseif command == "TurnOnGen" then
        self:noise("Received TurnOnGen command")
        if args and args.generatorIndex then
            self:TurnOnGen(args.generatorIndex)
        else
            self:noise("TurnOnGen command missing index")
        end
    elseif command == "TurnOffGen" then
        self:noise("Received TurnOffGen command")
        if args and args.generatorIndex then
            self:TurnOffGen(args.generatorIndex)
        else
            self:noise("TurnOffGen command missing index")
        end
    else
        self:noise("Unknown command received: " .. command)
    end
end

function DWAPPowerSystem:TurnOnGen(index)
    local gen = self.generators[index]
    if gen then
        gen.running = true
        self:noise("Generator " .. index .. " turned on")
        local controlObj = self:getLuaObjectAt(gen.controls.x, gen.controls.y, gen.controls.z)
        if controlObj then
            if not gen.solarmode then
                controlObj:transitionNoise(true)
                controlObj:makeNoise(true)
            end
        end
        for i = 1, #gen.fakeGenerators do
            local fakeGen = gen.fakeGenerators[i]
            if fakeGen then
                local luaObject = self:getLuaObjectAt(fakeGen.x, fakeGen.y, fakeGen.z)
                if luaObject then
                    luaObject:setActivated(true)
                    self:noise("Generator " ..
                    index .. " activated at " .. fakeGen.x .. "," .. fakeGen.y .. "," .. fakeGen.z)
                else
                    self:noise("Failed to find Lua object for generator at " ..
                    fakeGen.x .. "," .. fakeGen.y .. "," .. fakeGen.z)
                end
            end
        end
        self:sendCommand("refreshGenData", {
            generatorIndex = index,
            data = {
                running = gen.running,
            }
        })
    end
end

function DWAPPowerSystem:TurnOffGen(index)
    local gen = self.generators[index]
    if gen then
        gen.running = false
        local controlObj = self:getLuaObjectAt(gen.controls.x, gen.controls.y, gen.controls.z)
        if controlObj then
            if not gen.solarmode then
                controlObj:transitionNoise(false)
                controlObj:makeNoise(false)
            end
        end
        self:noise("Generator " .. index .. " turned off")
        for i = 1, #gen.fakeGenerators do
            local fakeGen = gen.fakeGenerators[i]
            if fakeGen then
                local luaObject = self:getLuaObjectAt(fakeGen.x, fakeGen.y, fakeGen.z)
                if luaObject then
                    luaObject:setActivated(false)
                    self:noise("Generator " ..
                    index .. " deactivated at " .. fakeGen.x .. "," .. fakeGen.y .. "," .. fakeGen.z)
                else
                    self:noise("Failed to find Lua object for generator at " ..
                    fakeGen.x .. "," .. fakeGen.y .. "," .. fakeGen.z)
                end
            end
        end
        self:sendCommand("refreshGenData", {
            generatorIndex = index,
            data = {
                running = gen.running,
            }
        })
    end
end

function DWAPPowerSystem:RepairGen(index, repairAmount)
    local gen = self.generators[index]
    if gen then
        gen.condition = math.min(gen.condition + repairAmount, 100)
        self:noise("Generator " .. index .. " repaired by " .. repairAmount .. ", new condition: " .. gen.condition)
        self:sendCommand("refreshGenData", {
            generatorIndex = index,
            data = {
                condition = gen.condition,
            }
        })
    end
end

function DWAPPowerSystem:RemoveFuel(index, fuelAmount)
    local gen = self.generators[index]
    if gen then
        gen.fuel = math.max(0, gen.fuel - fuelAmount)
        self:noise("Generator " .. index .. " fuel reduced by " .. fuelAmount .. ", new fuel level: " .. gen.fuel)
        self:sendCommand("refreshGenData", {
            generatorIndex = index,
            data = {
                fuel = gen.fuel,
            }
        })
    end
end

function DWAPPowerSystem:AddFuel(index, fuelAmount)
    local gen = self.generators[index]
    if gen then
        gen.fuel = math.min(gen.fuel + fuelAmount, gen.capacity)
        self:noise("Generator " .. index .. " fuel increased by " .. fuelAmount .. ", new fuel level: " .. gen.fuel)
        self:sendCommand("refreshGenData", {
            generatorIndex = index,
            data = {
                fuel = gen.fuel,
            }
        })
    end
end

function DWAPPowerSystem:getSoundVolume(index)
    local gen = self.generators[index]
    if gen and gen.condition then
        local addedSound = 0
        if gen.condition < 50 then
            addedSound = 0.5
        elseif gen.condition < 20 then
            addedSound = 1.0
        end
        return SOUNDVOLUME + addedSound
    end
    return SOUNDVOLUME
end

function DWAPPowerSystem:dailyMaintenance()
    if not self.active then
        return
    end
    local count = self.system:getObjectCount()
    for i = 0, count - 1 do
        local globalObject = self.system:getObjectByIndex(i)
        if globalObject then
            if globalObject:getModData().DWAPObjectType == "generator" then
                local isoObject = globalObject:getIsoObject()
                if isoObject then
                    isoObject:setCondition(100)
                    isoObject:setFuel(100)
                end
            end
        end
    end
end

function DWAPPowerSystem:getPowerConsumption(index)
    local gen = self.generators[index]
    if not gen then
        self:noise("Generator index " .. index .. " not found")
        return 0
    end
    local totalPowerUsing = 0
    for _, squareData in pairs(gen.objectsPowered) do
        totalPowerUsing = totalPowerUsing + (squareData.drain or 0)
    end

    return totalPowerUsing
end

function DWAPPowerSystem:getBatteryPowerAvailable(index)
    local gen = self.generators[index]
    if not gen or not gen.solar then
        return 0
    end
    local batteryPower = 0
    local powerbankConfig = gen.solar.powerbank
    if self.PbSystem and self.PbSystem.instance then
        local pbSystem = self.PbSystem.instance
        local powerbank = pbSystem:getLuaObjectAt(powerbankConfig.x, powerbankConfig.y, powerbankConfig.z)
        if powerbank then
            local charge = tonumber(powerbank.charge) or 0
            local fuelToSolarRate = tonumber(pbSystem.fuelToSolarRate) or 800
            self:noise({ debug = true, charge = charge, maxcapacity = powerbank.maxcapacity, fuelToSolarRate =
            fuelToSolarRate })
            batteryPower = (fuelToSolarRate > 0) and (charge / fuelToSolarRate) or 0
            -- need at least 60% if we're not already in solar mode to prevent the generator rapidly switching
            if not gen.solarEnabled and batteryPower < 0.6 then
                batteryPower = 0
            end
        end
    end

    return batteryPower
end

function DWAPPowerSystem:calculateGeneratorFuelUse(index)
    local fuelMultiplier = SandboxVars.GeneratorFuelConsumption or 1.0
    -- Base power consumption
    local basePowerUsing = 0.02

    -- Get current power consumption from cached data
    local currentPowerUsing = self:getPowerConsumption(index)
    local totalPowerNeeded = basePowerUsing + currentPowerUsing
    if self.canUseSolar then
        -- @TODO test if the batteries have more power than this cycle needs, if so use battery power instead
        local batteryPower = self:getBatteryPowerAvailable(index)
        if batteryPower >= totalPowerNeeded then
            return 0, totalPowerNeeded
        elseif batteryPower*0.5 > 0 then -- if the battery is at least half full, reduce fuel use
            totalPowerNeeded = totalPowerNeeded - batteryPower
            self:noise("Using " .. batteryPower .. " battery power instead of fuel")
            return totalPowerNeeded, batteryPower
        end
    end
    if totalPowerNeeded > 0 then
        return math.max(0, totalPowerNeeded * fuelMultiplier), 0
    end
    return 0, 0
end

function DWAPPowerSystem:DrainBatteryPower(index, amount)
    if not self.canUseSolar then
        return
    end
    local gen = self.generators[index]
    if not gen or not gen.solar then
        return
    end
    local powerbankConfig = gen.solar.powerbank
    if self.PbSystem and self.PbSystem.instance then
        local pbSystem = self.PbSystem.instance
        local powerbank = pbSystem:getLuaObjectAt(powerbankConfig.x, powerbankConfig.y, powerbankConfig.z)
        if powerbank then
            local pbIsoObject = powerbank:getIsoObject()
            if pbIsoObject then
                -- Convert fuel units back to battery charge units
                local fuelToSolarRate = tonumber(pbSystem.fuelToSolarRate) or 800
                local batteryDrainAmount = amount * fuelToSolarRate

                -- Calculate new charge after draining (similar to ISA updatePowerbanks logic)
                local newCharge = math.max(0, (powerbank.charge or 0) - batteryDrainAmount)
                local modCharge = powerbank.maxcapacity > 0 and newCharge / powerbank.maxcapacity or 0

                -- Update the actual charge value (this was missing!)
                powerbank.charge = newCharge

                -- Update batteries with the percentage charge
                powerbank:updateBatteries(pbIsoObject:getContainer(), modCharge)
                powerbank:updateGenerator(-batteryDrainAmount) -- negative because we're draining, in battery units
                powerbank:updateSprite(modCharge)

                self:noise("Drained " ..
                amount .. " fuel units (" .. batteryDrainAmount .. " battery charge) from generator " ..
                index .. " (new charge: " .. newCharge .. "/" .. powerbank.maxcapacity .. ")")
                powerbank:saveData(true)
            end
        end
    end
end

--- Get a random decay value between 0 0.02
--- @return number
local function getRandDecay()
    local value = random:random(0, 2)
    if value == 0 then
        return 0
    end
    return value / 100
end

function DWAPPowerSystem:hourly()
    if not self.active then
        return
    end
    local nowPower = DWAPUtils.WorldPowerStillAvailable()
    if not nowPower then
        if self.haveWorldPower then
            -- World power just went out, see if we need to start generators
            if SandboxVars.DWAP.AutoPowerGenSystem then
                self:noise("World power is out, starting generators")
                for i = 1, #self.generators do
                    local gen = self.generators[i]
                    if gen and not gen.running and not gen.autoPowerDone then
                        self:TurnOnGen(i)
                        gen.autoPowerDone = true
                    end
                end
            else
                self:noise("World power is out, but auto generator start is disabled")
            end
            self.haveWorldPower = false
        end
        for i = 1, #self.generators do
            local gen = self.generators[i]
            if gen and gen.running then
                local gasUse, batteryUse = self:calculateGeneratorFuelUse(i)
                if batteryUse > 0 then
                    -- Handle battery use if applicable
                    self:noise("Generator " .. i .. " using battery power: " .. batteryUse)
                    self:DrainBatteryPower(i, batteryUse)
                end
                if gasUse > 0 and gen.solarEnabled then
                    local controlObj = self:getLuaObjectAt(gen.controls.x, gen.controls.y, gen.controls.z)
                    if controlObj then
                        controlObj:transitionNoise(true)
                        controlObj:makeNoise(true)
                    end
                    gen.solarEnabled = false
                elseif gasUse == 0 and not gen.solarEnabled then
                    local controlObj = self:getLuaObjectAt(gen.controls.x, gen.controls.y, gen.controls.z)
                    if controlObj then
                        controlObj:transitionNoise(false)
                        controlObj:makeNoise(false)
                    end
                    gen.solarEnabled = true
                end
                gen.fuel = math.max(0, gen.fuel - gasUse)
                -- self:noise(string.format("Generator %d fuel reduced by %.2f, now at %.2f", i, gasUse, gen.fuel))
                if gen.fuel <= 0 then
                    gen.fuel = 0
                    self:noise("Generator " .. i .. " ran out of fuel, shutting down")
                    self:TurnOffGen(i)
                end

                gen.condition = gen.condition - getRandDecay()
                if gen.condition <= 0 then
                    gen.condition = 0
                    self:TurnOffGen(i)
                    self:noise("Generator " .. i .. " broke down")
                end
                -- Refresh client data for this generator since it is loaded into the world
                local luaObject = self:getLuaObjectAt(gen.controls.x, gen.controls.y, gen.controls.z)
                if luaObject then
                    self:refreshClientGeneratorData(i)
                end
            end
        end
    end
end

--- Helper function to get the proper display name for a powered item
--- @param object IsoObject The object to get the name for
--- @return string name The localized display name
local function getPoweredItemName(object)
    local itemName = getText("IGUI_VehiclePartCatOther") -- Default to "Other"

    -- Check for gas pump first (highest priority)
    if object:getPipedFuelAmount() > 0 then
        itemName = getText("IGUI_GasPump")
    end

    -- Check for custom moveable object names
    local properties = object:getProperties()
    if properties and properties:Is("CustomName") then
        local customName = "Moveable Object"
        if properties:Is("CustomName") then
            if properties:Is("GroupName") then
                customName = properties:Val("GroupName") .. " " .. properties:Val("CustomName")
            else
                customName = properties:Val("CustomName")
            end
        end
        itemName = Translator.getMoveableDisplayName(customName)
    end

    -- Special case for light switches
    if instanceof(object, "IsoLightSwitch") then
        itemName = getText("IGUI_Lights")
    end

    return itemName
end

--- Get the power drain for a square
--- This mirrors the logic in IsoGenerator as of 42.10
--- @param square IsoGridSquare|nil The square to check, or nil to use coordinates
--- @param x ?number The X coordinate of the square
--- @param y ?number The Y coordinate of the square
--- @param z ?number The Z coordinate of the square
--- @return number drain the total power drain for the square
--- @return table items a list of powered items in the square
function DWAPPowerSystem.getSquarePowerDrain(square, x, y, z)
    if not square then
        assert(x and y and z, "getSquarePowerDrain called without square or coordinates")
        square = getSquare(x, y, z)
    end
    if not square then
        return -1, {}
    end
    local objects = square:getObjects()
    local size = objects:size() - 1
    local drain = 0
    local items = table.newarray()
    if not square:haveElectricity() then
        return 0, {}
    end
    for i = size, 0, -1 do
        local object = objects:get(i)
        if object and not instanceof(object, "IsoWorldInventoryObject") then
            if instanceof(object, "IsoClothingDryer") and object:isActivated() then
                drain = drain + 0.09
                items[#items + 1] = getPoweredItemName(object)
            end
            if instanceof(object, "IsoClothingWasher") and object:isActivated() then
                drain = drain + 0.09
                items[#items + 1] = getPoweredItemName(object)
            end
            if instanceof(object, "IsoCombinationWasherDryer") and object:isActivated() then
                drain = drain + 0.09
                items[#items + 1] = getPoweredItemName(object)
            end
            if instanceof(object, "IsoStackedWasherDryer") then
                local power = 0.0
                if object:isDryerActivated() then
                    power = power + 0.9
                end
                if object:isWasherActivated() then
                    power = power + 0.9
                end
                if power > 0.0 then
                    drain = drain + power
                    items[#items + 1] = getPoweredItemName(object)
                end
            end
            if instanceof(object, "IsoTelevision") and object:getDeviceData():getIsTurnedOn() then
                drain = drain + 0.03
                items[#items + 1] = getPoweredItemName(object)
            end
            if instanceof(object, "IsoRadio") then
                local deviceData = object:getDeviceData()
                if deviceData:getIsTurnedOn() and not deviceData:getIsBatteryPowered() then
                    drain = drain + 0.01
                    items[#items + 1] = getPoweredItemName(object)
                end
            end
            if instanceof(object, "IsoStove") and object:Activated() then
                drain = drain + 0.09
                items[#items + 1] = getPoweredItemName(object)
            end
            local fridgeContainer = object:getContainerByType("fridge")
            local freezerContainer = object:getContainerByType("freezer")
            if fridgeContainer and freezerContainer then
                drain = drain + 0.13
                items[#items + 1] = getPoweredItemName(object)
            elseif fridgeContainer or freezerContainer then
                drain = drain + 0.08
                items[#items + 1] = getPoweredItemName(object)
            end
            -- bStreetLight = this.sprite != null && this.sprite.getProperties().Is("streetlight")
            if instanceof(object, "IsoLightSwitch") and object:isActivated() then
                local sprite = object:getSprite()
                if sprite and not sprite:getProperties():Is("streetlight") then
                    drain = drain + 0.002
                    items[#items + 1] = getPoweredItemName(object)
                end
            end
            if object:getPipedFuelAmount() > 0 then
                drain = drain + 0.03
                items[#items + 1] = getPoweredItemName(object)
            end
        end
    end
    return drain, items
end

function DWAPPowerSystem:powerScan()
    if not self.active then
        return
    end
    local cell = getCell()
    local tileRange = SandboxVars.GeneratorTileRange or 20
    local verticalRange = SandboxVars.GeneratorVerticalPowerRange or 3
    local count = self.system:getObjectCount()
    for i = 0, count - 1 do
        local globalObject = self.system:getObjectByIndex(i)
        if globalObject then
            if globalObject:getModData().DWAPObjectType == "generator" then
                local modData = globalObject:getModData()

                local lastCoords = modData.lastCoords
                local generatorCoords = {
                    x = globalObject:getX(),
                    y = globalObject:getY(),
                    z = globalObject:getZ()
                }
                if not lastCoords then
                    lastCoords = { y = generatorCoords.y - tileRange, z = generatorCoords.z - verticalRange }
                end
                -- scan one row
                local startX = generatorCoords.x - tileRange
                local endX = generatorCoords.x + tileRange
                local startY = lastCoords.y + 1
                local startZ = lastCoords.z
                for x = startX, endX do
                    local square = cell:getGridSquare(x, startY, startZ)
                    if square then
                        local drain, items = DWAPPowerSystem.getSquarePowerDrain(square)
                        local key = DWAPUtils.hashCoords(x, startY, startZ)
                        if drain > 0 then
                            local itemsStr = table.concat(items, ", ")
                            self.generators[modData.DWAPGeneratorIndex].objectsPowered[key] = {
                                drain = drain,
                                items = itemsStr,
                            }
                        else
                            self.generators[modData.DWAPGeneratorIndex].objectsPowered[key] = nil
                        end
                    end
                end
                if startY + 1 <= generatorCoords.y + tileRange then
                    lastCoords.y = startY
                else
                    lastCoords.y = generatorCoords.y - tileRange
                    lastCoords.z = lastCoords.z + 1
                    if lastCoords.z > generatorCoords.z + verticalRange then
                        lastCoords.z = generatorCoords.z - verticalRange
                    end
                end

                modData.lastCoords = lastCoords
            end
        end
    end
end

SGlobalObjectSystem.RegisterSystemClass(DWAPPowerSystem)


local function powerScan()
    if not DWAPPowerSystem.instance then
        DWAPUtils.dprint("DWAPPowerSystem instance not found, cannot perform power scan")
        return
    end
    if not DWAPPowerSystem.instance.active then
        return
    end

    DWAPPowerSystem.instance:powerScan()
end
Events.OnTick.Add(powerScan)

local function dailyMaintenance()
    DWAPPowerSystem.instance:dailyMaintenance()
end
Events.EveryDays.Add(dailyMaintenance)

local function hourly()
    DWAPPowerSystem.instance:hourly()
end
Events.EveryHours.Add(hourly)
