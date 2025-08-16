local DWAPUtils = require("DWAPUtils")
local ISA
local generators = {}
local powerbanks = {}

-- Patching variables
local originalUpdatePowerbanks = nil
local patchApplied = false

local hashCoords = DWAPUtils.hashCoords

local function initModData(isNewGame)
    if DWAPUtils.getSaveVersion() < 17 then
        return
    end

    if SandboxVars.DWAP.EnableGenSystem and getActivatedMods():contains("\\ISA") and SandboxVars.DWAP.EnableGenSystemSolar then
        local configs = DWAPUtils.loadConfigs()
        for i = 1, #configs do
            local config = configs[i]
            if config and config.generators then
                -- Handle new nested generators format
                for j = 1, #config.generators do
                    local generator = config.generators[j]
                    if generator.solar then
                        generators[i] = { solar = generator.solar }
                        if generator.solar.powerbank then
                            local key = hashCoords(generator.solar.powerbank.x, generator.solar.powerbank.y,
                                generator.solar.powerbank.z)
                            powerbanks[key] = {
                                generatorIndex = i,
                                x = generator.solar.powerbank.x,
                                y = generator.solar.powerbank.y,
                                z = generator.solar.powerbank.z,
                                sprite = generator.solar.powerbank.sprite
                            }
                        end
                    end
                end
            end
        end
    end
end

Events.OnInitGlobalModData.Add(function(isNewGame)
    initModData(isNewGame)
end)

local function patchPowerbankCreation()
    -- Hook into ISA's powerbank creation to configure DWAP powerbanks
    local function onObjectAdded(isoObject)
        -- Only process powerbank objects that ISA recognizes
        if not isoObject or not isoObject:getSquare() then return end

        local isaType = ISA.WorldUtil.getType(isoObject)
        if isaType ~= "PowerBank" then return end

        local square = isoObject:getSquare()
        local x, y, z = square:getX(), square:getY(), square:getZ()
        local key = hashCoords(x, y, z)

        -- Check if this is one of our configured DWAP powerbanks
        if powerbanks[key] then
            DWAPUtils.dprint("DWAP_ISA: Configuring DWAP powerbank at " .. x .. ", " .. y .. ", " .. z)

            -- Wait a tick to ensure ISA has finished setting up the object
            DWAPUtils.Defer(function()
                -- Get the ISA lua object for this powerbank
                local luaPowerbank = ISA.PBSystem_Server:getLuaObjectOnSquare(square)
                if luaPowerbank then
                    -- Check if we've already configured this powerbank using ISO mod data
                    local isoModData = isoObject:getModData()
                    if isoModData.dwapInit then
                        DWAPUtils.dprint("DWAP_ISA: Powerbank already configured by DWAP, skipping")
                        return
                    end

                    DWAPUtils.dprint("DWAP_ISA: Found ISA lua object, configuring...")

                    local generator = generators[powerbanks[key].generatorIndex]
                    local panelCount = 0
                    local panels = {}
                    for i = 1, #generator.solar.panels do
                        local component = generator.solar.panels[i]
                        if component.type == "panel" then
                            panelCount = panelCount + 1
                            panels[#panels + 1] = {
                                x = component.x,
                                y = component.y,
                                z = component.z
                            }
                        end
                    end

                    -- Configure the powerbank through ISA's proper interface
                    luaPowerbank.on = false
                    luaPowerbank.batteries = 2
                    luaPowerbank.charge = 800
                    luaPowerbank.maxcapacity = 800
                    luaPowerbank.panels = panels
                    luaPowerbank.npanels = panelCount

                    -- Store DWAP data in the ISO object's mod data to persist it
                    -- local isoModData = isoObject:getModData()
                    isoModData.dwapInit = true
                    isoModData.dwap_drain = 0
                    isoModData.dwap_generatorIndex = powerbanks[key].generatorIndex
                    isoModData.panels = panels
                    isoModData.npanels = panelCount
                    isoObject:transmitModData()

                    -- Also set on lua object for immediate access
                    luaPowerbank.dwapInit = true
                    luaPowerbank.dwap_drain = 0

                    -- Save the changes through ISA's system
                    luaPowerbank:saveData(true)

                    DWAPUtils.dprint("DWAP_ISA: Successfully configured DWAP powerbank with " .. panelCount .. " panels")
                else
                    DWAPUtils.dprint("DWAP_ISA: Warning - could not find ISA lua object for powerbank at " ..
                        x .. ", " .. y .. ", " .. z)
                end
            end)
        end
    end

    -- Hook into the OnObjectAdded event
    Events.OnObjectAdded.Add(onObjectAdded)
end

-- Function to wrap the original updatePowerbanks with our logic
local function wrappedUpdatePowerbanks()
    DWAPUtils.dprint("DWAP_ISA: PBSystem.updatePowerbanks called (DWAP PATCHED)")

    -- Get the PBSystem instance
    local PBSystem = require("ImmersiveSolarArrays/PowerBank/PowerBankSystem_Server")
    local self = PBSystem.instance

    -- our powerbanks will be off, so the regular loop will ignore them.
    if self and self.system then
        DWAPUtils.dprint("DWAP_ISA: Processing powerbanks in updatePowerbanks")
        for i = 0, self.system:getObjectCount() - 1 do
            local pb = self.system:getObjectByIndex(i):getModData()
            local isoObject = pb:getIsoObject()
            if isoObject then
                local isoModData = isoObject:getModData()
                -- Check if this is a DWAP powerbank using ISO mod data
                if isoModData.dwap_drain then
                    DWAPUtils.dprint("DWAP_ISA: Processing DWAP powerbank at " ..
                        isoObject:getX() .. "," .. isoObject:getY() .. "," .. isoObject:getZ())

                    -- Process the powerbank with negative drain (discharge)
                    local dCharge = -isoModData.dwap_drain -- Negative because it's draining
                    if self.updateEveryTenMinutes then dCharge = dCharge / 6 end
                    local charge = pb.charge + dCharge
                    if charge < 0 then charge = 0 elseif charge > pb.maxcapacity then charge = pb.maxcapacity end
                    local modCharge = pb.maxcapacity > 0 and charge / pb.maxcapacity or 0
                    pb.charge = charge

                    -- Update the powerbank components
                    pb:updateBatteries(isoObject:getContainer(), modCharge)
                    pb:updateGenerator(dCharge)
                    pb:updateSprite(modCharge)
                    pb:updateConGenerator()
                    pb:saveData(true)

                    DWAPUtils.dprint("DWAP_ISA: Updated DWAP powerbank charge: " .. charge .. "/" .. pb.maxcapacity)
                end
            end
        end
    else
        DWAPUtils.dprint("DWAP_ISA: Warning - PBSystem instance or system not found in updatePowerbanks")
    end

    -- Call the original function
    if originalUpdatePowerbanks then
        originalUpdatePowerbanks()
    end
end

-- Hook into the Events system to replace the handler
local function patchUpdatePowerbanks()
    if patchApplied then return end

    DWAPUtils.dprint("DWAP_ISA: Attempting to patch updatePowerbanks")

    DWAPUtils.Defer(function()
        local success, PBSystem = pcall(require, "ImmersiveSolarArrays/PowerBank/PowerBankSystem_Server")

        if success and PBSystem and PBSystem.updatePowerbanks then
            -- Store the original function
            originalUpdatePowerbanks = PBSystem.updatePowerbanks

            -- Mirror ISA's logic for determining which event to use
            -- local useEveryTenMinutes = SandboxVars.ISA.ChargeFreq == 1
            -- -- Force to 10 minutes for now since ISA logic is commented out
            -- useEveryTenMinutes = true

            -- if useEveryTenMinutes then
            --     DWAPUtils.dprint("DWAP_ISA: Using EveryTenMinutes event (ChargeFreq = 1)")
            --     if Events.EveryTenMinutes then
            --         Events.EveryTenMinutes.Remove(originalUpdatePowerbanks)
            --         Events.EveryTenMinutes.Add(wrappedUpdatePowerbanks)
            --     end
            -- else
            --     DWAPUtils.dprint("DWAP_ISA: Using EveryHours event (ChargeFreq != 1)")
            --     if Events.EveryHours then
            --         Events.EveryHours.Remove(originalUpdatePowerbanks)
            --         Events.EveryHours.Add(wrappedUpdatePowerbanks)
            --     end
            -- end

            patchApplied = true
            DWAPUtils.dprint("DWAP_ISA: Successfully patched updatePowerbanks")
        else
            DWAPUtils.dprint("DWAP_ISA: Failed to find PBSystem.updatePowerbanks. Success: " .. tostring(success))
        end
    end)
end

-- Patch MapObjects to handle DWAP powerbank tiles
local function patchMapObjects()
    DWAPUtils.dprint("DWAP_ISA: Patching MapObjects to handle DWAP powerbank tiles")

    -- Client-side loader for DWAP powerbank
    if isClient() then
        local function LoadDWAPPowerbank(isoObject)
            DWAPUtils.dprint("DWAP_ISA: Loading DWAP powerbank on client")
            isoObject:getCell():addToProcessIsoObjectRemove(isoObject)
            isoObject:getContainer():setAcceptItemFunction("AcceptItemFunction.ISA_Batteries")
        end
        MapObjects.OnLoadWithSprite("dwap_tiles_01_0", LoadDWAPPowerbank, 6)
    else
        -- Server-side loader for DWAP powerbank
        local function LoadDWAPPowerbank(isoObject)
            DWAPUtils.dprint("DWAP_ISA: Loading DWAP powerbank on server")

            -- Check if we need to convert the object to an IsoGenerator
            if not instanceof(isoObject, "IsoGenerator") then
                DWAPUtils.dprint("DWAP_ISA: Converting IsoThumpable to IsoGenerator for DWAP powerbank")

                -- Use ISA's own replacement function if available, otherwise do it manually
                if ISA.WorldUtil and ISA.WorldUtil.replaceIsoObjectWithGenerator then
                    isoObject = ISA.WorldUtil.replaceIsoObjectWithGenerator(isoObject)
                    DWAPUtils.dprint("DWAP_ISA: Used ISA WorldUtil.replaceIsoObjectWithGenerator")
                    triggerEvent("OnFillContainer", isoObject:getSquare(), "BatteryBank", isoObject:getContainer())
                else
                    -- Manual conversion as fallback
                    local textureName = isoObject:getTextureName()
                    local square = isoObject:getSquare()
                    -- local x, y, z = isoObject:getX(), isoObject:getY(), isoObject:getZ()
                    -- Remove the original object
                    square:removeIsoObject(isoObject)

                    -- Create a new IsoGenerator
                    local generator = square:AddGenerator(textureName, 0, false, 0, true, 0, nil)

                    -- Use the new generator object
                    isoObject = generator
                    DWAPUtils.dprint("DWAP_ISA: Successfully converted to IsoGenerator manually")
                end
            end

            ISA.PBSystem_Server:loadIsoObject(isoObject)
            isoObject:getContainer():setAcceptItemFunction("AcceptItemFunction.ISA_Batteries")
        end
        MapObjects.OnLoadWithSprite("dwap_tiles_01_0", LoadDWAPPowerbank, 6)

        -- Handler for new DWAP powerbank spawns
        local function OnNewDWAPSprite(isoObject)
            DWAPUtils.dprint("DWAP_ISA: New DWAP powerbank sprite detected")
            local isaType = ISA.WorldUtil.getType(isoObject)
            local square = isoObject:getSquare()
            if not square then
                DWAPUtils.dprint("DWAP_ISA: OnNewDWAPSprite no square")
                return
            end

            if isaType == "PowerBank" then
                -- For DWAP tiles, don't use RandomWorldSpawns - just add to special objects
                DWAPUtils.dprint("DWAP_ISA: Adding DWAP powerbank to special objects (no random spawn)")
                square:getSpecialObjects():add(isoObject)
            else
                square:getSpecialObjects():add(isoObject)
            end
        end

        MapObjects.OnNewWithSprite("dwap_tiles_01_0", OnNewDWAPSprite, 5)
    end

    DWAPUtils.dprint("DWAP_ISA: MapObjects patch applied successfully")
end

local function patchPowerBankUpdateSprite()
    DWAPUtils.dprint("DWAP_ISA: Patching PowerBankObject_Server updateSprite function")

    -- Check if ISA PowerBank class is available
    local success, PowerBankClass = pcall(require, "ImmersiveSolarArrays/PowerBank/PowerBankObject_Server")
    if not success or not PowerBankClass then
        DWAPUtils.dprint("DWAP_ISA: PowerBankObject_Server not found")
        return
    end

    -- Store the original updateSprite function
    local originalUpdateSprite = PowerBankClass.updateSprite
    if not originalUpdateSprite then
        DWAPUtils.dprint("DWAP_ISA: PowerBankObject_Server.updateSprite function not found")
        return
    end

    -- Create our patched version
    PowerBankClass.updateSprite = function(self, modCharge)
        DWAPUtils.dprint("DWAP_ISA: updateSprite called (DWAP PATCHED)")

        local isoObject = self:getIsoObject()
        if not isoObject then
            DWAPUtils.dprint("DWAP_ISA: No isoObject found, calling original")
            return originalUpdateSprite(self, modCharge)
        end

        local textureName = isoObject:getTextureName()

        -- Check if this is our DWAP powerbank tile
        if textureName == "dwap_tiles_01_0" then
            DWAPUtils.dprint("DWAP_ISA: DWAP powerbank detected, skipping sprite update")
            -- Return early for DWAP tiles - don't update the sprite overlay
            return
        end

        -- For all other tiles (original ISA tiles), call the original function
        DWAPUtils.dprint("DWAP_ISA: Non-DWAP powerbank (" .. tostring(textureName) .. "), calling original updateSprite")
        return originalUpdateSprite(self, modCharge)
    end

    DWAPUtils.dprint("DWAP_ISA: PowerBankObject_Server.updateSprite successfully patched")
end

local function setupISAIntegration()
    patchPowerbankCreation()
    patchUpdatePowerbanks()
    patchMapObjects()
    patchPowerBankUpdateSprite()
end

local function noIntegration()
    local function LoadDWAPPowerbank(isoObject)
        -- industry_02_175
        -- Replace the custom powerbank tile with a standard one
        DWAPUtils.dprint("DWAP_ISA: Loading DWAP powerbank without ISA integration")
        local x, y, z = isoObject:getX(), isoObject:getY(), isoObject:getZ()
        local square = isoObject:getSquare()
        if not square then
            DWAPUtils.dprint("DWAP_ISA: LoadDWAPPowerbank no square")
            return
        end
        local index = -1
        if isoObject then
            isoObject:getObjectIndex()
            square:RemoveTileObject(isoObject)
            square:transmitRemoveItemFromSquare(isoObject)
        end

        local newObject = IsoObject.getNew(square, "industry_02_175", "industry_02_175", false)
        if newObject == nil then
            DWAPUtils.dprint("DWAP_ISA: Failed to create new IsoObject for powerbank replacement")
            return
        end
        square:transmitAddObjectToSquare(newObject, index)

    end
    MapObjects.OnLoadWithSprite("dwap_tiles_01_0", LoadDWAPPowerbank, 6)
end

if (getActivatedMods():contains("\\ISA") and SandboxVars.DWAP.EnableGenSystemSolar) then
    local success, isa = pcall(require, "ImmersiveSolarArrays/Utilities")
    if not success or not isa then
        DWAPUtils.dprint("DWAP_ISA: ImmersiveSolarArrays not found or not loaded")
        return
    end
    ISA = isa
    Events.OnSGlobalObjectSystemInit.Add(setupISAIntegration)
else
    Events.OnSGlobalObjectSystemInit.Add(noIntegration)
end
