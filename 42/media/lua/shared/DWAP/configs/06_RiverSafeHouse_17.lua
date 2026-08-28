local wtc = {x = 6957, y = 5565, z = -1} -- waterTankCoords
local pb1 = { x = 6952, y = 5566, z = -1 }
local RiverSafeHouse = {
    group = "Riverside",
    baseBuildings = {
        { x = 6965, y = 5584, z = 0 }, -- house
        { x = 6964, y = 5555, z = 0 }, -- barn/chicken coop
        { x = 7006, y = 5599, z = 0 }, -- barn/farm storage
    },
    spawn = { x = 6965, y = 5584, z = 0 },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc.x, y = wtc.y, z = wtc.z, sourceType="generator", source = {x = 6962, y = 5564, z = -1} },
    },
    waterFixtures = {
        { sprite = "fixtures_sinks_01_17", x = 6958, y = 5581, z = 0, sourceType="tank", source = wtc, }, -- kitchen, bld 27,21#0
        { sprite = "fixtures_sinks_01_17", x = 6964, y = 5589, z = 0, sourceType="tank", source = wtc, }, -- laundry, bld 27,21#0
        { sprite = "appliances_laundry_01_6", x = 6964, y = 5591, z = 0, sourceType="tank", source = wtc, }, -- laundry, bld 27,21#0
        { sprite = "fixtures_sinks_01_13", x = 6966, y = 5589, z = 0, sourceType="tank", source = wtc, }, -- bathroom, bld 27,21#0
        { sprite = "fixtures_bathroom_01_1", x = 6966, y = 5590, z = 0, sourceType="tank", source = wtc, }, -- bathroom, bld 27,21#0
        { sprite = "fixtures_bathroom_01_32", x = 6968, y = 5589, z = 0, sourceType="tank", source = wtc, }, -- bathroom, bld 27,21#0
        -- 2nd floor
        { sprite = "fixtures_bathroom_01_1", x = 6961, y = 5575, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 27,21#0
        { sprite = "fixtures_sinks_01_1", x = 6961, y = 5576, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 27,21#0
        { sprite = "fixtures_sinks_01_1", x = 6961, y = 5577, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 27,21#0
        { sprite = "fixtures_bathroom_01_25", x = 6963, y = 5575, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 27,21#0
        { sprite = "fixtures_bathroom_01_24", x = 6963, y = 5576, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 27,21#0
        -- basement fixtures
        { sprite = "appliances_laundry_01_3", x = 6960, y = 5564, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_6", x = 6960, y = 5565, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_1", x = 6958, y = 5565, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_33", x = 6958, y = 5564, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
    },
    doorKeys = {
        name = "Riverside Ivan Rd House",
        doors = {
        },
    },
    map = { name = "DWAPStashMap6", },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 6953, y = 5565, z = pb1.z },
            fuelTank = { sprite = "dwap_tiles_01_24", x= 6955, y= 5565, z= -1, },
            fakeGenerators = {
                -- { x = 6968, y = 5579, z = -1, createTile = false },
                { x = 6968, y = 5572, z = -1, createTile = false },
                { x = 7000, y = 5581, z = -1, createTile = false },
            },
        },
    },
    objectSpawns = {
        { sprite = "industry_02_175", x = pb1.x, y = pb1.y, z = pb1.z, disabled = "EnableGenSystemSolar", clearExisting = true, },

        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_windows_01_24", x = 6957, y = 5586, z = 0, }, -- window W | livingroom, bld 27,21#0
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_windows_01_24", x = 6957, y = 5587, z = 0, }, -- window W | livingroom, bld 27,21#0
        { barricade = "metalbar", enabled = "Barricade", target="fixtures_windows_01_25", x = 6958, y = 5581, z = 0, }, -- window N | kitchen, bld 27,21#0
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_doors_01_44", x = 6961, y = 5590, z = 0, }, -- door W | laundry, bld 27,21#0
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_windows_01_13", x = 6962, y = 5592, z = 0, }, -- window N | laundry, bld 27,21#0
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_windows_01_25", x = 6967, y = 5592, z = 0, }, -- window N | bathroom, bld 27,21#0
        { barricade = "metalbar", enabled = "Barricade", target="fixtures_windows_01_24", x = 6969, y = 5582, z = 0, }, -- window W | diningroom, bld 27,21#0
        { barricade = "metalbar", enabled = "Barricade", target="fixtures_windows_01_24", x = 6969, y = 5583, z = 0, }, -- window W | diningroom, bld 27,21#0
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_windows_01_24", x = 6969, y = 5590, z = 0, }, -- window W | bathroom, bld 27,21#0
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_windows_01_24", x = 6970, y = 5576, z = 0, }, -- window W | garagestorage, bld 27,21#0
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_windows_01_24", x = 6970, y = 5579, z = 0, }, -- window W | garagestorage, bld 27,21#0
        { barricade = "woodhalf", enabled = "Barricade", target="location_community_church_small_01_64", x = 6970, y = 5586, z = 0, }, -- door W | hall, bld 27,21#0
        { barricade = "woodhalf", enabled = "Barricade", target="location_community_church_small_01_68", x = 6970, y = 5587, z = 0, }, -- door W | hall, bld 27,21#0
    },
    loot = {
        -- basement
        { -- E1 liquor cabinet
            note = "dishescabinet @ workshop",
            coords = {x=6955,y=5580,z=-1},
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E2
            note = "dishescabinet @ workshop",
            coords = {x=6955,y=5579,z=-1},
            dist = {"LiquorStoreWine"},
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E3 liquor cabinet
            note = "dishescabinet @ workshop",
            coords = {x=6958,y=5572,z=-1},
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E4
            note = "dishescabinet @ workshop",
            coords = {x=6959,y=5572,z=-1},
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        -- crates by stairs
        { -- E5
            stack = 1,
            note = "crate @ workshop",
            coords = {x=6960,y=5577,z=-1},
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E6
            stack = 2,
            note = "crate @ workshop",
            coords = {x=6960,y=5577,z=-1},
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E7
            stack = 1,
            note = "crate @ workshop",
            coords = {x=6960,y=5576,z=-1},
            dist = {"CrateLumber"},
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E8
            stack = 2,
            note = "crate @ workshop",
            coords = {x=6960,y=5576,z=-1},
            dist = {"CrateLumber"},
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E9
            stack = 1,
            note = "crate @ workshop",
            coords = {x=6960,y=5575,z=-1},
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E10
            stack = 2,
            note = "crate @ workshop",
            coords = {x=6960,y=5575,z=-1},
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E11 foot locker
            note = "locker @ workshop",
            coords = {x=6962,y=5577,z=-1},
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E12 cardboardbox
            note = "cardboardbox @ workshop",
            coords = {x=6967,y=5576,z=-1},
            items = {
                { name = 'Base.Firewood', chance = 1, count = {10,10} },
            },
            level = "Loot_FarmLevel",
        },
        -- basement rec room
        { -- E13
            note = "counter @ bar",
            coords = {x=6964,y=5568,z=-1},
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E14
            note = "counter @ bar",
            coords = {x=6964,y=5567,z=-1},
            dist = {"SafehouseBooze"},
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E15 popcorn machine
            note = "counter @ bar",
            coords = {x=6964,y=5566,z=-1},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        -- E16
        { --bookcase
            
            note = "shelves @ bar",
            coords = {x=6964,y=5564,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E17 bookcase
            note = "shelves @ bar",
            coords = {x=6965,y=5564,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E18 media stand
            note = "sidetable @ bar",
            coords = {x=6966,y=5564,z=-1},
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E19 bookcase
            note = "shelves @ bar",
            coords = {x=6967,y=5564,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        -- basement armory
        { -- E20
            note = "freezer @ security",
            coords = {x=6963,y=5570,z=-1},
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        { -- E21
            stack = 1,
            note = "militarycrate @ security",
            coords = {x=6963,y=5569,z=-1},
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E22
            stack = 2,
            note = "militarycrate @ security",
            coords = {x=6963,y=5569,z=-1},
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E23
            note = "metal_shelves @ security",
            coords = {x=6963,y=5568,z=-1},
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E24
            note = "metal_shelves @ security",
            coords = {x=6963,y=5567,z=-1},
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E25
            note = "freezer @ security",
            coords = {x=6963,y=5566,z=-1},
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        { -- E26 mil locker
            note = "militarylocker @ security",
            coords = {x=6961,y=5565,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E27 mil locker
            note = "militarylocker @ security",
            coords = {x=6961,y=5566,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E28 mil locker
            note = "militarylocker @ security",
            coords = {x=6961,y=5567,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E29 mil locker
            note = "militarylocker @ security",
            coords = {x=6961,y=5568,z=-1},
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E30
            stack = 1,
            note = "militarycrate @ security",
            coords = {x=6961,y=5569,z=-1},
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E31
            stack = 2,
            note = "militarycrate @ security",
            coords = {x=6961,y=5569,z=-1},
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E32
            note = "metal_shelves @ security",
            coords = {x=6961,y=5570,z=-1},
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E33
            note = "metal_shelves @ security",
            coords = {x=6961,y=5571,z=-1},
            special = "essentials",
        },
        -- infirmary/bathroom
        { -- E34
            note = "medicine @ medical",
            coords = {x=6958,y=5571,z=-1},
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E35
            note = "medicine @ medical",
            coords = {x=6958,y=5570,z=-1},
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E36
            note = "counter @ medical",
            coords = {x=6958,y=5569,z=-1},
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E37
            note = "medicine @ medical",
            coords = {x=6958,y=5568,z=-1},
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E38
            note = "sidetable @ medical",
            coords = {x=6960,y=5566,z=-1},
            dist = {"CrateToiletPaper" },
            distIncludeJunk = false,
            tag = "DWAPTools",
        },
        { -- E39
            note = "counter @ medical",
            coords = {x=6958,y=5565,z=-1},
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E40
            note = "medicine @ medical",
            coords = {x=6958,y=5565,z=-1},
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPTools",
        },
        -- basement utility room/warehouse
        { -- E41
            stack = 1,
            note = "crate @ warehouse",
            coords = {x=6956,y=5571,z=-1},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E42
            stack = 2,
            note = "crate @ warehouse",
            coords = {x=6956,y=5571,z=-1},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E43
            note = "metal_shelves @ warehouse",
            coords = {x=6955,y=5571,z=-1},
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E44
            note = "metal_shelves @ warehouse",
            coords = {x=6954,y=5571,z=-1},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E45
            note = "metal_shelves @ warehouse",
            coords = {x=6953,y=5571,z=-1},
            dist = {"CrateCannedFood"},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E46
            note = "metal_shelves @ warehouse",
            coords = {x=6952,y=5571,z=-1},
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E47
            stack = 1,
            note = "crate @ warehouse",
            coords = {x=6956,y=5569,z=-1},
            distIncludeJunk = true,
            tag = "DWAPFarm",
        },
        { -- E48
            stack = 2,
            note = "crate @ warehouse",
            coords = {x=6956,y=5569,z=-1},
            distIncludeJunk = true,
            tag = "DWAPFarm",
        },
        { -- E49
            note = "metal_shelves @ warehouse",
            coords = {x=6955,y=5569,z=-1},
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E50
            note = "metal_shelves @ warehouse",
            coords = {x=6954,y=5569,z=-1},
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E51
            note = "metal_shelves @ warehouse",
            coords = {x=6953,y=5569,z=-1},
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E52
            note = "metal_shelves @ warehouse",
            coords = {x=6952,y=5569,z=-1},
            dist = {"CrateVHSTapes"},
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E53
            note = "crate @ warehouse",
            coords = {x=6956,y=5567,z=-1},
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E54
            note = "metal_shelves @ warehouse",
            coords = {x=6955,y=5567,z=-1},
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E55
            note = "metal_shelves @ warehouse",
            coords = {x=6954,y=5567,z=-1},
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = {9,12} },
            },
            level = "Loot_FarmLevel",
        },
        { -- E56
            note = "metal_shelves @ warehouse",
            coords = {x=6953,y=5567,z=-1},
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = {8,10} },
            },
            level = "Loot_FarmLevel",
        },
        { -- E57
            note = "metal_shelves @ warehouse",
            coords = {x=6952,y=5567,z=-1},
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        -- first floor
        { -- E58
            note = "wardrobe @ hall",
            coords = {x=6961,y=5579,z=1},
            dist = {"CampingLockers"},
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E59
            note = "smallcrate @ garagestorage",
            coords = {x=6965,y=5580,z=0},
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E60
            note = "smallcrate @ garagestorage",
            coords = {x=6964,y=5580,z=0},
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E61
            note = "wardrobe @ bedroom",
            coords = { x = 6957, y = 5585, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E62
            note = "wardrobe @ bedroom",
            coords = { x = 6958, y = 5585, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E63
            note = "metal_shelves @ barn",
            coords = {x=6963,y=5555,z=0},
            slot = "upper", -- square carries only a High metal_shelves
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E64
            note = "metal_shelves @ barn",
            coords = {x=6963,y=5556,z=0},
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E65
            note = "dishescabinet @ kitchen",
            coords = {x=6963,y=5583,z=0},
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        -- kitchen
        { -- E66
            slot = 'freezer',
            note = "freezer @ kitchen",
            coords = {x=6957,y=5582,z=0},
            dist = {"FreezerRich", },
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        { -- E67
            note = "fridge @ kitchen",
            coords = {x=6957,y=5582,z=0},
            dist = { "MotelFridge", },
            distIncludeJunk = true,
            tag = "DWAPFridge",
        },
        { -- E68
            slot = 'upper',
            note = "counter @ kitchen",
            coords = {x=6957,y=5582,z=0},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E69
            note = "counter @ kitchen",
            coords = {x=6957,y=5581,z=0},
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E70
            note = "overhead @ kitchen",
            coords = {x=6957,y=5581,z=0},
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E71
            note = "counter @ kitchen",
            coords = {x=6958,y=5581,z=0},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E72
            slot = 'upper',
            note = "counter @ kitchen",
            coords = {x=6958,y=5581,z=0},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E73
            note = "counter @ kitchen",
            coords = {x=6959,y=5581,z=0},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E74
            note = "counter @ kitchen",
            coords = {x=6961,y=5581,z=0},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E75
            slot = 'upper',
            note = "counter @ kitchen",
            coords = {x=6961,y=5581,z=0},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E76
            note = "wardrobe @ hall",
            coords = {x=6961,y=5578,z=1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        -- living area
        { -- E77
            note = "shelves @ livingroom",
            coords = {x=6957,y=5586,z=0},
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E78
            note = "shelves @ livingroom",
            coords = {x=6964,y=5576,z=1},
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E79
            note = "shelves @ office",
            coords = {x=6964,y=5581,z=1},
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E80
            note = "metal_shelves @ garagestorage",
            coords = {x=7002,y=5590,z=0},
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        -- other bathrom/sink area
        { -- E81
            note = "dresser @ bathroom",
            coords = {x=6966,y=5591,z=0},
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E82
            note = "dishescabinet @ kitchen",
            coords = {x=6963,y=5584,z=0},
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E83
            note = "metal_shelves @ garagestorage",
            coords = {x=7002,y=5591,z=0},
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        -- nearby shed
        { -- E84
            note = "toolcabinet @ garagestorage",
            coords = {x=7007,y=5590,z=0},
            dist = {"CarSupplyTools", },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E85
            
            note = "metal_shelves @ garagestorage",
            coords = {x=7004,y=5590,z=0},
            slot = "upper", -- square carries only a High metal_shelves
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            level = "Loot_BuildMatsLevel",
        },
        { -- E86
            note = "counter @ laundry",
            coords = {x=6964,y=5589,z=0},
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(RiverSafeHouse.generators[1].fakeGenerators, { x = 6989, y = 5570, z = -1, createTile = false })
    table.insert(RiverSafeHouse.generators[1].fakeGenerators, { x = 7008, y = 5591, z = -1, createTile = false })

    table.insert(RiverSafeHouse.objectSpawns, { enabled = "EnableLadders", x = 6957, y = 5569, z = -1, removeWall = "west" })
    table.insert(RiverSafeHouse.objectSpawns, { enabled = "EnableLadders", sprite = "walls_exterior_wooden_01_34", x = 6957, y = 5569, z = -1 })
    table.insert(RiverSafeHouse.objectSpawns, { enabled = "EnableLadders", sprite = "fixtures_doors_01_12", x = 6957, y = 5569, z = -1, isDoor = true, doorN = false, })
    table.insert(RiverSafeHouse.objectSpawns, { enabled = "EnableLadders", sprite = "location_shop_bargNclothes_01_24", x = 7009, y = 5591, z = 0, removeFloor = true, })
    table.insert(RiverSafeHouse.objectSpawns, { enabled = "EnableLadders", sprite = "location_shop_bargNclothes_01_25", x = 7009, y = 5592, z = 0, })
end

return RiverSafeHouse