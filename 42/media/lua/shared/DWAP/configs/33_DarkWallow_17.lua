local wtc = { x = 8711, y = 15303, z = -1 }
local bunkerTopLeft = { x = 8709, y = 15293, z = -1 }
local pb1 = { x = 8713, y = 15305, z = -1 }
local DarkWallow = {
    group = "Dark Wallow",
    baseBuildings = {
        { x = 8718, y = 15311, z = 1 },  -- lake house
        { x = 8710, y = 15306, z = -1 }, -- bunker
    },
    spawn = { x = 8718, y = 15311, z = 1 },
    waterTanks = {
        { sprite = "dwap_tiles_01_8", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = { x = pb1.x - 1, y = pb1.y, z = pb1.z } },
    },
    waterFixtures = {
        -- basement
        { sprite = "fixtures_sinks_01_16",    x = 8709, y = 15297, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_6",  x = 8711, y = 15301, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- 1st floor
        { sprite = "fixtures_sinks_01_9",     x = 8712, y = 15305, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_9",     x = 8713, y = 15305, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "appliances_laundry_01_4", x = 8717, y = 15305, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "appliances_laundry_01_0", x = 8718, y = 15305, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- 2nd floor
        { sprite = "fixtures_bathroom_01_32", x = 8707, y = 15305, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_2",     x = 8709, y = 15305, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_2",     x = 8710, y = 15305, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_3",  x = 8710, y = 15307, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_7",  x = 8709, y = 15307, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_1",  x = 8717, y = 15307, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_5",  x = 8717, y = 15306, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_26", x = 8717, y = 15305, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_2",     x = 8720, y = 15305, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_2",     x = 8721, y = 15305, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
    },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 8716, y = 15303, z = -1 },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 8714, y = 15303, z = -1, },
            fakeGenerators = {
                { x = 8712, y = 15310, z = -1, createTile = true },
            },
        },
    },
    doorKeys = {
        name = "Dark Wallow Lake House Key",
        doors = {
            { sprite = "location_community_church_small_01_65", x = 8712, y = 15314, z = 0, },
        },
    },
    map = { name = "DWAPStashMap33", },
    objectSpawns = {
        { barricade = "metal",        enabled = "Barricade", target = "walls_exterior_wooden_01_37", x = 8706,  y = 15314, z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_exterior_wooden_01_37", x = 8710,  y = 15315, z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_exterior_wooden_01_37", x = 8715,  y = 15315, z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_exterior_wooden_01_37", x = 8719,  y = 15314, z = 0, },
        { barricade = "metalbar",     enabled = "Barricade", target = "fixtures_windows_01_9",       x = 8711,  y = 15305, z = 0, },
        { barricade = "metalbar",     enabled = "Barricade", target = "fixtures_windows_01_9",       x = 8714,  y = 15305, z = 0, },
    },
    loot = {
        { -- E1 cabinet next to bunk beds (9365)
            note = "filingcabinet @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 2, z = bunkerTopLeft.z },
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E2 upper
            sprite = 'location_trailer_02_23',
            note = "overhead @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 3, z = bunkerTopLeft.z },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E3 lower (66)
            note = "counter @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 3, z = bunkerTopLeft.z },
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E4 upper
            sprite = 'location_trailer_02_23',
            note = "overhead @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 4, z = bunkerTopLeft.z },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E5 lower (67)
            sprite = 'location_trailer_02_19',
            note = "counter @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 4, z = bunkerTopLeft.z },
            distIncludeJunk = false,
            tag = "DWAPMed",
        },
        { -- E6 upper
            sprite = 'location_trailer_02_23',
            note = "overhead @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 5, z = bunkerTopLeft.z },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E7 lower (68)
            sprite = 'location_trailer_02_19',
            note = "counter @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 5, z = bunkerTopLeft.z },
            dist = { "SewingStoreTools" },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E8 metal shelves (70)
            sprite = 'location_trailer_02_23',
            note = "metal_shelves @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 7, z = bunkerTopLeft.z },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E9 metal shelves (71)
            note = "metal_shelves @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 8, z = bunkerTopLeft.z },
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E10 next to inner door (9372)
            note = "metal_shelves @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 9, z = bunkerTopLeft.z },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E11 (73)
            note = "metal_shelves @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 10, z = bunkerTopLeft.z },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E12 (9374)
            note = "metal_shelves @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 11, z = bunkerTopLeft.z },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E13 far end next to stairs (9375)
            note = "metal_shelves @ bunker",
            coords = { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 12, z = bunkerTopLeft.z },
            special = "essentials",
        },
        { -- E14
            note = "militarycrate @ bunker",
            coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y + 5, z = bunkerTopLeft.z },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E15
            note = "militarycrate @ bunker",
            coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y + 5, z = bunkerTopLeft.z },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E16
            note = "militarylocker @ bunker",
            coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y + 6, z = bunkerTopLeft.z },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E17
            note = "militarylocker @ bunker",
            coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y + 7, z = bunkerTopLeft.z },
            distIncludeJunk = true,
            tag = "DWAPFarm",
        },
        { -- E18
            note = "militarycrate @ bunker",
            coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y, z = bunkerTopLeft.z },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E19
            note = "militarycrate @ bunker",
            coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y, z = bunkerTopLeft.z },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E20
            note = "militarycrate @ bunker",
            coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y + 1, z = bunkerTopLeft.z },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E21
            note = "militarycrate @ bunker",
            coords = { x = bunkerTopLeft.x + 2, y = bunkerTopLeft.y + 1, z = bunkerTopLeft.z },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E22
            note = "logs @ hallway",
            coords = { x = 8711, y = 15310, z = -1 },
            items = {
                { name = 'Base.Firewood', chance = 1, count = { 30, 30 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E23
            note = "metal_shelves @ bunker",
            coords = { x = 8711, y = 15305, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E24
            note = "metal_shelves @ bunker",
            coords = { x = 8712, y = 15305, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        ---------------------
        ---- First Floor ----
        ---------------------
        { -- E25
            note = "dishescabinet @ lobby",
            coords = { x = 8707, y = 15311, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E26
            note = "dishescabinet @ lobby",
            coords = { x = 8707, y = 15310, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E27
            note = "wardrobe @ lobby",
            coords = { x = 8707, y = 15305, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E28
            note = "wardrobe @ lobby",
            coords = { x = 8708, y = 15305, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E29
            note = "dresser @ lobby",
            coords = { x = 8704, y = 15305, z = 0 },
            dist = { "CrateToiletPaper" },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E30
            note = "shelves @ office",
            coords = { x = 8704, y = 15310, z = 0 },
            dist = { "CrateVHSTapes" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E31
            note = "counter @ kitchen",
            coords = { x = 8710, y = 15305, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E32
            note = "overhead @ kitchen",
            coords = { x = 8710, y = 15305, z = 0 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E33
            note = "counter @ kitchen",
            coords = { x = 8712, y = 15305, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E34
            note = "overhead @ kitchen",
            coords = { x = 8712, y = 15305, z = 0 },
            slot = "upper",
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E35
            note = "counter @ kitchen",
            coords = { x = 8713, y = 15305, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E36
            note = "overhead @ kitchen",
            coords = { x = 8713, y = 15305, z = 0 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E37
            note = "counter @ kitchen",
            coords = { x = 8714, y = 15305, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E38
            note = "overhead @ kitchen",
            coords = { x = 8714, y = 15305, z = 0 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E39
            note = "fridge @ kitchen",
            coords = { x = 8716, y = 15307, z = 0 },
            dist = { "WesternKitchenFridge", },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E40
            note = "freezer @ kitchen",
            coords = { x = 8716, y = 15307, z = 0 },
            slot = "freezer",
            dist = { "WesternKitchenFreezer", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E41
            note = "freezer @ kitchen",
            coords = { x = 8716, y = 15308, z = 0 },
            dist = { "FreezerIceCream", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E42
            note = "freezer @ kitchen",
            coords = { x = 8716, y = 15309, z = 0 },
            dist = { "CatfishKitchenFreezer", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E43
            note = "counter @ livingroom",
            coords = { x = 8717, y = 15308, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E44
            note = "fridge @ storage",
            coords = { x = 8719, y = 15305, z = 0 },
            dist = { "CatfishKitchenFridge", },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E45
            note = "freezer @ storage",
            coords = { x = 8719, y = 15305, z = 0 },
            slot = "freezer",
            dist = { "CatfishKitchenFreezer", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E46
            note = "metal_shelves @ storage",
            coords = { x = 8720, y = 15305, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E47
            note = "metal_shelves @ storage",
            coords = { x = 8721, y = 15305, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E48
            note = "counter @ livingroom",
            coords = { x = 8717, y = 15307, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        -----------------------
        ---- Second Floor -----
        -----------------------
        { -- E49
            note = "dresser @ bedroom",
            coords = { x = 8704, y = 15310, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E50
            note = "wardrobe @ bedroom",
            coords = { x = 8704, y = 15307, z = 1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E51
            note = "wardrobe @ bedroom",
            coords = { x = 8704, y = 15306, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E52
            note = "dresser @ bedroom",
            coords = { x = 8704, y = 15305, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E53
            note = "counter @ bedroom",
            coords = { x = 8708, y = 15309, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E54
            note = "counter @ bedroom",
            coords = { x = 8709, y = 15309, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E55
            note = "counter @ bathroom",
            coords = { x = 8709, y = 15305, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPMed",
        },
        { -- E56
            note = "counter @ bathroom",
            coords = { x = 8710, y = 15305, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E57
            note = "dresser @ bathroom",
            coords = { x = 8719, y = 15305, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E58
            note = "dresser @ bedroom",
            coords = { x = 8721, y = 15308, z = 1 },
            dist = { "CampingStoreBackpacks" },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E59
            note = "dresser @ bedroom",
            coords = { x = 8721, y = 15310, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E60
            note = "dresser @ bedroom",
            coords = { x = 8721, y = 15313, z = 1 },
            dist = { "LivingRoomShelfClassy" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E61
            note = "wardrobe @ lobby",
            coords = { x = 8709, y = 15312, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E62
            note = "wardrobe @ lobby",
            coords = { x = 8709, y = 15311, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E63
            note = "dishescabinet @ lobby",
            coords = { x = 8715, y = 15308, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPTools",
        },
        { -- E64
            note = "dishescabinet @ lobby",
            coords = { x = 8716, y = 15308, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        ----------------
        ---- Attic -----
        ----------------
        { -- E65
            note = "cardboardbox @ lobby",
            coords = { x = 8704, y = 15309, z = 2 },
            items = {
                { name = 'Base.NailsBox', },
            },
            level = "Loot_BuildMatsLevel",
        },
        { -- E66
            note = "cardboardbox @ lobby",
            coords = { x = 8704, y = 15308, z = 2 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E67
            note = "cardboardbox @ lobby",
            coords = { x = 8717, y = 15308, z = 2 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E68
            note = "cardboardbox @ lobby",
            coords = { x = 8718, y = 15308, z = 2 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E69
            note = "cardboardbox @ lobby",
            coords = { x = 8719, y = 15308, z = 2 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E70
            note = "cardboardbox @ lobby",
            coords = { x = 8720, y = 15308, z = 2 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E71
            note = "cardboardbox @ lobby",
            coords = { x = 8721, y = 15308, z = 2 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(DarkWallow.objectSpawns, { enabled = "EnableLadders", x = 8712, y = 15311, z = -1, removeWall = "west" })
    table.insert(DarkWallow.objectSpawns,
        { enabled = "EnableLadders", sprite = "walls_exterior_wooden_01_26", x = 8716, y = 15314, z = 0, removeFloor = true, clearExisting = true, })
    table.insert(DarkWallow.objectSpawns,
        { enabled = "EnableLadders", sprite = "location_sewer_01_33", x = 8716, y = 15314, z = 0, })
    table.insert(DarkWallow.objectSpawns,
        { enabled = "EnableLadders", x = 8716, y = 15314, z = 1, removeFloor = true, clearExisting = true, })
else
    -- table.insert(DarkWallow.objectSpawns, { sprite = "industry_trucks_01_4", x = 2607, y = 14453, z = -1, replaceWall = true, })
end
return DarkWallow
