require "StashDescriptions/StashUtil";

-- @SEE DWAP_ISMapDefintions.lua
local configs = {
    [1] = {
        name = "Doe Valley Bunker Map",
        stamps = {
            {"Asterisk", nil, 5577, 9376, 0, 0, 0},
            -- {nil, "<3 Uncle Dave", 3580, 10887, 0, 0, 0},
        },
        buildingX = 5577,
        buildingY = 9372,
    },
    [2] = {
        name = "Echo Creek Safehouse Map",
        stamps = {
            {"Asterisk", nil, 3575, 10901, 0, 0, 0},
            -- {nil, "Meet here", 3580, 10887, 0, 0, 0},
        },
        buildingX = 3567,
        buildingY = 10899,
    },
    [3] = {
        name = "Louisville Safehouse Map",
        stamps = {
            {"Asterisk", nil, 12037, 2592, 0, 0, 0},
            -- {nil, "Meet here", 12045, 2577, 0, 0, 0},
        },
        buildingX = 12027,
        buildingY = 2587,
    },
    [4] = {
        name = "March Ridge Bunker Map",
        stamps = {
            {"Asterisk", nil, 9947, 12616, 0, 0, 0},
            -- {nil, "Meet Here", 9876, 12642, 0, 0, 0},
        },
    },
    [5] = {
        name = "Muldraugh Safehouse Map",
        stamps = {
            {"Asterisk", nil, 10660, 9567, 0, 0, 0},
            -- {nil, "Meet here", 8136, 11239, 0, 0, 0},
        },
        buildingX = 10669,
        buildingY = 9562,
    },
    [6] = {
        name = "Riverside Safehouse Map",
        stamps = {
            {"Asterisk", nil, 6953, 5565, 0, 0, 0},
            -- {nil, "Meet here", 8136, 11239, 0, 0, 0},
        },
        buildingX = 6962,
        buildingY = 5564,
    },
    [7] = {
        name = "Rosewood Safehouse Map",
        stamps = {
            {"Asterisk", nil, 8184, 11269.5, 1, 0, 0},
            -- {nil, "Meet here", 8136, 11239, 0, 0, 0},
        },
        buildingX = 8181,
        buildingY = 11259,
    },
    [8] = {
        name = "West Point Safehouse Map",
        stamps = {
            {"Asterisk", nil, 10162, 6622, 0, 0, 0},
            -- {nil, "Meet here", 12045, 2577, 0, 0, 0},
        },
        buildingX = 10162,
        buildingY = 6622,
    },
    [9] = {
        name = "Lowry Court Map",
        stamps = {
            {"Asterisk", nil, 12983, 1914, 0, 0, 0},
            {nil, "top floor", 12955, 1882, 0, 0, 0},
        },
        buildingX = 12993,
        buildingY = 1914,
    },
    [10] = {
        name = "West Point Safehouse Map",
        stamps = {
            {"Asterisk", nil, 13612, 1269, 0, 0, 0},
            {nil, "behind security office", 13549, 1291, 0, 0, 0},
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
            {nil, "fallout shelter in basement", 748, 9870, 0, 0, 0},
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
            {"Asterisk", nil, 565, 9374, 0, 0, 0},
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
            {"Asterisk", nil, 9850, 13111, 0, 0, 0},
        },
        buildingX = 9850,
        buildingY = 13111,
    },
    [27] = {
        name = "The Drake Map",
        stamps = {
            {"Asterisk", nil, 11908, 6853, 0, 0, 0},
        },
        buildingX = 11908,
        buildingY = 6853,
    },
}
for i = 1, #configs do
    local config = configs[i]
    local DWAPStashMap = StashUtil.newStash("DWAPStashMap" .. i, "Map", "Base.RosewoodMap", "Stash_AnnotedMap");
    for j = 1, #config.stamps do
        local stamp = config.stamps[j]
        if config.buildingX and config.buildingY then
            DWAPStashMap.buildingX = config.buildingX
            DWAPStashMap.buildingY = config.buildingY
        end
        DWAPStashMap:addStamp(stamp[1], stamp[2], stamp[3], stamp[4], stamp[5], stamp[6], stamp[7])
    end
    DWAPStashMap.customName = config.name
end
