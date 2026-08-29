local wtc = { x = 8084, y = 11550, z = -1 }
local pb1 = { x = 8079, y = 11551, z = -1 }
local RosewoodZippee = {
    group = "Rosewood",
    baseBuildings = {
        { x = 8087, y = 11558, z = 2 }, -- apartments
    },
    baseRooms = {
        { x = 8086, y = 11556, z = 2 },  -- bedroom
        { x = 8082, y = 11552, z = 2 },  -- livingroom
        { x = 8085, y = 11552, z = 2 },  -- bathroom
        { x = 8088, y = 11552, z = 2 },  -- closet
        { x = 8090, y = 11552, z = 2 },  -- kitchen
        { x = 8090, y = 11554, z = 2 },  -- livingroom
        { x = 8084, y = 11556, z = 2 },  -- bedroom
        { x = 8080, y = 11552, z = 2 },  -- livingroom
        { x = 8080, y = 11552, z = 1 },  -- livingroom
        { x = 8079, y = 11556, z = 0 },  -- livingroom
        { x = 8073, y = 11556, z = 0 },  -- office
        { x = 8073, y = 11552, z = 0 },  -- zippeestorage
        { x = 8076, y = 11556, z = 0 },  -- breakroom
        { x = 8078, y = 11552, z = 0 },  -- bathroom
        { x = 8085, y = 11552, z = -1 }, -- hall
        { x = 8081, y = 11552, z = -1 }, -- storage
        { x = 8087, y = 11552, z = -1 }, -- storageunit
        { x = 8093, y = 11552, z = -1 }, -- storageunit
        { x = 8090, y = 11557, z = -1 }, -- storageunit
        { x = 8084, y = 11557, z = -1 }, -- storageunit
    },
    spawn = { x = 8087, y = 11558, z = 2 },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 8082, y = 11550, z = -1, },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 8080, y = 11550, z = -1, },
            fakeGenerators = {
                { x = 8082, y = 11548, z = -1, createTile = false },
            },
        },
    },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = { x = 8082, y = 11550, z = -1 } },
    },
    waterFixtures = {
        -- 3rd floor apts
        { sprite = "fixtures_sinks_01_1",        x = 8085, y = 11552, z = 2, sourceType = "tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_bathroom_01_1",     x = 8085, y = 11553, z = 2, sourceType = "tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_bathroom_01_25",    x = 8087, y = 11552, z = 2, sourceType = "tank", source = wtc, }, -- bathroom, bld 31,45#6
        -- 2nd floor apts
        { sprite = "fixtures_sinks_01_5",        x = 8074, y = 11552, z = 1, sourceType = "tank", source = wtc, }, -- kitchen, bld 31,45#6
        { sprite = "fixtures_bathroom_01_26",    x = 8077, y = 11560, z = 1, sourceType = "tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_sinks_01_11",       x = 8078, y = 11551, z = 1, sourceType = "tank", source = wtc, }, -- kitchen, bld 31,45#6
        { sprite = "fixtures_bathroom_01_2",     x = 8078, y = 11558, z = 1, sourceType = "tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_sinks_01_29",       x = 8078, y = 11559, z = 1, sourceType = "tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_bathroom_01_25",    x = 8087, y = 11552, z = 1, sourceType = "tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_sinks_01_4",        x = 8085, y = 11552, z = 1, sourceType = "tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_bathroom_01_1",     x = 8085, y = 11553, z = 1, sourceType = "tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_sinks_01_5",        x = 8092, y = 11552, z = 1, sourceType = "tank", source = wtc, }, -- kitchen, bld 31,45#6
        -- 1st floor businesses
        { sprite = "fixtures_sinks_01_8",        x = 8076, y = 11557, z = 0, sourceType = "tank", source = wtc, }, -- breakroom, bld 31,45#6
        { sprite = "fixtures_sinks_01_12",       x = 8078, y = 11552, z = 0, sourceType = "tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_bathroom_01_0",     x = 8079, y = 11552, z = 0, sourceType = "tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "location_shop_zippee_01_60", x = 8093, y = 11560, z = 0, sourceType = "tank", source = wtc, }, -- zippeestore, bld 31,45#6
    },
    doorKeys = {
        name = "Rosewood Zippee Apts Key",
        doors = {
        },
    },
    map = { name = "DWAPStashMap7", },
    objectSpawns = {
        { sprite = "carpentry_02_122", x = 8084,              y = 11552,                            z = 3,    enabled = "EnableWaterSystem", delete = true, },
        { barricade = "woodhalf",      enabled = "Barricade", target = "fixtures_windows_metal_16", x = 8096, y = 11555,                     z = 2, },     -- window W | livingroom, bld 31,45#6
        { barricade = "woodhalf",      enabled = "Barricade", target = "fixtures_windows_metal_16", x = 8096, y = 11557,                     z = 2, },     -- window W | livingroom, bld 31,45#6
        { barricade = "woodhalf",      enabled = "Barricade", target = "fixtures_windows_metal_16", x = 8096, y = 11559,                     z = 2, },     -- window W | livingroom, bld 31,45#6
    },
    loot = {
        { -- E1
            note = "dresser @ bedroom",
            coords = { x = 8089, y = 11560, z = 2 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E2
            note = "sidetable @ bedroom",
            coords = { x = 8088, y = 11556, z = 2 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E3
            note = "wardrobe @ bedroom",
            coords = { x = 8086, y = 11556, z = 2 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E4
            note = "wardrobe @ bedroom",
            coords = { x = 8086, y = 11557, z = 2 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E5
            note = "shelves @ bedroom",
            coords = { x = 8086, y = 11559, z = 2 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E6
            note = "wardrobe @ bedroom",
            coords = { x = 8082, y = 11556, z = 2 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E7
            note = "wardrobe @ bedroom",
            coords = { x = 8082, y = 11557, z = 2 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E8
            note = "dresser @ bedroom",
            coords = { x = 8085, y = 11558, z = 2 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E9
            note = "shelves @ bedroom",
            coords = { x = 8085, y = 11559, z = 2 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E10
            note = "sidetable @ bedroom",
            coords = { x = 8082, y = 11560, z = 2 },
            dist = { "LivingRoomShelfClassy" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E11
            note = "shelves @ livingroom",
            coords = { x = 8089, y = 11554, z = 2 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E12
            note = "shelves @ livingroom",
            coords = { x = 8090, y = 11554, z = 2 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E13
            note = "wardrobe @ livingroom",
            coords = { x = 8083, y = 11552, z = 2 },
            special = "essentials",
        },
        { -- E14
            note = "wardrobe @ livingroom",
            coords = { x = 8084, y = 11552, z = 2 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E15
            note = "dresser @ livingroom",
            coords = { x = 8082, y = 11555, z = 2 },
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E16
            note = "counter @ bathroom",
            coords = { x = 8085, y = 11552, z = 2 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E17
            note = "medicine @ bathroom",
            coords = { x = 8085, y = 11552, z = 2 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E18
            note = "cardboardbox @ closet",
            coords = { x = 8088, y = 11552, z = 2 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E19
            note = "cardboardbox @ closet",
            coords = { x = 8088, y = 11552, z = 2 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E20
            note = "metal_shelves @ closet",
            coords = { x = 8089, y = 11552, z = 2 },
            slot = "upper",
            sandboxEnable = 'SeedLibrary',
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = { 8, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E21
            note = "counter @ kitchen",
            coords = { x = 8090, y = 11552, z = 2 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E22
            note = "shelves @ kitchen",
            coords = { x = 8091, y = 11552, z = 2 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E23
            note = "counter @ kitchen",
            coords = { x = 8091, y = 11552, z = 2 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E24
            note = "counter @ kitchen",
            coords = { x = 8092, y = 11552, z = 2 },
            dist = { "KitchenDryFood", },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E25
            note = "counter @ kitchen",
            coords = { x = 8094, y = 11552, z = 2 },
            special = "kitchentools",
        },
        { -- E26
            note = "fridge @ kitchen",
            coords = { x = 8090, y = 11553, z = 2 },
            distIncludeJunk = true,
            tag = "DWAPFridge",
        },
        { -- E27
            note = "freezer @ kitchen",
            coords = { x = 8090, y = 11553, z = 2 },
            slot = "freezer",
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        { -- E28
            note = "sidetable @ livingroom",
            coords = { x = 8090, y = 11560, z = 2 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E29
            note = "sidetable @ livingroom",
            coords = { x = 8093, y = 11559, z = 2 },
            dist = { "CrateVHSTapes" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E30
            note = "cardboardbox @ livingroom",
            coords = { x = 8080, y = 11552, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E31
            note = "cardboardbox @ livingroom",
            coords = { x = 8081, y = 11552, z = 1 },
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
                { name = 'Base.Fertilizer',    chance = 1, count = { 8, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E32
            note = "cardboardbox @ livingroom",
            coords = { x = 8081, y = 11552, z = 1 },
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
                { name = 'Base.Fertilizer',    chance = 1, count = { 8, 10 } },
            },
            level = "Loot_FarmLevel",
            slot = "upper",
        },
        { -- E33
            note = "smallbox @ livingroom",
            coords = { x = 8081, y = 11553, z = 1 },
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            level = "Loot_BuildMatsLevel",
        },
        { -- E34
            note = "shelves @ hall",
            coords = { x = 8078, y = 11557, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E35
            note = "smallbox @ hall",
            coords = { x = 8079, y = 11558, z = -1 },
            items = {
                { name = 'Base.Firewood', chance = 1, count = { 10, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E36
            note = "metal_shelves @ storage",
            coords = { x = 8081, y = 11552, z = -1 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E37
            note = "smallbox @ storageunit",
            coords = { x = 8090, y = 11552, z = -1 },
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.Sheet', },
                { name = 'Base.WoodAxe', },
                { name = 'Base.Machete', },
            },
            level = "Loot_BuildMatsLevel",
        },
        { -- E38
            note = "desk @ storageunit",
            coords = { x = 8089, y = 11549, z = -1 },
            dist = { "MusicStoreCDs" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E39
            note = "shelves @ storageunit",
            coords = { x = 8092, y = 11549, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E40
            note = "cardboardbox @ storageunit",
            coords = { x = 8092, y = 11551, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E41
            note = "metal_shelves @ storageunit",
            coords = { x = 8087, y = 11549, z = -1 },
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E42
            note = "cardboardbox @ storageunit",
            coords = { x = 8087, y = 11550, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E43
            note = "cardboardbox @ storageunit",
            coords = { x = 8087, y = 11550, z = -1 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E44
            note = "cardboardbox @ storageunit",
            coords = { x = 8087, y = 11551, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E45
            note = "locker @ storageunit",
            coords = { x = 8090, y = 11560, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E46
            note = "smallbox @ storageunit",
            coords = { x = 8093, y = 11560, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E47
            note = "cardboardbox @ storageunit",
            coords = { x = 8090, y = 11557, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E48
            note = "metal_shelves @ storageunit",
            coords = { x = 8086, y = 11560, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E49
            note = "metal_shelves @ storageunit",
            coords = { x = 8087, y = 11560, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E50
            note = "toolcabinet @ storageunit",
            coords = { x = 8086, y = 11557, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E51
            note = "counter @ breakroom",
            coords = { x = 8076, y = 11556, z = 0 },
            dist = { "BreakRoomCounter" },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E52
            note = "counter @ breakroom",
            coords = { x = 8076, y = 11557, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E53
            note = "counter @ breakroom",
            coords = { x = 8076, y = 11558, z = 0 },
            dist = { "StoreKitchenCleaning" },
            distIncludeJunk = false,
            tag = "DWAPTools",
        },
        { -- E54
            note = "cardboardbox @ zippeestorage",
            coords = { x = 8073, y = 11552, z = 0 },
            dist = { "CrateBlacksmithing", },
            distIncludeJunk = false,
            tag = "DWAPTools",
        },
        { -- E55
            note = "cardboardbox @ zippeestorage",
            coords = { x = 8073, y = 11552, z = 0 },
            slot = "upper",
            dist = { "CrateCarpentry", },
            distIncludeJunk = false,
            tag = "DWAPTools",
        },
        { -- E56
            note = "metal_shelves @ zippeestorage",
            coords = { x = 8074, y = 11552, z = 0 },
            dist = { "CrateMechanics", },
            distIncludeJunk = false,
            tag = "DWAPTools",
        },
        { -- E57
            note = "metal_shelves @ zippeestorage",
            coords = { x = 8075, y = 11552, z = 0 },
            dist = { "CrateMetalwork" },
            distIncludeJunk = false,
            tag = "DWAPTools",
        },
        { -- E58
            note = "metal_shelves @ zippeestorage",
            coords = { x = 8076, y = 11552, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E59
            note = "metal_shelves @ zippeestorage",
            coords = { x = 8077, y = 11552, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E60
            note = "cardboardbox @ zippeestorage",
            coords = { x = 8073, y = 11553, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E61
            note = "smallbox @ zippeestorage",
            coords = { x = 8077, y = 11553, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E62
            note = "medicine @ bathroom",
            coords = { x = 8079, y = 11552, z = 0 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    -- @TODO this needs to be remapped and updated for the new location
    -- table.insert(RosewoodZippee.objectSpawns, { enabled = "EnableLadders", x = 8174, y = 11255, z = -1, removeWall = "north" })
    -- table.insert(RosewoodZippee.objectSpawns, { enabled = "EnableLadders", x = 8174, y = 11215, z = 0, removeFloor = true, })
    -- table.insert(RosewoodZippee.objectSpawns, { enabled = "EnableLadders", sprite = "fencing_01_59", x = 8175, y = 11215, z = 0 })
    -- table.insert(RosewoodZippee.doorKeys.doors, { sprite = "fixtures_doors_fences_01_25", x = 8175, y = 11213, z = 0, })
    -- table.insert(RosewoodZippee.doorKeys.doors, { sprite = "fixtures_doors_01_57", x = 8175, y = 11214, z = 0, })

    -- table.insert(RosewoodZippee.generators[1].fakeGenerators, { x = 8173, y = 11234, z = -1, createTile = false })
end

return RosewoodZippee
