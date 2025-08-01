local DWAPUtils = require("DWAPUtils")
local ISA
-- Shared ISA patches that work on both client and server
local function initializeSharedISAPatches()
    DWAPUtils.dprint("DWAP_ISA: Initializing shared ISA patches")

    -- Check if ISA mod is activated and solar system is enabled
    if not (getActivatedMods():contains("\\ISA") and SandboxVars.DWAP.EnableGenSystemSolar) then
        DWAPUtils.dprint("DWAP_ISA: ISA mod not activated or solar system disabled, skipping shared patches")
        return
    end

    -- Patch WorldUtilities to include DWAP powerbank
    if ISA.WorldUtil and ISA.WorldUtil.ISATypes then
        ISA.WorldUtil.ISATypes["dwap_tiles_01_0"] = "PowerBank"

        -- Count the types manually
        local count = 0
        for _ in pairs(ISA.WorldUtil.ISATypes) do count = count + 1 end

        DWAPUtils.dprint("DWAP_ISA: Shared WorldUtil patched - dwap_tiles_01_0 added as PowerBank")
        DWAPUtils.dprint("DWAP_ISA: Total ISATypes count: " .. tostring(count))
    else
        DWAPUtils.dprint("DWAP_ISA: Failed to find ISA.WorldUtil.ISATypes in shared context")
    end
end

if (getActivatedMods():contains("\\ISA") and SandboxVars.DWAP.EnableGenSystemSolar) then
    local success, isa = pcall(require, "ImmersiveSolarArrays/Utilities")
    if not success or not isa then
        DWAPUtils.dprint("DWAP_ISA: ImmersiveSolarArrays not found or not loaded")
        return
    end
    ISA = isa
    -- Events.OnSGlobalObjectSystemInit.Add(initializeSharedISAPatches)
    -- Events.OnSGlobalObjectSystemInit.Add(initializeSharedISAPatches)
    Events.OnGameStart.Add(initializeSharedISAPatches)
    Events.OnInitGlobalModData.Add(initializeSharedISAPatches)
end
