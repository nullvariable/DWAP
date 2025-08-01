local basements = { -- these are hard coded in the base game, but if we add these configs, we can spawn them
    lot_basement_jamieton_bunker_01 = { width=4, height=14, stairx=2, stairy=9, stairDir="N" },
    lot_basement_coldwar_bunker_01 = { width=61, height=52, stairx=0, stairy=24, stairDir="N" },
    lot_basement_house_wadsworth_main = { width=13, height=16, stairx=7, stairy=6, stairDir="N" },
    dummy = { width=1, height=1, stairx=0, stairy=0, stairDir='N' },
    dwap_01_doe_valley = { width=8, height=7, stairx=-1, stairy=2, stairDir="N" },
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
    dwap_14_tunnel = { width=7, height=23, stairx=0, stairy=0, stairDir="N" },
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
    ba_dwap_01 = { width=1, height=4, stairx=3, stairy=-9, stairDir="N" },
    ba_dwap_jamieton_bunker_01 = { width=3, height=8, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_02_water = { width=3, height=3, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_03 = { width=15, height=22, stairx=0, stairy=19, stairDir="N" },
    ba_dwap_04_tunnel = { width=2, height=2, stairx=0, stairy=5, stairDir="N" },
    ba_dwap_04_water = { width=3, height=3, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_05_water = { width=5, height=5, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_06_water = { width=3, height=3, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_06 = { width=9, height=5, stairx=-1, stairy=5, stairDir="N" },
    ba_dwap_07 = { width=2, height=2, stairx=-2, stairy=3, stairDir="N" },
    ba_dwap_07_water = { width=9, height=2, stairx=-5, stairy=-51, stairDir="N" },
    ba_dwap_09 = { width=2, height=5, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_09_lowry_apt_ladder = { width=2, height=2, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_09_water = { width=3, height=3, stairx=0, stairy=0, stairDir="N" },
    -- ba_dwap_11_deck3 = { width=4, height=6, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_11_deckb = { width=31, height=7, stairx=0, stairy=2, stairDir="N" },
    ba_dwap_12 = { width=2, height=4, stairx=0, stairy=1, stairDir="N" },
    ba_dwap_12_tunnel_ent = { width=9, height=2, stairx=3, stairy=-2, stairDir="N" },
    ba_dwap_14 = { width=6, height=9, stairx=0, stairy=4, stairDir="N" },
    ba_dwap_15 = { width=2, height=2, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_16 = { width=17, height=17, stairx=17, stairy=4, stairDir="N" },
    ba_dwap_17 = { width=9, height=2, stairx=1, stairy=-1, stairDir="W" },
    ba_dwap_19 = { width=9, height=9, stairx=1, stairy=9, stairDir="W" },
    ba_dwap_20 = { width=6, height=5, stairx=2, stairy=0, stairDir="W" },
    ba_dwap_20_tunnel = { width=2, height=5, stairx=0, stairy=1, stairDir="N" },
    ba_dwap_21 = { width=20, height=8, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_22 = { width=30, height=30, stairx=29, stairy=2, stairDir="N" },
    ba_dwap_23 = { width=5, height=1, stairx=1, stairy=0, stairDir="W" },
    ba_dwap_23_books = { width=3, height=3, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_24 = { width=23, height=42, stairx=0, stairy=38, stairDir="W" },
    ba_dwap_25_water = { width=2, height=3, stairx=0, stairy=-3, stairDir="N" },
    ba_dwap_26 = { width=15, height=9, stairx=15, stairy=9, stairDir="N" },
    ba_dwap_27 = { width=30, height=30, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_28 = { width=4, height=1, stairx=1, stairy=0, stairDir="W" },
    ba_dwap_29_a = { width=1, height=1, stairx=1, stairy=0, stairDir="W" },
    ba_dwap_29_b = { width=1, height=1, stairx=0, stairy=1, stairDir="N" },
    ba_dwap_29_c = { width=10, height=25, stairx=1, stairy=3, stairDir="N" },
    ba_dwap_30 = { width=2, height=2, stairx=0, stairy=1, stairDir="N" },
    ba_dwap_31_a_b = { width=4, height=4, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_31_c_d = { width=4, height=4, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_31_d = { width=2, height=2, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_32 = { width=4, height=9, stairx=2, stairy=0, stairDir="N" },
    ba_dwap_32_water = { width=2, height=3, stairx=0, stairy=0, stairDir="N" },
    ba_dwap_33 = { width=3, height=6, stairx=0, stairy=1, stairDir="N" },
    ba_dwap_35 = { width=35, height=12, stairx=1, stairy=0, stairDir="W" },
    ba_dwap_36 = { width=2, height=7, stairx=0, stairy=2, stairDir="N" },
    ba_dwap_37 = { width=2, height=5, stairx=1, stairy=1, stairDir="N" },
    ba_dwap_38_for_lease = { width=6, height=4, stairx=3, stairy=0, stairDir="W" },
    ba_dwap_39_leaf_hill = { width=1, height=8, stairx=1, stairy=0, stairDir="W" },
    ba_dwap_40 = { width=4, height=4, stairx=0, stairy=1, stairDir="N" },
    ba_dwap_41 = { width=10, height=10, stairx=7, stairy=0, stairDir="W" },
}


local fullConfig = table.newarray()
fullConfig[1] = { -- DoeValleyBunker
    locations = {
        {x=5577, y = 9363+9, stairDir="N", choices={"dwap_01_doe_valley"}, access="ba_dwap_01"},
        {x=5575, y = 9363, z = -1, stairDir="N", choices={"dummy"}, access="ba_dwap_jamieton_bunker_01"},
    },
}

fullConfig[2] = { -- EchoCreek
    locations = {
        {x=3569, y = 10907, z = -2, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"},

        {x=3612, y=10903, stairDir="N", choices={"dwap_02_echo_creek_tunnel"}},
        {x=3565, y=10888, stairDir="N", choices={"dummy"}, access="ba_dwap_02_water"},
    },
}

fullConfig[3] = { -- LVilleMansion
locations = {
        {x=12024, y=2598, stairDir="N", choices={"dwap_03_lville_mansion"}, access="ba_dwap_03"},
    },
}
if getActivatedMods():contains("\\Ladders") then
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
table.insert(fullConfig[4].locations, {x=9948, y = 12651, z = -5, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"})
table.insert(fullConfig[4].locations, {x=9977, y = 12637, z = -5, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"})
table.insert(fullConfig[4].locations, {x=9962, y = 12607, z = -5, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"})
table.insert(fullConfig[4].locations, {x=9929, y = 12627, z = -2, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"})

fullConfig[5] = { -- MuldSafeHouse
    locations = {
        {x=10657, y=9562, stairDir="N", choices={"dwap_05_muldsafehouse"}, access="ba_exterior_north_westside_29"},
        {x=10658, y=9554, stairDir="N", choices={"dummy"}, access="ba_dwap_05_water"},
    },
}

fullConfig[6] = { -- Riverside
    locations = {
        {x=6950, y=5564, stairDir="N", choices={"dwap_06_riverside_farm"}, access="ba_dwap_06"},
    },
}

fullConfig[7] = { -- RosewoodGas
locations = {
        {x=8183, y = 11265, z = -2, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"},
        {x=8152, y = 11263, z = -2, stairDir="N", choices={"dummy"}, access="ba_dwap_generator"},

        {x=8174, y=11216, stairDir="N", choices={"dwap_07_rosewood_tunnel"}, access="ba_dwap_07_water"},
        {x=8173, y=11263, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_07"},
    },
}

fullConfig[8] = { -- WWPSafeHouse
    locations = {
        {x=10159, y=6623, stairDir="N", choices={"dwap_08_WWPSafeHouse"}, access="ba_house_large_01_S_08"},
    },
}

fullConfig[9] = { -- Lowry Court
    locations = {
        {x=12983, y=1916, z=0, stairDir="N", choices={"lot_basement_jamieton_bunker_01"}, access="ba_dwap_09"},
        {x = 12981, y = 1907, z = -1, stairDir="N", choices={"dummy"}, access="ba_dwap_jamieton_bunker_01"},
        {x=12992, y=1901, z=0, stairDir="N", choices={"dummy"}, access="ba_dwap_09_water"},
        {x=12989, y=1915, z=0, stairDir="N", choices={"dummy"}, access="ba_dwap_09_apt_oven"}
    },
}
if getActivatedMods():contains("\\Ladders") then
    table.insert(fullConfig[9].locations, {x=12982, y=1921, z=0, stairDir="N", choices={"dwap_09_lowry_tunnel"},})
    table.insert(fullConfig[9].locations, {x=12989, y=1917, z=0, stairDir="N", choices={"dummy"}, access="ba_dwap_09_lowry_apt_ladder",})
end

fullConfig[10] = { -- Grand Ohio Mall
    locations = {
        {x=13610, y=1270, stairDir="N", choices={"lot_basement_coldwar_bunker_01"}, access="ba_interior_north_01"},
    },
}
if getActivatedMods():contains("\\Ladders") then
    table.insert(fullConfig[10].locations, {x=13609, y=1270, z=-3, stairDir="N", choices={"dwap_10_tunnel_a"},})
    table.insert(fullConfig[10].locations, {x=13482, y=1297, stairDir="N", choices={"dwap_10_tunnel_b"},})
end

fullConfig[11] = { -- PSDelilah
    locations = {
        -- {x=2036, y=5684, z=2, stairDir="N", choices={"dummy"}, access="ba_dwap_11_deck3"},
        {x=2031, y=5686, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_11_deckb"},
    },
}
fullConfig[12] = { -- Ekron Community College
    locations = {
        {x=725, y=9820, z=-1, stairDir="N", choices={"lot_basement_coldwar_bunker_01"}, access="ba_dwap_12"},
    },
}
if getActivatedMods():contains("\\Ladders") then
    table.insert(fullConfig[12].locations, {x=754, y=9792, stairDir="N", choices={"dwap_12_cc_tunnel"}})
    table.insert(fullConfig[12].locations, {x=757, y=9793, z=-5, stairDir="N", choices={"dummy"}, access="ba_dwap_12_tunnel_ent"})
end

fullConfig[13] = { -- pawnshop
locations = {
    {x=12333, y=1326, z=0, stairDir="N", choices={"dwap_13_lvillepawn"}, access="ba_house_large_01_S_08"},
},
}
fullConfig[14] = { -- autoshop
locations = {
        {x=13137, y=3028, z=0, stairDir="N", choices={"lot_basement_jamieton_bunker_01"}, access="ba_dwap_14"},
        {x=13135, y=3019, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_jamieton_bunker_01"},
        {x=13138, y=3031, z=0, stairDir="N", choices={"dwap_14_tunnel"}},
    },
}

fullConfig[15] = { -- ekron lake house
    locations = {
        {x=1906, y=9945, stairDir="N", choices={"dwap_15_ekron_farm"}},
        {x=1906, y=9948, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_15"},
    },
}
fullConfig[16] = { -- ELVille Farm House
    locations = {
        {x=14579, y=3035, z=0, stairDir="W", choices={"dwap_16_elvillefarm"}, access="ba_dwap_16"},
    },
}
fullConfig[17] = { -- Animal rehab
    locations = {
        {x=3110, y=12048, z=0, stairDir="W", choices={"dwap_17_animal_rehab"}, access="ba_dwap_17"},
    },
}
fullConfig[18] = { -- McCoy
    locations = {
        {x=10109, y=8238, z=0, stairDir="W", choices={"dwap_18_mccoy_mansion"}, access="ba_exterior_west_northside_14"},
    },
}
fullConfig[19] = { -- CentralLVilleMansion
    locations = {
        {x=13432, y=1905, z=0, stairDir="W", choices={"dwap_19_lville_mansion"}, access = "ba_dwap_19", },
    },
}
fullConfig[20] = { -- scrapeyard
    locations = {
        {x=2940, y=12517, z=0, stairDir="W", choices={"lot_basement_house_08"}, access="ba_dwap_20"},
        {x=2940, y=12562, z=0, stairDir="N", choices={"dwap_20_tunnel"}, access="ba_dwap_20_tunnel" }, --access="ba_exterior_north_eastside_03_C"
    },
}
fullConfig[21] = { -- Ekron Factory
    locations = {
        {x=586, y=9379, z=0, stairDir="W", choices={"dwap_21_ekron_factory"} },
        {x=556, y=9375, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_21" },
    },
}
fullConfig[22] = { -- Cortman
    locations = {
        {x=10889, y=10021, z=0, stairDir="N", choices={"dwap_22_cortman_basement"}, access="ba_dwap_22" },
    },
}
fullConfig[23] = { -- Rusty Rifle
    locations = {
        {x=10777, y=10577, z=0, stairDir="W", choices={"dwap_23_rusty_rifle"}, access="ba_dwap_23" },
        {x=10764, y=10542, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_23_books" },
    },
}
fullConfig[24] = { -- March Ridge Secret complex
    locations = {
        {x=9831, y=13128, z=0, stairDir="N", choices={"dwap_24_mrsecret"}, access="ba_dwap_24" },
    },
}
fullConfig[25] = { -- RiversideMansion
    locations = {
        {x=6675, y=5510, z=0, stairDir="W", choices={"dwap_25_riverside_mansion"}, access="ba_house_large_01_S_01" },
        {x=6671, y=5496, z=0, stairDir="N", choices={"dummy"}, access="ba_dwap_25_water" },
    },
}
fullConfig[26] = { -- WestPoint Home
    locations = {
        {x=11607, y=6726, z=0, stairDir="N", choices={"dwap_26_westpointhome"}, access="ba_dwap_26" },
    },
}
fullConfig[27] = { -- TheDrake
    locations = {
        {x=11905-2, y=6840, z=0, stairDir="N", choices={"dwap_27_thedrake"}, },
        {x=11902, y=6844, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_27" },
    },
}
if getActivatedMods():contains("\\Ladders") then
    table.insert(fullConfig[27].locations, {x=11904, y=6873, z=0, stairDir="N", choices={"dwap_27_drake_tunnel"}})
end

fullConfig[28] = { -- Ekron Pig Farm
    locations = {
        {x=98, y=8958, z=0, stairDir="W", choices={"dwap_28_pig_farm"}, access="ba_dwap_28" },
    },
}
fullConfig[29] = { -- Louiseville Complex
    locations = {
        {x=14140, y=2662, z=0, stairDir="W", choices={"dwap_29_lvillecomplex_a"}, access="ba_dwap_29_a" },
        {x=14185, y=2636, z=0, stairDir="N", choices={"dwap_29_lvillecomplex_b"}, access="ba_dwap_29_b" },
        {x=14157, y=2598, z=0, stairDir="N", choices={"dwap_29_lvillecomplex_c"},},
        {x=14156, y=2598, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_29_c" },
    },
}
fullConfig[30] = { -- Brandenburg Townhome
    locations = {
        {x=2608, y=14453, z=0, stairDir="N", choices={"dwap_30_brandenburg"},},
        {x=2608, y=14455, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_30" },
    },
}
fullConfig[31] = { -- Prison Break Tunnel
    locations = {
        {x=7673, y=12272, z=0, stairDir="N", choices={"dwap_31_prison_break_a"}, access="ba_exterior_north_westside_01"},
        {x=7674, y=12223, z=0, stairDir="N", choices={"dwap_31_prison_break_b"},},
        {x=7674, y=12173, z=0, stairDir="N", choices={"dwap_31_prison_break_c"},},
        {x=7676, y=11983, z=0, stairDir="N", choices={"dwap_31_prison_break_d"},},
        {x=7674, y=12227, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_31_a_b"},
        {x=7674, y=12177, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_31_a_b"},
        {x=7674, y=11986, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_31_c_d"},
        {x=7677, y=11887, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_31_d"},
    },
}
fullConfig[32] = { -- Quill Manor
    locations = {
        {x=1227, y=7364, z=0, stairDir="N", choices={"dwap_32_quill_manor"}, access="ba_dwap_32" },
        {x=1203, y=7374, z=0, stairDir="N", choices={"dummy"}, access="ba_dwap_32_water" },
    },
}
fullConfig[33] = { -- Dark Wallow Lake House
    locations = {
        {x=8709, y=15307, z=0, stairDir="N", choices={"dwap_33_darkwallow"}, access="ba_dwap_33" },
    },
}
fullConfig[34] = { -- Far East Muldraugh Hunting Cabin
    locations = {
        {x=12717, y=8744, z=0, stairDir="W", choices={"dwap_34_huntingcabin"}, access="ba_house_small_173"},
    },
}
fullConfig[35] = { -- East Muldraugh Drug Shack
    locations = {
        {x=11586, y=9287, z=0, stairDir="W", choices={"dwap_35_drugshack"}, access="ba_dwap_35"},
    },
}
fullConfig[36] = { -- Irvington Gun Club
    locations = {
        {x=1866, y=14160, z=0, stairDir="N", choices={"dwap_36_gunclub"},},
        {x=1866, y=14165, z=-1, stairDir="N", choices={"dummy"}, access="ba_dwap_36" },
    },
}
fullConfig[37] = { -- Brandenburg Gas Corner
    locations = {
        {x=1657, y=5745, z=-1, stairDir="N", choices={"dwap_37_gas_corner"}, access="ba_dwap_37" },
    },
}
if getActivatedMods():contains("\\Ladders") then
    table.insert(fullConfig[37].locations, {x=1657, y=5749, z=0, stairDir="N", choices={"dwap_37_tunnel"}})
end
fullConfig[38] = { -- Kinsella for lease building
    locations = {
        {x=12533, y=5214, z=0, stairDir="N", choices={"dwap_38_for_lease"}, access="ba_dwap_38_for_lease"},
    },
}
fullConfig[39] = { -- Leaf Hill Heights
    locations = {
        {x=12395, y=3410, z=0, stairDir="W", choices={"dwap_39_leaf_hill_heights"}, access="ba_dwap_39_leaf_hill"},
    },
}
fullConfig[40] = { -- West Maple Golf Course
    locations = {
        {x=6125, y=6636, z=0, stairDir="N", choices={"dwap_40_west_maple"}, access="ba_dwap_40"},
    },
}
fullConfig[41] = { -- Rosewood Parsonage
    locations = {
        {x=8156, y=11538, z=0, stairDir="W", choices={"dwap_41_parsonage"}, access="ba_dwap_41"},
    },
}

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
