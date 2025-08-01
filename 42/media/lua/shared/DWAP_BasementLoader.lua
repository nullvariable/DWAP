-- DWAP Basement Loader
-- This ensures basement definitions are loaded during OnLoadMapZones event
-- BUT ONLY when a debug scenario is active

local function loadDWAPBasements()
    -- Check if we're in a debug scenario with proper error handling
    local selectedDebugScenario = nil
    
    -- Safely try to access the debug scenario variable
    if LuaManager and LuaManager.env then
        -- Try using pcall to safely access the environment
        local success, result = pcall(function()
            return LuaManager.env.rawget("selectedDebugScenario")
        end)
        if success then
            selectedDebugScenario = result
        end
    end
    
    -- Alternative method: check if we're using a debug scenario through game state
    if not selectedDebugScenario then
        -- Try alternative detection methods
        if getDebug() then
            -- If debug mode is active, assume we want to load basements
            selectedDebugScenario = true
        elseif _G.selectedDebugScenario then
            -- Check global variable as fallback
            selectedDebugScenario = _G.selectedDebugScenario
        end
    end
    
    if not selectedDebugScenario then
        -- No debug scenario active, don't load custom basements
        print("DWAP_BasementLoader: No debug scenario detected, skipping custom basement loading")
        return
    end
    
    print("DWAP_BasementLoader: Debug scenario detected - loading basement definitions during OnLoadMapZones")
    
    local api = Basements.getAPIv1()
    local mapID = 'Muldraugh, KY'
    
    -- Load the basement definitions from your mod's basements.lua
    local basementFile = 'media/maps/DWAP/basements.lua'
    if fileExists(basementFile) then
        print("DWAP_BasementLoader: Loading " .. basementFile)
        reloadLuaFile(basementFile)
        print("DWAP_BasementLoader: Successfully loaded DWAP basements for debug scenario")
    else
        print("DWAP_BasementLoader: Could not find " .. basementFile)
    end
end

-- Register this to run during OnLoadMapZones - the same time vanilla basements load
Events.OnLoadMapZones.Add(loadDWAPBasements)
