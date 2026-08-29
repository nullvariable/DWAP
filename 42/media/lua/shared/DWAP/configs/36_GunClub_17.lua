local wtc1 = { x = 1835, y = 14134, z = -2, }
-- local wtc2 = { x = 1858, y = 14163, z = 1, }
local pb1 = { x = 1835, y = 14137, z = -2 }
local GunClub = {
    group = "Irvington",
    baseBuildings = {
        { x = 1850, y = 14165, z = 0 },  -- gun club
        { x = 1845, y = 14125, z = 0 },  -- gun range room
        { x = 1833, y = 14111, z = 0 },  -- utility bldg
        { x = 1860, y = 14166, z = -1 }, -- range basement
        { x = 1860, y = 14150, z = -1 }, -- bunker basement
    },
    spawn = { x = 1847, y = 14163, z = 0 },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 1833, y = 14137, z = -2 },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 1835, y = 14137, z = -2, },
            fakeGenerators = {
                { x = 1858, y = 14154, z = -1, createTile = true },
                { x = 1842, y = 14127, z = -1, createTile = true },
            },
        },
    },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc1.x, y = wtc1.y, z = wtc1.z, sourceType = "generator", source = { x = 1835, y = 14137, z = -2 } },
        -- { sprite = "crafted_01_11",   x = wtc2.x, y = wtc2.y, z = wtc2.z, sourceType = "generator", source = { x = 1835, y = 14137, z = -2 } },
    },
    waterFixtures = {
        { sprite = "fixtures_bathroom_01_2",     x = 1860, y = 14163, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_23",       x = 1860, y = 14164, z = 0,  sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },

        -- basement
        { sprite = "location_shop_zippee_01_57", x = 1840, y = 14132, z = -1, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_32",       x = 1840, y = 14129, z = -1, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_32",    x = 1858, y = 14134, z = -1, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_4",     x = 1860, y = 14134, z = -1, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_4",     x = 1861, y = 14134, z = -1, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_0",        x = 1858, y = 14137, z = -1, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_0",        x = 1859, y = 14137, z = -1, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },

        { sprite = "fixtures_sinks_01_24",       x = 1854, y = 14145, z = -1, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "appliances_laundry_01_7",    x = 1846, y = 14148, z = -1, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "appliances_laundry_01_5",    x = 1847, y = 14151, z = -1, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_sinks_01_19",       x = 1865, y = 14152, z = -1, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },

        -- shower entry
        { sprite = "fixtures_bathroom_01_31",    x = 1859, y = 14156, z = -1, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_31",    x = 1859, y = 14155, z = -1, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_31",    x = 1859, y = 14154, z = -1, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_23",    x = 1863, y = 14156, z = -1, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_23",    x = 1863, y = 14155, z = -1, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
        { sprite = "fixtures_bathroom_01_23",    x = 1863, y = 14154, z = -1, sourceType = "tank", source = { x = wtc1.x, y = wtc1.y, z = wtc1.z } },
    },
    doorKeys = {
        name = "Irvington Gun Club",
        doors = {
            { sprite = "fixtures_doors_02_5", x = 1856, y = 14168, z = 0, },
            { sprite = "walls_garage_01_3",   x = 1861, y = 14157, z = -1, },
        },
    },
    map = { name = "DWAPStashMap36", },
    objectSpawns = {
        -- { sprite = "crafted_01_11",   x = wtc2.x,            y = wtc2.y,                         z = wtc2.z, enabled = "EnableWaterSystem", },

        { barricade = "metal",    enabled = "Barricade", target = "walls_commercial_01_113", x = 1848, y = 14169, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target = "walls_commercial_01_113", x = 1849, y = 14169, z = 0, },
        { barricade = "metal",    enabled = "Barricade", target = "walls_commercial_01_113", x = 1852, y = 14169, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target = "walls_commercial_01_113", x = 1853, y = 14169, z = 0, },
        { barricade = "wood",     enabled = "Barricade", target = "fixtures_doors_02_41",    x = 1856, y = 14169, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target = "fixtures_doors_02_45",    x = 1857, y = 14169, z = 0, },
        { barricade = "metal",    enabled = "Barricade", target = "walls_commercial_01_113", x = 1860, y = 14169, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target = "walls_commercial_01_113", x = 1861, y = 14169, z = 0, },
        { barricade = "metal",    enabled = "Barricade", target = "walls_commercial_01_113", x = 1864, y = 14169, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target = "walls_commercial_01_113", x = 1865, y = 14169, z = 0, },

    },
    loot = {
        -----------------------
        ---- Crafting room ----
        -----------------------
        { -- E1
            note = "logs @ crafting room",
            coords = { x = 1829, y = 14135, z = -2 },
            items = {
                { name = 'Base.Firewood', chance = 1, count = { 10, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E2
            note = "metal_shelves @ crafting room",
            coords = { x = 1834, y = 14141, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E3
            note = "metal_shelves @ crafting room",
            coords = { x = 1835, y = 14141, z = -2 },
            dist = { "CrateLongStick" },
            items = {
                { name = 'Base.LongStick', chance = 1, count = { 10, 10 } },
                { name = 'Base.Firewood',  chance = 1, count = { 10, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E4
            note = "metal_shelves @ crafting room",
            coords = { x = 1833, y = 14131, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E5
            note = "metal_shelves @ crafting room",
            coords = { x = 1833, y = 14130, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E6
            note = "metal_shelves @ crafting room",
            coords = { x = 1833, y = 14129, z = -2 },
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = { 8, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E7
            note = "metal_shelves @ crafting room",
            coords = { x = 1833, y = 14128, z = -2 },
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E8
            note = "metal_shelves @ crafting room",
            coords = { x = 1835, y = 14131, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E9
            note = "metal_shelves @ crafting room",
            coords = { x = 1835, y = 14130, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E10
            note = "metal_shelves @ crafting room",
            coords = { x = 1835, y = 14129, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E11
            note = "metal_shelves @ crafting room",
            coords = { x = 1835, y = 14128, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E12
            note = "metal_shelves @ crafting room",
            coords = { x = 1838, y = 14131, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E13
            note = "metal_shelves @ crafting room",
            coords = { x = 1838, y = 14130, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E14
            note = "metal_shelves @ crafting room",
            coords = { x = 1838, y = 14129, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E15
            note = "metal_shelves @ crafting room",
            coords = { x = 1838, y = 14128, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPFarm",
        },
        { -- E16
            note = "counter @ crafting room",
            coords = { x = 1838, y = 14136, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E17
            note = "counter @ crafting room",
            coords = { x = 1839, y = 14136, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        ----------------------------
        ---- Bar/Kitchen/Lounge ----
        ----------------------------
        { -- E18
            note = "shelves @ bar",
            coords = { x = 1840, y = 14134, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E19
            note = "shelves @ bar",
            coords = { x = 1840, y = 14133, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E20
            note = "counter @ bar",
            coords = { x = 1842, y = 14134, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E21
            note = "counter @ bar",
            coords = { x = 1840, y = 14130, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E22
            note = "counter @ bar",
            coords = { x = 1840, y = 14128, z = -1 },
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E23
            note = "counter @ bar",
            coords = { x = 1841, y = 14128, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E24
            note = "counter @ bar",
            coords = { x = 1842, y = 14128, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E25
            note = "fridge @ bar",
            coords = { x = 1843, y = 14128, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E26
            note = "freezer @ bar",
            coords = { x = 1843, y = 14128, z = -1 },
            slot = "freezer",
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E27
            note = "sidetable @ bar",
            coords = { x = 1847, y = 14128, z = -1 },
            dist = { "CrateVHSTapes" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        -----------------------------
        ---- Bunk Rooms/Bathroom ----
        -----------------------------
        { -- E28
            note = "desk @ bedroom",
            coords = { x = 1852, y = 14141, z = -1 },
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E29
            note = "locker @ bedroom",
            coords = { x = 1855, y = 14141, z = -1 },
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E30
            note = "locker @ bedroom",
            coords = { x = 1854, y = 14139, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E31
            note = "counter @ crafting room",
            coords = { x = 1837, y = 14132, z = -2 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E32
            note = "militarylocker @ bedroom",
            coords = { x = 1852, y = 14136, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E33
            note = "locker @ bedroom",
            coords = { x = 1852, y = 14135, z = -1 },
            dist = { "ArmyStorageOutfit", },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E34
            note = "desk @ bedroom",
            coords = { x = 1854, y = 14134, z = -1 },
            dist = { "BookstoreMilitaryHistory" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E35
            note = "militarylocker @ bedroom",
            coords = { x = 1852, y = 14133, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E36
            note = "locker @ bedroom",
            coords = { x = 1852, y = 14131, z = -1 },
            dist = { "ClothingStorageWinter", },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E37
            note = "desk @ bedroom",
            coords = { x = 1854, y = 14130, z = -1 },
            dist = { "LivingRoomShelfClassy" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E38
            note = "militarylocker @ bedroom",
            coords = { x = 1860, y = 14133, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E39
            note = "locker @ bedroom",
            coords = { x = 1861, y = 14131, z = -1 },
            dist = { "DrugLabOutfit", },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E40
            note = "desk @ bedroom",
            coords = { x = 1858, y = 14130, z = -1 },
            dist = { "MusicStoreCDs" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E41
            note = "counter @ bathroom",
            coords = { x = 1859, y = 14137, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E42
            note = "dresser @ bathroom",
            coords = { x = 1860, y = 14137, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E43
            note = "militarylocker @ bedroom",
            coords = { x = 1860, y = 14141, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E44
            note = "locker @ bedroom",
            coords = { x = 1861, y = 14139, z = -1 },
            dist = { "CrateBootsArmy", },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E45
            note = "desk @ bedroom",
            coords = { x = 1858, y = 14138, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E46
            note = "cardboardbox @ bedroom",
            coords = { x = 1861, y = 14141, z = -1 },
            dist = { "CrateVHSTapes" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        ---------------
        --- Medical ---
        ---------------
        { -- E47
            note = "medicine @ medical",
            coords = { x = 1862, y = 14150, z = -1 },
            slot = "upper",
            dist = { "SafehouseMedical" },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E48
            note = "medicine @ medical",
            coords = { x = 1867, y = 14149, z = -1 },
            slot = "upper",
            dist = { "MedicalCabinet" },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E49
            note = "medicine @ medical",
            coords = { x = 1868, y = 14149, z = -1 },
            slot = "upper",
            dist = { "MedicalClinicDrugs" },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E50
            note = "metal_shelves @ medical",
            coords = { x = 1868, y = 14152, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E51
            note = "metal_shelves @ medical",
            coords = { x = 1866, y = 14152, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        -- entry lockers
        { -- E52
            note = "locker @ entry",
            coords = { x = 1859, y = 14157, z = -1 },
            items = {
                { name = 'Base.Bag_ProtectiveCaseBulkyHazard', },
                { name = 'Base.Hat_NBCmask', },
                { name = 'Base.Glasses_SafetyGoggles', },
                { name = 'Base.Hat_BuildersRespirator', },
                { name = 'Base.HazmatSuit', },
                { name = 'Base.RespiratorFilters', },
                { name = 'Base.Hat_GasMask', },
                { name = 'Base.GasmaskFilter', },
            },
            level = "Loot_LockersLevel",
        },
        { -- E53
            note = "locker @ entry",
            coords = { x = 1863, y = 14157, z = -1 },
            items = {
                { name = 'Base.Oxygen_Tank', },
            },
            level = "Loot_LockersLevel",
        },
        --------------------------
        --- Big Warehouse room ---
        --------------------------
        -- cold stuff
        { -- E54
            note = "fridge @ gunstore",
            coords = { x = 1842, y = 14151, z = -1 },
            dist = { "FridgeGeneric", },
            distIncludeJunk = true,
            tag = "DWAPFridge",
        },
        { -- E55
            note = "freezer @ gunstore",
            coords = { x = 1842, y = 14151, z = -1 },
            slot = "freezer",
            dist = { "SushiKitchenFreezer", },
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        { -- E56
            note = "fridge @ gunstore",
            coords = { x = 1843, y = 14151, z = -1 },
            dist = { "FridgeGeneric", },
            distIncludeJunk = true,
            tag = "DWAPFridge",
        },
        { -- E57
            note = "freezer @ gunstore",
            coords = { x = 1843, y = 14151, z = -1 },
            slot = "freezer",
            dist = { "WesternKitchenFreezer", },
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        { -- E58
            note = "freezer @ gunstore",
            coords = { x = 1841, y = 14145, z = -1 },
            dist = { "FreezerRich" },
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        { -- E59
            note = "freezer @ gunstore",
            coords = { x = 1842, y = 14145, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFreezer",
        },
        { -- E60
            note = "freezer @ gunstore",
            coords = { x = 1843, y = 14145, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E61
            note = "freezer @ gunstore",
            coords = { x = 1844, y = 14145, z = -1 },
            dist = { "FreezerIceCream", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        -- end cold stuff
        { -- E62
            note = "militarycrate @ gunstore",
            coords = { x = 1846, y = 14147, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E63
            note = "militarycrate @ gunstore",
            coords = { x = 1846, y = 14147, z = -1 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E64
            note = "locker @ gunstore",
            coords = { x = 1845, y = 14145, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E65
            note = "militarycrate @ gunstore",
            coords = { x = 1846, y = 14145, z = -1 },
            special = "essentials",
        },
        { -- E66
            note = "locker @ gunstore",
            coords = { x = 1847, y = 14145, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E67
            note = "militarycrate @ gunstore",
            coords = { x = 1848, y = 14145, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E68
            note = "militarycrate @ gunstore",
            coords = { x = 1848, y = 14145, z = -1 },
            stack = 2,
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E69
            note = "locker @ gunstore",
            coords = { x = 1849, y = 14145, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E70
            note = "militarylocker @ gunstore",
            coords = { x = 1850, y = 14145, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E71
            note = "militarylocker @ gunstore",
            coords = { x = 1851, y = 14145, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E72
            note = "militarylocker @ gunstore",
            coords = { x = 1852, y = 14145, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E73
            note = "militarylocker @ gunstore",
            coords = { x = 1853, y = 14145, z = -1 },
            dist = { "SafehouseTraps", },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E74
            note = "militarylocker @ gunstore",
            coords = { x = 1855, y = 14145, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E75
            note = "militarylocker @ gunstore",
            coords = { x = 1856, y = 14145, z = -1 },
            dist = { "CrateBlacksmithing" },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E76
            note = "militarylocker @ gunstore",
            coords = { x = 1857, y = 14145, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E77
            note = "militarylocker @ gunstore",
            coords = { x = 1858, y = 14145, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E78
            note = "militarylocker @ gunstore",
            coords = { x = 1859, y = 14145, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },

        { -- E79
            note = "militarylocker @ gunstore",
            coords = { x = 1850, y = 14150, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E80
            note = "militarylocker @ gunstore",
            coords = { x = 1851, y = 14150, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E81
            note = "militarylocker @ gunstore",
            coords = { x = 1850, y = 14149, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E82
            note = "militarylocker @ gunstore",
            coords = { x = 1851, y = 14149, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E83
            note = "militarylocker @ gunstore",
            coords = { x = 1850, y = 14148, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E84
            note = "militarylocker @ gunstore",
            coords = { x = 1851, y = 14148, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E85
            note = "militarycrate @ gunstore",
            coords = { x = 1850, y = 14147, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },

        { -- E86
            note = "militarylocker @ gunstore",
            coords = { x = 1854, y = 14150, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E87
            note = "militarylocker @ gunstore",
            coords = { x = 1855, y = 14150, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E88
            note = "militarylocker @ gunstore",
            coords = { x = 1854, y = 14149, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E89
            note = "militarylocker @ gunstore",
            coords = { x = 1855, y = 14149, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E90
            note = "militarylocker @ gunstore",
            coords = { x = 1854, y = 14148, z = -1 },
            dist = { "MovieRentalShelves" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E91
            note = "militarylocker @ gunstore",
            coords = { x = 1855, y = 14148, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E92
            note = "militarycrate @ gunstore",
            coords = { x = 1854, y = 14147, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E93
            note = "militarycrate @ gunstore",
            coords = { x = 1854, y = 14147, z = -1 },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E94
            note = "militarycrate @ gunstore",
            coords = { x = 1855, y = 14147, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },

        { -- E95
            note = "militarycrate @ gunstore",
            coords = { x = 1858, y = 14151, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E96
            note = "militarycrate @ gunstore",
            coords = { x = 1858, y = 14151, z = -1 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E97
            note = "militarycrate @ gunstore",
            coords = { x = 1859, y = 14151, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E98
            note = "militarycrate @ gunstore",
            coords = { x = 1859, y = 14151, z = -1 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(GunClub.objectSpawns,
        { enabled = "EnableLadders", x = 1831, y = 14111, z = 0, removeFloor = true, clearExisting = true, })
    table.insert(GunClub.objectSpawns,
        { enabled = "EnableLadders", sprite = "fencing_01_27", x = 1832, y = 14111, z = 0, })
end

return GunClub
