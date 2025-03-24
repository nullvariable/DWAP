if debugScenarios == nil then
    debugScenarios = {}
end
print("DebugScenario.lua loaded")

debugScenarios.DebugScenarioDWAP = {
    name = "_DWAP Scenario",
    world = "Muldraugh, KY",
    -- forceLaunch = true, -- use this to force the launch of THIS scenario right after main menu was loaded, save more clicks! Don't do multiple scenarii with this options
    startLoc = { x = 9956, y = 12603, z = -4 }, -- Doe Valley
    setSandbox = function()
        SandboxVars.VehicleEasyUse = true;
        SandboxVars.Zombies = 6; -- none
        SandboxVars.WaterShutModifier = -1;
        SandboxVars.ElecShutModifier = 999;
        SandboxVars.WaterShut = 1;
        SandboxVars.ElecShut = 4;
        SandboxVars.DayLength = 26;
        -- SandboxVars.TimeSinceApo = 3;
        SandboxVars.StartTime = 2;
        SandboxVars.AnimalRanchChance = 1;
        SandboxVars.DWAP = {
            Safehouse = 5,
            SpawnInBase = true,
            SpawnWithMapAndKeys = true,
            EnableAllLocations = false,
            EnableWaterSystem = true,
            EnableGenSystem = true,
            GeneratorFuel = 1000,
            GeneratorPerHour = 0.5,
            GeneratorFuelTank = 1000,
            GeneratorCondition = 100,
            WaterLevel = 1999.0,
            WaterTankCapacity = 4000.0,
            Loot = false,
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
    end
}
