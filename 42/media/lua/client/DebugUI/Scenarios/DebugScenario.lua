-- Dev tooling: inert outside debug mode so shipping this file is safe.
-- getDebug() is the -debug launch flag - per-launch, never set for normal
-- players, no sandbox UI exposure
if not getDebug() then return end

print("DebugScenario.lua loaded")

-- Drop every base-game scenario so the picker only lists ours. Mod Lua loads
-- after the vanilla DebugUIs/Scenarios files, so wiping the table is both
-- shorter and drift-proof: the old per-key blacklist nil'd file names rather
-- than the keys those files actually register (BobKates.lua registers
-- BobKateHouse, Multiplayer.lua registers MP1Scenario), so those two always
-- leaked through, and any scenario TIS adds would leak through too.
debugScenarios = {}

DebugScenarioAllMaps = false

local target = 42


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

-- target is hand-edited constantly; an out-of-range value would otherwise
-- blow up indexing spawns[target] below, before the picker ever opens.
if not spawns[target] then
    print(("DWAP scenario target %d out of range (1-%d), using 1"):format(target, #spawns))
    target = 1
end

debugScenarios.DebugScenarioDWAP = {
    -- coords in the name confirm at a glance which spawn target resolved to
    name = ("DWAP Scenario %d (%d,%d,%d)"):format(target, spawns[target].x, spawns[target].y, spawns[target].z),
    -- world = "Muldraugh, KY",  -- runner defaults to this when unset
    -- Skips the scenario picker on launch, but only when the DebugScenario
    -- .ForceLaunch debug option is enabled (defaults off), so it stays inert
    -- until you want it. Keep it on exactly one scenario.
    forceLaunch = true,
    -- startLoc is NOT optional: IsoWorld reads it with no nil check and NPEs
    -- the world load if a selected scenario lacks it.
    -- startLoc = { x = 12659, y = 6402, z = 2 },
    startLoc = { x = spawns[target].x, y = spawns[target].y, z = spawns[target].z },
    setSandbox = function()
        -- 1 = Never. This gates ONLY the random-story roll: RandomizedBuilding
        -- Base.ChunkLoaded runs its forced stories (setAlwaysDo /
        -- reallyAlwaysForce) first and unconditionally, then hits
        -- `case 1: return;` before getRandomStory(). So the PreventStories
        -- canary this was set to 7 for survives - RBShopLooted is
        -- setAlwaysDo(true) (RBShopLooted.java:128) and still runs, along with
        -- RBBar/RBOffice/RBTrashed/RBSchool and the named ones. What it drops
        -- is the random pool, which is where RBBurnt/RBBurntFireman/
        -- RBBurntCorpse live - none of them forced.
        -- That is the point: a burnt building near a config grinds the audit
        -- to a halt. BurnWalls calls the one-arg RemoveTileObject at six sites
        -- and never checks the return, so a shipped multi-tile object that
        -- cannot resolve its siblings is retried forever, and in -debug every
        -- refusal costs a stack capture + File.length() + flush. That killed
        -- the 2026-08-11 run at config 23 (Rusty Rifle): ~160 KB/s of
        -- "Failed to find all parts of a multi-tile object!", console.txt and
        -- the DebugLog both rotated to 100% that one line, no progress for
        -- 6+ minutes. See docs/tis-post-1-burnwalls.md and TIS thread 97089.
        -- Set back to 7 when deliberately testing story interactions.
        SandboxVars.SurvivorHouseChance = 1
        -- Was HouseAlarmFrequency, which is only this option's translation
        -- key - the SandboxVars name is Alarm, so the old line set nothing
        -- and alarms ran at the default (Sometimes). 1 = Never, which is
        -- what a teleport-heavy audit world wants.
        SandboxVars.Alarm = 1
        SandboxVars.VehicleEasyUse = true;
        SandboxVars.Zombies = 6; -- none
        SandboxVars.WaterShutModifier = -1;
        SandboxVars.ElecShutModifier = -1;
        SandboxVars.WaterShut = 1;
        SandboxVars.ElecShut = 1;
        -- Infinite pump gas makes IsoObject.getPipedFuelAmount return early
        -- instead of lazily rolling a pump's fuel. That lazy roll also fires
        -- from removeFromWorld during chunk unload, and on an empty roll it
        -- tries to spawn an "out of gas" sign on a square whose chunk is
        -- already torn down -> NPE that kills IngameState (crashed the
        -- 2026-08-06 audit at config 37, the Brandenburg gas station).
        SandboxVars.FuelStationGasInfinite = true;
        -- SandboxVars.DayLength = 26;
        SandboxVars.DayLength = 1;
        -- SandboxVars.TimeSinceApo = 3;
        SandboxVars.StartTime = 2;
        SandboxVars.AnimalRanchChance = 1; -- Never
        -- BasementSpawnFrequency is likewise only a translation key; the real
        -- option is nested (Basement.SpawnFrequency), so the old flat line
        -- never applied and vanilla random basements have always run at the
        -- default (Sometimes). Left off deliberately: turning it to 7/Always
        -- injects a new worldgen variable into the audit, and random vanilla
        -- basements are a prime suspect for the duplicate RoomDef.metaID
        -- errors. Uncomment when testing basement interactions specifically.
        -- SandboxVars.Basement = SandboxVars.Basement or {};
        -- SandboxVars.Basement.SpawnFrequency = 7; -- Always
        if not SandboxVars.GunsElevator then
            SandboxVars.GunsElevator = {};
        end
        SandboxVars.GunsElevator.elevatorSpeed = 10;

        SandboxVars.DWAPHWFF ={
            MakePrimary = false,
            IncludeLoot = true,
        }
        SandboxVars.DWAPBateman ={
            MakePrimary = true,
            IncludeLoot = true,
            PenthouseSpawn = true,
        }
        SandboxVars.DWAP = {
            EnableLadders = true,
            EnableAllLocations = true,
            Safehouse = target +1,
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
            Loot = 2, -- all
            -- Loot = 1, -- primary only
            Loot_EnableMaps = true,
            Loot_EnableBooks = true,
            SeedLibrary = true,
            -- Levels set to 3 (Low) to exercise the step-8 ADDITIVE-LOW path:
            -- at tier 3 every string-level entry goes additive (skip emptyIt,
            -- add the concentrated ~5/category floor on top of vanilla, stamp
            -- "added"); tier 1 (Full) would route them all through the
            -- unchanged replace path and never test allocation. Set back to 1
            -- to test the replace/full path.
            Loot_FoodLevel = 3,
            Loot_MediaLevel = 3,
            Loot_GunLevel = 3,
            Loot_MedLevel = 3,
            Loot_FarmLevel = 3,
            Loot_FishLevel = 3,
            Loot_TailorLevel = 3,
            Loot_LockersLevel = 3,
            Loot_ToolsLevel = 3,
            Loot_BuildMatsLevel = 3,
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
