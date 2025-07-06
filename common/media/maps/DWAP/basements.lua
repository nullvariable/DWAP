local basements = { -- these are hard coded in the base game, but if we add these configs, we can spawn them
    lot_basement_jamieton_bunker_01 = { width=4, height=14, stairx=2, stairy=9, stairDir="N" },
    lot_basement_storefront_09 = { width=15, height=9, stairx=13, stairy=4, stairDir="N" },
    lot_basement_coldwar_bunker_01 = { width=61, height=52, stairx=0, stairy=24, stairDir="N" },
    lot_basement_gas_15_brandenburg = { width=10, height=10, stairx=0, stairy=1, stairDir="N" },
    lot_basement_gunclub_01 = { width=21, height=7, stairx=19, stairy=1, stairDir="N" },
    lot_basement_house_wadsworth_main = { width=13, height=16, stairx=7, stairy=6, stairDir="N" },
    dwap_02_echo_creek_tunnel = { width=37, height=7, stairx=35, stairy=6, stairDir="N" },
    dwap_03_lville_mansion = { width=15, height=25, stairx=0, stairy=20, stairDir="N" },
    dwap_04_march_ridge_tunnel = { width=37, height=6, stairx=0, stairy=1, stairDir="N" },
    dwap_05_muldsafehouse = { width=8, height=15, stairx=0, stairy=1, stairDir="N" },
    dwap_06_riverside_farm = { width=70, height=41, stairx=9, stairy=11, stairDir="N" },
    dwap_07_rosewood_tunnel = { width=10, height=47, stairx=8, stairy=1, stairDir="N" },
    dwap_08_WWPSafeHouse = { width=19, height=62, stairx=17, stairy=4, stairDir="N" },
    dwap_09_lowry_tunnel = { width=45, height=15, stairx=43, stairy=1, stairDir="N" },
    dwap_10_tunnel_a = { width=64, height=11, stairx=63, stairy=1, stairDir="N" },
    dwap_10_tunnel_b = { width=65, height=24, stairx=0, stairy=19, stairDir="N" },
    dwap_12_cc_tunnel = { width=2, height=16, stairx=0, stairy=12, stairDir="N" },
    dwap_13_lvillepawn = { width=25, height=25, stairx=23, stairy=13, stairDir="N" },
    dwap_14_tunnel = { width=9, height=20, stairx=0, stairy=0, stairDir="N" },
    dwap_15_ekron_farm = { width=17, height=38, stairx=0, stairy=34, stairDir="N" },
    dwap_16_elvillefarm = { width=31, height=26, stairx=24, stairy=13, stairDir="W" },
    dwap_17_animal_rehab = { width=20, height=32, stairx=1, stairy=0, stairDir="W" },
    dwap_18_mccoy_mansion = { width=15, height=4, stairx=1, stairy=0, stairDir="W" },
    dwap_19_lville_mansion = { width=42, height=38, stairx=13, stairy=36, stairDir="W" },
    dwap_20_tunnel = { width=15, height=49, stairx=5, stairy=35, stairDir="N" },
    dwap_21_ekron_factory = { width=13, height=15, stairx=-1, stairy=13, stairDir="W" },
    dwap_22_cortman_basement = { width=46, height=18, stairx=24, stairy=1, stairDir="N" },
    dwap_23_rusty_rifle = { width=31, height=33, stairx=25, stairy=31, stairDir="W" },
    dwap_24_mrsecret = { width=24, height=43, stairx=1, stairy=38, stairDir="N" },
    dwap_25_riverside_mansion = { width=20, height=24, stairx=13, stairy=11, stairDir="W" },
    dwap_26_westpointhome = { width=24, height=17, stairx=15, stairy=9, stairDir="N" },
    dwap_27_drake_tunnel = { width=17, height=10, stairx=15, stairy=1, stairDir="N" },
    dwap_27_thedrake = { width=20, height=4, stairx=7, stairy=-1, stairDir="N" },
    dwap_28_pig_farm = { width=22, height=35, stairx=1, stairy=33, stairDir="W" },
    dwap_29_lvillecomplex_a = { width=19, height=46, stairx=1, stairy=44, stairDir="W" },
    dwap_29_lvillecomplex_b = { width=30, height=22, stairx=28, stairy=17, stairDir="N" },
    dwap_29_lvillecomplex_c = { width=11, height=22, stairx=9, stairy=1, stairDir="N" },
    dwap_30_brandenburg = { width=57, height=20, stairx=49, stairy=17, stairDir="N" },
    dwap_31_prison_break_a = { width=7, height=51, stairx=0, stairy=45, stairDir="N" },
    dwap_31_prison_break_b = { width=14, height=51, stairx=0, stairy=46, stairDir="N" },
    dwap_31_prison_break_c = { width=14, height=191, stairx=0, stairy=186, stairDir="N" },
    dwap_31_prison_break_d = { width=2, height=102, stairx=0, stairy=97, stairDir="N" },
    dwap_32_quill_manor = { width=41, height=23, stairx=8, stairy=10, stairDir="N" },
    dwap_33_darkwallow = { width=9, height=23, stairx=0, stairy=14, stairDir="N" },
    dwap_34_huntingcabin = { width=9, height=17, stairx=1, stairy=15, stairDir="W" },
    dwap_35_drugshack = { width=41, height=21, stairx=1, stairy=3, stairDir="W" },
    dwap_36_gunclub = { width=43, height=54, stairx=38, stairy=49, stairDir="N" },
}

local fullConfig = table.newarray()
fullConfig[1] = { -- DoeValleyBunker
    locations = {},
}
fullConfig[2] = { -- EchoCreek
    locations = {
        {x=3612, y=10903, stairDir="N", choices={"dwap_02_echo_creek_tunnel"}},
    },
}
fullConfig[3] = { -- LVilleMansion
    locations = {
        {x=12024, y=2598, stairDir="N", choices={"dwap_03_lville_mansion"}},
    },
}
fullConfig[4] = { -- MarchRidgeBunker
locations = {
        {x=9883, y=12620, stairDir="N", choices={"dwap_04_march_ridge_tunnel"}},
    },
}
fullConfig[5] = { -- MuldSafeHouse
    locations = {
        {x=10657, y=9562, stairDir="N", choices={"dwap_05_muldsafehouse"}, access="ba_exterior_north_westside_29"},
    },
}
fullConfig[6] = { -- Riverside
    locations = {
        {x=6950, y=5564, stairDir="N", choices={"dwap_06_riverside_farm"}, access="ba_house_medium_18_farmhouse"},
    },
}
fullConfig[7] = { -- RosewoodGas
locations = {
        {x=8174, y=11216, stairDir="N", choices={"dwap_07_rosewood_tunnel"},},
    },
}
fullConfig[8] = { -- WWPSafeHouse
    locations = {
        {x=10159, y=6623, stairDir="N", choices={"dwap_08_WWPSafeHouse"}, access="ba_house_large_01_S_08"},
    },
}
fullConfig[9] = { -- Lowry Court
    locations = {
        {x=12983, y=1916, z=0, stairDir="N", choices={"lot_basement_jamieton_bunker_01"}, access="ba_interior_north_01"},
    },
}
if getActivatedMods():contains("\\Ladders") then
    table.insert(fullConfig[9].locations, {x=12982, y=1921, z=0, stairDir="N", choices={"dwap_09_lowry_tunnel"},})
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
    locations = {},
}
fullConfig[12] = { -- Ekron Community College
    locations = {
        {x=725, y=9820, z=-1, stairDir="N", choices={"lot_basement_coldwar_bunker_01"}},
    },
}
if getActivatedMods():contains("\\Ladders") then
    table.insert(fullConfig[12].locations, {x=754, y=9792, stairDir="N", choices={"dwap_12_cc_tunnel"}})
end

fullConfig[13] = { -- pawnshop
locations = {
    {x=12333, y=1326, z=0, stairDir="N", choices={"dwap_13_lvillepawn"}, access="ba_house_large_01_S_08"},
},
}
fullConfig[14] = { -- autoshop
locations = {
    {x=13137, y=3028, z=0, stairDir="N", choices={"lot_basement_jamieton_bunker_01"}},
    },
}
if getActivatedMods():contains("\\Ladders") then
    table.insert(fullConfig[14].locations, {x=13136, y=3033, z=0, stairDir="N", choices={"dwap_14_tunnel"}})
end
fullConfig[15] = { -- ekron lake house
    locations = {
        {x=1906, y=9945, stairDir="N", choices={"dwap_15_ekron_farm"}},
    },
}
fullConfig[16] = { -- ELVille Farm House
    locations = {
        {x=14579, y=3035, z=0, stairDir="W", choices={"dwap_16_elvillefarm"},},
    },
}
fullConfig[17] = { -- Animal rehab
    locations = {
        {x=3110, y=12048, z=0, stairDir="W", choices={"dwap_17_animal_rehab"}, access="ba_house_medium_07"},
    },
}
fullConfig[18] = { -- McCoy
    locations = {
        {x=10109, y=8238, z=0, stairDir="W", choices={"dwap_18_mccoy_mansion"}, access="ba_exterior_west_northside_14"},
    },
}
fullConfig[19] = { -- CentralLVilleMansion
    locations = {
        {x=13432, y=1905, z=0, stairDir="W", choices={"dwap_19_lville_mansion"}, access = "ba_interior_west_07", },
    },
}
fullConfig[20] = { -- scrapeyard
    locations = {
        {x=2940, y=12517, z=0, stairDir="W", choices={"lot_basement_house_08"}, },
        {x=2940, y=12562, z=0, stairDir="N", choices={"dwap_20_tunnel"}, }, --access="ba_exterior_north_eastside_03_C"
    },
}
fullConfig[21] = { -- Ekron Factory
    locations = {
        {x=586, y=9379, z=0, stairDir="W", choices={"dwap_21_ekron_factory"} },
    },
}
fullConfig[22] = { -- Cortman
    locations = {
        {x=10860, y=10039, z=0, stairDir="N", choices={"lot_basement_house_wadsworth_main"}, access="ba_interior_north_01" },
        {x=10889, y=10021, z=0, stairDir="N", choices={"dwap_22_cortman_basement"}, },
    },
}
fullConfig[23] = { -- Rusty Rifle
    locations = {
        {x=10777, y=10577, z=0, stairDir="W", choices={"dwap_23_rusty_rifle"}, },
    },
}
fullConfig[24] = { -- March Ridge Secret complex
    locations = {
        {x=9831, y=13128, z=0, stairDir="N", choices={"dwap_24_mrsecret"}, },
    },
}
fullConfig[25] = { -- RiversideMansion
    locations = {
        {x=6675, y=5510, z=0, stairDir="W", choices={"dwap_25_riverside_mansion"}, access="ba_house_large_01_S_01" },
    },
}
fullConfig[26] = { -- WestPoint Home
    locations = {
        {x=11607, y=6726, z=0, stairDir="N", choices={"dwap_26_westpointhome"}, },
    },
}
fullConfig[27] = { -- TheDrake
    locations = {
        {x=11905-2, y=6840, z=0, stairDir="N", choices={"dwap_27_thedrake"}, },
    },
}
if getActivatedMods():contains("\\Ladders") then
    table.insert(fullConfig[27].locations, {x=11904, y=6873, z=0, stairDir="N", choices={"dwap_27_drake_tunnel"}})
end

fullConfig[28] = { -- Ekron Pig Farm
    locations = {
        {x=98, y=8958, z=0, stairDir="W", choices={"dwap_28_pig_farm"},},
    },
}
fullConfig[29] = { -- Louiseville Complex
    locations = {
        {x=14140, y=2662, z=0, stairDir="W", choices={"dwap_29_lvillecomplex_a"},},
        {x=14185, y=2636, z=0, stairDir="N", choices={"dwap_29_lvillecomplex_b"},},
        {x=14157, y=2598, z=0, stairDir="N", choices={"dwap_29_lvillecomplex_c"},},
    },
}
fullConfig[30] = { -- Brandenburg Townhome
    locations = {
        {x=2608, y=14453, z=0, stairDir="N", choices={"dwap_30_brandenburg"},},
    },
}
fullConfig[31] = { -- Prison Break Tunnel
    locations = {
        {x=7673, y=12272, z=0, stairDir="N", choices={"dwap_31_prison_break_a"}, access="ba_exterior_north_westside_01"},
        {x=7674, y=12223, z=0, stairDir="N", choices={"dwap_31_prison_break_b"},},
        {x=7674, y=12173, z=0, stairDir="N", choices={"dwap_31_prison_break_c"},},
        {x=7676, y=11983, z=0, stairDir="N", choices={"dwap_31_prison_break_d"},},
    },
}
fullConfig[32] = { -- Quill Manor
    locations = {
        {x=1225, y=7368, z=0, stairDir="N", choices={"dwap_32_quill_manor"},},
    },
}
fullConfig[33] = { -- Dark Wallow Lake House
    locations = {
        {x=8709, y=15307, z=0, stairDir="N", choices={"dwap_33_darkwallow"}, access="ba_interior_north_01"},
    },
}
fullConfig[34] = { -- Far East Muldraugh Hunting Cabin
    locations = {
        {x=12717, y=8744, z=0, stairDir="W", choices={"dwap_34_huntingcabin"}, access="ba_house_small_173"},
    },
}
fullConfig[35] = { -- East Muldraugh Drug Shack
    locations = {
        {x=11586, y=9287, z=0, stairDir="W", choices={"dwap_35_drugshack"}, access="ba_house_small_173"},
    },
}
fullConfig[36] = { -- Irvington Gun Club
    locations = {
        {x=1866, y=14160, z=0, stairDir="N", choices={"dwap_36_gunclub"},},
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
api:addBasementDefinitions('Muldraugh, KY', basements)
api:addSpawnLocations('Muldraugh, KY', locations)


if getActivatedMods():contains("\\Taylorsville") then
    api:addBasementDefinitions('Taylorsville', basements)
    api:addSpawnLocations('Taylorsville', locations)
end
print("DWAP basements.lua loaded")
