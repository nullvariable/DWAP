-- @TODO (2026-08-07 audit) unresolved - delete lines as they are fixed
--   * systems: 1 component at 3585,10898 z=-1 names a sprite that is not on
--     the square, though the square itself loads - config drifted from the
--     map
local wtc = {x = 3563, y = 10904, z = -1}
local pb1 = { x = 3586, y = 10898, z = -1 }
local EchoCreek = {
    group = "Echo Creek",
    baseBuildings = {
        { x = 3573, y = 10896, z = 1 }, -- gas station
        { x = 3583, y = 10899, z = -1 }, -- addon basement
        { x = 3608, y = 10903, z = 0 }, -- shed
    },
    spawn = { x = 3573, y = 10896, z = 1 },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = pb1.x-1, y = pb1.y, z = pb1.z },
            fuelTank = { sprite = "dwap_tiles_01_24", x= 3584, y= 10898, z= -1, },
            fakeGenerators = {
                { x = 3569, y = 10907, z = -1 }, -- dummy
                { x = 3588, y = 10898, z = -1 },
                { x = 3612, y = 10903, z = -1 },
            },
        },
    },
    waterTanks = {
        { sprite = "industry_02_75", x = wtc.x, y = wtc.y, z = wtc.z, sourceType="generator", source = {x = 3586, y = 10898, z = -1} },
    },
    waterFixtures = {
        { sprite = "fixtures_sinks_01_22", x = 3577, y = 10893, z = 0, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_4", x = 3578, y = 10893, z = 0, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_32", x = 3566, y = 10899, z = 0, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_17", x = 3569, y = 10897, z = 0, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_18", x = 3570, y = 10903, z = 0, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_4", x = 3562, y = 10897, z = 0, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_12", x = 3563, y = 10897, z = 0, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "appliances_laundry_01_5", x = 3562, y = 10900, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_9", x = 3567, y = 10897, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_25", x = 3569, y = 10897, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_24", x = 3569, y = 10898, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_2", x = 3571, y = 10897, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_3", x = 3571, y = 10899, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_32", x = 3567, y = 10904, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
    },
    doorKeys = {
        name = "Echo Creek Station",
        doors = {
            { sprite = "fixtures_doors_01_45", x = 3572, y = 10906, z = 0, },
            { sprite = "fixtures_doors_01_52", x = 3570, y = 10893, z = 0, },
            { sprite = "fixtures_doors_01_52", x = 3563, y = 10899, z = 1, },
        },
    },
    map = {name = "DWAPStashMap2",},
    objectSpawns = {
        -- { sprite = "camping_01_64", x = 3565, y = 10888, z = 0, enabled = "EnableWaterSystem", }, -- fountain
        { x = 3565, y = 10888, z = 0, disabled = "EnableWaterSystem", clearExisting = true }, -- fountain
        { sprite = "industry_02_175", x = pb1.x, y = pb1.y, z = pb1.z, disabled = "EnableGenSystemSolar", clearExisting = true, },

        -- { x = 3576, y = 10902, z = -1, clearExisting = true, },
        -- { x = 3577, y = 10902, z = -1, removeWall = "west", },
        -- { x = 3578, y = 10902, z = -1, removeWall = "west", },
        -- { sprite = "floors_exterior_street_01_16", x = 3577, y = 10902, z = -1, isFloor = true, },
        -- { sprite = "location_sewer_01_1", x = 3577, y = 10902, z = -1, },
        -- { sprite = "location_sewer_01_1", x = 3577, y = 10903, z = -1, },

        -- { sprite = "carpentry_01_16", x = 3572, y = 10891, z = -1, enabled = "Loot", clearExisting = true, },

        { barricade = "metalbar", enabled = "Barricade", target="walls_exterior_house_01_41", x = 3575, y = 10906, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target="walls_exterior_house_01_41", x = 3574, y = 10906, z = 0, },
        { barricade = "wood", enabled = "Barricade", target="walls_commercial_02_50", x = 3568, y = 10906, z = 0, },
        { barricade = "wood", enabled = "Barricade", target="walls_commercial_02_49", x = 3567, y = 10906, z = 0, },
        { barricade = "wood", enabled = "Barricade", target="walls_commercial_02_48", x = 3566, y = 10906, z = 0, },
        { barricade = "wood", enabled = "Barricade", target="fixtures_doors_01_49", x = 3563, y = 10906, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target="fixtures_windows_01_24", x = 3566, y = 10898, z = 1, },
    },
    loot = {
        -- addon basement room
        { -- E1
            note = "militarylocker @ warehouse",
            coords = {x=3581, y=10897,z=-1},
            special = "essentials",
        },
        { -- E2
            note = "crate @ warehouse",
            coords = {x=3584, y=10901,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E3
            note = "crate @ warehouse",
            coords = {x=3585, y=10901,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E4
            note = "crate @ warehouse",
            coords = {x=3586, y=10901,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E5
            note = "crate @ warehouse",
            coords = {x=3587, y=10901,z=-1},
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E6
            note = "freezer @ warehouse",
            coords = {x=3587, y=10900,z=-1},
            dist = {"FreezerIceCream", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E7
            stack = 1,
            note = "militarycrate @ warehouse",
            coords = {x=3587, y=10897,z=-1},
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E8
            stack = 2,
            note = "militarycrate @ warehouse",
            coords = {x=3587, y=10897,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },


        { -- E9 house next to couch
            note = "sidetable @ livingroom",
            coords = {x=3566, y=10901,z=1},
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E10 tv stand
            note = "sidetable @ livingroom",
            coords = {x=3564,y=10905,z=1},
            items = {
                { name = 'Base.VHS_Retail', chance = 1, count = {30,30} },
            },
            level = "Loot_MediaLevel",
        },
        { -- E11 bunkbed bedroom
            note = "dresser @ kidsbedroom",
            coords = {x=3572,y=10903,z=1},
            dist = {"MusicStoreCDs"},
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E12 twin bedroom
            note = "sidetable @ bedroom",
            coords = {x=3573,y=10905,z=1},
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E13 twin bedroom
            note = "sidetable @ bedroom",
            coords = {x=3575,y=10905,z=1},
            dist = {"BookstoreNonFiction"},
            distIncludeJunk = false,
            level = 1,
        },
        { -- E14 twin bedroom
            note = "wardrobe @ bedroom",
            coords = {x=3573,y=10904,z=1},
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E15 twin bedroom
            note = "wardrobe @ bedroom",
            coords = {x=3573,y=10903,z=1},
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E16 twin bedroom closet
            note = "metal_shelves @ closet",
            coords = {x=3576,y=10900,z=1},
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E17 master bedroom closet
            note = "metal_shelves @ closet",
            coords = {x=3576,y=10899,z=1},
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E18 master bedroom wardrobe
            note = "wardrobe @ bedroom",
            coords = {x=3576,y=10898,z=1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E19 master bedroom wardrobe
            note = "wardrobe @ bedroom",
            coords = {x=3576,y=10897,z=1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E20 master bedroom nightstand
            note = "sidetable @ bedroom",
            coords = {x=3575,y=10894,z=1},
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E21 master bedroom nightstand
            note = "sidetable @ bedroom",
            coords = {x=3572,y=10894,z=1},
            dist = {"ArmyStorageGuns",},
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E22 master bedroom
            note = "dresser @ bedroom",
            coords = {x=3571,y=10896,z=1},
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E23 bathroom
            note = "metal_shelves @ bathroom",
            coords = {x=3569,y=10899,z=1},
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E24 bathroom
            note = "counter @ bathroom",
            coords = {x=3571,y=10899,z=1},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        -- kitchen
        { -- E25
            note = "fridge @ kitchen",
            coords = {x=3569,y=10900,z=1},
            distIncludeJunk = true,
            tag = "DWAPFridge",
        },
        { -- E26
            slot = "freezer",
            note = "freezer @ kitchen",
            coords = {x=3569,y=10900,z=1},
            dist = {"FreezerIceCream", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E27
            note = "counter @ kitchen",
            coords = {x=3566,y=10898,z=1},
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E28
            note = "counter @ kitchen",
            coords = {x=3566,y=10897,z=1},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E29
            note = "counter @ kitchen",
            coords = {x=3567,y=10897,z=1},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E30
            note = "counter @ kitchen",
            coords = {x=3568,y=10897,z=1},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E31
            note = "counter @ kitchen",
            coords = {x=3568,y=10898,z=1},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        -- mechanic's storage
        { -- E32
            note = "metal_shelves @ mechanic",
            coords = {x=3581,y=10894,z=0},
            slot = "upper",
            dist = {"FirearmWeapons_Late"},
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E33
            note = "crate @ mechanic",
            coords = {x=3581,y=10891,z=0},
            special = 'SeedLibrary',
        },
        { -- E34
            note = "metal_shelves @ mechanic",
            coords = {x=3583,y=10891,z=0},
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E35
            note = "metal_shelves @ mechanic",
            coords = {x=3583,y=10892,z=0},
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E36
            note = "metal_shelves @ mechanic",
            coords = {x=3585,y=10891,z=0},
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E37
            note = "metal_shelves @ mechanic",
            coords = {x=3585,y=10892,z=0},
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E38
            note = "crate @ mechanic",
            coords = {x=3584,y=10894,z=0},
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E39
            stack = 1,
            note = "crate @ mechanic",
            coords = {x=3585,y=10894,z=0},
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E40
            stack = 2,
            note = "crate @ mechanic",
            coords = {x=3585,y=10894,z=0},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        -- lift area
        { -- E41
            note = "toolcabinet @ mechanic",
            coords = {x=3581,y=10895,z=0},
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E42
            note = "metal_shelves @ mechanic",
            coords = {x=3582,y=10895,z=0},
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E43
            note = "metal_shelves @ mechanic",
            coords = {x=3583,y=10895,z=0},
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E44
            note = "counter @ mechanic",
            coords = {x=3584,y=10895,z=0},
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E45
            note = "counter @ mechanic",
            coords = {x=3585,y=10895,z=0},
            dist = {"LoggingFactoryTools" },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        -- servo storage area
        { -- E46
            note = "metal_shelves @ gasstorage",
            coords = {x=3571,y=10895,z=0},
            dist = {"ArmyStorageAmmunition", },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E47
            note = "metal_shelves @ gasstorage",
            coords = {x=3572,y=10895,z=0},
            dist = {"ArmyStorageAmmunition", },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E48
            note = "metal_shelves @ gasstorage",
            coords = {x=3573,y=10895,z=0},
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E49
            note = "metal_shelves @ gasstorage",
            coords = {x=3574,y=10895,z=0},
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E50 box
            note = "cardboardbox @ gasstorage",
            coords = {x=3574,y=10893,z=0},
            dist = {"CafeteriaSnacks"},
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        -- basement
        { -- E51 by water tank
            note = "metal_shelves @ storage",
            coords = {x=3562,y=10902,z=-1},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E52
            note = "metal_shelves @ storage",
            coords = {x=3562,y=10901,z=-1},
            dist = {"CrateToiletPaper"},
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E53 by generator
            note = "counter @ storage",
            coords = {x=3566,y=10897,z=-1},
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E54
            note = "counter @ storage",
            coords = {x=3567,y=10897,z=-1},
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E55
            note = "metal_shelves @ storage",
            coords = {x=3568,y=10897,z=-1},
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        -- back corner room
        { -- E56
            note = "metal_shelves @ cannedstorage",
            coords = {x=3570,y=10891,z=-1},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E57
            note = "metal_shelves @ cannedstorage",
            coords = {x=3571,y=10891,z=-1},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E58
            note = "metal_shelves @ cannedstorage",
            coords = {x=3570,y=10893,z=-1},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E59
            note = "metal_shelves @ cannedstorage",
            coords = {x=3571,y=10893,z=-1},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E60
            note = "cardboardbox @ storage",
            coords = {x=3576,y=10896,z=-1},
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E61
            note = "metal_shelves @ storage",
            coords = {x=3572,y=10894,z=-1},
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = {9,12} },
            },
            level = "Loot_FarmLevel",
        },
        { -- E62
            note = "metal_shelves @ storage",
            coords = {x=3571,y=10894,z=-1},
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = {8,10} },
            },
            level = "Loot_FarmLevel",
        },
        -- crates
        { -- E63
            note = "crate @ storage",
            coords = {x=3572,y=10902,z=-1},
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            level = "Loot_BuildMatsLevel",
        },
        { -- E64
            note = "crate @ storage",
            coords = {x=3574,y=10905,z=-1},
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E65
            note = "crate @ storage",
            coords = {x=3575,y=10905,z=-1},
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E66
            note = "crate @ storage",
            coords = {x=3576,y=10905,z=-1},
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E67
            note = "crate @ storage",
            coords = {x=3576,y=10904,z=-1},
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E68 metal shelves by sink
            note = "metal_shelves @ storage",
            coords = {x=3567,y=10905,z=-1},
            slot = "upper",
            dist = {"CrateVHSTapes"},
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(EchoCreek.objectSpawns, { enabled = "EnableLadders", x = 3588, y = 10902, z = -1, removeWall = "west" })
    table.insert(EchoCreek.objectSpawns, { enabled = "EnableLadders", x = 3612, y = 10901, z = 0, clearExisting = true, })
    table.insert(EchoCreek.objectSpawns, { enabled = "EnableLadders", sprite = "walls_exterior_wooden_01_64", x = 3612, y = 10902, z = 0, removeFloor = true, })
    table.insert(EchoCreek.objectSpawns, { enabled = "EnableLadders", sprite = "walls_exterior_wooden_01_65", x = 3612, y = 10903, z = 0, })
end

return EchoCreek