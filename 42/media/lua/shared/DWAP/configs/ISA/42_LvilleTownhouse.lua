-- Solar (Immersive Solar Arrays) definitions for 42_LvilleTownhouse.
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
local pb1 = { x = 12836, y = 1611, z = 1 }

return {
    [1] = {
        powerbank = { sprite = "dwap_tiles_01_0", x = pb1.x, y = pb1.y, z = pb1.z },
        panels = {
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_10",
                x = 12834,
                y = 1613,
                z = 2,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_10",
                x = 12835,
                y = 1613,
                z = 2,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_10",
                x = 12836,
                y = 1613,
                z = 2,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_10",
                x = 12837,
                y = 1613,
                z = 2,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_10",
                x = 12838,
                y = 1613,
                z = 2,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_10",
                x = 12834,
                y = 1615,
                z = 2,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_10",
                x = 12835,
                y = 1615,
                z = 2,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_10",
                x = 12836,
                y = 1615,
                z = 2,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_10",
                x = 12837,
                y = 1615,
                z = 2,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_10",
                x = 12838,
                y = 1615,
                z = 2,
                pb = 1,
                spawn = false,
            },
        }
    },
}
