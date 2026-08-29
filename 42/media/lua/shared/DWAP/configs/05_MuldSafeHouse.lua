--- Notes, "gated" community in north part of Muldraugh. Smallish 2 story house
local wtc = { x = 10704, y = 9548, z = -1 } -- waterTankCoords
local pb1 = { x = 10703, y = 9549, z = -1 }
local MuldSafeHouse = {
    group = "Muldraugh",
    baseBuildings = {
        { x = 10710, y = 9549, z = 1 }, -- house
        { x = 10703, y = 9552, z = -1 }, -- house
    },
    spawn = { x = 10710, y=9549, z = 1 },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = { x = 10708, y = 9548, z = -1 } },
    },
    waterFixtures = {
        -- first floor
        { sprite = "fixtures_bathroom_01_26", x = 10703, y = 9550, z = 0, sourceType="tank", source = wtc, }, -- bathroom, bld 41,37#4
        { sprite = "fixtures_bathroom_01_1", x = 10703, y = 9551, z = 0, sourceType="tank", source = wtc, }, -- bathroom, bld 41,37#4
        { sprite = "fixtures_sinks_01_21", x = 10703, y = 9552, z = 0, sourceType="tank", source = wtc, }, -- bathroom, bld 41,37#4
        -- 2nd floor
        { sprite = "fixtures_bathroom_01_33", x = 10703, y = 9546, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 41,37#4
        { sprite = "fixtures_bathroom_01_1", x = 10703, y = 9547, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 41,37#4
        { sprite = "fixtures_sinks_01_23", x = 10705, y = 9546, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 41,37#4
        { sprite = "fixtures_sinks_01_23", x = 10705, y = 9547, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 41,37#4
        { sprite = "fixtures_sinks_01_21", x = 10709, y = 9546, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 41,37#4
        { sprite = "fixtures_sinks_01_21", x = 10709, y = 9547, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 41,37#4
        { sprite = "fixtures_bathroom_01_32", x = 10711, y = 9546, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 41,37#4
        { sprite = "fixtures_bathroom_01_2", x = 10711, y = 9547, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 41,37#4

        -- basement fixtures
        { sprite = "fixtures_sinks_01_17",    x = 10707, y = 9550, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_23",    x = 10708, y = 9559, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_6",  x = 10708, y = 9560, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_33", x = 10706, y = 9560, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
    },
    doorKeys = {
        name = "Muldraugh Safe House",
        doors = {
            { sprite = "fixtures_doors_01_45", x = 10707, y = 9554, z = 0, }, -- front door
            { sprite = "walls_garage_01_11",    x = 10713, y = 9552, z = 0, }, -- garage door
            { sprite = "fixtures_doors_01_29",  x = 10702, y = 9547, z = 0, }, -- basement door
        },
    },
    map = { name = "DWAPStashMap5", },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 10708, y = 9548, z = -1 },
            fuelTank = { sprite = "dwap_tiles_01_24", x= 10706, y= 9548, z= -1, },
            fakeGenerators = {
                { x = 10710, y = 9555, z = -1 },
            },
        },
    },
    objectSpawns = {
        { clearExisting = true, x = 10659, y = 9555, z = 0, disabled = "EnableWaterSystem", },
        { sprite = "industry_02_175", x = pb1.x, y = pb1.y, z = pb1.z, disabled = "EnableGenSystemSolar", clearExisting = true, },

        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_windows_01_9", x = 10704, y = 9553, z = 0, }, -- window N | bathroom, bld 41,37#4
        { barricade = "metalbar", enabled = "Barricade", target="fixtures_windows_01_9", x = 10705, y = 9546, z = 0, }, -- window N | livingroom, bld 41,37#4
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_doors_01_45", x = 10707, y = 9554, z = 0, }, -- door N | lobby, bld 41,37#4
        { barricade = "metalbar", enabled = "Barricade", target="fixtures_windows_01_9", x = 10709, y = 9546, z = 0, }, -- window N | kitchen, bld 41,37#4
        { barricade = "metalbar", enabled = "Barricade", target="fixtures_windows_01_9", x = 10710, y = 9553, z = 0, }, -- window N | lobby, bld 41,37#4
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_windows_01_8", x = 10717, y = 9549, z = 0, }, -- window W | garage, bld 41,37#4
    },
    loot = {
        -- new spawned bookshelves from ba_dwap_05_books map
        { -- E1
            note = "shelves @ lobby",
            coords = { x = 10707, y = 9552, z = 1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E2
            note = "shelves @ lobby",
            coords = { x = 10708, y = 9552, z = 1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        -- main floor
        { -- E3
            note = "metal_shelves @ storage",
            coords = { x = 10710, y = 9551, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E4
            note = "metal_shelves @ storage",
            coords = { x = 10711, y = 9551, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E5
            note = "toolcabinet @ garage",
            coords = { x = 10712, y = 9547, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        -- kitchen
        { -- E6
            slot = 'freezer',
            note = "freezer @ kitchen",
            coords = { x = 10707, y = 9546, z = 0 },
            dist = { "FreezerRich", },
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        { -- E7
            note = "fridge @ kitchen",
            coords = { x = 10707, y = 9546, z = 0 },
            dist = { "MotelFridge", },
            distIncludeJunk = true,
            tag = "DWAPFridge",
        },
        { -- E8
            note = "counter @ kitchen",
            coords = { x = 10709, y = 9546, z = 0 },
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E9
            note = "counter @ kitchen",
            coords = { x = 10709, y = 9546, z = 0 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E10
            note = "counter @ kitchen",
            coords = { x = 10711, y = 9546, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E11
            note = "counter @ kitchen",
            coords = { x = 10711, y = 9546, z = 0 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        -- tv stand
        { -- E12
            note = "dresser @ livingroom",
            coords = { x = 10704, y = 9549, z = 0 },
            tag = "DWAPMedia",
        },
        { -- E13
            note = "medicine @ bathroom",
            coords = { x = 10703, y = 9551, z = 0 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        -- 2nd floor
        { -- E14
            note = "wardrobe @ bedroom",
            coords = { x = 10703, y = 9549, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E15
            note = "dresser @ bedroom",
            coords = { x = 10705, y = 9552, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E16
            note = "sidetable @ kidsbedroom",
            coords = { x = 10709, y = 9548, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E17
            note = "wardrobe @ kidsbedroom",
            coords = { x = 10711, y = 9550, z = 1 },
            dist = { "SafehouseArmor", },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E18
            note = "wardrobe @ bedroom",
            coords = { x = 10703, y = 9550, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E19
            note = "counter @ bathroom",
            coords = { x = 10703, y = 9552, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E20
            note = "wardrobe @ kidsbedroom",
            coords = { x = 10711, y = 9551, z = 1 },
            dist = { "CampingLockers" },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E21
            note = "counter @ bathroom",
            coords = { x = 10709, y = 9547, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E22
            note = "counter @ bathroom",
            coords = { x = 10705, y = 9546, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -- entry way
        { -- E23
            note = "dresser @ livingroom",
            coords = { x = 10703, y = 9546, z = 0 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E24
            note = "counter @ bathroom",
            coords = { x = 10705, y = 9547, z = 1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E25
            note = "dresser @ lobby",
            coords = { x = 10706, y = 9553, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E26
            note = "counter @ bathroom",
            coords = { x = 10709, y = 9546, z = 1 },
            dist = { "GasStoreToiletries" },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E27 south west corner
            note = "metal_shelves @ storage",
            coords = { x = 10702, y = 9560, z = -1 },
            special = "essentials",
        },
        { -- E28
            note = "metal_shelves @ storage",
            coords = { x = 10702, y = 9559, z = -1 },
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E29
            note = "metal_shelves @ storage",
            coords = { x = 10702, y = 9558, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E30
            note = "cardboardbox @ storage",
            coords = { x = 10702, y = 9557, z = -1 },
            dist = { "SewingStoreTools" },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E31
            note = "metal_shelves @ storage",
            coords = { x = 10702, y = 9556, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E32
            note = "metal_shelves @ storage",
            coords = { x = 10702, y = 9555, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E33
            note = "militarylocker @ storage",
            coords = { x = 10702, y = 9554, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E34
            note = "militarylocker @ storage",
            coords = { x = 10702, y = 9553, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E35
            note = "freezer @ storage",
            coords = { x = 10703, y = 9551, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E36
            stack = 1,
            note = "crate @ storage",
            coords = { x = 10703, y = 9550, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E37
            stack = 2,
            note = "crate @ storage",
            coords = { x = 10703, y = 9550, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E38
            note = "fridge @ storage",
            coords = { x = 10705, y = 9550, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E39
            slot = 'freezer',
            note = "freezer @ storage",
            coords = { x = 10705, y = 9550, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E40
            note = "overhead @ storage",
            coords = { x = 10705, y = 9550, z = -1 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E41
            note = "counter @ storage",
            coords = { x = 10706, y = 9550, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E42
            note = "overhead @ storage",
            coords = { x = 10706, y = 9550, z = -1 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E43
            note = "counter @ storage",
            coords = { x = 10707, y = 9550, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E44
            note = "overhead @ storage",
            coords = { x = 10707, y = 9550, z = -1 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E45
            note = "overhead @ storage",
            coords = { x = 10708, y = 9550, z = -1 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E46
            note = "locker @ storage",
            coords = { x = 10706, y = 9557, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E47
            note = "metal_shelves @ storage",
            coords = { x = 10706, y = 9559, z = -1 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E48
            note = "counter @ storage",
            coords = { x = 10708, y = 9559, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E49
            note = "metal_shelves @ storage",
            coords = { x = 10706, y = 9556, z = -1 },
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = { 8, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E50
            note = "metal_shelves @ storage",
            coords = { x = 10706, y = 9555, z = -1 },
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E51
            stack = 1,
            note = "crate @ storage",
            coords = { x = 10706, y = 9554, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E52
            stack = 2,
            note = "crate @ storage",
            coords = { x = 10706, y = 9554, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E53
            stack = 1,
            note = "crate @ storage",
            coords = { x = 10706, y = 9553, z = -1 },
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            level = "Loot_BuildMatsLevel",
        },
        { -- E54
            stack = 2,
            note = "crate @ storage",
            coords = { x = 10706, y = 9553, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E55
            stack = 1,
            note = "crate @ storage",
            coords = { x = 10706, y = 9552, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E56
            note = "dresser @ storage",
            coords = { x = 10708, y = 9556, z = -1 },
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E57
            note = "militarylocker @ storage",
            coords = { x = 10704, y = 9560, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E58
            stack = 1,
            note = "militarycrate @ storage",
            coords = { x = 10704, y = 9559, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E59
            stack = 2,
            note = "militarycrate @ storage",
            coords = { x = 10704, y = 9559, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E60
            stack = 1,
            note = "militarycrate @ storage",
            coords = { x = 10704, y = 9558, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E61
            stack = 2,
            note = "militarycrate @ storage",
            coords = { x = 10704, y = 9558, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E62
            stack = 1,
            note = "militarycrate @ storage",
            coords = { x = 10704, y = 9557, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E63
            stack = 2,
            note = "militarycrate @ storage",
            coords = { x = 10704, y = 9557, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E64
            stack = 1,
            note = "militarycrate @ storage",
            coords = { x = 10704, y = 9556, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E65
            stack = 2,
            note = "militarycrate @ storage",
            coords = { x = 10704, y = 9556, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E66
            note = "logs @ storage",
            coords = { x = 10705, y = 9554, z = -1 },
            items = {
                { name = 'Base.Firewood', chance = 1, count = { 10, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E67
            note = "logs @ storage",
            coords = { x = 10705, y = 9553, z = -1 },
            items = {
                { name = 'Base.Firewood', chance = 1, count = { 10, 10 } },
                { name = 'Base.Twigs',    chance = 1, count = { 10, 10 } },
            },
            level = "Loot_FarmLevel",
        },
    },
}

return MuldSafeHouse
