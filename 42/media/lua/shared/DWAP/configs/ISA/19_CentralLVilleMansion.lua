-- Solar (Immersive Solar Arrays) definitions for 19_CentralLVilleMansion.
--
-- Split out of the main config so it is only require()d when ISA is actually
-- active - DWAPUtils.loadConfigs attaches it back onto generators[n].solar.
-- Without ISA the key is simply absent, which every consumer already handles
-- (devTools checkPart and SolarSupport both test for it).
--
-- Keyed by generator index so a config with solar on a generator other than
-- the first does not need a new convention.
-- pb1 is the powerbank coordinate shared with the main config; it is a
-- local there, so it has to be restated here now that solar lives in its
-- own file. Keep the two in step.
local pb1 = { x = 13452, y = 1883, z = -2 }

return {
    [1] = {
        powerbank = { sprite = "dwap_tiles_01_0", x = pb1.x, y = pb1.y, z = pb1.z },
        panels = {
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_6",
                x = 13445,
                y = 1898,
                z = 0,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_6",
                x = 13445,
                y = 1897,
                z = 0,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_6",
                x = 13445,
                y = 1896,
                z = 0,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_6",
                x = 13445,
                y = 1895,
                z = 0,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_6",
                x = 13445,
                y = 1894,
                z = 0,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_6",
                x = 13445,
                y = 1893,
                z = 0,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_6",
                x = 13445,
                y = 1892,
                z = 0,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_6",
                x = 13445,
                y = 1891,
                z = 0,
                pb = 1,
                spawn = false,
            },
        },
    },
}
