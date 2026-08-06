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

-- Per-object lifecycle traffic: fires for every generator, panel and tank on
-- every load, so it is off unless DWAPUtils.verbosePower is set
function DWAPPowerSystem:chatter(message)
    if DWAPUtils.verbosePower then
        self:noise(message)
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
    local _running = not DWAPUtils.WorldPowerStillAvailable() and SandboxVars.DWAP.AutoPowerGenSystem
    for i = 1, #configs do
        local config = configs[i]
        if config and config.generators then
            for j = 1, #config.generators do
                local gen = config.generators[j]
                local running = _running
                if gen.startsOn and SandboxVars.DWAP.AutoPowerGenSystem then
                    running = true
                end
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
    self.system:setModDataKeys({ 'setupDone', 'generators', 'haveWorldPower', 'ghostHashToIndex', 'controlHashToIndex', 'tankHashToIndex', })
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
    if not self.setupDone or (self.ghostHashToIndex == nil or self.controlHashToIndex == nil) then
        self:noise("Setting up power system")
        self.haveWorldPower = DWAPUtils.WorldPowerStillAvailable()
        local generators = self:loadGenerators()
        self.generators = generators

        self.ghostHashToIndex, self.controlHashToIndex, self.tankHashToIndex = {}, {}, {}
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
            if gen and gen.fuelTank then
                local hash = DWAPUtils.hashCoords(gen.fuelTank.x, gen.fuelTank.y, gen.fuelTank.z)
                self.tankHashToIndex[hash] = i
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
        isoGenerator:transmitModData()
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
        isoObject:transmitModData()
    end
end

--- Replace a fuel tank map tile with a thumpable carrying a FluidContainer of Petrol
--- @param isoObject IsoObject The map tile found by MapObjects
--- @return IsoThumpable|nil thumpable The converted object, or nil if it isn't one of ours
function DWAPPowerSystem:maybeConfigureFuelTank(isoObject)
    if not self.active or not isoObject then return nil end
    if not self.tankHashToIndex then return nil end

    local x, y, z = isoObject:getX(), isoObject:getY(), isoObject:getZ()
    local hash = DWAPUtils.hashCoords(x, y, z)
    local genIndex = self.tankHashToIndex[hash]
    if not genIndex then return nil end

    local gen = self.generators[genIndex]
    if not gen or not gen.fuelTank then return nil end

    local sprite = isoObject:getSprite()
    if not sprite or sprite:getName() ~= gen.fuelTank.sprite then return nil end

    if isoObject:getModData().DWAPObjectType then
        -- already converted
        return nil
    end

    local square = isoObject:getSquare()
    if not square then
        self:noise("No square found for fuel tank at " .. x .. "," .. y .. "," .. z)
        return nil
    end
    local index = isoObject:getObjectIndex()
    local thumpable = IsoThumpable.new(isoObject:getCell(), square, gen.fuelTank.sprite, false)

    local thumpableModData = thumpable:getModData()
    thumpableModData.DWAPObjectType = "fuelTank"
    thumpableModData.DWAPGeneratorIndex = genIndex

    local fluidContainer = ComponentType.FluidContainer:CreateComponent()
    if fluidContainer then
        -- Use pcall to safely attempt fluid container setup
        pcall(function()
            if fluidContainer.setCapacity then
                fluidContainer:setCapacity(gen.capacity)
            end
            if fluidContainer.addFluid then
                fluidContainer:addFluid(FluidType.Petrol, math.min(gen.fuel, gen.capacity))
            end
        end)
        GameEntityFactory.AddComponent(thumpable, true, fluidContainer)
    end

    square:AddTileObject(thumpable)
    square:transmitRemoveItemFromSquare(isoObject)
    square:RemoveTileObject(isoObject)
    square:transmitAddObjectToSquare(thumpable, index)

    self:chatter("Fuel tank for generator " .. genIndex .. " configured at " .. x .. "," .. y .. "," .. z)
    return thumpable
end

function DWAPPowerSystem:isValidIsoObject(isoObject)
    if not isoObject then return false end

    -- Check if this object has DWAP power system mod data
    local modData = isoObject:getModData()
    return modData.DWAPObjectType ~= nil
end

function DWAPPowerSystem:newLuaObject(globalObject)
    self:chatter("DWAPPowerSystem:newLuaObject")
    return DWAPPowerObject:new(self, globalObject)
end

function DWAPPowerSystem:getInitialStateForClient()
    self:chatter("DWAPPowerSystem:getInitialStateForClient")
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
        self:chatter("Received refreshGenData command")
        if args and args.generatorIndex then
            self:pullTankFuel(args.generatorIndex)
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
        self:pullTankFuel(index)
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
        self:pushTankFuel(index)
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
        self:pushTankFuel(index)
        self:noise("Generator " .. index .. " fuel increased by " .. fuelAmount .. ", new fuel level: " .. gen.fuel)
        self:sendCommand("refreshGenData", {
            generatorIndex = index,
            data = {
                fuel = gen.fuel,
            }
        })
    end
end

--- Get the IsoObject for a generator's fuel tank, if its square is currently loaded
--- @param index number The generator index
--- @return IsoObject|nil isoObject
function DWAPPowerSystem:getTankIsoObject(index)
    local gen = self.generators[index]
    if not gen or not gen.fuelTank then return nil end
    local luaObject = self:getLuaObjectAt(gen.fuelTank.x, gen.fuelTank.y, gen.fuelTank.z)
    if not luaObject then return nil end
    return luaObject:getIsoObject()
end

--- Copy the physical tank's fluid level into the gen.fuel mirror
--- @param index number The generator index
function DWAPPowerSystem:pullTankFuel(index)
    local gen = self.generators[index]
    if not gen or not gen.fuelTank then return end
    local isoObject = self:getTankIsoObject(index)
    if not isoObject then return end
    pcall(function()
        gen.fuel = math.min(isoObject:getFluidAmount(), gen.capacity)
    end)
end

--- Copy the gen.fuel mirror back onto the physical tank
--- @param index number The generator index
function DWAPPowerSystem:pushTankFuel(index)
    local gen = self.generators[index]
    if not gen or not gen.fuelTank then return end
    local isoObject = self:getTankIsoObject(index)
    if not isoObject then return end
    pcall(function()
        if isoObject:getFluidAmount() == gen.fuel then return end
        isoObject:emptyFluid()
        if gen.fuel > 0 then
            isoObject:addFluid(FluidType.Petrol, gen.fuel)
        end
        isoObject:transmitModData()
    end)
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
                    -- each setter syncs to every client, so only touch what drifted
                    if isoObject:getCondition() ~= 100 then
                        isoObject:setCondition(100)
                    end
                    local maxFuel = isoObject:getMaxFuel()
                    if isoObject:getFuel() ~= maxFuel then
                        isoObject:setFuel(maxFuel)
                    end
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
    -- keep the mirror fresh for loaded tanks even while the generator is off or
    -- world power is still on, so fuel added at the tank survives an unload
    for i = 1, #self.generators do
        self:pullTankFuel(i)
    end
    -- these generators are pulled out of the cell's process list, so the engine
    -- never consumes their updateSurrounding flag. Chunks that stream in after
    -- the generator's own chunk would never get registered, so re-assert here.
    -- Power registration matters whether or not world power is still on.
    for i = 1, #self.generators do
        local gen = self.generators[i]
        if gen and gen.running and gen.fakeGenerators then
            for j = 1, #gen.fakeGenerators do
                local fakeGen = gen.fakeGenerators[j]
                if fakeGen then
                    local luaObject = self:getLuaObjectAt(fakeGen.x, fakeGen.y, fakeGen.z)
                    local isoObject = luaObject and luaObject:getIsoObject()
                    if isoObject then
                        pcall(function()
                            isoObject:setSurroundingElectricity()
                        end)
                    end
                end
            end
        end
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
                self:pullTankFuel(i)
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
                self:pushTankFuel(i)

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
    if properties and properties:has("CustomName") then
        local customName = "Moveable Object"
        if properties:has("CustomName") then
            if properties:has("GroupName") then
                customName = properties:get("GroupName") .. " " .. properties:get("CustomName")
            else
                customName = properties:get("CustomName")
            end
        end
        itemName = Translator.getMoveableDisplayName(customName)
    end

    -- Special case for light switches
    if instanceof(object, "IsoLightSwitch") then
        itemName = getText("IGUI_Lights")
    end

    -- Vanilla lists battery chargers as "Other", even when they carry a custom name
    if instanceof(object, "IsoCarBatteryCharger") then
        itemName = getText("IGUI_VehiclePartCatOther")
    end

    -- getText() should never hand back nil, but a class we don't special case
    -- shouldn't be able to drop an item out of the UI list either
    if not itemName then
        local sprite = object:getSprite()
        itemName = object:getName() or (sprite and sprite:getName()) or "Unknown"
    end

    return itemName
end

--- Ask the object itself what it is drawing right now
--- New in 42.20: IsoObject.couldBePoweredByGenerator/getGeneratorPowerConsumption,
--- overridden per appliance class, so vanilla drain changes are picked up for free
--- @param object IsoObject The object to check
--- @return number drain the object's current draw, 0 if it isn't generator powered
local function getObjectPowerDrain(object)
    if not object:couldBePoweredByGenerator() then
        return 0
    end
    return object:getGeneratorPowerConsumption() or 0
end

--- Get the power drain for a square
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
        if object then
            -- IsoWorldInventoryObject (loose items on the floor) answers false, and
            -- light switches answer false for streetlights, so no filtering needed here
            local ok, objectDrain = pcall(getObjectPowerDrain, object)
            if ok and objectDrain and objectDrain > 0 then
                drain = drain + objectDrain
                items[#items + 1] = getPoweredItemName(object)
            end
        end
    end
    return drain, items
end

--- Get the vertical range a generator reaches
--- Prefers the 42.20 IsoGenerator API (which clamps to the world's level limits),
--- falling back to the sandbox var while the generator's square is unloaded
--- @param isoObject IsoObject|nil The generator, if it is loaded
--- @param z number The generator's Z level
--- @return number minZ the lowest level the generator powers
--- @return number maxZ the highest level the generator powers
local function getGeneratorLevelRange(isoObject, z)
    if isoObject then
        local ok, minZ, maxZ = pcall(function()
            return isoObject:getMinAffectedLevel(), isoObject:getMaxAffectedLevel()
        end)
        if ok and minZ and maxZ then
            return minZ, maxZ
        end
    end
    local verticalRange = SandboxVars.GeneratorVerticalPowerRange or 3
    return z - verticalRange, z + verticalRange
end

function DWAPPowerSystem:powerScan()
    if not self.active then
        return
    end
    local cell = getCell()
    local tileRange = SandboxVars.GeneratorTileRange or 20
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
                local minZ, maxZ = getGeneratorLevelRange(globalObject:getIsoObject(), generatorCoords.z)
                if not lastCoords then
                    lastCoords = { y = generatorCoords.y - tileRange, z = minZ }
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
                    if lastCoords.z > maxZ or lastCoords.z < minZ then
                        lastCoords.z = minZ
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
