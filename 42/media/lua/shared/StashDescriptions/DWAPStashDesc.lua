require "StashDescriptions/StashUtil";

-- @SEE DWAP_ISMapDefintions.lua
local configs = {
    [1] = {
        name = "Doe Valley Bunker Map",
        stamps = {
            {"Asterisk", nil, 5577, 9376, 1, 0, 0},
        },
        buildingX = 5577,
        buildingY = 9372,
    },
    [2] = {
        name = "Echo Creek Safehouse Map",
        stamps = {
            {"Asterisk", nil, 3575, 10901, 0, 0, 0},
        },
        buildingX = 3567,
        buildingY = 10899,
    },
    [3] = {
        name = "Louisville Safehouse Map",
        stamps = {
            {"Asterisk", nil, 12037, 2592, 0, 0, 0},
        },
        buildingX = 12027,
        buildingY = 2587,
    },
    [4] = {
        name = "March Ridge Bunker Map",
        stamps = {
            {"Asterisk", nil, 9947, 12616, 0, 0, 0},
        },
        buildingX = 9925,
        buildingY = 12625,
    },
    [5] = {
        name = "Muldraugh Safehouse Map",
        stamps = {
            {"Asterisk", nil, 10709, 9551, 0.50, 0.50, 0.0, 0.000, 0.000, 0.000},
        },
        buildingX = 10669,
        buildingY = 9562,
    },
    [6] = {
        name = "Riverside Ivan Rd House Map",
        stamps = {
            {"Asterisk", nil, 6964, 5583, 0.50, 0.50, 0.0, 0.000, 0.000, 0.000},
        },
        buildingX = 6965,
        buildingY = 5584,
    },
    [7] = {
        name = "Rosewood Zippee Apts Map",
        stamps = {
            {"ArrowSouthEast", nil, 8067, 11554, 0.50, 0.50, 0.0, 0.129, 0.129, 0.129}
        },
        buildingX = 8087,
        buildingY = 11558,
    },
    [8] = {
        name = "West Point Safehouse Map",
        stamps = {
            {"Asterisk", nil, 10162, 6622, 0, 0, 0},
            {"Asterisk", nil, 10081, 7371, 0.50, 0.50, 0.0, 0.129, 0.129, 0.129},
            {"ArrowNorthWest", nil, 10102, 7357, 0.50, 0.50, 0.0, 0.129, 0.129, 0.129},
        },
        buildingX = 10083,
        buildingY = 7371,
    },
    [9] = {
        name = "Lowry Court Map",
        stamps = {
            {"Asterisk", nil, 12983, 1914, 0, 0, 0},
            {nil, "Stash_DWAP_09_text1", 12955, 1882, 0, 0, 0},
        },
        buildingX = 12993,
        buildingY = 1914,
    },
    [10] = {
        name = "Grand Ohio Map",
        stamps = {
            {"Asterisk", nil, 13612, 1269, 0, 0, 0},
            {nil, "Stash_DWAP_10_text1", 13549, 1291, 0, 0, 0},
        },
        buildingX = 13649,
        buildingY = 1272,
    },
    [11] = {
        name = "P.S. Delilah Map",
        stamps = {
            {"Asterisk", nil, 2037, 5686, 0, 0, 0},
            -- {nil, "behind security office", 13549, 1291, 0, 0, 0},
        },
        buildingX = 2037,
        buildingY = 5686,
    },
    [12] = {
        name = "Ekron Community College Map",
        stamps = {
            {"Asterisk", nil, 725, 9820, 0, 0, 0},
            {nil, "Stash_DWAP_12_text1", 748, 9870, 0, 0, 0},
        },
        buildingX = 725,
        buildingY = 9820,
    },
    [13] = {
        name = "Pawnshop Map",
        stamps = {
            {"Asterisk", nil, 12333, 1326, 0, 0, 0},
        },
        buildingX = 12321,
        buildingY = 1330,
    },
    [14] = {
        name = "Autoshop Map",
        stamps = {
            {"Asterisk", nil, 13137, 3028, 0, 0, 0},
        },
        buildingX = 13144,
        buildingY = 3022,
    },
    [15] = {
        name = "Ekron Lake House Map",
        stamps = {
            {"Asterisk", nil, 1897, 9955, 0, 0, 0},
        },
        buildingX = 1900,
        buildingY = 9957,
    },
    [16] = {
        name = "East Louisville Farm House Map",
        stamps = {
            {"Asterisk", nil, 14579, 3035, 0, 0, 0},
        },
        buildingX = 14579,
        buildingY = 3039,
    },
    [17] = {
        name = "Animal Rehab Map",
        stamps = {
            {"Asterisk", nil, 3108, 12053, 0, 0, 0},
        },
        buildingX = 3108,
        buildingY = 12053,
    },
    [18] = {
        name = "McCoy Estate Map",
        stamps = {
            {"Asterisk", nil, 10081, 8259, 0, 0, 0},
        },
        buildingX = 10081,
        buildingY = 8259,
    },
    [19] = {
        name = "Central Louisville Mansion Map",
        stamps = {
            {"Asterisk", nil, 13441, 1895, 0, 0, 0},
        },
        buildingX = 13441,
        buildingY = 1895,
    },
    [20] = {
        name = "ScrapYard Map",
        stamps = {
            {"Asterisk", nil, 2937, 12523, 0, 0, 0},
        },
        buildingX = 2937,
        buildingY = 12523,
    },
    [201] = { -- fix the second building from getting stories?
        name = "ScrapYard Map2",
        buildingX = 2939,
        buildingY = 12566,
    },
    [21] = {
        name = "Ekron Factory Map",
        stamps = {
            {"Asterisk", nil, 565, 9374, 1, 1, 1},
        },
        buildingX = 565,
        buildingY = 9374,
    },
    [22] = {
        name = "Cortman Medical Map",
        stamps = {
            {"Asterisk", nil, 10877, 10022, 0, 0, 0},
        },
        buildingX = 10877,
        buildingY = 10022,
    },
    [23] = {
        name = "Rusty Rifle Map",
        stamps = {
            {"Asterisk", nil, 10758, 10549, 0, 0, 0},
        },
        buildingX = 10758,
        buildingY = 10549,
    },
    [24] = {
        name = "March Ridge Clandestine Complex Map",
        stamps = {
            {"Asterisk", nil, 9850, 13111, 0, 0, 0},
        },
        buildingX = 9850,
        buildingY = 13111,
    },
    [25] = {
        name = "Riverside Mansion Map",
        stamps = {
            {"Asterisk", nil, 6674, 5514, 0, 0, 0},
        },
        buildingX = 6674,
        buildingY = 5514,
    },
    [26] = {
        name = "West Point Home Map",
        stamps = {
            {"Asterisk", nil, 11602, 6731, 0, 0, 0},
        },
        buildingX = 11602,
        buildingY = 6731,
    },
    [27] = {
        name = "The Drake Map",
        stamps = {
            {"Asterisk", nil, 11908, 6853, 0, 0, 0},
        },
        buildingX = 11908,
        buildingY = 6853,
    },
    [28] = {
        name = "Ekron Pig Farm Map",
        stamps = {
            {"Asterisk", nil, 104, 8955, 0, 0, 0},
        },
        buildingX = 104,
        buildingY = 8955,
    },
    [29] = {
        name = "LV Complex Map",
        stamps = {
            {"Asterisk", nil, 14151, 2629, 0, 0, 0},
        },
        buildingX = 14146,
        buildingY = 2660,
    },
    [30] = {
        name = "Brandenburg Townhome Map",
        stamps = {
            {"Asterisk", nil, 2609, 14458, 0, 0, 0},
        },
        buildingX = 2609,
        buildingY = 14458,
    },
    [31] = {
        name = "Fallas Hotel Map",
        stamps = {
            {"Asterisk", nil, 7253, 8248, 0, 0, 0},
        },
        buildingX = 7253,
        buildingY = 8248,
    },
    [32] = {
        name = "Quill Manor Map",
        stamps = {
            {"Asterisk", nil, 1221, 7384, 0, 0, 0},
            {nil, "Stash_DWAP_32_text1", 1214, 7400, 0, 0, 0},
        },
        buildingX = 1221,
        buildingY = 7384,
    },
    [33] = {
        name = "Dark Wallow Lake Map",
        stamps = {
            {"Asterisk", nil, 8718, 15311, 0, 0, 0},
        },
        buildingX = 8718,
        buildingY = 15311,
    },
    [34] = {
        name = "Eastern Hunting Cabin Map",
        stamps = {
            {"Asterisk", nil, 12722, 8749, 0, 0, 0},
        },
        buildingX = 12722,
        buildingY = 8749,
    },
    [35] = {
        name = "Drug Lab Map",
        stamps = {
            {"Asterisk", nil, 11613, 9293, 0, 0, 0},
        },
        buildingX = 11613,
        buildingY = 9293,
    },
    [36] = {
        name = "Gun Club Map",
        stamps = {
            {"Asterisk", nil, 1858, 14166, 0, 0, 0},
        },
        buildingX = 1858,
        buildingY = 14166,
    },
    [37] = {
        name = "Gas Corner Map",
        stamps = {
            {"Asterisk", nil, 1664, 5746, 0, 0, 0},
        },
        buildingX = 1664,
        buildingY = 5746,
    },
    [38] = {
        name = "For Lease Map",
        stamps = {
            {"Asterisk", nil, 12538, 5211, 0, 0, 0},
        },
        buildingX = 12538,
        buildingY = 5211,
    },
    [39] = {
        name = "Leaf Hill Map",
        stamps = {
            {"Asterisk", nil, 12395, 3404, 0, 0, 0},
        },
        buildingX = 12395,
        buildingY = 3404,
    },
    [40] = {
        name = "West Maple Golf Course Map",
        stamps = {
            {"Asterisk", nil, 6117, 6638, 0, 0, 0},
        },
        buildingX = 6117,
        buildingY = 6638,
    },
    [41] = {
        name = "Secret Mausoleum Map",
        stamps = {
            {"Asterisk", nil, 8143, 11515, 0, 0, 0},
            {nil, "Stash_DWAP_41_text1", 8090, 11533, 0.00, 0.00, 0.0, 0.129, 0.129, 0.129},
        },
        buildingX = 8143,
        buildingY = 11515,
    },
    [42] = {
        name = "Louisville Townhouse Map",
        stamps = {
            {"Asterisk", nil, 12832, 1619, 0, 0, 0},
            -- {nil, "Stash_DWAP_42_text1", 12688, 1496, 1, 1, 1},
        },
        buildingX = 12832,
        buildingY = 1619,
    },
}

if getActivatedMods():contains("\\Ladders") then
    print("Found Ladders mod, adding ladder stamps to safehouses")
    table.insert(configs[2].stamps, {"Ladder", nil, 3612, 10902, 0, 0, 0})
    table.insert(configs[4].stamps, {"Ladder", nil, 9883, 12619, 0, 0, 0})
    table.insert(configs[6].stamps, {"Ladder", nil, 7009, 5591, 0, 0, 0})
    table.insert(configs[7].stamps, {"Ladder", nil, 8174, 11215, 0, 0, 0})
    table.insert(configs[8].stamps, {"Ladder", nil, 10143, 6679, 0, 0, 0})
    table.insert(configs[9].stamps, {"Ladder", nil, 12939, 1933, 0, 0, 0})
    table.insert(configs[10].stamps, {"Ladder", nil, 13482, 1300, 0, 0, 0})
    table.insert(configs[12].stamps, {"Ladder", nil, 754, 9780, 0, 0, 0})
    table.insert(configs[13].stamps, {"Ladder", nil, 12321, 1313, 0, 0, 0})
    table.insert(configs[14].stamps, {"Ladder", nil, 13143, 3051, 0, 0, 0})
    table.insert(configs[15].stamps, {"Ladder", nil, 1921, 9911, 0, 0, 0})
    table.insert(configs[17].stamps, {"Ladder", nil, 3127, 12078, 0, 0, 0})
    table.insert(configs[19].stamps, {"Ladder", nil, 13452, 1874, 0, 0, 0})
    table.insert(configs[20].stamps, {"Ladder", nil, 2939, 12561, 0, 0, 0})
    table.insert(configs[21].stamps, {"Ladder", nil, 598, 9376, 0, 0, 0})
    table.insert(configs[22].stamps, {"Ladder", nil, 10909, 10020, 0, 0, 0})
    table.insert(configs[23].stamps, {"Ladder", nil, 10752, 10547, 0, 0, 0})
    table.insert(configs[27].stamps, {"Ladder", nil, 11889, 6880, 0, 0, 0})
    table.insert(configs[28].stamps, {"Ladder", nil, 117, 8925, 0, 0, 0})
    table.insert(configs[30].stamps, {"Ladder", nil, 2559, 14454, 0, 0, 0})
    table.insert(configs[31].stamps, {"Ladder", nil, 7679, 12205, 0, 0, 0})
    table.insert(configs[33].stamps, {"Ladder", nil, 8716, 15314, 0, 0, 0})
    table.insert(configs[36].stamps, {"Ladder", nil, 1831, 14111, 0, 0, 0})
    table.insert(configs[41].stamps, {"Ladder", nil, 8128, 11514, 0, 0, 0})
end

for i = 1, #configs do
    local config = configs[i]
    local DWAPStashMap = StashUtil.newStash("DWAPStashMap" .. i, "Map", "Base.RosewoodMap", "Stash_AnnotedMap");
    -- hoisted out of the stamp loop: it does not vary per stamp, and a config
    -- with a building but no stamps would otherwise never get one
    if config.buildingX and config.buildingY then
        DWAPStashMap.buildingX = config.buildingX
        DWAPStashMap.buildingY = config.buildingY
    end
    for j = 1, #config.stamps do
        local stamp = config.stamps[j]
        -- addStampV2 inserts anchorX, anchorY and rotation BEFORE the colours,
        -- so a 7-element row cannot simply be extended - the values would land
        -- in the wrong parameters. Switch on length instead, which lets a new
        -- stamp opt into V2 without rewriting the 72 that do not need it.
        -- Colours are 0..1 floats in both: StashSystem passes r/g/b straight
        -- into addTexture alongside a literal 1.0 alpha.
        if #stamp >= 10 then
            -- called through StashUtil rather than as a method: newStash only
            -- attaches addStamp and addContainer to the instance, so
            -- DWAPStashMap:addStampV2 is nil even though StashUtil defines it.
            -- Passing the stash as self does the same job without depending on
            -- vanilla wiring it up later.
            StashUtil.addStampV2(DWAPStashMap, stamp[1], stamp[2], stamp[3], stamp[4],
                stamp[5], stamp[6], stamp[7], stamp[8], stamp[9], stamp[10])
        else
            DWAPStashMap:addStamp(stamp[1], stamp[2], stamp[3], stamp[4], stamp[5], stamp[6], stamp[7])
        end
    end
    DWAPStashMap.customName = config.name
    DWAPStashMap.minDayToSpawn = 100
    DWAPStashMap.maxDayToSpawn = 1
end
