local wtc = { x = 11606, y = 9299, z = -1 }
local pb1 = { x = 11609, y = 9290, z = -1 }
local DrugShack = {
    group = "Muldraugh",                 -- Also kinda closer to Dixie
    baseBuildings = {
        { x = 11613, y = 9293, z = 0 },  -- trailer
        { x = 11615, y = 9296, z = -1 }, -- basement
        { x = 11582, y = 9290, z = 0 },  -- rundown house
    },
    baseRooms = {
        { x = 11617, y = 9293, z = 0 },  -- druglab
        { x = 11583, y = 9291, z = 0 },  -- drugshack
        { x = 11600, y = 9289, z = -1 }, -- hallway
        { x = 11588, y = 9293, z = -1 }, -- bedroom
        { x = 11590, y = 9299, z = -1 }, -- medical
        { x = 11600, y = 9296, z = -1 }, -- bar
        { x = 11597, y = 9293, z = -1 }, -- kitchen
        { x = 11614, y = 9296, z = -1 }, -- warehouse
        { x = 11617, y = 9293, z = -1 }, -- lab
        { x = 11620, y = 9288, z = -1 }, -- workroom
    },
    spawn = { x = 11613, y = 9293, z = 0 },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = wtc },
    },
    waterFixtures = {
        -- upper
        { sprite = "fixtures_sinks_01_17",    x = 11580, y = 9288, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_9",     x = 11615, y = 9292, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_9",     x = 11617, y = 9292, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- basement
        { sprite = "appliances_laundry_01_1", x = 11605, y = 9294, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_2",     x = 11592, y = 9298, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_14",    x = 11598, y = 9290, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_4",  x = 11595, y = 9284, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_30", x = 11597, y = 9284, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_29",    x = 11597, y = 9286, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
    },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 11608, y = 9291, z = -1 },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 11606, y = 9291, z = -1, },
            fakeGenerators = {
                { x = 11610, y = 9294, z = -2, createTile = true },
                { x = 11595, y = 9294, z = -2, createTile = true },
            },
        },
    },
    doorKeys = {
        name = "Drug Lab Key",
        doors = {
            { sprite = "fixtures_doors_01_17", x = 11617, y = 9295, z = 0, },
            { sprite = "fixtures_doors_01_8",  x = 11585, y = 9287, z = 0, },
        },
    },
    map = { name = "DWAPStashMap35", },
    objectSpawns = {
        { barricade = "wood",     enabled = "Barricade", target = "fixtures_windows_01_48", x = 11611, y = 9294, z = 0, },
        { barricade = "wood",     enabled = "Barricade", target = "fixtures_windows_01_49", x = 11611, y = 9293, z = 0, },
        { barricade = "wood",     enabled = "Barricade", target = "fixtures_windows_01_50", x = 11615, y = 9296, z = 0, },
        { barricade = "wood",     enabled = "Barricade", target = "fixtures_windows_01_51", x = 11616, y = 9296, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_57", x = 11621, y = 9296, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_48", x = 11624, y = 9294, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_49", x = 11624, y = 9293, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_57", x = 11618, y = 9292, z = 0, },
    },
    loot = {
        -- lab room under trailer lab
        { -- E1
            note = "fridge @ lab",
            coords = { x = 11619, y = 9292, z = -1 },
            dist = { "SafehouseFridge", },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E2
            note = "freezer @ lab",
            coords = { x = 11619, y = 9292, z = -1 },
            slot = "freezer",
            dist = { "FreezerIceCream", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E3
            note = "fridge @ lab",
            coords = { x = 11620, y = 9292, z = -1 },
            dist = { "SafehouseFridge", },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E4
            note = "freezer @ lab",
            coords = { x = 11620, y = 9292, z = -1 },
            slot = "freezer",
            dist = { "CatfishKitchenFreezer", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E5
            note = "militarylocker @ lab",
            coords = { x = 11623, y = 9292, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E6
            note = "militarylocker @ lab",
            coords = { x = 11624, y = 9292, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        -- warehouse room
        { -- E7
            note = "metal_shelves @ warehouse",
            coords = { x = 11623, y = 9296, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E8
            note = "metal_shelves @ warehouse",
            coords = { x = 11624, y = 9296, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E9
            note = "metal_shelves @ warehouse",
            coords = { x = 11623, y = 9298, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E10
            note = "metal_shelves @ warehouse",
            coords = { x = 11624, y = 9298, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E11
            note = "metal_shelves @ warehouse",
            coords = { x = 11623, y = 9300, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E12
            note = "metal_shelves @ warehouse",
            coords = { x = 11624, y = 9300, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E13
            note = "crate @ warehouse",
            coords = { x = 11619, y = 9298, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E14
            note = "metal_shelves @ warehouse",
            coords = { x = 11620, y = 9298, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E15
            note = "metal_shelves @ warehouse",
            coords = { x = 11621, y = 9298, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E16
            note = "crate @ warehouse",
            coords = { x = 11619, y = 9300, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E17
            note = "metal_shelves @ warehouse",
            coords = { x = 11620, y = 9300, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E18
            note = "metal_shelves @ warehouse",
            coords = { x = 11621, y = 9300, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },

        { -- E19
            note = "crate @ warehouse",
            coords = { x = 11617, y = 9300, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E20
            note = "crate @ warehouse",
            coords = { x = 11617, y = 9300, z = -1 },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E21
            note = "crate @ warehouse",
            coords = { x = 11616, y = 9300, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFarm",
        },
        { -- E22
            note = "crate @ warehouse",
            coords = { x = 11616, y = 9300, z = -1 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPFarm",
        },
        { -- E23
            note = "crate @ warehouse",
            coords = { x = 11615, y = 9300, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E24
            note = "crate @ warehouse",
            coords = { x = 11617, y = 9298, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E25
            note = "crate @ warehouse",
            coords = { x = 11616, y = 9298, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E26
            note = "crate @ warehouse",
            coords = { x = 11616, y = 9298, z = -1 },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E27
            note = "crate @ warehouse",
            coords = { x = 11615, y = 9298, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E28
            note = "crate @ warehouse",
            coords = { x = 11615, y = 9298, z = -1 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPTools",
        },

        { -- E29
            note = "cardboardbox @ warehouse",
            coords = { x = 11610, y = 9301, z = -1 },
            items = {
                { name = 'Base.NailsBox', },
            },
            level = "Loot_BuildMatsLevel",
        },
        { -- E30
            note = "cardboardbox @ warehouse",
            coords = { x = 11610, y = 9301, z = -1 },
            stack = 2,
            items = {
                { name = 'Base.NailsBox', },
            },
            level = "Loot_BuildMatsLevel",
        },
        { -- E31
            note = "cardboardbox @ warehouse",
            coords = { x = 11609, y = 9301, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E32
            note = "cardboardbox @ warehouse",
            coords = { x = 11609, y = 9301, z = -1 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E33
            note = "cardboardbox @ warehouse",
            coords = { x = 11610, y = 9300, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E34
            note = "cardboardbox @ warehouse",
            coords = { x = 11609, y = 9300, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E35
            note = "cardboardbox @ warehouse",
            coords = { x = 11609, y = 9300, z = -1 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },

        { -- E36
            note = "logs @ warehouse",
            coords = { x = 11608, y = 9296, z = -1 },
            items = {
                { name = 'Base.Firewood', chance = 1, count = { 30, 30 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E37
            note = "logs @ warehouse",
            coords = { x = 11608, y = 9295, z = -1 },
            items = {
                { name = 'Base.Firewood', chance = 1, count = { 30, 30 } },
            },
            level = "Loot_FarmLevel",
        },
        -- medical room
        { -- E38
            note = "fridge @ medical",
            coords = { x = 11591, y = 9298, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E39
            note = "freezer @ medical",
            coords = { x = 11591, y = 9298, z = -1 },
            slot = "freezer",
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E40
            note = "overhead @ medical",
            coords = { x = 11591, y = 9298, z = -1 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E41
            note = "counter @ medical",
            coords = { x = 11592, y = 9298, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPMed",
        },
        { -- E42
            note = "overhead @ medical",
            coords = { x = 11592, y = 9298, z = -1 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPMed",
        },
        -- "bedroom"
        { -- E43
            note = "crate @ bedroom",
            coords = { x = 11587, y = 9295, z = -1 },
            special = "essentials",
        },
        -- living area
        { -- E44
            note = "shelves @ bar",
            coords = { x = 11595, y = 9298, z = -1 },
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E45
            note = "shelves @ bar",
            coords = { x = 11596, y = 9298, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E46
            note = "shelves @ bar",
            coords = { x = 11597, y = 9298, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E47
            note = "shelves @ bar",
            coords = { x = 11598, y = 9298, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E48
            note = "shelves @ bar",
            coords = { x = 11599, y = 9298, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E49
            note = "desk @ bar",
            coords = { x = 11604, y = 9296, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E50
            note = "desk @ bar",
            coords = { x = 11604, y = 9293, z = -1 },
            dist = { "CrateToiletPaper" },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        -- kitchen
        { -- E51
            note = "counter @ kitchen",
            coords = { x = 11599, y = 9297, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E52
            note = "counter @ kitchen",
            coords = { x = 11598, y = 9297, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E53
            note = "counter @ kitchen",
            coords = { x = 11597, y = 9297, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E54
            note = "counter @ kitchen",
            coords = { x = 11596, y = 9297, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E55
            note = "counter @ kitchen",
            coords = { x = 11595, y = 9296, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E56
            note = "counter @ kitchen",
            coords = { x = 11595, y = 9295, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E57
            note = "counter @ kitchen",
            coords = { x = 11595, y = 9294, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E58
            note = "counter @ kitchen",
            coords = { x = 11595, y = 9292, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E59
            note = "counter @ kitchen",
            coords = { x = 11595, y = 9291, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E60
            note = "counter @ kitchen",
            coords = { x = 11595, y = 9290, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E61
            note = "counter @ kitchen",
            coords = { x = 11596, y = 9290, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        {
            note = "shelves @ kitchen",
            coords = { x = 11598, y = 9290, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        {
            note = "shelves @ kitchen",
            coords = { x = 11599, y = 9290, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },

        {
            note = "counter @ druglab",
            coords = { x = 11616, y = 9292, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        {
            note = "counter @ druglab",
            coords = { x = 11617, y = 9292, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        {
            note = "metal_shelves @ druglab",
            coords = { x = 11611, y = 9292, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPNonFoodFiller",
        },
        {
            note = "metal_shelves @ druglab",
            coords = { x = 11612, y = 9292, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        {
            note = "overhead @ druglab",
            coords = { x = 11613, y = 9292, z = 0 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        {
            note = "counter @ druglab",
            coords = { x = 11613, y = 9292, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        {
            note = "overhead @ druglab",
            coords = { x = 11614, y = 9292, z = 0 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        {
            note = "fridge @ druglab",
            coords = { x = 11614, y = 9292, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPFridge",
        },
        {
            note = "freezer @ druglab",
            coords = { x = 11614, y = 9292, z = 0 },
            slot = "freezer",
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        {
            note = "counter @ druglab",
            coords = { x = 11615, y = 9292, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        {
            note = "crate @ drugshack",
            coords = { x = 11587, y = 9288, z = 0 },
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        {
            note = "crate @ drugshack",
            coords = { x = 11586, y = 9292, z = 0 },
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
    },
}

return DrugShack
