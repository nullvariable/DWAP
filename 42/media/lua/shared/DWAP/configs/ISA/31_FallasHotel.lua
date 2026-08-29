-- Solar (Immersive Solar Arrays) definitions for 31_FallasHotel.
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
local pb1 = { x = 7254, y = 8253, z = -1 }

return {
    [1] = {
        powerbank = { sprite = "dwap_tiles_01_0", x = pb1.x, y = pb1.y, z = pb1.z },
        panels = {
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_8",
                x = 7229,
                y = 8215,
                z = 1,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_8",
                x = 7230,
                y = 8215,
                z = 1,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_8",
                x = 7231,
                y = 8215,
                z = 1,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_8",
                x = 7232,
                y = 8215,
                z = 1,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_8",
                x = 7233,
                y = 8215,
                z = 1,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_8",
                x = 7234,
                y = 8215,
                z = 1,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_8",
                x = 7229,
                y = 8216,
                z = 1,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_8",
                x = 7230,
                y = 8216,
                z = 1,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_8",
                x = 7231,
                y = 8216,
                z = 1,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_8",
                x = 7232,
                y = 8216,
                z = 1,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_8",
                x = 7233,
                y = 8216,
                z = 1,
                pb = 1,
                spawn = false,
            },
            {
                type = "panel",
                isSpecial = true,
                sprite = "solarmod_tileset_01_8",
                x = 7234,
                y = 8216,
                z = 1,
                pb = 1,
                spawn = false,
            },
        }
    },
}
