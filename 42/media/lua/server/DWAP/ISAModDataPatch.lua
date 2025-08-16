-- Patch ISA's PowerBankSystem to include dwap_drain in saved modData
-- This ensures DWAP's drain value is transmitted to clients

if isClient() then return end

local patched = false

-- Function to try patching ISA PowerBankSystem
local function tryPatchISAPBSystem()
    if patched then return end

    -- Check if ISA is loaded
    if not getActivatedMods():contains("\\ISA") then
        return -- ISA not loaded
    end

    -- Try to access the PowerBankSystem class
    local success, PBSystem = pcall(function()
        require "ImmersiveSolarArrays/PowerBank/PowerBankSystem_Server"
        -- Look for the PBSystem in global namespace
        for name, value in pairs(_G) do
            if name == "PBSystem" or (type(value) == "table" and value.savedObjectModData) then
                return value
            end
        end
        return nil
    end)

    if success and PBSystem and PBSystem.savedObjectModData then
        -- Add dwap_drain to the saved modData if not already present
        local found = false
        for i, key in ipairs(PBSystem.savedObjectModData) do
            if key == "dwap_drain" then
                found = true
                break
            end
        end

        if not found then
            table.insert(PBSystem.savedObjectModData, "dwap_drain")
            patched = true
            print("[DWAP] ISA PowerBankSystem patched to save dwap_drain modData")
        end
    end
end

-- Try patching on multiple events to catch when ISA is loaded
Events.OnGameBoot.Add(tryPatchISAPBSystem)
Events.OnGameStart.Add(tryPatchISAPBSystem)

local everyTenFun
everyTenFun = function()
    if not patched then
        tryPatchISAPBSystem()
    end
    if patched then
        Events.EveryTenMinutes.Remove(everyTenFun)
    end
end
-- Also try after a delay
Events.EveryTenMinutes.Add(everyTenFun)
