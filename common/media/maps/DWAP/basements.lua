local basements = { -- these are hard coded in the base game, but if we add these configs, we can spawn them
    lot_basement_jamieton_bunker_01 = { width=4, height=14, stairx=2, stairy=9, stairDir="N" },
    lot_basement_storefront_09 = { width=15, height=9, stairx=13, stairy=4, stairDir="N" },
    lot_basement_coldwar_bunker_01 = { width=61, height=52, stairx=0, stairy=24, stairDir="N" },
    lot_basement_gas_15_brandenburg = { width=10, height=10, stairx=0, stairy=1, stairDir="N" },
    lot_basement_gunclub_01 = { width=21, height=7, stairx=19, stairy=1, stairDir="N" },
}

local fullConfig = table.newarray()
fullConfig[1] = { -- DoeValleyBunker
    locations = {},
}
fullConfig[2] = { -- EchoCreek
    locations = {
        {x=12024, y=2598, stairDir="N", choices={"lot_basement_jamieton_bunker_01"}},
    },
}
fullConfig[3] = { -- LVilleMansion
    locations = {
        {x=12024, y=2598, stairDir="N", choices={"lot_basement_jamieton_bunker_01"}},
    },
}
fullConfig[4] = { -- MarchRidgeBunker
    locations = {},
}
fullConfig[5] = { -- MuldSafeHouse
    locations = {
        -- {x=10663, y=9565, stairDir="N", choices={"lot_basement_jamieton_bunker_01"}}, -- my first spot, fits into the front hall, but needs extra walls spawned and cuts off garage access.
        {x=10657, y=9562, stairDir="N", choices={"lot_basement_house_09"}, access="ba_exterior_north_westside_29"},
        {x=10658, y=9562, z=-1, stairDir="N", choices={"lot_basement_jamieton_bunker_01"}, access="ba_interior_north_01"},
    },
}
fullConfig[6] = { -- Riverside
    locations = {
        {x=6950, y=5564, stairDir="N", choices={"lot_basement_house_09"}, access="ba_house_medium_18_farmhouse"},
        {x=6951, y=5564, z=-1, stairDir="N", choices={"lot_basement_jamieton_bunker_01"}},
    },
}
fullConfig[7] = { -- RosewoodGas
    locations = {},
}
fullConfig[8] = { -- WWPSafeHouse
    locations = {
        {x=10159, y=6623, stairDir="N", choices={"lot_basement_storefront_09"}, access="ba_house_large_01_S_08"},
        {x=10146, y=6623, z=-1, stairDir="N", choices={"lot_basement_jamieton_bunker_01"}, access="ba_interior_north_01"},
    },
}
fullConfig[9] = { -- Lowry Court
    locations = {
        {x=12983, y=1916, z=0, stairDir="N", choices={"lot_basement_jamieton_bunker_01"}, access="ba_interior_north_01"},
    },
}
fullConfig[10] = { -- Grand Ohio Mall
    locations = {
        {x=13610, y=1270, stairDir="N", choices={"lot_basement_coldwar_bunker_01"}, access="ba_interior_north_01"},
    },
}
fullConfig[11] = { -- PSDelilah
    locations = {},
}
fullConfig[12] = { -- Ekron Community College
    locations = {
        {x=725, y=9820, z=-1, stairDir="N", choices={"lot_basement_coldwar_bunker_01"}},
    },
}
fullConfig[13] = { -- pawnshop
    locations = {
        {x=12333, y=1326, z=0, stairDir="N", choices={"lot_basement_house_42_B_south"}, access="ba_house_large_01_S_08"},
        {x=12334, y=1326, z=-1, stairDir="N", choices={"lot_basement_jamieton_bunker_01"}},
    },
}
fullConfig[14] = { -- autoshop
    locations = {
        {x=13137, y=3028, z=0, stairDir="N", choices={"lot_basement_jamieton_bunker_01"}},
        -- {x=10146, y=6623, z=-1, stairDir="N", choices={"lot_basement_jamieton_bunker_01"}, access="ba_interior_north_01"},
    },
}
fullConfig[15] = { -- ekron lake house
    locations = {
        {x=1897, y=9955, z=-1, stairDir="N", choices={"lot_basement_jamieton_bunker_01"}},
        -- {x=10146, y=6623, z=-1, stairDir="N", choices={"lot_basement_jamieton_bunker_01"}, access="ba_interior_north_01"},
    },
}
fullConfig[16] = { -- ELVille Farm House
    locations = {
        {x=14579, y=3035, z=0, stairDir="W", choices={"lot_basement_house_09_east"}, access="ba_house_large_01_N_02"},
        {x=14575, y=3031, z=-1, stairDir="N", choices={"lot_basement_jamieton_bunker_01"}},
    },
}
fullConfig[17] = { -- Animal rehab
    locations = {
        {x=3110, y=12048, z=0, stairDir="W", choices={"lot_basement_house_06_B_east"}, access="ba_house_medium_07"},
        {x=3106, y=12039, z=-1, stairDir="N", choices={"lot_basement_jamieton_bunker_01"}, access="ba_interior_north_01"},
    },
}
fullConfig[18] = { -- McCoy
    locations = {
    },
}
fullConfig[19] = { -- CentralLVilleMansion
    locations = {
        {x=13431, y=1908, z=0, stairDir="N", choices={"lot_basement_gas_15_brandenburg"}, },
        {x=13434, y=1913, z=-1, stairDir="N", choices={"lot_basement_jamieton_bunker_01"}, access="ba_interior_north_01"},
    },
}
fullConfig[20] = { -- CentralLVilleMansion
    locations = {
        {x=2940, y=12517, z=0, stairDir="W", choices={"lot_basement_house_08"}, },
        {x=2940, y=12561, z=0, stairDir="N", choices={"lot_basement_house_05"}, }, --access="ba_exterior_north_eastside_03_C"

        -- {x=8400, y=6590, z=0, stairDir="N", choices={"lot_basement_house_03"}, access="ba_exterior_north_eastside_02"},
        -- {x=8400, y=6590-20, z=0, stairDir="N", choices={"lot_basement_house_05"}, access="ba_exterior_north_eastside_02_C"},
        -- {x=8400, y=6590-(20*2), z=0, stairDir="N", choices={"lot_basement_house_05"}, access="ba_exterior_north_eastside_03_C"},
        -- {x=8400, y=6590-(20*3), z=0, stairDir="N", choices={"lot_basement_house_05"}, access="ba_exterior_north_eastside_04"},
        -- {x=8400, y=6590-(20*4), z=0, stairDir="N", choices={"lot_basement_house_05"}, access="ba_house_medium_100_E"},
        -- {x=8400, y=6590-(20*5), z=0, stairDir="N", choices={"lot_basement_house_05"}, access="ba_house_medium_11"},
        -- {x=8400, y=6590-(20*6), z=0, stairDir="N", choices={"lot_basement_house_05"}, access="ba_house_medium_13"},
        -- {x=8400, y=6590-(20*7), z=0, stairDir="N", choices={"lot_basement_house_05"}, access="ba_house_medium_22_redbrick"},
        -- {x=8400, y=6590-(20*8), z=0, stairDir="N", choices={"lot_basement_house_05"}, access="ba_house_medium_93_farmhouse"},
        -- {x=8400, y=6590-(20*9), z=0, stairDir="N", choices={"lot_basement_house_05"}, access="ba_house_medium_96_farmhouse"},
    },
}

local locations = {}

local function getRandomSelected()
    local random = newrandom()
    random:seed(WGParams.instance:getSeedString())
    return random:random(1, 16) -- IMPORTANT, must match the number of safehouse configs. See also DWAPUtils.lua
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
print("DWAP basements.lua loaded")

-- Notes on Muldraugh safe house
-- { name = "", type = "Basement", x = 10657, y = 9560, z = 0, width = 7, height = 14,
--     properties = {
--       StairDirection = "N",
--       StairX = 0,
--       StairY = 2,
--       Access = "ba_exterior_north_westside_29"
--     }
--   },
-- the above is the objects.lua definition for the basement here, but we want to force our chosen basement to spawn every time

-- { name = "", type = "Basement", x = 6948, y = 5562, z = 0, width = 11, height = 11,
-- properties = {
--   StairDirection = "N",
--   StairX = 2,
--   StairY = 2,
--   Access = "ba_house_medium_18_farmhouse"
-- }
-- },
-- the above is the objects.lua definition for the basement here, but we want to force our chosen basement to spawn every time

-- { name = "", type = "Basement", x = 10149, y = 6620, z = 0, width = 15, height = 13,
-- properties = {
--   StairDirection = "N",
--   StairX = 10,
--   StairY = 3,
--   Access = "ba_house_large_01_S_08"
-- }
-- },
-- the above is the objects.lua definition for the basement here, but we want to force our chosen basement to spawn every time
-- lot_basement_house_32
-- lot_basement_house_36_south
-- lot_basement_house_37_empty_south
-- lot_basement_house_39_south

-- lot_basement_house_42_B_south has water tank already
-- lot_basement_house_65 has wt
