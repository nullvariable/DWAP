-- Solar (Immersive Solar Arrays) definitions for 34_HuntingCabin.
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
local pb1 = {x = 12723, y = 8739, z = -1}

return {
    [1] = {
        powerbank = { sprite = "dwap_tiles_01_0", x = pb1.x, y = pb1.y, z = pb1.z },
        panels = {
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_7",
                x = 12714,
                y = 8752,
                z = 1,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_7",
                x = 12715,
                y = 8752,
                z = 1,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_7",
                x = 12716,
                y = 8752,
                z = 1,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_7",
                x = 12717,
                y = 8752,
                z = 1,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_7",
                x = 12718,
                y = 8752,
                z = 1,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_7",
                x = 12719,
                y = 8752,
                z = 1,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_7",
                x = 12720,
                y = 8752,
                z = 1,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_7",
                x = 12721,
                y = 8752,
                z = 1,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_7",
                x = 12722,
                y = 8752,
                z = 1,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_7",
                x = 12723,
                y = 8752,
                z = 1,
                pb = 1,
                spawn = false,
            },
        },
    },
}
