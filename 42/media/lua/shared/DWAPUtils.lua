local DWAPUtils = {}

DWAPUtils.currentVersion = 16
DWAPUtils.selectedSafehouse = 4
DWAPUtils.safehouseKeyId = nil

local getSandboxOptions = getSandboxOptions
local getGameTime = getGameTime
local getCell = getCell
local getPlayer = getPlayer
local table = table

print(("DWAPUtils.lua loaded: debug = %s"):format(tostring(getDebug())))

local configFiles = { -- should match order in Sandbox_EN and other translations, which should also be alphabetical
    [1] = "DWAP/configs/01_DoeValleyBunker",
    [2] = "DWAP/configs/02_EchoCreek",
    [3] = "DWAP/configs/03_LVilleMansion",
    [4] = "DWAP/configs/04_MarchRidgeBunker",
    [5] = "DWAP/configs/05_MuldSafeHouse",
    [6] = "DWAP/configs/06_RiverSafeHouse",
    [7] = "DWAP/configs/07_RosewoodGas",
    [8] = "DWAP/configs/08_WWPSafeHouse",
    [9] = "DWAP/configs/09_LowryCourt",
    [10] = "DWAP/configs/10_GrandOhio",
    [11] = "DWAP/configs/11_PSDelilah",
    [12] = "DWAP/configs/12_EkronCC",
    [13] = "DWAP/configs/13_LVPawnshop",
    [14] = "DWAP/configs/14_LVAutoshop",
    [15] = "DWAP/configs/15_EkronLakeHouse",
    [16] = "DWAP/configs/16_ELVilleFarm",
    [17] = "DWAP/configs/17_AnimalRehab",
    [18] = "DWAP/configs/18_McCoyEstate",
    [19] = "DWAP/configs/19_CentralLVilleMansion",
    [20] = "DWAP/configs/20_ScrapYard",
    [21] = "DWAP/configs/21_EkronFactory",
    [22] = "DWAP/configs/22_CortmanMedical",
    [23] = "DWAP/configs/23_RustyRifle",
    [24] = "DWAP/configs/24_MRSecret",
    [25] = "DWAP/configs/25_RiversideMansion",
    [26] = "DWAP/configs/26_WestPointHome",
    [27] = "DWAP/configs/27_TheDrake",
    [28] = "DWAP/configs/28_EkronPigFarm",
    [29] = "DWAP/configs/29_LVilleComplex",
    [30] = "DWAP/configs/30_BrandenburgTH",
    [31] = "DWAP/configs/31_PrisonBreak",
    [32] = "DWAP/configs/32_QuillManor",
    [33] = "DWAP/configs/33_DarkWallow",
    [34] = "DWAP/configs/34_HuntingCabin",
    [35] = "DWAP/configs/35_DrugShack",
}

local configCache = {}

--- Get a random selected safehouse
--- Should always return the same number for the same seed
--- @return number
function DWAPUtils.getRandomSelected()
    local random = newrandom()
    random:seed(WGParams.instance:getSeedString())
    return random:random(1, #configFiles) -- IMPORTANT, must match the number of safehouse configs. See also basements.lua
end

function DWAPUtils.getSafehouseKeyId()
    local random = newrandom()
    random:seed(WGParams.instance:getSeedString())
    return random:random(10000, 99999)
end

function DWAPUtils.getSafehouseIndex()
    local selected = SandboxVars.DWAP.Safehouse - 1
    if SandboxVars.DWAP.Safehouse > 1 then
        -- enum 1 is random which is the default so we need to subtract 1
        selected = SandboxVars.DWAP.Safehouse - 1
    else
        selected = DWAPUtils.getRandomSelected()
    end
    return selected
end

Events.OnInitGlobalModData.Add(function()
    DWAPUtils.selectedSafehouse = DWAPUtils.getSafehouseIndex()
    DWAPUtils.safehouseKeyId = DWAPUtils.getSafehouseKeyId()
    DWAPUtils.dprint(("OnInitGlobalModData Selected safehouse: %d"):format(DWAPUtils.selectedSafehouse))
end)

function DWAPUtils.dprint(var)
    if not getDebug() then return end
    if type(var) == "string" then
        log(DebugType.Lua, var)
        return
    end
    debugLuaTable(var)
end

--- Test if a set of coords are in a given table/list
--- @param coords table{ x = number, y = number, z = number }
--- @param list table
--- @return boolean
function DWAPUtils.areCoordsInList(coords, list)
    if not coords.x or not coords.y or not coords.z then
        return false
    end
    if not coords or type(coords) ~= "table" then
        error("areCoordsInList: coords is nil or not a table")
        log(DebugType.Lua, "areCoordsInList: coords is nil or not a table")
        return false
    end
    if not list or type(list) ~= "table" then
        error("areCoordsInList: list is nil or not a table")
        log(DebugType.Lua, "areCoordsInList: list is nil or not a table")
        return false
    end
    for i = 1, #list do
        local item = list[i]
        if item and item.x == coords.x and item.y == coords.y and item.z == coords.z then
            return true
        end
    end
    return false
end

local function maybeApplyOverrides(config)
    if config.overrides then
        local modData = ModData.getOrCreate("DWAP_Utils")
        if not modData.saveVersion or modData.saveVersion >= DWAPUtils.currentVersion then
            config.overrides = nil
            DWAPUtils.dprint("No overrides applied")
        else
            -- traverse backwards and load the newest overrides prior to the save version if there's not a matching save version
            for i = #config.overrides, 1, -1 do
                local override = config.overrides[i]
                if override.version == modData.saveVersion then
                    DWAPUtils.dprint("Applying overrides for version " .. override.version)
                    for k, v in pairs(override) do
                        config[k] = v
                    end
                    break
                end
            end
        end
    end
    config.overrides = nil
    return config
end
Events.OnInitGlobalModData.Add(function(isNewGame)
    DWAPUtils.dprint("OnInitGlobalModData")
    DWAPUtils.dprint(isNewGame)
    local modData = ModData.getOrCreate("DWAP_Utils")
    if not modData.saveVersion then
        modData.saveVersion = DWAPUtils.currentVersion
    end
end)


function DWAPUtils.loadConfigs()
    if #configCache > 0 then
        return configCache
    end
    local configs = table.newarray()
    local index = DWAPUtils.selectedSafehouse
    if index == nil then index = SandboxVars.DWAP.Safehouse - 1 end
    if SandboxVars.DWAP.EnableAllLocations then
        DWAPUtils.dprint("Loading all configs: " .. #configFiles)
        for i = 1, #configFiles do
            local config = require(configFiles[i])
            if config then
                if i ~= index and (not SandboxVars.DWAP.Loot or SandboxVars.DWAP.Loot > 3) then
                    config.loot = nil
                end
                table.insert(configs, maybeApplyOverrides(config))
            end
        end
    else
        DWAPUtils.dprint("Loading config: " .. index)
        local config = require(configFiles[index])
        if config then
            table.insert(configs, maybeApplyOverrides(config))
        else
            DWAPUtils.dprint("Error loading config: " .. index)
        end
    end
    configCache = configs
    return configCache
end

--- Test if the water is still available in the world
--- @return boolean
function DWAPUtils.WorldWaterStillAvailable()
    local waterShutModifier = getSandboxOptions():getOptionByName("WaterShutModifier"):getValue()
    return waterShutModifier > -1 and getGameTime():getWorldAgeHours() / 24 + (getSandboxOptions():getTimeSinceApo() - 1) * 30 < waterShutModifier
end

--- Test if the power is still available in the world
--- @return boolean
function DWAPUtils.WorldPowerStillAvailable()
    local elecShutModifier = getSandboxOptions():getOptionByName("ElecShutModifier"):getValue()
    return elecShutModifier > -1 and getGameTime():getWorldAgeHours() / 24 + (getSandboxOptions():getTimeSinceApo() - 1) * 30 < elecShutModifier
end

-----------------------------------------------------
--- Utility to defer a function to the next tick (frame)
--- so that we can reduce load or ensure that other things have been done
--- before we run the function
-----------------------------------------------------

local functionsPerThrottle = 5
local tickHooked = false
local functions = table.newarray()
local functionsThrottled = table.newarray()

--- Run all deferred functions
--- @param _functions function[]
--- @param maxPerTick number|nil
--- @return function[]
local function runDeferredFunctions(_functions, maxPerTick)
    local functionsToRun = _functions
    local retFunctions = table.newarray()
    local runsThisTick = 0
    for i = 1, #functionsToRun do
        if maxPerTick and runsThisTick >= maxPerTick then
            if functionsToRun[i] then
                retFunctions[#retFunctions + 1] = functionsToRun[i]
            end
        else
            runsThisTick = runsThisTick + 1
            local success, err = pcall(functionsToRun[i])
            if not success then
                log(DebugType.Lua, "Error running deferred function: " .. tostring(err))
            else
                DWAPUtils.dprint("Ran deferred function " .. tostring(i))
            end
        end
    end
    return retFunctions
end

--- Run all deferred functions
function DWAPUtils.runTick()
    DWAPUtils.dprint("runTick " .. #functions .. " " .. #functionsThrottled)
    functionsThrottled = runDeferredFunctions(functionsThrottled, functionsPerThrottle - #functions)
    functions = runDeferredFunctions(functions)
    if #functions == 0 and #functionsThrottled == 0 then
        Events.OnTick.Remove(DWAPUtils.runTick)
        tickHooked = false
    end
end

--- Defer a function to the next tick (frame)
--- @param f function
function DWAPUtils.Defer(f)
    functions[#functions + 1] = f
    if not tickHooked then
        tickHooked = true
        Events.OnTick.Add(DWAPUtils.runTick)
    end
end

--- Defer a function to the next tick (frame)
--- @param f function
function DWAPUtils.DeferThrottled(f)
    functionsThrottled[#functionsThrottled + 1] = f
    if not tickHooked then
        tickHooked = true
        Events.OnTick.Add(DWAPUtils.runTick)
    end
end

local minuteHooked = false
local minuteFunctions = table.newarray()

function DWAPUtils.runMinute()
    minuteFunctions = runDeferredFunctions(minuteFunctions)
    if #minuteFunctions == 0 then
        Events.EveryTenMinutes.Remove(DWAPUtils.runMinute)
        minuteHooked = false
    end
end

local repeatFunctions = table.newarray()
function DWAPUtils.Repeat(f, times, args)
    repeatFunctions[#repeatFunctions + 1] = {f = f, times = times, args = args}
end

Events.OnTick.Add(function()
    if #repeatFunctions == 0 then
        return
    end
    for i = 1, #repeatFunctions do
        local repeatFunction = repeatFunctions[i]
        if repeatFunction.times > 0 then
            local success, err = pcall(repeatFunction.f, repeatFunction.args)
            if not success then
                log(DebugType.Lua, "Error running repeat function: " .. tostring(err))
            end
            repeatFunction.times = repeatFunction.times - 1
        else
            repeatFunctions[i] = nil
        end
    end
end)

--- Defer a function to the next minute in game time
--- @param f function
function DWAPUtils.DeferMinute(f)
    minuteFunctions[#minuteFunctions + 1] = f
    if not minuteHooked then
        minuteHooked = true
        Events.EveryTenMinutes.Add(DWAPUtils.runMinute)
    end
end

--- Toggle the lights on in a building
--- @param square IsoGridSquare|nil
--- @param building IsoBuilding|nil
--- @param attempts number|nil
--- @return boolean
function DWAPUtils.lightsOn(square, building, attempts)
    DWAPUtils.dprint("lightsOn")
    local player = getPlayer()
    square = square or player:getCurrentSquare()
    if not square then
        if not attempts or attempts < 5 then
            DWAPUtils.Defer(function()
                DWAPUtils.lightsOn(nil, building, (attempts or 0) + 1)
            end)
            return false
        end
        return false
    end

    building = building or square:getBuilding()
    if not building then
        if not attempts or attempts < 5 then
            DWAPUtils.Defer(function()
                DWAPUtils.lightsOn(nil, building, (attempts or 0) + 1)
            end)
            return false
        end
        return false
    end
    local rooms = getCell():getRoomList()
    local switches = 0
    for i = 1, rooms:size() do
        local room = rooms:get(i - 1)
        if room:getBuilding() == building then
            local lightSwitches = room:getLightSwitches()
            for j = 1, lightSwitches:size() do
                local lightSwitch = lightSwitches:get(j - 1)
                lightSwitch:setActive(true, false, true)
                switches = switches + 1
            end
        end
    end
    DWAPUtils.dprint(("Turned on %d lights"):format(switches))
    return true
end

function DWAPUtils.hashCoords(x, y, z)
    return x * 24593 + y * 49157 + z * 193
end

return DWAPUtils
