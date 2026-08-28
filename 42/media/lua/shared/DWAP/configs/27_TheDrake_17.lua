local wtc = { x = 11912, y = 6844, z = -1, }
local pb1 = { x = 11907, y = 6843, z = -1 }
local TheDrake = {
    group = "West Point",
    baseBuildings = {
        { x = 11908, y = 6853, z = 1 },  -- apartments
        { x = 11908, y = 6853, z = -1 }, -- basement
        { x = 11905, y = 6840, z = -1 }, -- addon basement
    },
    baseRooms = {
        { x = 11907, y = 6849, z = 1 },  -- livingroom
        { x = 11904, y = 6849, z = 1 },  -- bathroom
        { x = 11910, y = 6853, z = 1 },  -- bedroom
        { x = 11911, y = 6849, z = 1 },  -- kitchen
        { x = 11904, y = 6856, z = 1 },  -- hall
        { x = 11906, y = 6848, z = 0 },  -- bar
        { x = 11904, y = 6843, z = 0 },  -- restaurantkitchen
        { x = 11904, y = 6848, z = 0 },  -- bar
        { x = 11902, y = 6854, z = 0 },  -- janitor
        { x = 11904, y = 6856, z = 0 },  -- bathroom
        { x = 11904, y = 6858, z = 0 },  -- hall
        { x = 11905, y = 6848, z = -1 }, -- hall
        { x = 11910, y = 6858, z = -1 }, -- storage
        { x = 11907, y = 6848, z = -1 }, -- storage
        { x = 11904, y = 6855, z = -1 }, -- storageunit
        { x = 11904, y = 6851, z = -1 }, -- storageunit
        { x = 11904, y = 6848, z = -1 }, -- storageunit
        { x = 11904, y = 6843, z = -1 }, -- storageunit
        { x = 11904, y = 6840, z = -1 }, -- warehouse
    },
    spawn = { x = 11908, y = 6853, z = 1 },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 11908, y = 6844, z = pb1.z },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 11910, y = 6844, z = -1, },
            fakeGenerators = {
                { x = 11913, y = 6851, z = -1, createTile = false },
            },
        },
    },
    waterTanks = {
        { sprite = "dwap_tiles_01_8", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = { x = 11911, y = 6844, z = -1 } },
    },
    waterFixtures = {
        -- 2nd floor apt
        { sprite = "fixtures_bathroom_01_25", x = 11904, y = 6849, z = 1,  sourceType = "tank", source = wtc, }, -- CONNECTED already | bathroom, bld 46,26#4
        { sprite = "fixtures_sinks_01_12",    x = 11905, y = 6849, z = 1,  sourceType = "tank", source = wtc, }, -- bathroom, bld 46,26#4
        { sprite = "fixtures_bathroom_01_0",  x = 11906, y = 6849, z = 1,  sourceType = "tank", source = wtc, }, -- bathroom, bld 46,26#4
        { sprite = "fixtures_sinks_01_10",    x = 11913, y = 6850, z = 1,  sourceType = "tank", source = wtc, }, -- kitchen, bld 46,26#4
        -- 1st floor
        { sprite = "fixtures_sinks_01_18",    x = 11904, y = 6847, z = 0,  sourceType = "tank", source = wtc, }, -- bar, bld 46,26#4
        { sprite = "fixtures_sinks_01_32",    x = 11902, y = 6845, z = 0,  sourceType = "tank", source = wtc, }, -- restaurantkitchen, bld 46,26#4
        { sprite = "fixtures_sinks_01_8",     x = 11902, y = 6844, z = 0,  sourceType = "tank", source = wtc, }, -- restaurantkitchen, bld 46,26#4
        { sprite = "fixtures_sinks_01_13",    x = 11904, y = 6856, z = 0,  sourceType = "tank", source = wtc, }, -- bathroom, bld 46,26#4
        { sprite = "fixtures_bathroom_01_1",  x = 11904, y = 6857, z = 0,  sourceType = "tank", source = wtc, }, -- bathroom, bld 46,26#4
        -- basement
        { sprite = "fixtures_sinks_01_2",     x = 11902, y = 6839, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "appliances_laundry_01_2", x = 11902, y = 6841, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_1",  x = 11896, y = 6841, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

    },
    doorKeys = {
        name = "The Drake",
        doors = {
            { sprite = "fixtures_doors_02_5",  x = 11905, y = 6841, z = -1, },
            { sprite = "fixtures_doors_02_4",  x = 11912, y = 6852, z = 0, },
            { sprite = "fixtures_doors_01_52", x = 11902, y = 6860, z = 0, },
            { sprite = "fixtures_doors_01_0",  x = 11904, y = 6854, z = 1, },
        },
    },
    map = { name = "DWAPStashMap27", },
    objectSpawns = {
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_56", x = 11902, y = 6845, z = 0, }, -- window W | restaurantkitchen, bld 46,26#4
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_57", x = 11905, y = 6843, z = 0, }, -- window N | restaurantkitchen, bld 46,26#4
        { barricade = "wood",     enabled = "Barricade", target = "walls_commercial_01_0",  x = 11914, y = 6844, z = 0, }, -- window W | bar, bld 46,26#4
        { barricade = "wood",     enabled = "Barricade", target = "walls_commercial_01_0",  x = 11914, y = 6845, z = 0, }, -- window W | bar, bld 46,26#4
        { barricade = "wood",     enabled = "Barricade", target = "walls_commercial_01_0",  x = 11914, y = 6846, z = 0, }, -- window W | bar, bld 46,26#4
        { barricade = "wood",     enabled = "Barricade", target = "walls_commercial_01_0",  x = 11914, y = 6854, z = 0, }, -- window W | bar, bld 46,26#4
        { barricade = "wood",     enabled = "Barricade", target = "walls_commercial_01_0",  x = 11914, y = 6855, z = 0, }, -- window W | bar, bld 46,26#4
        { barricade = "wood",     enabled = "Barricade", target = "walls_commercial_01_0",  x = 11914, y = 6856, z = 0, }, -- window W | bar, bld 46,26#4
    },
    loot = {
        -- basement
        -- shelter area
        { -- E1
            coords = { x = 11896, y = 6841, z = -1 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E2
            coords = { x = 11900, y = 6839, z = -1 },
            slot = "upper",
            dist = { "MedicalCabinet" },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E3
            note = "metal_shelves @ warehouse",
            coords = { x = 11901, y = 6839, z = -1 },
            special = "essentials",
        },
        { -- E4
            note = "counter @ warehouse",
            coords = { x = 11902, y = 6839, z = -1 },
            dist = { "CrateToiletPaper" },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E5
            note = "clothingwasher @ warehouse",
            coords = { x = 11902, y = 6841, z = -1 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E6
            note = "counter @ warehouse",
            coords = { x = 11903, y = 6839, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E7
            coords = { x = 11903, y = 6839, z = -1 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E8
            note = "counter @ warehouse",
            coords = { x = 11904, y = 6839, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E9
            coords = { x = 11904, y = 6839, z = -1 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E10
            note = "crate @ warehouse",
            coords = { x = 11906, y = 6839, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E11
            note = "crate @ warehouse",
            coords = { x = 11906, y = 6839, z = -1 },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E12
            note = "militarylocker @ warehouse",
            coords = { x = 11907, y = 6839, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E13
            note = "militarylocker @ warehouse",
            coords = { x = 11908, y = 6839, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E14
            note = "militarycrate @ warehouse",
            coords = { x = 11909, y = 6839, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E15
            note = "militarycrate @ warehouse",
            coords = { x = 11909, y = 6839, z = -1 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E16
            note = "militarycrate @ warehouse",
            coords = { x = 11910, y = 6839, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E17
            note = "militarycrate @ warehouse",
            coords = { x = 11910, y = 6839, z = -1 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E18
            note = "metal_shelves @ warehouse",
            coords = { x = 11911, y = 6839, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E19
            note = "metal_shelves @ warehouse",
            coords = { x = 11912, y = 6839, z = -1 },
            dist = { "GasStoreEmergency" },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E20
            note = "metal_shelves @ warehouse",
            coords = { x = 11913, y = 6839, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E21
            note = "metal_shelves @ warehouse",
            coords = { x = 11914, y = 6839, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E22
            note = "metal_shelves @ warehouse",
            coords = { x = 11914, y = 6841, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E23
            note = "metal_shelves @ warehouse",
            coords = { x = 11913, y = 6841, z = -1 },
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
                { name = 'Base.Fertilizer',    chance = 1, count = { 8, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E24
            note = "crate @ warehouse",
            coords = { x = 11912, y = 6841, z = -1 },
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E25
            note = "crate @ warehouse",
            coords = { x = 11911, y = 6841, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E26
            note = "crate @ warehouse",
            coords = { x = 11910, y = 6841, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E27
            note = "crate @ warehouse",
            coords = { x = 11909, y = 6841, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E28
            note = "crate @ warehouse",
            coords = { x = 11908, y = 6841, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E29
            note = "crate @ warehouse",
            coords = { x = 11907, y = 6841, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E30
            note = "locker @ warehouse",
            coords = { x = 11906, y = 6841, z = -1 },
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E31
            note = "clothingrack @ warehouse",
            coords = { x = 11904, y = 6841, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E32
            note = "clothingrack @ warehouse",
            coords = { x = 11903, y = 6841, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E33
            note = "shelves @ warehouse",
            coords = { x = 11900, y = 6841, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E34
            note = "shelves @ warehouse",
            coords = { x = 11899, y = 6841, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        -- rest of basement
        { -- E35
            note = "crate @ storage",
            coords = { x = 11907, y = 6846, z = -1 },
            dist = { "CrateLumber" },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E36
            note = "crate @ storage",
            coords = { x = 11907, y = 6847, z = -1 },
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            level = "Loot_BuildMatsLevel",
        },
        { -- E37
            note = "crate @ storage",
            coords = { x = 11913, y = 6857, z = -1 },
            dist = { "CrateSheetMetal" },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E38
            note = "crate @ storage",
            coords = { x = 11913, y = 6869, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E39
            note = "crate @ storage",
            coords = { x = 11907, y = 6865, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        -- storage rooms, south to north
        { -- E40
            note = "metal_shelves @ storageunit",
            coords = { x = 11904, y = 6858, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E41
            note = "locker @ storageunit",
            coords = { x = 11904, y = 6854, z = -1 },
            dist = { "SafehouseTraps", },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E42
            note = "metal_shelves @ storageunit",
            coords = { x = 11902, y = 6854, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E43
            note = "metal_shelves @ storageunit",
            coords = { x = 11902, y = 6853, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E44
            note = "toolcabinet @ storageunit",
            coords = { x = 11902, y = 6852, z = -1 },
            dist = { "StoreShelfMechanics", },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E45
            note = "cardboardbox @ storageunit",
            coords = { x = 11904, y = 6850, z = -1 },
            dist = { "CrateLeather", },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E46
            note = "cardboardbox @ storageunit",
            coords = { x = 11902, y = 6848, z = -1 },
            dist = { "SewingStoreTools", },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E47
            note = "cardboardbox @ storageunit",
            coords = { x = 11902, y = 6847, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E48
            note = "cardboardbox @ storageunit",
            coords = { x = 11902, y = 6847, z = -1 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E49
            note = "cardboardbox @ storageunit",
            coords = { x = 11903, y = 6847, z = -1 },
            dist = { "SewingStoreFabric" },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E50
            note = "crate @ storageunit",
            coords = { x = 11904, y = 6846, z = -1 },
            dist = { "ArtStorePottery", },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        -- first floor
        -- bar area
        { -- E51
            note = "fridge @ bar",
            coords = { x = 11902, y = 6853, z = 0 },
            dist = { "CrateBeer", },
            distIncludeJunk = true,
            tag = "DWAPFridge",
        },
        { -- E52
            note = "fridge @ bar",
            coords = { x = 11902, y = 6852, z = 0 },
            dist = { "CrateWine", },
            distIncludeJunk = true,
            tag = "DWAPFridge",
        },
        { -- E53
            note = "shelves @ bar",
            coords = { x = 11902, y = 6851, z = 0 },
            dist = { "StoreCounterTobacco" },
            distIncludeJunk = true,
            tag = "DWAPBooze",
        },
        { -- E54
            note = "shelves @ bar",
            coords = { x = 11902, y = 6850, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPBooze",
        },
        { -- E55
            note = "shelves @ bar",
            coords = { x = 11902, y = 6849, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPBooze",
        },
        { -- E56
            note = "shelves @ bar",
            coords = { x = 11902, y = 6848, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E57
            coords = { x = 11905, y = 6849, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E58
            coords = { x = 11905, y = 6848, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        -- bar kitchen
        { -- E59
            note = "shelves @ bar",
            coords = { x = 11902, y = 6846, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E60
            coords = { x = 11902, y = 6843, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E61
            coords = { x = 11905, y = 6846, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        -- 2nd floor apt
        { -- E62
            note = "counter @ kitchen",
            coords = { x = 11912, y = 6849, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E63
            note = "counter @ kitchen",
            coords = { x = 11911, y = 6849, z = 1 },
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E64
            note = "fridge @ kitchen",
            coords = { x = 11911, y = 6852, z = 1 },
            dist = { "BurgerKitchenFridge", },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E65
            note = "freezer @ kitchen",
            coords = { x = 11911, y = 6852, z = 1 },
            slot = "freezer",
            dist = { "BurgerKitchenFreezer" },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E66
            note = "counter @ kitchen",
            coords = { x = 11913, y = 6849, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E67
            note = "medicine @ bathroom",
            coords = { x = 11905, y = 6849, z = 1 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(TheDrake.objectSpawns, { enabled = "EnableLadders", x = 11889, y = 6880, z = 0, removeFloor = true, })
    table.insert(TheDrake.objectSpawns,
        { enabled = "EnableLadders", sprite = "location_business_office_generic_01_35", x = 11889, y = 6879, z = 0, })
end

return TheDrake
