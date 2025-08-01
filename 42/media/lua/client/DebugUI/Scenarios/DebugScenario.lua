if debugScenarios == nil then
    debugScenarios = {}
end
print("DebugScenario.lua loaded")

-- Hide/override unwanted base game debug scenarios
debugScenarios.AiteronScenario = nil
debugScenarios.BobKates = nil
debugScenarios.DebugScenario = nil
debugScenarios.FenrisScenario = nil
debugScenarios.LotsaZombies = nil
debugScenarios.MarkR = nil
debugScenarios.Multiplayer = nil
debugScenarios.PatrickScenario = nil
debugScenarios.SashaScenario = nil
debugScenarios.SteveS = nil
debugScenarios.Trailer1Scenario = nil
debugScenarios.Trailer2Scenario = nil
debugScenarios.Trailer2_LimpWPScenario = nil
debugScenarios.Trailer2_PoliceScenario = nil
debugScenarios.Trailer3Scenario = nil
debugScenarios.Trailer3Scenario_Arrival = nil
debugScenarios.Trailer3Scenario_Building = nil
debugScenarios.Trailer3Scenario_Fishing = nil
debugScenarios.Trailer3Scenario_GasStation = nil
debugScenarios.Trailer3Scenario_Roadtrip = nil
debugScenarios.TurboGreenTest = nil
debugScenarios.TurboSaveTest = nil
debugScenarios.Water = nil
debugScenarios.Water2 = nil
debugScenarios.Water3 = nil
debugScenarios.Water4 = nil
debugScenarios.Water5 = nil
debugScenarios.Water6 = nil
debugScenarios.Water7 = nil
debugScenarios.Water8 = nil
debugScenarios.WeaponScenario = nil
debugScenarios.SteveProfile = nil
debugScenarios.DebugScenarioTGreen = nil
debugScenarios.DebugScenarioTSave = nil

DebugScenarioAllMaps = false

local target = 3


local DWAPUtils = require "DWAPUtils"
if not DWAPUtils then
    print("DWAPUtils module not found, cannot load DebugScenarioDWAP")
    return
end
local spawns = DWAPUtils.getStartingLocations()
if not spawns or #spawns == 0 then
    print("No DWAP spawns found, cannot load DebugScenarioDWAP")
    return
end
print(("Loaded %d DWAP spawns"):format(#spawns))

debugScenarios.DebugScenarioDWAP = {
    name = "DWAP Scenario " .. target,
    -- world = "Muldraugh, KY",
    -- forceLaunch = true, -- use this to force the launch of THIS scenario right after main menu was loaded, save more clicks! Don't do multiple scenarii with this options
    -- startLoc = { x = 3108, y = 12053, z = 1 },
    startLoc = { x = spawns[target].x, y = spawns[target].y, z = spawns[target].z },
    setSandbox = function()
        SandboxVars.VehicleEasyUse = true;
        SandboxVars.Zombies = 6; -- none
        SandboxVars.WaterShutModifier = -1;
        SandboxVars.ElecShutModifier = -1;
        SandboxVars.WaterShut = 1;
        SandboxVars.ElecShut = 1;
        SandboxVars.DayLength = 26;
        -- SandboxVars.TimeSinceApo = 3;
        SandboxVars.StartTime = 2;
        SandboxVars.AnimalRanchChance = 1;
        SandboxVars.BasementSpawnFrequency = 7;
        if not SandboxVars.GunsElevator then
            SandboxVars.GunsElevator = {};
        end
        SandboxVars.GunsElevator.elevatorSpeed = 10;
        SandboxVars.DWAP = {
            Safehouse = target +1,
            SpawnInBase = true,
            SpawnWithMapAndKeys = true,
            Barricade = true,
            EnableWaterSystem = true,
            EnableGenSystem = true,
            EnableGenSystemSolar = true,
            AutoPowerGenSystem = true,
            GeneratorFuel = 1000,
            GeneratorPerHour = 0.5,
            GeneratorFuelTank = 2000,
            GeneratorCondition = 75,
            WaterLevel = 2000,
            WaterTankCapacity = 4000,
            Loot = 2,
            Loot_EnableMaps = true,
            Loot_EnableBooks = true,
            SeedLibrary = true,
            Loot_FoodLevel = 1,
            Loot_MediaLevel = 1,
            Loot_GunLevel = 1,
            Loot_MedLevel = 1,
            Loot_FarmLevel = 1,
            Loot_FishLevel = 1,
            Loot_TailorLevel = 1,
            Loot_LockersLevel = 1,
            Loot_ToolsLevel = 1,
            Loot_BuildMatsLevel = 1,
            EnableAllLocations = true,
        }
    end,
    onStart = function()
        print("DWAP Scenario started")
        local clim = getClimateManager()
        local w = clim:getWeatherPeriod()
        if w:isRunning() then
            clim:stopWeatherAndThunder()
        end

        local var = clim:getClimateFloat(5)
        var:setEnableOverride(true)
        var:setOverride(0, 1)
        DoAutoLights()

        -- Note: Basement loading is now handled by DWAP_BasementLoader.lua during OnLoadMapZones
        
        -- Load all maps into player inventory for testing
        if DebugScenarioAllMaps then
            local DWAPUtils = require "DWAPUtils"
            local configs = DWAPUtils.loadConfigs()
            for i = 1, #configs do
                local config = configs[i]
                if config and config.map then
                    local playerObj = getPlayer()
                    local stash = StashSystem.getStash(config.map.name)
                    if stash then
                        local mapItem = instanceItem(stash:getItem())
                        StashSystem.doStashItem(stash, mapItem)
                        -- mapItem:setCustomName(true)
                        playerObj:getInventory():AddItem(mapItem)
                        DWAPUtils.dprint(("Added map %s to player inventory"):format(mapItem:getDisplayName()))
                    end
                end
            end
        end
    end
}
