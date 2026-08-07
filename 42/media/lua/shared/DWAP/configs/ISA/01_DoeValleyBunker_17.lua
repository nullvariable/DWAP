-- Solar (Immersive Solar Arrays) definitions for 01_DoeValleyBunker_17.
--
-- Split out of the main config so it is only require()d when ISA is actually
-- active - DWAPUtils.loadConfigs attaches it back onto generators[n].solar.
-- Without ISA the key is simply absent, which every consumer already handles
-- (devTools checkPart and SolarSupport both test for it).
--
-- Keyed by generator index so a config with solar on a generator other than
-- the first does not need a new convention.
return {
    [1] = {
        powerbank = { sprite = "dwap_tiles_01_0", x = 5584, y = 9371, z = -1 },
        panels = {
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_9",
                x = 5577,
                y = 9374,
                z = 1,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_9",
                x = 5577,
                y = 9373,
                z = 1,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_9",
                x = 5577,
                y = 9372,
                z = 1,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_9",
                x = 5577,
                y = 9371,
                z = 1,
                pb = 1,
                spawn = false,
            },
        }
    },
}
