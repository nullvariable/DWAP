local DWAPUtils = {}
local IsoObjectUtils = require("Starlit/IsoObjectUtils")
local TableUtils = require("Starlit/TableUtils")

DWAPUtils.currentVersion = 17

local getSandboxOptions = getSandboxOptions
local getGameTime = getGameTime
local getCell = getCell
local getPlayer = getPlayer
local table = table

print(("DWAPUtils.lua loaded: debug = %s"):format(tostring(getDebug())))
local debugEnabled = getDebug()

-- should match order in Sandbox_EN and other translations, which should also be alphabetical
local configFiles_17 = {
    [1] = "DWAP/configs/01_DoeValleyBunker_17",
    [2] = "DWAP/configs/02_EchoCreek_17",
    [3] = "DWAP/configs/03_LVilleMansion_17",
    [4] = "DWAP/configs/04_MarchRidgeBunker_17",
    [5] = "DWAP/configs/05_MuldSafeHouse_17",
    [6] = "DWAP/configs/06_RiverSafeHouse_17",
    [7] = "DWAP/configs/07_RosewoodZippee_17",
    [8] = "DWAP/configs/08_WWPSafeHouse_17",
    [9] = "DWAP/configs/09_LowryCourt_17",
    [10] = "DWAP/configs/10_GrandOhio_17",
    [11] = "DWAP/configs/11_PSDelilah_17",
    [12] = "DWAP/configs/12_EkronCC_17",
    [13] = "DWAP/configs/13_LVPawnshop_17",
    [14] = "DWAP/configs/14_LVAutoshop_17",
    [15] = "DWAP/configs/15_EkronLakeHouse_17",
    [16] = "DWAP/configs/16_ELVilleFarm_17",
    [17] = "DWAP/configs/17_AnimalRehab_17",
    [18] = "DWAP/configs/18_McCoyEstate_17",
    [19] = "DWAP/configs/19_CentralLVilleMansion_17",
    [20] = "DWAP/configs/20_ScrapYard_17",
    [21] = "DWAP/configs/21_EkronFactory_17",
    [22] = "DWAP/configs/22_CortmanMedical_17",
    [23] = "DWAP/configs/23_RustyRifle_17",
    [24] = "DWAP/configs/24_MRSecret_17",
    [25] = "DWAP/configs/25_RiversideMansion_17",
    [26] = "DWAP/configs/26_WestPointHome_17",
    [27] = "DWAP/configs/27_TheDrake_17",
    [28] = "DWAP/configs/28_EkronPigFarm_17",
    [29] = "DWAP/configs/29_LVilleComplex_17",
    [30] = "DWAP/configs/30_IrvingtonTH_17",
    [31] = "DWAP/configs/31_FallasHotel_17",
    [32] = "DWAP/configs/32_QuillManor_17",
    [33] = "DWAP/configs/33_DarkWallow_17",
    [34] = "DWAP/configs/34_HuntingCabin_17",
    [35] = "DWAP/configs/35_DrugShack_17",
    [36] = "DWAP/configs/36_GunClub_17",
    [37] = "DWAP/configs/37_GasCorner_17",
    [38] = "DWAP/configs/38_ForLease_17",
    [39] = "DWAP/configs/39_LeafHill_17",
    [40] = "DWAP/configs/40_WestMaple_17",
    [41] = "DWAP/configs/41_SecretMausoleum_17",
    [42] = "DWAP/configs/42_LvilleTownhouse_17",
}

local configCache = {}
local cachedBaseIndex = nil
local cachedPrimaryConfigIndex = nil

--- Global variable for external configs - new system
--- Format: {
---   {
---     minimumVersion = 17,
---     file = "DWAP_HogWallowFacility",
---     overrides = {
---       makePrimary = true|false
---       includeLoot = true|false
---     },
---   }
--- }
DWAP_ExternalConfigs = DWAP_ExternalConfigs or {}

function DWAPUtils.addExternalConfig(config)
    DWAPUtils.dprint("Adding external config: " .. config.file)
    if not config or not config.file then
        error("Invalid external config: " .. tostring(config))
        return
    end
    DWAP_ExternalConfigs[#DWAP_ExternalConfigs + 1] = config
end

--- Get a random selected safehouse
--- Should always return the same number for the same seed
--- @return number
function DWAPUtils.getRandomSelected()
    local random = newrandom()
    local seed = WorldGenParams.INSTANCE:getSeedString()
    random:seed(seed)
    DWAPUtils.dprint("Random seed: " .. seed)
    return random:random(1, #configFiles_17) -- IMPORTANT, must match the number of safehouse configs. See also basements.lua
end

function DWAPUtils.getSafehouseKeyId()
    local random = newrandom()
    random:seed(WorldGenParams.INSTANCE:getSeedString())
    return random:random(10000, 99999)
end

function DWAPUtils.getBaseSafehouseIndex()
    if cachedBaseIndex then return cachedBaseIndex end
    local selected = SandboxVars.DWAP.Safehouse - 1
    if SandboxVars.DWAP.Safehouse == 1 then
        selected = DWAPUtils.getRandomSelected()
    end
    cachedBaseIndex = selected
    return selected
end

function DWAPUtils.getPrimaryConfigIndex()
    if cachedPrimaryConfigIndex then return cachedPrimaryConfigIndex end
    -- if there are any external configs that set makePrimary to true, return the last one
    if DWAP_ExternalConfigs and #DWAP_ExternalConfigs > 0 then
        for i = #DWAP_ExternalConfigs, 1, -1 do
            local extConfig = DWAP_ExternalConfigs[i]
            if extConfig.overrides and extConfig.overrides.makePrimary then
                DWAPUtils.dprint("Found external config with makePrimary: " .. extConfig.file .. ", index: " .. i .. ", returning index: " .. (#configFiles_17 + i))
                if SandboxVars.DWAP.EnableAllLocations then
                    cachedPrimaryConfigIndex = #configFiles_17 + i
                    return cachedPrimaryConfigIndex
                else -- if enable all is not selected, then it will be just 1 config from this and then any external configs
                    cachedPrimaryConfigIndex = i + 1
                    return cachedPrimaryConfigIndex
                end
            end
        end
    else
        DWAPUtils.dprint("No external configs with makePrimary found, using base safehouse index")
    end
    if SandboxVars.DWAP.EnableAllLocations then
        cachedPrimaryConfigIndex = DWAPUtils.getBaseSafehouseIndex()
    else -- 
        cachedPrimaryConfigIndex = 1
    end
    return cachedPrimaryConfigIndex
end

Events.OnInitGlobalModData.Add(function(isNewGame)
    DWAPUtils.dprint(("OnInitGlobalModData Primary Safehouse: %d"):format(DWAPUtils.getPrimaryConfigIndex()))

    local modData = ModData.getOrCreate("DWAP_Utils")
    if not modData.saveVersion then
        modData.saveVersion = DWAPUtils.currentVersion
    end
    if not modData.cachedBaseIndex then
        modData.cachedBaseIndex = DWAPUtils.getBaseSafehouseIndex()
        cachedBaseIndex = modData.cachedBaseIndex
        WorldGenParams.INSTANCE:save()
    end
    if not modData.cachedPrimaryConfigIndex then
        modData.cachedPrimaryConfigIndex = DWAPUtils.getPrimaryConfigIndex()
        cachedPrimaryConfigIndex = modData.cachedPrimaryConfigIndex
    end
    if not modData.originalSeed then
        DWAPUtils.dprint("No original seed found, setting to current seed")
        local seed = WorldGenParams.INSTANCE:getSeedString()
        modData.originalSeed = seed
        WorldGenParams.INSTANCE:save()
    else
        local seed = WorldGenParams.INSTANCE:getSeedString()
        if seed ~= modData.originalSeed then
            local message = ("DWAP Warning: Current world seed (%s) does not match original seed (%s). This may cause issues with safehouse selection and loot spawning."):format(seed, modData.originalSeed)
            print(message)
            DWAPUtils.dprint(message)
            WorldGenParams.INSTANCE:setSeedString(modData.originalSeed)
            WorldGenParams.INSTANCE:save()
            print("DWAP Attempting to restore original seed")
        end
    end

    local configs = DWAPUtils.loadConfigs()
    if configs then
        local config = configs[DWAPUtils.getPrimaryConfigIndex()]
        if config and config.spawn then
            DWAPSPAWN = {
                x = config.spawn.x,
                y = config.spawn.y,
                z = config.spawn.z
            }
        end
    end
end)

function DWAPUtils.dprint(var)
    if not debugEnabled then return end
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

function DWAPUtils.loadConfigs(noCache)
    if noCache == nil then
        noCache = false
    end
    if #configCache > 0 and not noCache then
        return configCache
    end
    local configs = table.newarray()
    local configFilesToUse = configFiles_17
    local saveVersion = DWAPUtils.getSaveVersion()
    local index = DWAPUtils.getBaseSafehouseIndex()
    if index == nil then index = SandboxVars.DWAP.Safehouse - 1 end
    local primaryIndex = DWAPUtils.getPrimaryConfigIndex()
    DWAPUtils.dprint("Base Safehouse Index: " .. index .. ", Primary Safehouse Index: " .. primaryIndex)
    if SandboxVars.DWAP.EnableAllLocations then
        if debugEnabled then
            DWAPUtils.dprint("Loading all configs: " .. #configFilesToUse)
        end
        for i = 1, #configFilesToUse do
            local file = configFilesToUse[i]
            local config = file and require(file) or false
            if config then
                if i ~= index and (not SandboxVars.DWAP.Loot or SandboxVars.DWAP.Loot > 3) then
                    -- shallow copy instead of stripping in place: require()
                    -- caches these tables, so every consumer (audit, dev
                    -- tools, systems) shares them - an in-place strip would
                    -- corrupt the config for the whole session
                    local stripped = {}
                    for k, v in pairs(config) do stripped[k] = v end
                    stripped.loot = nil
                    config = stripped
                end
                DWAPUtils.dprint("Loaded config: " .. file)
            end
            -- false placeholders keep configs[i] aligned with safehouse numbering
            configs[#configs + 1] = config
        end
    else
        DWAPUtils.dprint("Loading config: " .. index)
        local file = configFilesToUse[index]
        local config = file and require(file)
        if config then
            table.insert(configs, config)
            DWAPUtils.dprint("Loaded config: " .. configFilesToUse[index])
        else
            DWAPUtils.dprint("Error loading config: " .. index)
        end
    end

    DWAPUtils.dprint("Loading external configs: " .. #DWAP_ExternalConfigs)
    for i = 1, #DWAP_ExternalConfigs do
        local specialCount = 0
        local extConfig = DWAP_ExternalConfigs[i]
        if saveVersion >= (extConfig.minimumVersion or 0) then
            local success, config = pcall(require, extConfig.file)
            if success and config then
                if extConfig.overrides then
                    if extConfig.overrides.includeLoot == false then
                        DWAPUtils.dprint("External config override to exclude loot")
                        config.loot = nil
                    end
                    if extConfig.overrides.makePrimary then
                        DWAPUtils.dprint(extConfig.file .. " is set to be primary safehouse")
                        config.selectedSafehouse = true
                    end
                    if not extConfig.overrides.makePrimary then
                        local lootVal = extConfig.overrides.regularLoot
                        local removeSpecials = extConfig.overrides.essentialLoot and extConfig.overrides.essentialLoot < 3
                        if config.loot then
                            for j = 1, #config.loot do
                                if config.loot[j] and config.loot[j].special then
                                    specialCount = specialCount + 1
                                end
                                if config.loot[j] and config.loot[j].special ~= nil and removeSpecials then
                                    DWAPUtils.dprint(extConfig.file .. " removing special loot: " .. tostring(config.loot[j].special))
                                    config.loot[j] = nil
                                elseif config.loot[j] and type(config.loot[j].level) == "string" then
                                    if lootVal == 2 then
                                        config.loot[j] = nil
                                    elseif lootVal == 3 then -- high, or extra high
                                        config.loot[j].level = 1
                                    elseif lootVal == 4 then
                                        config.loot[j].level = 2
                                    elseif lootVal == 5 then
                                        config.loot[j].level = 3
                                    end
                                end
                            end
                        end
                    end
                    if (extConfig.overrides.essentialLoot and extConfig.overrides.essentialLoot > 2) then
                        config.essentialLootOverride = true
                    end
                    if (extConfig.overrides.regularLoot and extConfig.overrides.regularLoot > 2) then
                        config.addonLootOverride = true
                    end
                    if extConfig.overrides.keyAndMap and extConfig.overrides.keyAndMap > 1 then
                        DWAPUtils.dprint("External config override to include key and map")
                        config.doorKeys.extra = true
                        if config.map then
                            config.map.extra = true
                        end
                    end
                    if extConfig.overrides.key and extConfig.overrides.key == 2 then
                        DWAPUtils.dprint("External config override to include key")
                        config.doorKeys.extra = true
                    end
                    if config.map and extConfig.overrides.map and extConfig.overrides.map == 2 then
                        DWAPUtils.dprint("External config override to include map")
                        config.map.extra = true
                    end
                end
                table.insert(configs, config)
            else
                DWAPUtils.dprint("Error loading external config: " .. extConfig.file)
            end
        end
    end

    DWAPUtils.dprint("Loaded " .. #configs .. " configs.")
    configCache = configs
    return configCache
end

local useGen = false
function DWAPUtils.getStartingLocations()
    local spawns = {}
    local configFilesToUse = configFiles_17
    local saveVersion = DWAPUtils.getSaveVersion()
    for i = 1, #configFilesToUse do
        local file = configFilesToUse[i]
        local config = file and require(file)
        if useGen and config and config.generators and config.generators[1].controls then
            spawns[#spawns+1] = {
                x = config.generators[1].controls.x,
                y = config.generators[1].controls.y,
                z = config.generators[1].controls.z,
            }
        elseif config and config.spawn then
            spawns[#spawns + 1] = config.spawn
        end
    end
    for i = 1, #DWAP_ExternalConfigs do
        local extConfig = DWAP_ExternalConfigs[i]
        if saveVersion >= (extConfig.minimumVersion or 0) then
            local success, config = pcall(require, extConfig.file)
            if success and config then
                -- Add spawn points from external configs
                if useGen and config.generators and config.generators[1] and config.generators[1].controls then
                    spawns[#spawns+1] = {
                        x = config.generators[1].controls.x,
                        y = config.generators[1].controls.y,
                        z = config.generators[1].controls.z,
                    }
                elseif config.spawn then
                    spawns[#spawns + 1] = config.spawn
                end
            else
                DWAPUtils.dprint("Error loading external config: " .. extConfig.file)
            end
        end
    end
    return spawns
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

local functionsPerThrottle = 10 -- Increased from 5 to process more functions per tick
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
            elseif debugEnabled then
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
--- Same physical building? Runtime IsoBuilding instances are recreated per
--- streaming pass (one physical building can carry several instances right
--- after a teleport), so object identity fails - compare the map-stable
--- BuildingDef IDs instead
function DWAPUtils.sameBuilding(a, b)
    if not a or not b then return false end
    if a == b then return true end
    local da = a.getDef and a:getDef()
    local db = b.getDef and b:getDef()
    if not da or not db then return false end
    return da:getID() == db:getID()
end

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
        if DWAPUtils.sameBuilding(room:getBuilding(), building) then
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

--- Toggle the lights on in the current room only
--- @param square IsoGridSquare|nil
--- @param attempts number|nil
--- @return boolean
function DWAPUtils.lightsOnCurrentRoom(square, attempts)
    DWAPUtils.dprint("lightsOnCurrentRoom")
    local player = getPlayer()
    square = square or player:getCurrentSquare()
    if not square then
        if not attempts or attempts < 5 then
            DWAPUtils.Defer(function()
                DWAPUtils.lightsOnCurrentRoom(nil, (attempts or 0) + 1)
            end)
            return false
        end
        return false
    end

    local room = square:getRoom()
    if not room then
        DWAPUtils.dprint("No room found for current square")
        return false
    end

    local switches = 0
    local lightSwitches = room:getLightSwitches()
    for j = 1, lightSwitches:size() do
        local lightSwitch = lightSwitches:get(j - 1)
        lightSwitch:setActive(true, false, true)
        switches = switches + 1
    end
    
    DWAPUtils.dprint(("Turned on %d lights in current room"):format(switches))
    return true
end

--- Get the save version from ModData
--- @return number
function DWAPUtils.getSaveVersion()
    local utilsModData = ModData.getOrCreate("DWAP_Utils")
    
    if not utilsModData.saveVersion then
        return DWAPUtils.currentVersion
    end
    return utilsModData.saveVersion
end

--- Hash coordinates to a unique number
--- This is a simple hash function that combines x, y, z coordinates into a single number
--- @param x number
--- @param y number
--- @param z number
--- @return number
function DWAPUtils.hashCoords(x, y, z)
    return x * 24593 + y * 49157 + z * 193
end

--- Whether a square container counts as "upper" (wall-mounted) for loot.
--- 42.20 tile defs are inconsistent: overhead cabinets have type "overhead"
--- but pos=nil; trailer cabinets have ContainerPosition High/Low; medicine
--- cabinets and wall shelves have neither - callers must handle isHigh=false
--- wall containers via ordering fallbacks (see resolveLootContainer)
local function isHighContainer(object, container)
    if container:getType() == "overhead" then return true end
    if container:getContainerPosition() == "High" then return true end
    local yoff = object.getRenderYOffset and object:getRenderYOffset()
    if yoff and yoff > 32 then return true end
    return false
end

--- All containers on a square in object-list order (stable: authored into
--- the map data, floor furniture before wall furniture in practice).
--- Enumerates EVERY container per object - fridge/freezer combos carry a
--- secondary "freezer" container on the same object.
--- @return table array of { object, container, isHigh }
function DWAPUtils.getSquareContainers(square)
    local result = {}
    if not square then return result end
    local objects = square:getObjects()
    if not objects then return result end
    for j = 0, objects:size() - 1 do
        local obj = objects:get(j)
        if obj then
            if obj.getContainerCount and obj:getContainerCount() > 0 then
                for c = 0, obj:getContainerCount() - 1 do
                    local cont = obj:getContainerByIndex(c)
                    if cont then
                        result[#result + 1] = { object = obj, container = cont, isHigh = isHighContainer(obj, cont) }
                    end
                end
            else
                local cont = obj:getContainer()
                if cont then
                    result[#result + 1] = { object = obj, container = cont, isHigh = isHighContainer(obj, cont) }
                end
            end
        end
    end
    return result
end

--- Resolve which container on a square a loot entry addresses. Single source
--- of truth shared by the loot fill (Events.lua) and the dev audit tools.
--- opts.stack   = n: the nth container in object-list order (crate stacks)
--- opts.upper   = true when the entry's z carries the +0.5 flag
--- opts.pairPresent = true when the square also has the complementary
---                    (lower/upper) entry configured
--- @return ItemContainer|nil
function DWAPUtils.resolveLootContainer(square, opts)
    opts = opts or {}
    local list = DWAPUtils.getSquareContainers(square)
    if #list == 0 then return nil end
    if opts.stack then
        local hit = list[opts.stack]
        return hit and hit.container or nil
    end
    if opts.freezer then
        -- the freezer compartment of a fridge/freezer combo (secondary
        -- container with type "freezer")
        for i = 1, #list do
            if list[i].container:getType() == "freezer" then return list[i].container end
        end
        return nil
    end
    if opts.upper then
        -- property-flagged wall container wins outright
        for i = 1, #list do
            if list[i].isHigh then return list[i].container end
        end
        -- no flags (medicine/shelves/metal_shelves in 42.20): a lone
        -- container satisfies a lone upper entry; with a base+upper pair,
        -- the wall-mounted container is the LAST in object order
        if #list == 1 then
            if not opts.pairPresent then return list[1].container end
            return nil
        end
        return list[#list].container
    end
    -- base entry: first non-high, non-freezer container in object order.
    -- A lone freezer-type container (standalone freezer unit) still
    -- satisfies base so plain entries keep working on those
    local fallback = nil
    for i = 1, #list do
        if not list[i].isHigh then
            if list[i].container:getType() ~= "freezer" then
                return list[i].container
            end
            fallback = fallback or list[i].container
        end
    end
    return fallback
end

function DWAPUtils.tableSize(tbl)
    if type(tbl) ~= "table" then
        return 0
    end
    if #tbl > 0 then
        return #tbl
    end
    local count = 0
    for _ in pairs(tbl) do
        count = count + 1
    end
    return count
end

--- Connect a water tank to a specific coordinates. Note that this should be the actual coords for the tank, we'll do -1 in the code
--- @param isoObject IsoObject
--- @param coords table{ x = number, y = number, z = number }
function DWAPUtils.connectWaterTank(isoObject, coords)
    local originalSquare = isoObject:getSquare()
    local moveSquare = IsoObjectUtils.getOrCreateSquare(coords.x, coords.y, coords.z - 1)
    if moveSquare then
        isoObject:setSquare(moveSquare)
        DWAPUtils.dprint('square updated to ' .. coords.x .. "," .. coords.y .. "," .. (coords.z - 1))
        isoObject:getModData().canBeWaterPiped = false
        isoObject:setUsesExternalWaterSource(true)
        -- isoObject:transmitModData()
        isoObject:doFindExternalWaterSource()
        DWAPUtils.dprint(tostring(isoObject:hasExternalWaterSource()))
        isoObject:setSquare(originalSquare)
        DWAPUtils.dprint('square updated back')
        originalSquare:setSquareChanged()
        isoObject:transmitModData()
        DWAPUtils.dprint(originalSquare:getX() .. "," .. originalSquare:getY() .. "," .. originalSquare:getZ() .. " connected to tank")
    end
end

return DWAPUtils
