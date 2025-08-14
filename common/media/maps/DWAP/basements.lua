local basements = { -- these are hard coded in the base game, but if we add these configs, we can spawn them
    lot_basement_jamieton_bunker_01 = { width=4, height=14, stairx=2, stairy=9, stairDir="N" },
    lot_basement_coldwar_bunker_01 = { width=61, height=52, stairx=0, stairy=24, stairDir="N" },
    lot_basement_house_wadsworth_main = { width=13, height=16, stairx=7, stairy=6, stairDir="N" },
    dummy = { width=1, height=1, stairx=0, stairy=0, stairDir='N' },
    dwap_01_doe_valley = { width=8, height=8, stairx=0, stairy=6, stairDir="N" },
    dwap_02_echo_creek_tunnel = { width=37, height=7, stairx=35, stairy=6, stairDir="N" },
    dwap_03_lville_mansion = { width=15, height=25, stairx=0, stairy=20, stairDir="N" },
    dwap_04_march_ridge_tunnel = { width=38, height=6, stairx=0, stairy=1, stairDir="N" },
    dwap_05_muldsafehouse = { width=8, height=15, stairx=0, stairy=1, stairDir="N" },
    dwap_06_riverside_farm = { width=70, height=41, stairx=9, stairy=11, stairDir="N" },
    dwap_07_rosewood_tunnel = { width=10, height=47, stairx=8, stairy=1, stairDir="N" },
    dwap_08_WWPSafeHouse = { width=19, height=62, stairx=17, stairy=4, stairDir="N" },
    dwap_09_lowry_tunnel = { width=45, height=15, stairx=43, stairy=1, stairDir="N" },
    dwap_10_tunnel_a = { width=64, height=11, stairx=63, stairy=1, stairDir="N" },
    dwap_10_tunnel_b = { width=65, height=24, stairx=0, stairy=19, stairDir="N" },
    dwap_12_cc_tunnel = { width=2, height=16, stairx=0, stairy=12, stairDir="N" },
    dwap_13_lvillepawn = { width=25, height=25, stairx=23, stairy=13, stairDir="N" },
    dwap_14_tunnel = { width=7, height=24, stairx=0, stairy=1, stairDir="N" },
    dwap_15_ekron_farm = { width=17, height=38, stairx=0, stairy=34, stairDir="N" },
    dwap_16_elvillefarm = { width=31, height=26, stairx=24, stairy=13, stairDir="W" },
    dwap_17_animal_rehab = { width=20, height=32, stairx=1, stairy=0, stairDir="W" },
    dwap_18_mccoy_mansion = { width=15, height=4, stairx=1, stairy=0, stairDir="W" },
    dwap_19_lville_mansion = { width=42, height=38, stairx=13, stairy=36, stairDir="W" },
    dwap_20_tunnel = { width=27, height=49, stairx=5, stairy=35, stairDir="N" },
    dwap_21_ekron_factory = { width=14, height=15, stairx=0, stairy=13, stairDir="W" },
    dwap_22_cortman_basement = { width=51, height=24, stairx=29, stairy=1, stairDir="N" },
    dwap_23_rusty_rifle = { width=31, height=33, stairx=25, stairy=31, stairDir="W" },
    dwap_24_mrsecret = { width=24, height=43, stairx=1, stairy=38, stairDir="N" },
    dwap_25_riverside_mansion = { width=20, height=24, stairx=13, stairy=11, stairDir="W" },
    dwap_26_westpointhome = { width=24, height=17, stairx=15, stairy=9, stairDir="N" },
    dwap_27_drake_tunnel = { width=17, height=10, stairx=15, stairy=1, stairDir="N" },
    dwap_27_thedrake = { width=28, height=4, stairx=7, stairy=-1, stairDir="N" },
    dwap_28_pig_farm = { width=22, height=35, stairx=1, stairy=33, stairDir="W" },
    dwap_29_lvillecomplex_a = { width=19, height=46, stairx=1, stairy=44, stairDir="W" },
    dwap_29_lvillecomplex_b = { width=30, height=22, stairx=28, stairy=17, stairDir="N" },
    dwap_29_lvillecomplex_c = { width=11, height=22, stairx=9, stairy=1, stairDir="N" },
    dwap_30_brandenburg = { width=57, height=20, stairx=49, stairy=17, stairDir="N" },
    dwap_31_prison_break_a = { width=7, height=50, stairx=0, stairy=44, stairDir="N" },
    dwap_31_prison_break_b = { width=14, height=52, stairx=0, stairy=46, stairDir="N" },
    dwap_31_prison_break_c = { width=14, height=191, stairx=0, stairy=186, stairDir="N" },
    dwap_31_prison_break_d = { width=3, height=102, stairx=0, stairy=97, stairDir="N" },
    dwap_32_quill_manor = { width=41, height=23, stairx=10, stairy=6, stairDir="N" },
    dwap_33_darkwallow = { width=9, height=23, stairx=0, stairy=14, stairDir="N" },
    dwap_34_huntingcabin = { width=9, height=17, stairx=1, stairy=15, stairDir="W" },
    dwap_35_drugshack = { width=41, height=21, stairx=1, stairy=3, stairDir="W" },
    dwap_36_gunclub = { width=43, height=54, stairx=38, stairy=49, stairDir="N" },
    dwap_37_gas_corner = { width=12, height=8, stairx=0, stairy=1, stairDir="N" },
    dwap_37_tunnel = { width=31, height=13, stairx=29, stairy=0, stairDir="N" },
    dwap_38_for_lease = { width=13, height=9, stairx=0, stairy=2, stairDir="N" },
    dwap_39_leaf_hill_heights = { width=9, height=8, stairx=2, stairy=0, stairDir="W" },
    dwap_40_west_maple = { width=10, height=21, stairx=7, stairy=1, stairDir="N" },
    dwap_41_parsonage = { width=21, height=14, stairx=14, stairy=2, stairDir="W" },
}

local basement_access = {
    ba_dwap_generator = { width=1, height=1, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_01 = { width=1, height=4, stairx=5, stairy=-5, stairDir="N" },
    ba_dwap_01_solar = { width=4, height=15, stairx=5, stairy=5, stairDir="N" },
    ba_dwap_jamieton_bunker_01 = { width=3, height=8, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_02_water = { width=3, height=3, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_02_water_solar = { width=25, height=18, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_03 = { width=15, height=22, stairx=0, stairy=19, stairDir="N" },
    ba_dwap_03_solar = { width=15, height=22, stairx=0, stairy=19, stairDir="N" },
    ba_dwap_04_tunnel = { width=2, height=2, stairx=0, stairy=5, stairDir="N" },
    ba_dwap_04_water = { width=3, height=3, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_05_water = { width=5, height=5, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_05_water_solar = { width=5, height=10, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_06 = { width=9, height=5, stairx=-1, stairy=5, stairDir="N" },
    ba_dwap_06_solar = { width=8, height=11, stairx=-1, stairy=5, stairDir="N" },
    ba_dwap_07 = { width=2, height=2, stairx=-2, stairy=3, stairDir="N" },
    ba_dwap_07_solar = { width=8, height=1, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_07_water = { width=9, height=2, stairx=-5, stairy=-51, stairDir="N" },
    ba_dwap_08_solar = { width=2, height=3, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_09 = { width=2, height=5, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_09_lowry_apt_ladder = { width=2, height=2, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_09_water = { width=3, height=3, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_11_deckb = { width=31, height=7, stairx=0, stairy=2, stairDir="N" },
    ba_dwap_11_solar = { width=2, height=7, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_12 = { width=2, height=4, stairx=0, stairy=1, stairDir="N" },
    ba_dwap_12_tunnel_ent = { width=9, height=2, stairx=3, stairy=-2, stairDir="N" },
    ba_dwap_13 = { width=1, height=4, stairx=0, stairy=1, stairDir="N" },
    ba_dwap_13_solar = { width=3, height=4, stairx=3, stairy=1, stairDir="N" },
    ba_dwap_14 = { width=6, height=9, stairx=0, stairy=4, stairDir="N" },
    ba_dwap_14_solar = { width=6, height=9, stairx=0, stairy=4, stairDir="N" },
    ba_dwap_15 = { width=2, height=2, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_15_solar = { width=6, height=2, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_16 = { width=17, height=17, stairx=17, stairy=4, stairDir="N" },
    ba_dwap_16_solar = { width=17, height=17, stairx=17, stairy=4, stairDir="N" },
    ba_dwap_17 = { width=9, height=2, stairx=1, stairy=-1, stairDir="W" },
    ba_dwap_17_solar = { width=9, height=11, stairx=1, stairy=-1, stairDir="W" },
    ba_dwap_18_solar = { width=8, height=5, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_19 = { width=9, height=9, stairx=1, stairy=9, stairDir="W" },
    ba_dwap_19_solar = { width=14, height=15, stairx=1, stairy=14, stairDir="W" },
    ba_dwap_20 = { width=6, height=5, stairx=2, stairy=0, stairDir="W" },
    ba_dwap_20_solar = { width=3, height=3, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_20_tunnel = { width=2, height=5, stairx=0, stairy=1, stairDir="N" },
    ba_dwap_21 = { width=20, height=8, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_21_solar = { width=3, height=2, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_22 = { width=30, height=24, stairx=29, stairy=2, stairDir="N" },
    ba_dwap_22_solar = { width=30, height=24, stairx=29, stairy=2, stairDir="N" },
    ba_dwap_23 = { width=5, height=1, stairx=1, stairy=0, stairDir="W" },
    ba_dwap_23_books = { width=3, height=3, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_23_books_solar = { width=3, height=12, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_24 = { width=23, height=42, stairx=0, stairy=38, stairDir="W" },
    ba_dwap_24_solar = { width=23, height=42, stairx=0, stairy=38, stairDir="W" },
    ba_dwap_25_water = { width=2, height=3, stairx=0, stairy=-3, stairDir="N" },
    ba_dwap_25_water_solar = { width=6, height=6, stairx=5, stairy=0, stairDir="N" },
    ba_dwap_26 = { width=15, height=9, stairx=15, stairy=9, stairDir="N" },
    ba_dwap_26_solar = { width=15, height=9, stairx=15, stairy=9, stairDir="N" },
    ba_dwap_27 = { width=30, height=30, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_27_solar = { width=30, height=30, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_28 = { width=4, height=1, stairx=1, stairy=0, stairDir="W" },
    ba_dwap_28_solar = { width=4, height=1, stairx=1, stairy=0, stairDir="W" },
    ba_dwap_29_a = { width=1, height=1, stairx=1, stairy=0, stairDir="W" },
    ba_dwap_29_b = { width=1, height=1, stairx=0, stairy=1, stairDir="N" },
    ba_dwap_29_c = { width=10, height=25, stairx=1, stairy=3, stairDir="N" },
    ba_dwap_29_solar = { width=2, height=3, stairx=-10, stairy=0, stairDir="N" },
    ba_dwap_30 = { width=2, height=2, stairx=0, stairy=1, stairDir="N" },
    ba_dwap_30_solar = { width=3, height=15, stairx=2, stairy=14, stairDir="N" },
    ba_dwap_31 = { width=10, height=13, stairx=2, stairy=1, stairDir="N" },
    ba_dwap_31_solar = { width=10, height=13, stairx=2, stairy=1, stairDir="N" },
    ba_dwap_32 = { width=4, height=9, stairx=2, stairy=0, stairDir="N" },
    ba_dwap_32_water = { width=2, height=3, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_33 = { width=3, height=6, stairx=0, stairy=1, stairDir="N" },
    ba_dwap_33_solar = { width=15, height=5, stairx=0, stairy=1, stairDir="N" },
    ba_dwap_34_solar = { width=9, height=1, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_35 = { width=35, height=12, stairx=1, stairy=0, stairDir="W" },
    ba_dwap_35_solar = { width=35, height=12, stairx=1, stairy=0, stairDir="W" },
    ba_dwap_36 = { width=2, height=7, stairx=0, stairy=2, stairDir="N" },
    ba_dwap_36_solar = { width=11, height=1, stairx=0, stairy=-30, stairDir="N" },
    ba_dwap_37 = { width=4, height=6, stairx=1, stairy=1, stairDir="N" },
    ba_dwap_37_solar = { width=9, height=8, stairx=1, stairy=1, stairDir="N" },
    ba_dwap_38_for_lease = { width=6, height=4, stairx=3, stairy=0, stairDir="W" },
    ba_dwap_38_solar = { width=9, height=5, stairx=3, stairy=3, stairDir="W" },
    ba_dwap_39_leaf_hill = { width=1, height=8, stairx=1, stairy=0, stairDir="W" },
    ba_dwap_39_solar = { width=1, height=7, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_40 = { width=4, height=4, stairx=0, stairy=1, stairDir="N" },
    ba_dwap_40_solar = { width=4, height=4, stairx=0, stairy=1, stairDir="N" },
    ba_dwap_41 = { width=10, height=10, stairx=7, stairy=0, stairDir="W" },
    ba_dwap_41_solar = { width=10, height=10, stairx=7, stairy=0, stairDir="W" },
    ba_dwap_42 = { width=20, height=20, stairx=0, stairy=3, stairDir="N" },
    ba_dwap_42_solar = { width=20, height=20, stairx=0, stairy=3, stairDir="N" },
}

local doSolar = getActivatedMods():contains("\\ISA") and SandboxVars.DWAP.EnableGenSystemSolar
local doLadders = getActivatedMods():contains("\\Ladders") and SandboxVars.DWAP.EnableLadders

local fullConfig = table.newarray()
fullConfig[1] = { -- DoeValleyBunker
    locations = {
        {x=5578, y = 9375+1, stairDir="N", choices={"dwap_01_doe_valley"}, access="ba_dwap_01"},
        {x=5575, y = 9363, z = -1, stairDir="N", choices={"dummy"}, access="ba_dwap_jamieton_bunker_01"},
    },
}
if doSolar then
    fullConfig[1].locations[1].access="ba_dwap_01_solar"
end

fullConfig[2] = { -- EchoCreek
    locations = {
        {x=3569, y = 10907, z = -2, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"},

        {x=3612, y=10903, stairDir="N", choices={"dwap_02_echo_creek_tunnel"}},
        {x=3565, y=10887, stairDir="N", choices={"dummy"}, access="ba_dwap_02_water"},
    },
}
if doSolar then
    fullConfig[2].locations[#fullConfig[2].locations].access="ba_dwap_02_water_solar"
end

fullConfig[3] = { -- LVilleMansion
locations = {
        {x=12024, y=2598, stairDir="N", choices={"dwap_03_lville_mansion"}, access="ba_dwap_03"},
    },
}
if doSolar then
    fullConfig[3].locations[1].access="ba_dwap_03_solar"
end

if doLadders then
fullConfig[4] = { -- MarchRidgeBunker
    locations = {
        {x=9883, y=12620, stairDir="N", choices={"dwap_04_march_ridge_tunnel"}},
        {x=9920, y=12628, z=-4, stairDir="N", choices={"dummy"}, access="ba_dwap_04_tunnel"},
        {x=3565, y=10888, stairDir="N", choices={"dummy"}, access="ba_dwap_02_water"},
    },
}
else
fullConfig[4] = { -- MarchRidgeBunker
    locations = {
        {x=9931, y=12616, stairDir="N", choices={"dummy"}, access="ba_dwap_04_water"},
    },
}
end
--[[

                { x = 9920, y = 12624, z = -4, createTile = true },
                { x = 9943, y = 12627, z = -4, createTile = true },
                { x = 9948, y = 12651, z = -4, createTile = true },
                { x = 9977, y = 12637, z = -4, createTile = true },
                { x = 9962, y = 12607, z = -4, createTile = true },
                { x = 9929, y = 12627, z = -1, createTile = true },
]]
table.insert(fullConfig[4].locations, {x=9920, y = 12624, z = -5, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"})
table.insert(fullConfig[4].locations, {x=9943, y = 12627, z = -5, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"})
table.insert(fullConfig[4].locations, {x=9948, y = 12652, z = -5, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"})
table.insert(fullConfig[4].locations, {x=9974, y = 12638, z = -5, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"})
table.insert(fullConfig[4].locations, {x=9962, y = 12607, z = -5, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"})
table.insert(fullConfig[4].locations, {x=9929, y = 12627, z = -2, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"})

fullConfig[5] = { -- MuldSafeHouse
    locations = {
        {x=10657, y=9562, stairDir="N", choices={"dwap_05_muldsafehouse"}, access="ba_exterior_north_westside_29"},
        {x=10658, y=9554, stairDir="N", choices={"dummy"}, access="ba_dwap_05_water"},
    },
}
if doSolar then
    fullConfig[5].locations[2].access="ba_dwap_05_water_solar"
end

fullConfig[6] = { -- Riverside
    locations = {
        {x=6950, y=5564, stairDir="N", choices={"dwap_06_riverside_farm"}, access="ba_dwap_06"},
    },
}
if doSolar then
    fullConfig[6].locations[1].access="ba_dwap_06_solar"
end

fullConfig[7] = { -- RosewoodGas
locations = {
        -- {x=8183, y = 11265, z = -2, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"},
        {x=8152, y = 11263, z = -2, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"},

        {x=8174, y=11216, stairDir="N", choices={"dwap_07_rosewood_tunnel"}, access="ba_dwap_07_water"},
        {x=8173, y=11263, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_07"},
    },
}
if doSolar then
    table.insert(fullConfig[7].locations, {x=8176, y=11272, z=-2, stairDir="N", choices={"dummy"}, access="ba_dwap_07_solar"})
end

fullConfig[8] = { -- WWPSafeHouse
    locations = {
        {x=10159, y=6623, stairDir="N", choices={"dwap_08_WWPSafeHouse"}, access="ba_house_large_01_S_08"},
    },
}
if doSolar then
    table.insert(fullConfig[8].locations, {x=10143, y=6626, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_08_solar"})
end

fullConfig[9] = { -- Lowry Court
    locations = {
        {x=12983, y=1916, z=0, stairDir="N", choices={"lot_basement_jamieton_bunker_01"}, access="ba_dwap_09"},
        {x = 12981, y = 1907, z = -1, stairDir="N", choices={"dummy"}, access="ba_dwap_jamieton_bunker_01"},
        {x=12992, y=1901, z=0, stairDir="N", choices={"dummy"}, access="ba_dwap_09_water"},
        {x=12989, y=1915, z=0, stairDir="N", choices={"dummy"}, access="ba_dwap_09_apt_oven"},

        {x=12985, y = 1916, z = -2, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"},
    },
}
if doLadders then
    table.insert(fullConfig[9].locations, {x=12982, y=1921, z=0, stairDir="N", choices={"dwap_09_lowry_tunnel"},})
    table.insert(fullConfig[9].locations, {x=12989, y=1917, z=0, stairDir="N", choices={"dummy"}, access="ba_dwap_09_lowry_apt_ladder",})
    table.insert(fullConfig[9].locations, {x=12951, y=1931, z=-5, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"})
end
if doSolar then
    -- uses the same layout as 08 for the panels
    table.insert(fullConfig[9].locations, {x=12984, y=1902, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_08_solar"})
end

local GOMgeneratorStartCoords = { x = 13636, y = 1262, z = -4, }
fullConfig[10] = { -- Grand Ohio Mall
    locations = {
        {x=13610, y=1270, stairDir="N", choices={"lot_basement_coldwar_bunker_01"}, access="ba_interior_north_01"},

        {x=GOMgeneratorStartCoords.x-22, y=GOMgeneratorStartCoords.y+12, z=GOMgeneratorStartCoords.z-1, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"},
        {x=GOMgeneratorStartCoords.x-5, y=GOMgeneratorStartCoords.y+12, z=GOMgeneratorStartCoords.z-1, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"},
        {x=GOMgeneratorStartCoords.x+1, y=GOMgeneratorStartCoords.y+36, z=GOMgeneratorStartCoords.z-1, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"},
        {x=GOMgeneratorStartCoords.x+30, y=GOMgeneratorStartCoords.y+22, z=GOMgeneratorStartCoords.z-1, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"},
        {x=GOMgeneratorStartCoords.x+15, y=GOMgeneratorStartCoords.y-12, z=GOMgeneratorStartCoords.z-1, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"},
    },
}
if doLadders then
    table.insert(fullConfig[10].locations, {x=13609, y=1270, z=-3, stairDir="N", choices={"dwap_10_tunnel_a"},})
    table.insert(fullConfig[10].locations, {x=13482, y=1297, stairDir="N", choices={"dwap_10_tunnel_b"},})
end

fullConfig[11] = { -- PSDelilah
    locations = {
        {x=2031, y=5686, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_11_deckb"},
    },
}
if doSolar then
    table.insert(fullConfig[11].locations, {x=2057, y=5685, z=-2, stairDir="N", choices={"dummy"}, access="ba_dwap_11_solar"})
end

local ECCgeneratorStartCoords = { x = 751, y = 9812, z = -5, }
fullConfig[12] = { -- Ekron Community College
    locations = {
        {x=725, y=9820, z=-1, stairDir="N", choices={"lot_basement_coldwar_bunker_01"}, access="ba_dwap_12"},

        {x=ECCgeneratorStartCoords.x-22, y=ECCgeneratorStartCoords.y+12, z=ECCgeneratorStartCoords.z-1, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"},
        {x=ECCgeneratorStartCoords.x-5, y=ECCgeneratorStartCoords.y+12, z=ECCgeneratorStartCoords.z-1, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"},
        {x=ECCgeneratorStartCoords.x+1, y=ECCgeneratorStartCoords.y+36, z=ECCgeneratorStartCoords.z-1, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"},
        {x=ECCgeneratorStartCoords.x+30, y=ECCgeneratorStartCoords.y+22, z=ECCgeneratorStartCoords.z-1, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"},
        {x=ECCgeneratorStartCoords.x+15, y=ECCgeneratorStartCoords.y-12, z=ECCgeneratorStartCoords.z-1, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"},
    },
}
if doLadders then
    table.insert(fullConfig[12].locations, {x=754, y=9792, stairDir="N", choices={"dwap_12_cc_tunnel"}})
    table.insert(fullConfig[12].locations, {x=757, y=9793, z=-5, stairDir="N", choices={"dummy"}, access="ba_dwap_12_tunnel_ent"})
end

fullConfig[13] = { -- pawnshop
    locations = {
        {x=12333, y=1326, z=0, stairDir="N", choices={"dwap_13_lvillepawn"}, access="ba_dwap_13"},
    },
}
if doSolar then
    fullConfig[13].locations[1].access="ba_dwap_13_solar"
end

fullConfig[14] = { -- autoshop
locations = {
        {x=13137, y=3028, z=0, stairDir="N", choices={"lot_basement_jamieton_bunker_01"}, access="ba_dwap_14"},
        {x=13135, y=3019, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_jamieton_bunker_01"},
        {x=13138, y=3031, z=0, stairDir="N", choices={"dwap_14_tunnel"}},
    },
}
if doSolar then
    fullConfig[14].locations[1].access="ba_dwap_14_solar"
end

fullConfig[15] = { -- ekron lake house
    locations = {
        {x=1906, y=9945, stairDir="N", choices={"dwap_15_ekron_farm"}},
        {x=1906, y=9948, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_15"},
    },
}
if doSolar then
    fullConfig[15].locations[2].access="ba_dwap_15_solar"
end

fullConfig[16] = { -- ELVille Farm House
    locations = {
        {x=14579, y=3035, z=0, stairDir="W", choices={"dwap_16_elvillefarm"}, access="ba_dwap_16"},
    },
}
if doSolar then
    fullConfig[16].locations[1].access="ba_dwap_16_solar"
end

fullConfig[17] = { -- Animal rehab
    locations = {
        {x=3110, y=12048, z=0, stairDir="W", choices={"dwap_17_animal_rehab"}, access="ba_dwap_17"},
    },
}
if doSolar then
    fullConfig[17].locations[1].access="ba_dwap_17_solar"
end

fullConfig[18] = { -- McCoy
    locations = {
        {x=10109, y=8238, z=0, stairDir="W", choices={"dwap_18_mccoy_mansion"}, access="ba_exterior_west_northside_14"},

        {x=10095, y = 8282, z = -2, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"},
        {x=10087, y = 8268, z = -2, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"},
    },
}
if doSolar then
    table.insert(fullConfig[18].locations, {x=10091, y=8242, z=0, stairDir="N", choices={"dummy"}, access="ba_dwap_18_solar"})
end
fullConfig[19] = { -- CentralLVilleMansion
    locations = {
        {x=13432, y=1905, z=0, stairDir="W", choices={"dwap_19_lville_mansion"}, access = "ba_dwap_19", },
    },
}
if doSolar then
    fullConfig[19].locations[1].access="ba_dwap_19_solar"
end

fullConfig[20] = { -- scrapeyard
    locations = {
        {x=2940, y=12517, z=0, stairDir="W", choices={"lot_basement_house_08"}, access="ba_dwap_20"},
        {x=2940, y=12562, z=0, stairDir="N", choices={"dwap_20_tunnel"}, access="ba_dwap_20_tunnel" }, --access="ba_exterior_north_eastside_03_C"
    },
}
if doSolar then
    table.insert(fullConfig[20].locations, {x=2961, y=12558, z=0, stairDir="N", choices={"dummy"}, access="ba_dwap_20_solar"})
end


fullConfig[21] = { -- Ekron Factory
    locations = {
        {x=586, y=9379, z=0, stairDir="W", choices={"dwap_21_ekron_factory"} },
        {x=556, y=9375, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_21" },
    },
}
if doSolar then
    table.insert(fullConfig[21].locations, {x=594, y=9377, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_21_solar"})
end

fullConfig[22] = { -- Cortman
    locations = {
        {x=10889, y=10021, z=0, stairDir="N", choices={"dwap_22_cortman_basement"}, access="ba_dwap_22" },
    },
}
if doSolar then
    fullConfig[22].locations[1].access="ba_dwap_22_solar"
end

fullConfig[23] = { -- Rusty Rifle
    locations = {
        {x=10777, y=10577, z=0, stairDir="W", choices={"dwap_23_rusty_rifle"}, access="ba_dwap_23" },
        {x=10764, y=10542, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_23_books" },
    },
}
if doSolar then
    fullConfig[23].locations[2].access="ba_dwap_23_books_solar"
end

fullConfig[24] = { -- March Ridge Secret complex
    locations = {
        {x=9831, y=13128, z=0, stairDir="N", choices={"dwap_24_mrsecret"}, access="ba_dwap_24" },
    },
}
if doSolar then
    fullConfig[24].locations[1].access="ba_dwap_24_solar"
end

fullConfig[25] = { -- RiversideMansion
    locations = {
        {x=6675, y=5510, z=0, stairDir="W", choices={"dwap_25_riverside_mansion"}, access="ba_house_large_01_S_01" },
        {x=6671, y=5496, z=0, stairDir="N", choices={"dummy"}, access="ba_dwap_25_water" },
    },
}
if doSolar then
    fullConfig[25].locations[2].access="ba_dwap_25_water_solar"
end

fullConfig[26] = { -- WestPoint Home
    locations = {
        {x=11607, y=6726, z=0, stairDir="N", choices={"dwap_26_westpointhome"}, access="ba_dwap_26" },
    },
}
if doSolar then
    fullConfig[26].locations[1].access="ba_dwap_26_solar"
end

fullConfig[27] = { -- TheDrake
    locations = {
        {x=11905-2, y=6840, z=0, stairDir="N", choices={"dwap_27_thedrake"}, },
        {x=11902, y=6844, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_27" },
    },
}
if doSolar then
    fullConfig[27].locations[2].access="ba_dwap_27_solar"
end
if doLadders then
    table.insert(fullConfig[27].locations, {x=11904, y=6873, z=0, stairDir="N", choices={"dwap_27_drake_tunnel"}})
end

fullConfig[28] = { -- Ekron Pig Farm
    locations = {
        {x=98, y=8958, z=0, stairDir="W", choices={"dwap_28_pig_farm"}, access="ba_dwap_28" },
    },
}
if doSolar then
    table.insert(fullConfig[28].locations, {x=104, y=8937, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_28_solar"})
end

fullConfig[29] = { -- Louiseville Complex
    locations = {
        {x=14140, y=2662, z=0, stairDir="W", choices={"dwap_29_lvillecomplex_a"}, access="ba_dwap_29_a" },
        {x=14185, y=2636, z=0, stairDir="N", choices={"dwap_29_lvillecomplex_b"}, access="ba_dwap_29_b" },
        {x=14157, y=2598, z=0, stairDir="N", choices={"dwap_29_lvillecomplex_c"},},
        {x=14156, y=2598, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_29_c" },
    },
}
if doSolar then
    table.insert(fullConfig[29].locations, {x=14145-10, y=2637, z=0, stairDir="N", choices={"dummy"}, access="ba_dwap_29_solar"})
end

fullConfig[30] = { -- Brandenburg Townhome
    locations = {
        {x=2608, y=14453, z=0, stairDir="N", choices={"dwap_30_brandenburg"},},
        {x=2608, y=14455, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_30" },
    },
}
if doSolar then
    fullConfig[30].locations[2].access="ba_dwap_30_solar"
end

fullConfig[31] = { -- Fallas Lake Diner
    locations = {
        {x=7228, y=8206, z=0, stairDir="N", choices={"lot_basement_jamieton_bunker_01"}, access="ba_dwap_31"},
        {x = 7226, y = 8197, z = -1, stairDir="N", choices={"dummy"}, access="ba_dwap_jamieton_bunker_01"},
        {x=7238, y = 8212, z = -2, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"},
    },
}
if doSolar then
    fullConfig[31].locations[1].access="ba_dwap_31_solar"
end

fullConfig[32] = { -- Quill Manor
    locations = {
        {x=1227, y=7364, z=0, stairDir="N", choices={"dwap_32_quill_manor"}, access="ba_dwap_32" },
        {x=1203, y=7374, z=0, stairDir="N", choices={"dummy"}, access="ba_dwap_32_water" },

        {x=1215, y = 7393, z = -2, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"},
        {x=1242, y = 7393, z = -2, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"},
        {x=1215, y = 7363, z = -2, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"},
    },
}
fullConfig[33] = { -- Dark Wallow Lake House
    locations = {
        {x=8709, y=15307, z=0, stairDir="N", choices={"dwap_33_darkwallow"}, access="ba_dwap_33" },
    },
}
if doSolar then
    fullConfig[33].locations[1].access="ba_dwap_33_solar"
end

fullConfig[34] = { -- Far East Muldraugh Hunting Cabin
    locations = {
        {x=12717, y=8744, z=0, stairDir="W", choices={"dwap_34_huntingcabin"}, access="ba_house_small_173"},
    },
}
if doSolar then
    table.insert(fullConfig[34].locations, {x=12714, y=8752, z=0, stairDir="N", choices={"dummy"}, access="ba_dwap_34_solar"})
end

fullConfig[35] = { -- East Muldraugh Drug Shack
    locations = {
        {x=11586, y=9287, z=0, stairDir="W", choices={"dwap_35_drugshack"}, access="ba_dwap_35"},
    },
}
if doSolar then
    fullConfig[35].locations[1].access="ba_dwap_35_solar"
end

fullConfig[36] = { -- Irvington Gun Club
    locations = {
        {x=1866, y=14160, z=0, stairDir="N", choices={"dwap_36_gunclub"},},
        {x=1866, y=14165, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_36" },
    },
}
if doSolar then
    table.insert(fullConfig[36].locations, {x=1845, y=14130-30, z=0, stairDir="N", choices={"dummy"}, access="ba_dwap_36_solar"})
end

fullConfig[37] = { -- Brandenburg Gas Corner
    locations = {
        {x=1657, y=5745, z=-1, stairDir="N", choices={"dwap_37_gas_corner"}, access="ba_dwap_37" },
    },
}
if doSolar then
    fullConfig[37].locations[1].access="ba_dwap_37_solar"
end
if doLadders then
    table.insert(fullConfig[37].locations, {x=1657, y=5749, z=0, stairDir="N", choices={"dwap_37_tunnel"}})
end
fullConfig[38] = { -- Kinsella for lease building
    locations = {
        {x=12533, y=5214, z=0, stairDir="N", choices={"dwap_38_for_lease"}, access="ba_dwap_38_for_lease"},
    },
}
if doSolar then
    fullConfig[38].locations[1].access="ba_dwap_38_solar"
end

fullConfig[39] = { -- Leaf Hill Heights
    locations = {
        {x=12395, y=3410, z=0, stairDir="W", choices={"dwap_39_leaf_hill_heights"}, access="ba_dwap_39_leaf_hill"},
    },
}
if doSolar then
    table.insert(fullConfig[39].locations, {x=12390, y=3406, z=0, stairDir="N", choices={"dummy"}, access="ba_dwap_39_solar"})
end

fullConfig[40] = { -- West Maple Golf Course
    locations = {
        {x=6125, y=6636, z=0, stairDir="N", choices={"dwap_40_west_maple"}, access="ba_dwap_40"},
    },
}
if doSolar then
    fullConfig[40].locations[1].access="ba_dwap_40_solar"
end

fullConfig[41] = { -- Rosewood Parsonage
    locations = {
        {x=8156, y=11538, z=0, stairDir="W", choices={"dwap_41_parsonage"}, access="ba_dwap_41"},
    },
}
if doSolar then
    fullConfig[41].locations[1].access="ba_dwap_41_solar"
end

fullConfig[42] = { -- Louisville Converted townhouse
    locations = {
        {x=12830, y=1613, z=0, stairDir="N", choices={"lot_basement_jamieton_bunker_01"}, access="ba_dwap_42"},
        {x = 12828, y = 1604, z = -1, stairDir="N", choices={"dummy"}, access="ba_dwap_jamieton_bunker_01"},
        {x=12835, y = 1615, z = -2, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"},
    },
}
if doSolar then
    fullConfig[42].locations[1].access="ba_dwap_42_solar"
end

local locations = {}

local function getRandomSelected()
    local random = newrandom()
    random:seed(WGParams.instance:getSeedString())
    return random:random(1, #fullConfig) -- IMPORTANT, must match the number of safehouse configs. See also DWAPUtils.lua
end

if SandboxVars.DWAP.EnableAllLocations then
    for i = 1, #fullConfig do
        for j = 1, #fullConfig[i].locations do
            table.insert(locations, fullConfig[i].locations[j])
        end
    end
else
    local index = SandboxVars.DWAP.Safehouse == 1 and getRandomSelected() or SandboxVars.DWAP.Safehouse - 1
    if fullConfig[index] and fullConfig[index].locations then
        for j = 1, #fullConfig[index].locations do
            table.insert(locations, fullConfig[index].locations[j])
        end
    end
end

local api = Basements.getAPIv1()
api:addAccessDefinitions('Muldraugh, KY', basement_access)
api:addBasementDefinitions('Muldraugh, KY', basements)
api:addSpawnLocations('Muldraugh, KY', locations)


if getActivatedMods():contains("\\Taylorsville") then
    print("DWAP Taylorsville support loading")
    api:addAccessDefinitions('Taylorsville', basement_access)
    api:addBasementDefinitions('Taylorsville', basements)
    api:addSpawnLocations('Taylorsville', locations)
end

if getActivatedMods():contains("\\shelter-EC42") then
    print("DWAP does not support Shelter Echo Creek B42 :(")
    -- api:addBasementDefinitions('Shelter Echo Creek B42', basements)
    -- api:addSpawnLocations('Shelter Echo Creek B42', locations)
end
print("DWAP basements.lua loaded")
