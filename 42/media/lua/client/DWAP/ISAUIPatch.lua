-- Client-side patch for ISA UI to display DWAP's drain consumption
-- This ensures the UI shows the correct total drain including DWAP's usage

if isServer() then return end

local patched = false

-- Function to try patching ISA UI
local function tryPatchISAUI()
    if patched then return end

    -- Check if ISA is loaded
    if not getActivatedMods():contains("\\ISA") then
        return -- ISA not loaded
    end

    -- Try to access the ISA UI class
    local success, ISAStatusWindowsSummaryView = pcall(function()
        return require "ImmersiveSolarArrays/UI/ISAStatusWindowsSummaryView"
    end)

    if success and ISAStatusWindowsSummaryView and ISAStatusWindowsSummaryView.update then
        -- Store the original update function
        local originalUpdate = ISAStatusWindowsSummaryView.update

        function ISAStatusWindowsSummaryView:update()
            -- Call the original function first
            originalUpdate(self)

            -- If we have powerbank data, check for DWAP drain
            if self.pb then
                local modData = self.pb:getModData()
                if modData and modData.dwap_drain then
                    -- Add DWAP's drain to the displayed drain value
                    self.drain = self.drain + modData.dwap_drain
                    -- Recalculate the difference with the updated drain
                    self.difference = self.panelsInput - (self.pb:shouldDrain() and self.drain or 0)
                end
            end
        end

        patched = true
        print("[DWAP] ISA UI patched to display DWAP power consumption")
    end
end

-- Try patching on multiple events to catch when ISA UI is loaded
Events.OnGameBoot.Add(tryPatchISAUI)
Events.OnGameStart.Add(tryPatchISAUI)

local everyTenFun
everyTenFun = function()
    if not patched then
        tryPatchISAUI()
    end
    if patched then
        Events.EveryTenMinutes.Remove(everyTenFun)
    end
end
-- Also try after a delay
Events.EveryTenMinutes.Add(everyTenFun)
