local wtc = { x = 11755, y = 6670, z = -1, }
local pb1 = { x = 11754, y = 6667, z = -1 }
local WestPointHome = {
    group = "West Point",
    baseBuildings = {
        { x = 11766, y = 6667, z = 0 },  -- house
        { x = 11759, y = 6658, z = 0 },  -- garage
        { x = 11766, y = 6638, z = 0 },  -- greenhouse
        { x = 11774, y = 6639, z = 0 },  -- shed
        { x = 11764, y = 6665, z = -1 }, -- basement
    },
    spawn = { x = 11766, y = 6667, z = 0 },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 11757, y = 6664, z = -1, },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 11755, y = 6664, z = -1, },
            fakeGenerators = {
                { x = 11764, y = 6673, z = -1, createTile = false },
            },
        },
    },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = { x = 11601, y = 6724, z = -1 } },
    },
    waterFixtures = {
        -- 1st floor
        { sprite = "fixtures_sinks_01_13",    x = 11768, y = 6667, z = 0,  sourceType = "tank", source = wtc, }, -- bathroom, bld 45,26#67
        { sprite = "fixtures_bathroom_01_1",  x = 11768, y = 6666, z = 0,  sourceType = "tank", source = wtc, }, -- bathroom, bld 45,26#67
        { sprite = "fixtures_bathroom_01_26", x = 11768, y = 6665, z = 0,  sourceType = "tank", source = wtc, }, -- bathroom, bld 45,26#67
        { sprite = "fixtures_sinks_01_10",    x = 11772, y = 6674, z = 0,  sourceType = "tank", source = wtc, }, -- kitchen, bld 45,26#67
        -- basement
        { sprite = "fixtures_sinks_01_4",     x = 11759, y = 6658, z = -1, sourceType = "tank", source = wtc, }, -- bedroom, bld 45,26#108
        { sprite = "fixtures_bathroom_01_31", x = 11759, y = 6657, z = -1, sourceType = "tank", source = wtc, }, -- bedroom, bld 45,26#108
        { sprite = "fixtures_bathroom_01_2",  x = 11761, y = 6657, z = -1, sourceType = "tank", source = wtc, }, -- bedroom, bld 45,26#108

    },
    doorKeys = {
        name = "West Point Home",
        doors = {
        },
    },
    map = { name = "DWAPStashMap26", },
    objectSpawns = {
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_24", x = 11764, y = 6671, z = 0, }, -- window W | livingroom, bld 45,26#67
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_25", x = 11765, y = 6678, z = 0, }, -- window N | livingroom, bld 45,26#67
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_25", x = 11766, y = 6665, z = 0, }, -- window N | bedroom, bld 45,26#67
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_25", x = 11769, y = 6665, z = 0, }, -- window N | bathroom, bld 45,26#67
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_25", x = 11771, y = 6665, z = 0, }, -- window N | bedroom, bld 45,26#67
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_24", x = 11773, y = 6669, z = 0, }, -- window W | livingroom, bld 45,26#67
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_24", x = 11773, y = 6674, z = 0, }, -- window W | kitchen, bld 45,26#67

        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_windows_01_0",  x = 11761, y = 6659, z = 0, }, -- window W | garagestorage, bld 45,26#68
    },
    loot = {

        -- basement
        -- rec room
        { -- E1
            note = "dishescabinet @ livingroom",
            coords = { x = 11770, y = 6672, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E2
            note = "dishescabinet @ livingroom",
            coords = { x = 11770, y = 6671, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E3
            note = "shelves @ livingroom",
            coords = { x = 11770, y = 6663, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E4
            note = "shelves @ livingroom",
            coords = { x = 11765, y = 6663, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E5
            note = "shelves @ livingroom",
            coords = { x = 11764, y = 6663, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E6
            note = "counter @ livingroom",
            coords = { x = 11763, y = 6663, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E7
            note = "counter @ livingroom",
            coords = { x = 11767, y = 6667, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E8
            note = "shelves @ livingroom",
            coords = { x = 11764, y = 6666, z = -1 },
            dist = { "LivingRoomShelfClassy" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E9
            note = "shelves @ livingroom",
            coords = { x = 11764, y = 6667, z = -1 },
            dist = { "CrateVHSTapes" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E10
            note = "shelves @ livingroom",
            coords = { x = 11764, y = 6668, z = -1 },
            dist = { "CrateVHSTapes" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        -- shelter room
        { -- E11
            note = "cardboardbox @ bedroom",
            coords = { x = 11761, y = 6662, z = -1 },
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E12
            note = "locker @ bedroom",
            coords = { x = 11759, y = 6660, z = -1 },
            special = "essentials",
        },
        { -- E13
            note = "locker @ bedroom",
            coords = { x = 11759, y = 6659, z = -1 },
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E14
            note = "counter @ bedroom",
            coords = { x = 11759, y = 6658, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E15
            note = "medicine @ bedroom",
            coords = { x = 11759, y = 6658, z = -1 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        -- main storage room
        { -- E16
            note = "militarylocker @ storage",
            coords = { x = 11762, y = 6663, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E17
            note = "militarylocker @ storage",
            coords = { x = 11761, y = 6663, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E18
            note = "militarycrate @ storage",
            coords = { x = 11759, y = 6663, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E19
            note = "militarycrate @ storage",
            coords = { x = 11759, y = 6663, z = -1 },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E20
            note = "militarycrate @ storage",
            coords = { x = 11758, y = 6663, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E21
            note = "militarycrate @ storage",
            coords = { x = 11758, y = 6663, z = -1 },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E22
            note = "metal_shelves @ storage",
            coords = { x = 11762, y = 6665, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E23
            note = "metal_shelves @ storage",
            coords = { x = 11761, y = 6665, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E24
            note = "metal_shelves @ storage",
            coords = { x = 11759, y = 6666, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E25
            note = "metal_shelves @ storage",
            coords = { x = 11758, y = 6666, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E26
            note = "crate @ storage",
            coords = { x = 11757, y = 6666, z = -1 },
            dist = { "CrateLongStick" },
            items = {
                { name = 'Base.LongStick', chance = 1, count = { 10, 10 } },
                { name = 'Base.Firewood',  chance = 1, count = { 10, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E27
            note = "crate @ storage",
            coords = { x = 11757, y = 6666, z = -1 },
            stack = 2,
            dist = { "CrateLongStick" },
            items = {
                { name = 'Base.LongStick', chance = 1, count = { 10, 10 } },
                { name = 'Base.Firewood',  chance = 1, count = { 10, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E28
            note = "metal_shelves @ storage",
            coords = { x = 11762, y = 6667, z = -1 },
            dist = { "CrateAntiqueStove", "CampingStoreLighting" },
            distIncludeJunk = false,
            level = 1,
        },
        { -- E29
            note = "metal_shelves @ storage",
            coords = { x = 11761, y = 6667, z = -1 },
            items = {
                { name = 'Base.Firewood', chance = 1, count = { 10, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E30
            note = "metal_shelves @ storage",
            coords = { x = 11759, y = 6668, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E31
            note = "metal_shelves @ storage",
            coords = { x = 11758, y = 6668, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E32
            note = "crate @ storage",
            coords = { x = 11757, y = 6668, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E33
            note = "crate @ storage",
            coords = { x = 11757, y = 6668, z = -1 },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E34
            note = "metal_shelves @ storage",
            coords = { x = 11754, y = 6668, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E35
            note = "metal_shelves @ storage",
            coords = { x = 11762, y = 6669, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E36
            note = "metal_shelves @ storage",
            coords = { x = 11761, y = 6669, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E37
            note = "metal_shelves @ storage",
            coords = { x = 11759, y = 6670, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E38
            note = "metal_shelves @ storage",
            coords = { x = 11758, y = 6670, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E39
            note = "crate @ storage",
            coords = { x = 11757, y = 6670, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E40
            note = "crate @ storage",
            coords = { x = 11757, y = 6670, z = -1 },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E41
            note = "metal_shelves @ storage",
            coords = { x = 11762, y = 6671, z = -1 },
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            level = "Loot_BuildMatsLevel",
        },
        { -- E42
            note = "metal_shelves @ storage",
            coords = { x = 11761, y = 6671, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E43
            note = "metal_shelves @ storage",
            coords = { x = 11759, y = 6672, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E44
            note = "metal_shelves @ storage",
            coords = { x = 11758, y = 6672, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E45
            note = "metal_shelves @ storage",
            coords = { x = 11757, y = 6672, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E46
            note = "metal_shelves @ storage",
            coords = { x = 11756, y = 6672, z = -1 },
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
                { name = 'Base.Fertilizer',    chance = 1, count = { 8, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E47
            note = "counter @ kitchen",
            coords = { x = 11770, y = 6671, z = 0 },
            tag = "DWAPFood",
        },
        { -- E48
            note = "counter @ kitchen",
            coords = { x = 11770, y = 6671, z = 0 },
            slot = "upper",
            tag = "DWAPFood",
        },
        { -- E49
            note = "counter @ kitchen",
            coords = { x = 11772, y = 6671, z = 0 },
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E50
            note = "counter @ kitchen",
            coords = { x = 11772, y = 6671, z = 0 },
            slot = "upper",
            tag = "DWAPFood",
        },
        { -- E51
            note = "counter @ kitchen",
            coords = { x = 11770, y = 6672, z = 0 },
            tag = "DWAPFood",
        },
        { -- E52
            note = "counter @ kitchen",
            coords = { x = 11770, y = 6672, z = 0 },
            slot = "upper",
            tag = "DWAPFood",
        },
        { -- E53
            note = "counter @ kitchen",
            coords = { x = 11772, y = 6673, z = 0 },
            tag = "DWAPFood",
        },
        { -- E54
            note = "counter @ kitchen",
            coords = { x = 11772, y = 6673, z = 0 },
            slot = "upper",
            tag = "DWAPFood",
        },
        { -- E55
            note = "counter @ kitchen",
            coords = { x = 11772, y = 6674, z = 0 },
            tag = "DWAPFood",
        },
        { -- E56
            note = "counter @ kitchen",
            coords = { x = 11772, y = 6674, z = 0 },
            slot = "upper",
            tag = "DWAPFood",
        },
        { -- E57
            note = "fridge @ kitchen",
            coords = { x = 11770, y = 6675, z = 0 },
            tag = "DWAPFridge",
        },
        { -- E58
            note = "freezer @ kitchen",
            coords = { x = 11770, y = 6675, z = 0 },
            slot = "freezer",
            tag = "DWAPFreezer",
        },
        { -- E59
            note = "dishwasher @ kitchen",
            coords = { x = 11771, y = 6675, z = 0 },
            tag = "DWAPFood",
        },
        { -- E60
            note = "counter @ kitchen",
            coords = { x = 11772, y = 6675, z = 0 },
            tag = "DWAPFood",
        },
        { -- E61
            note = "counter @ kitchen",
            coords = { x = 11772, y = 6675, z = 0 },
            slot = "upper",
            tag = "DWAPFood",
        },
        { -- E62
            note = "metal_shelves @ closet",
            coords = { x = 11769, y = 6677, z = 0 },
            slot = "upper",
            tag = "DWAPLockers",
        },
        { -- E63
            note = "dresser @ livingroom",
            coords = { x = 11764, y = 6673, z = 0 },
            tag = "DWAPLockers",
        },
        { -- E64
            note = "shelves @ livingroom",
            coords = { x = 11764, y = 6677, z = 0 },
            tag = "DWAPMedia",
        },
        { -- E65
            note = "dresser @ livingroom",
            coords = { x = 11765, y = 6677, z = 0 },
            tag = "DWAPLockers",
        },
        { -- E66
            note = "sidetable @ livingroom",
            coords = { x = 11766, y = 6677, z = 0 },
            tag = "DWAPMedia",
        },
        { -- E67
            note = "dresser @ bedroom",
            coords = { x = 11767, y = 6665, z = 0 },
            tag = "DWAPLockers",
        },
        { -- E68
            note = "dresser @ livingroom",
            coords = { x = 11764, y = 6669, z = 0 },
            tag = "DWAPLockers",
        },
        { -- E69
            note = "shelves @ livingroom",
            coords = { x = 11772, y = 6668, z = 0 },
            tag = "DWAPMedia",
        },
        { -- E70
            note = "shelves @ livingroom",
            coords = { x = 11772, y = 6669, z = 0 },
            tag = "DWAPMedia",
        },
        { -- E71
            note = "shelves @ livingroom",
            coords = { x = 11772, y = 6670, z = 0 },
            tag = "DWAPMedia",
        },
        { -- E72
            note = "medicine @ bathroom",
            coords = { x = 11768, y = 6667, z = 0 },
            slot = "upper",
            tag = "DWAPMed",
        },
        { -- E73
            note = "dresser @ bedroom",
            coords = { x = 11772, y = 6665, z = 0 },
            tag = "DWAPLockers",
        },
        { -- E74
            note = "counter @ greenhouse",
            coords = { x = 11765, y = 6637, z = 0 },
            tag = "DWAPFarm",
        },
        { -- E75
            note = "metal_shelves @ garagestorage",
            coords = { x = 11773, y = 6640, z = 0 },
            slot = "upper",
            tag = "DWAPTools",
        },
        { -- E76
            note = "counter @ garagestorage",
            coords = { x = 11773, y = 6638, z = 0 },
            tag = "DWAPTools",
        },
        { -- E77
            note = "counter @ garagestorage",
            coords = { x = 11773, y = 6639, z = 0 },
            tag = "DWAPTools",
        },
    },
}

return WestPointHome
