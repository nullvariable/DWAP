local wtc = { x = 13454, y = 1884, z = -2, }
local pb1 = { x = 13452, y = 1883, z = -2 }
local CentralLVilleMansion = {
    group = "Louisville",
    baseBuildings = {
        { x = 13441, y = 1895, z = 1 },  -- mansion
        { x = 13438, y = 1902, z = -2 }, -- basement
    },
    spawn = { x = 13441, y = 1895, z = 1 },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 13459, y = 1884, z = pb1.z },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 13457, y = 1884, z = -2, },
            fakeGenerators = {
                { x = 13439, y = 1888 + 6, z = -1, },
                { x = 13438, y = 1874,   z = -4, },
            },
        },
    },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = { x = 13459, y = 1884, z = -2 } },
        { sprite = "industry_02_72",  x = 13458, y = 1887,  z = -2,    sourceType = "generator", source = { x = 13459, y = 1884, z = -2 } },
    },
    waterFixtures = {
        { sprite = "fixtures_sinks_01_19",    x = 13438, y = 1904, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_3",  x = 13440, y = 1898, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_20",    x = 13441, y = 1898, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "appliances_laundry_01_2", x = 13442, y = 1898, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "appliances_laundry_01_6", x = 13443, y = 1898, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

        -- 2nd floor
        { sprite = "fixtures_bathroom_01_52", x = 13431, y = 1901, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_32", x = 13431, y = 1898, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_0",  x = 13432, y = 1898, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_22",    x = 13433, y = 1898, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_2",  x = 13438, y = 1893, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_3",     x = 13438, y = 1892, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_26", x = 13437, y = 1891, z = 1,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

        -- basement
        -- decon
        { sprite = "fixtures_bathroom_01_31", x = 13436, y = 1904, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_31", x = 13436, y = 1903, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_31", x = 13436, y = 1902, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- security bathroom
        { sprite = "fixtures_bathroom_01_33", x = 13429, y = 1902, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_3",     x = 13431, y = 1902, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_3",     x = 13431, y = 1901, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_1",  x = 13429, y = 1899, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_11", x = 13431, y = 1899, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- family suite
        { sprite = "fixtures_sinks_01_1",     x = 13445, y = 1897, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_1",  x = 13449, y = 1893, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_1",     x = 13445, y = 1892, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_1",  x = 13449, y = 1888, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- laundry
        { sprite = "appliances_laundry_01_0", x = 13445, y = 1878, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "appliances_laundry_01_0", x = 13447, y = 1878, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "appliances_laundry_01_0", x = 13449, y = 1878, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_17",    x = 13451, y = 1878, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- showers
        { sprite = "fixtures_sinks_01_1",     x = 13452, y = 1881, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_3",     x = 13455, y = 1881, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_30", x = 13456, y = 1878, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_4",  x = 13457, y = 1878, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_30", x = 13458, y = 1878, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_4",  x = 13459, y = 1878, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_22", x = 13456, y = 1882, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_7",  x = 13457, y = 1882, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_22", x = 13458, y = 1882, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_7",  x = 13459, y = 1882, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- infirmary
        { sprite = "fixtures_sinks_01_16",    x = 13419, y = 1893, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        -- main room
        { sprite = "fixtures_sinks_01_25",    x = 13434, y = 1885, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "location_shop_zippee_01_57", x = 13434, y = 1883, z = -2, sourceType="tank", source = wtc, }, -- bar, bld 52,7#144
        { sprite = "fixtures_sinks_01_32",    x = 13434, y = 1876, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
    },
    doorKeys = {
        name = "Louisville Safehouse",
        doors = {
            { sprite = "location_community_church_small_01_2", x = 13431, y = 1897, z = 0, },
            { sprite = "fixtures_doors_01_33",                 x = 13439, y = 1902, z = -2, },
        },
    },
    map = { name = "DWAPStashMap19", },
    objectSpawns = {
        { sprite = "industry_02_175", x = pb1.x,             y = pb1.y,                                      z = pb1.z, disabled = "EnableGenSystemSolar", clearExisting = true, },

        { barricade = "metalbar",     enabled = "Barricade", target = "walls_interior_house_05_10",          x = 13431, y = 1903,                          z = 0, },
        { barricade = "metalbar",     enabled = "Barricade", target = "walls_interior_house_05_10",          x = 13431, y = 1902,                          z = 0, },
        { barricade = "metalbar",     enabled = "Barricade", target = "walls_interior_house_05_10",          x = 13431, y = 1900,                          z = 0, },
        { barricade = "wood",         enabled = "Barricade", target = "location_community_church_small_01_28", x = 13431, y = 1898,                        z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "location_community_church_small_01_24", x = 13431, y = 1897,                        z = 0, },
        { barricade = "metalbar",     enabled = "Barricade", target = "walls_interior_house_05_10",          x = 13431, y = 1895,                          z = 0, },
        { barricade = "metalbar",     enabled = "Barricade", target = "walls_interior_house_05_10",          x = 13431, y = 1893,                          z = 0, },
        { barricade = "metalbar",     enabled = "Barricade", target = "walls_interior_house_05_10",          x = 13431, y = 1892,                          z = 0, },
        { barricade = "metalbar",     enabled = "Barricade", target = "walls_interior_house_05_11",          x = 13432, y = 1891,                          z = 0, },
        { barricade = "metalbar",     enabled = "Barricade", target = "walls_interior_house_05_11",          x = 13433, y = 1891,                          z = 0, },
        { barricade = "metalbar",     enabled = "Barricade", target = "walls_interior_house_05_11",          x = 13435, y = 1891,                          z = 0, },
        { barricade = "metalbar",     enabled = "Barricade", target = "walls_interior_house_05_11",          x = 13437, y = 1891,                          z = 0, },
        { barricade = "metalbar",     enabled = "Barricade", target = "walls_interior_house_05_11",          x = 13438, y = 1891,                          z = 0, },
        { barricade = "metal",        enabled = "Barricade", target = "walls_commercial_02_48",              x = 13441, y = 1891,                          z = 0, },
        { barricade = "metal",        enabled = "Barricade", target = "walls_commercial_02_49",              x = 13442, y = 1891,                          z = 0, },
        { barricade = "metal",        enabled = "Barricade", target = "walls_commercial_02_50",              x = 13443, y = 1891,                          z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_interior_house_03_28",          x = 13445, y = 1893,                          z = 0, },
        { barricade = "metal",        enabled = "Barricade", target = "walls_interior_house_03_29",          x = 13435, y = 1911,                          z = 0, },
        { barricade = "metal",        enabled = "Barricade", target = "walls_interior_house_03_29",          x = 13432, y = 1911,                          z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_interior_house_03_29",          x = 13438, y = 1905,                          z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "fixtures_windows_01_24",              x = 13441, y = 1900,                          z = 0, }, -- window W | kitchen, bld 52,7#113
        { barricade = "woodhalf",     enabled = "Barricade", target = "fixtures_windows_01_24",              x = 13441, y = 1903,                          z = 0, }, -- window W | kitchen, bld 52,7#113
        { barricade = "woodhalf",     enabled = "Barricade", target = "fixtures_windows_01_25",              x = 13443, y = 1899,                          z = 0, }, -- window N | laundry, bld 52,7#113
    },
    loot = {
        --- Basement ---
        { -- E1 decon locker
            note = "locker @ laboratory",
            coords = { x = 13438, y = 1902, z = -2 },
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
        { -- E2 decon locker
            note = "locker @ laboratory",
            coords = { x = 13438, y = 1904, z = -2 },
            items = {
                { name = 'Base.Oxygen_Tank', },
            },
            level = "Loot_LockersLevel",
        },
        { -- E3 short locker
            note = "locker @ gunstore",
            coords = { x = 13442, y = 1901, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E4 short locker
            note = "locker @ gunstore",
            coords = { x = 13441, y = 1901, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E5 desk
            note = "desk @ gunstore",
            coords = { x = 13438, y = 1899, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E6 locker
            note = "locker @ bedroom",
            coords = { x = 13435, y = 1899, z = -2 },
            special = "essentials",
        },
        { -- E7 locker
            note = "locker @ bedroom",
            coords = { x = 13435, y = 1902, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E8 mil locker
            note = "militarylocker @ bedroom",
            coords = { x = 13432, y = 1899, z = -2 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E9 mil locker
            note = "militarylocker @ bedroom",
            coords = { x = 13432, y = 1902, z = -2 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E10 bathroom
            note = "counter @ bathroom",
            coords = { x = 13431, y = 1901, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPMed",
        },
        { -- E11
            note = "medicine @ bathroom",
            coords = { x = 13431, y = 1901, z = -2 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        --------------------------
        ----- Recreation Area ----
        --------------------------
        { -- E12 bar
            note = "counter @ bar",
            coords = { x = 13442, y = 1897, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E13 bar
            note = "counter @ bar",
            coords = { x = 13442, y = 1896, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E14 bar
            note = "counter @ bar",
            coords = { x = 13442, y = 1895, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E15 movie snack stand
            note = "counter @ bar",
            coords = { x = 13438, y = 1890, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E16 movie snack stand
            note = "counter @ bar",
            coords = { x = 13437, y = 1890, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        ------------------------------
        ----- Kitchen/Dining Area ----
        ------------------------------
        { -- E17 under drink machine
            note = "counter @ bar",
            coords = { x = 13434, y = 1882, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E18 under toaster
            note = "counter @ bar",
            coords = { x = 13434, y = 1878, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E19
            note = "counter @ bar",
            coords = { x = 13434, y = 1877, z = -2 },
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E20
            note = "counter @ bar",
            coords = { x = 13434, y = 1875, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E21 under microwave
            note = "counter @ bar",
            coords = { x = 13438, y = 1877, z = -2 },
            dist = { "KitchenCannedFood" },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E22
            note = "counter @ bar",
            coords = { x = 13438, y = 1876, z = -2 },
            dist = { "KitchenDryFood" },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E23
            note = "counter @ bar",
            coords = { x = 13438, y = 1875, z = -2 },
            dist = { "SafehouseFood" },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E24 drink stand
            note = "shelves @ bar",
            coords = { x = 13441, y = 1877, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E25 drink stand
            note = "shelves @ bar",
            coords = { x = 13443, y = 1877, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E26 ice freezer
            note = "freezer @ bar",
            coords = { x = 13444, y = 1875, z = -2 },
            dist = { "FreezerIceCream", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E27 ice freezer
            note = "freezer @ bar",
            coords = { x = 13443, y = 1875, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E28 coolers
            note = "fridge @ bar",
            coords = { x = 13442, y = 1875, z = -2 },
            dist = { "SafehouseFridge" },
            distIncludeJunk = true,
            tag = "DWAPFridge",
        },
        { -- E29
            note = "fridge @ bar",
            coords = { x = 13441, y = 1875, z = -2 },
            dist = { "UniversityFridge" },
            distIncludeJunk = true,
            tag = "DWAPFridge",
        },
        { -- E30
            note = "fridge @ bar",
            coords = { x = 13440, y = 1875, z = -2 },
            dist = { "WesternKitchenFridge" },
            distIncludeJunk = true,
            tag = "DWAPFridge",
        },
        ------------------------------
        --- Library and School Area --
        ------------------------------
        { -- E31
            note = "shelves @ library",
            coords = { x = 13425, y = 1897, z = -2 },
            dist = { "LivingRoomShelfClassy" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E32
            note = "shelves @ library",
            coords = { x = 13425, y = 1896, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E33
            note = "shelves @ library",
            coords = { x = 13428, y = 1897, z = -2 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E34
            note = "shelves @ library",
            coords = { x = 13429, y = 1897, z = -2 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E35
            note = "shelves @ library",
            coords = { x = 13430, y = 1897, z = -2 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E36
            note = "shelves @ library",
            coords = { x = 13431, y = 1897, z = -2 },
            dist = { "CrateVHSTapes" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E37 desk
            note = "desk @ library",
            coords = { x = 13430, y = 1893, z = -2 },
            dist = { "MusicStoreCDs" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E38 desk
            note = "desk @ library",
            coords = { x = 13432, y = 1893, z = -2 },
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        -----------------
        --- Infirmary ---
        -----------------
        { -- E39
            note = "metal_shelves @ medicalstorage",
            coords = { x = 13419, y = 1897, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E40
            note = "medicine @ medicalstorage",
            coords = { x = 13419, y = 1896, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E41
            note = "medicine @ medicalstorage",
            coords = { x = 13419, y = 1895, z = -2 },
            dist = { "MedicalClinicDrugs" },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E42
            note = "desk @ medicalstorage",
            coords = { x = 13419, y = 1893, z = -2 },
            dist = { "MedicalCabinet" },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        --------------------
        ----- Gun Range ----
        --------------------
        { -- E43
            note = "locker @ hunting",
            coords = { x = 13433, y = 1872, z = -2 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E44
            note = "counter @ hunting",
            coords = { x = 13430, y = 1869, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E45
            note = "counter @ hunting",
            coords = { x = 13430, y = 1873, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        ---------------------------
        ----- Workroom / Power ----
        ---------------------------
        { -- E46
            note = "counter @ warehouse",
            coords = { x = 13445, y = 1886, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E47
            note = "counter @ warehouse",
            coords = { x = 13445, y = 1884, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E48
            note = "counter @ warehouse",
            coords = { x = 13445, y = 1883, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E49
            note = "counter @ warehouse",
            coords = { x = 13447, y = 1883, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E50
            note = "counter @ warehouse",
            coords = { x = 13449, y = 1883, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E51
            note = "counter @ warehouse",
            coords = { x = 13450, y = 1883, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E52
            note = "counter @ warehouse",
            coords = { x = 13450, y = 1885, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E53
            note = "metal_shelves @ warehouse",
            coords = { x = 13451, y = 1883, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E54
            note = "metal_shelves @ warehouse",
            coords = { x = 13451, y = 1884, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E55
            note = "metal_shelves @ warehouse",
            coords = { x = 13451, y = 1885, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E56
            note = "metal_shelves @ warehouse",
            coords = { x = 13451, y = 1886, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        -----------------------
        ----- Laundry Room ----
        -----------------------
        { -- E57
            note = "clothingrack @ laundry",
            coords = { x = 13445, y = 1882, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E58
            note = "clothingrack @ laundry",
            coords = { x = 13446, y = 1882, z = -2 },
            dist = { "CrateClothesRandom" },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E59
            note = "clothingrack @ laundry",
            coords = { x = 13447, y = 1882, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E60
            note = "clothingrack @ laundry",
            coords = { x = 13448, y = 1882, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E61
            note = "clothingrack @ laundry",
            coords = { x = 13449, y = 1882, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E62
            note = "clothingdryerbasic @ laundry",
            coords = { x = 13450, y = 1882, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E63 counter under sink
            note = "counter @ laundry",
            coords = { x = 13451, y = 1878, z = -2 },
            dist = { "LaundryCleaning" },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        ----------------------
        ----- Shower Room ----
        ----------------------
        { -- E64 counter under sink
            note = "counter @ bathroom",
            coords = { x = 13455, y = 1881, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E65 counter under sink
            note = "counter @ bathroom",
            coords = { x = 13452, y = 1881, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        --------------
        ----- Gym ----
        --------------
        { -- E66
            note = "counter @ gym",
            coords = { x = 13429, y = 1882, z = -2 },
            dist = { "FitnessTrainer" },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E67
            note = "counter @ gym",
            coords = { x = 13430, y = 1882, z = -2 },
            dist = { "CrateFitnessWeights" },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -----------------------------
        ----- Warehouse Freezers ----
        -----------------------------
        { -- E68
            note = "freezer @ warehouse",
            coords = { x = 13437, y = 1870, z = -2 },
            dist = { "FreezerIceCream", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E69
            note = "freezer @ warehouse",
            coords = { x = 13438, y = 1870, z = -2 },
            dist = { "WesternKitchenFreezer", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E70
            note = "freezer @ warehouse",
            coords = { x = 13440, y = 1870, z = -2 },
            dist = { "ArenaKitchenFreezer", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E71
            note = "freezer @ warehouse",
            coords = { x = 13441, y = 1870, z = -2 },
            dist = { "BurgerKitchenFreezer", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E72
            note = "freezer @ warehouse",
            coords = { x = 13437, y = 1872, z = -2 },
            dist = { "ButcherFreezer", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E73
            note = "freezer @ warehouse",
            coords = { x = 13438, y = 1872, z = -2 },
            dist = { "CafeteriaKitchenFreezer", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E74
            note = "freezer @ warehouse",
            coords = { x = 13440, y = 1872, z = -2 },
            dist = { "DeepFryKitchenFreezer", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E75
            note = "freezer @ warehouse",
            coords = { x = 13441, y = 1872, z = -2 },
            dist = { "CatfishKitchenFreezer", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        --------------------
        ----- Warehouse ----
        --------------------
        { -- E76
            note = "metal_shelves @ warehouse",
            coords = { x = 13434, y = 1869, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E77
            note = "metal_shelves @ warehouse",
            coords = { x = 13435, y = 1869, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E78
            note = "metal_shelves @ warehouse",
            coords = { x = 13436, y = 1869, z = -2 },
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            level = "Loot_BuildMatsLevel",
        },
        { -- E79
            note = "crate @ warehouse",
            coords = { x = 13437, y = 1869, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E80
            note = "crate @ warehouse",
            coords = { x = 13437, y = 1869, z = -2 },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E81
            note = "crate @ warehouse",
            coords = { x = 13438, y = 1869, z = -2 },
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
                { name = 'Base.Fertilizer',    chance = 1, count = { 8, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E82
            note = "crate @ warehouse",
            coords = { x = 13438, y = 1869, z = -2 },
            stack = 2,
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
                { name = 'Base.Fertilizer',    chance = 1, count = { 8, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E83
            note = "metal_shelves @ warehouse",
            coords = { x = 13434, y = 1873, z = -2 },
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
                { name = 'Base.Fertilizer',    chance = 1, count = { 8, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E84
            note = "metal_shelves @ warehouse",
            coords = { x = 13435, y = 1873, z = -2 },
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
                { name = 'Base.Fertilizer',    chance = 1, count = { 8, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E85
            note = "metal_shelves @ warehouse",
            coords = { x = 13436, y = 1873, z = -2 },
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
                { name = 'Base.Fertilizer',    chance = 1, count = { 8, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E86
            note = "cardboardbox @ warehouse",
            coords = { x = 13437, y = 1873, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E87
            note = "cardboardbox @ warehouse",
            coords = { x = 13437, y = 1873, z = -2 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E88
            note = "smallbox @ warehouse",
            coords = { x = 13438, y = 1873, z = -2 },
            dist = { "CrateTortillaChips" },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        -- ⬆ West of door way ⬇ East of door way
        { -- E89
            note = "crate @ warehouse",
            coords = { x = 13440, y = 1869, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E90
            note = "crate @ warehouse",
            coords = { x = 13441, y = 1869, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E91
            note = "crate @ warehouse",
            coords = { x = 13440, y = 1873, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E92
            note = "crate @ warehouse",
            coords = { x = 13441, y = 1873, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E93
            note = "crate @ warehouse",
            coords = { x = 13441, y = 1873, z = -2 },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E94
            note = "metal_shelves @ warehouse",
            coords = { x = 13443, y = 1869, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E95
            note = "metal_shelves @ warehouse",
            coords = { x = 13443, y = 1870, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E96
            note = "metal_shelves @ warehouse",
            coords = { x = 13447, y = 1869, z = -2 },
            items = {
                { name = 'Base.Firewood', chance = 1, count = { 10, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E97
            note = "metal_shelves @ warehouse",
            coords = { x = 13447, y = 1870, z = -2 },
            dist = { "CrateAntiqueStove", "CampingStoreLighting" },
            distIncludeJunk = false,
            level = 1,
        },
        { -- E98
            coords = { x = 13449, y = 1869, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E99
            coords = { x = 13449, y = 1870, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        -- south side crates
        { -- E100
            note = "crate @ warehouse",
            coords = { x = 13444, y = 1873, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E101
            note = "crate @ warehouse",
            coords = { x = 13444, y = 1873, z = -2 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E102
            note = "crate @ warehouse",
            coords = { x = 13445, y = 1873, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E103
            note = "crate @ warehouse",
            coords = { x = 13445, y = 1873, z = -2 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E104
            note = "crate @ warehouse",
            coords = { x = 13446, y = 1873, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E105
            note = "crate @ warehouse",
            coords = { x = 13446, y = 1873, z = -2 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E106
            note = "crate @ warehouse",
            coords = { x = 13447, y = 1873, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E107
            note = "crate @ warehouse",
            coords = { x = 13447, y = 1873, z = -2 },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E108
            coords = { x = 13448, y = 1873, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E109
            coords = { x = 13448, y = 1873, z = -2 },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E110
            note = "crate @ warehouse",
            coords = { x = 13449, y = 1873, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E111
            coords = { x = 13450, y = 1873, z = -2 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E112
            coords = { x = 13450, y = 1873, z = -2 },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E113
            coords = { x = 13451, y = 1873, z = -2 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E114
            coords = { x = 13451, y = 1873, z = -2 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPFood",
        },

        -- garage
        { -- E115
            note = "metal_shelves @ workshop",
            coords = { x = 13433, y = 1910, z = 0 },
            dist = { "GigamartDryGoods" },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E116
            note = "metal_shelves @ workshop",
            coords = { x = 13434, y = 1910, z = 0 },
            dist = { "GigamartDryGoods" },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E117
            note = "metal_shelves @ workshop",
            coords = { x = 13435, y = 1910, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E118
            note = "metal_shelves @ workshop",
            coords = { x = 13436, y = 1910, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E119
            note = "metal_shelves @ workshop",
            coords = { x = 13434, y = 1908, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E120
            note = "metal_shelves @ workshop",
            coords = { x = 13433, y = 1908, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E121
            note = "metal_shelves @ workshop",
            coords = { x = 13432, y = 1908, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPTools",
        },
        { -- E122
            note = "metal_shelves @ workshop",
            coords = { x = 13431, y = 1908, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPTools",
        },
        -- kitchen
        { -- E123 fridge
            note = "fridge @ kitchen",
            coords = { x = 13440, y = 1904, z = 0 },
            dist = { "FridgeRich" },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E124 fridge
            note = "fridge @ kitchen",
            coords = { x = 13440, y = 1904, z = 0 },
            slot = "freezer",
            dist = { "FreezerRich" },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E125
            note = "counter @ kitchen",
            coords = { x = 13439, y = 1904, z = 0 },
            dist = { "KitchenDryFood", },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E126
            note = "counter @ kitchen",
            coords = { x = 13438, y = 1904, z = 0 },
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E127
            note = "counter @ kitchen",
            coords = { x = 13437, y = 1904, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E128
            note = "overhead @ kitchen",
            coords = { x = 13437, y = 1904, z = 0 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E129
            note = "counter @ kitchen",
            coords = { x = 13437, y = 1903, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E130
            note = "overhead @ kitchen",
            coords = { x = 13437, y = 1903, z = 0 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E131
            note = "counter @ kitchen",
            coords = { x = 13437, y = 1901, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E132
            note = "overhead @ kitchen",
            coords = { x = 13437, y = 1901, z = 0 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E133
            note = "counter @ kitchen",
            coords = { x = 13437, y = 1900, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E134
            note = "overhead @ kitchen",
            coords = { x = 13437, y = 1900, z = 0 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E135
            note = "counter @ kitchen",
            coords = { x = 13437, y = 1899, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E136
            note = "overhead @ kitchen",
            coords = { x = 13437, y = 1899, z = 0 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E137
            note = "counter @ kitchen",
            coords = { x = 13438, y = 1899, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        -- laundry
        { -- E138
            note = "metal_shelves @ laundry",
            coords = { x = 13444, y = 1897, z = 0 },
            slot = "upper",
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E139
            note = "clothingdryerbasic @ laundry",
            coords = { x = 13444, y = 1898, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -- office
        { -- E140
            note = "desk @ library",
            coords = { x = 13441, y = 1891, z = 0 },
            items = {
                { name = 'Base.Pencil',                          chance = 1, count = { 2, 5 } },
                { name = 'Base.Notebook',                        chance = 1, count = { 1, 1 } },
                { name = 'Base.Notebook',                        chance = 1, count = { 1, 1 } },
                { name = 'Base.WristWatch_Left_DigitalBlack',    chance = 1, count = { 1, 1 } },
                { name = 'Base.WristWatch_Left_ClassicMilitary', chance = 1, count = { 1, 1 } },
            },
        },
        { -- E141
            note = "shelves @ library",
            coords = { x = 13440, y = 1891, z = 0 },
            dist = { "BookstoreMilitaryHistory" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E142
            note = "shelves @ library",
            coords = { x = 13440, y = 1892, z = 0 },
            dist = { "BookstoreNonFiction" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E143
            note = "shelves @ library",
            coords = { x = 13440, y = 1893, z = 0 },
            dist = { "CrateVHSTapes" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E144
            note = "shelves @ library",
            coords = { x = 13444, y = 1894, z = 0 },
            dist = { "SafehouseTraps", },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E145
            note = "dresser @ library",
            coords = { x = 13444, y = 1893, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E146
            note = "dresser @ library",
            coords = { x = 13444, y = 1892, z = 0 },
            dist = { "ArmyStorageAmmunition", },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E147
            note = "shelves @ library",
            coords = { x = 13444, y = 1891, z = 0 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        -- piano room
        { -- E148
            note = "dresser @ livingroom",
            coords = { x = 13436, y = 1891, z = 0 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E149
            note = "dresser @ livingroom",
            coords = { x = 13431, y = 1894, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -- dining room
        { -- E150
            note = "dresser @ diningroom",
            coords = { x = 13431, y = 1899, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E151
            note = "dresser @ diningroom",
            coords = { x = 13434, y = 1899, z = 0 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        -- 2nd floor
        { -- E152
            note = "wardrobe @ bedroom",
            coords = { x = 13431, y = 1897, z = 1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E153
            note = "wardrobe @ bedroom",
            coords = { x = 13431, y = 1896, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E154
            note = "dresser @ bedroom",
            coords = { x = 13431, y = 1895, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E155
            note = "dresser @ bedroom",
            coords = { x = 13431, y = 1891, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E156
            note = "dresser @ bedroom",
            coords = { x = 13434, y = 1891, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E157
            note = "dresser @ bedroom",
            coords = { x = 13431, y = 1904, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E158
            note = "dresser @ bedroom",
            coords = { x = 13431, y = 1903, z = 1 },
            dist = { "CampingStoreBackpacks" },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E159
            note = "wardrobe @ bedroom",
            coords = { x = 13434, y = 1902, z = 1 },
            dist = { "SewingStoreTools" },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E160
            note = "wardrobe @ bedroom",
            coords = { x = 13435, y = 1902, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E161
            note = "dresser @ bedroom",
            coords = { x = 13438, y = 1902, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E162
            note = "wardrobe @ bedroom",
            coords = { x = 13439, y = 1894, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E163
            note = "shelves @ bedroom",
            coords = { x = 13441, y = 1893, z = 1 },
            dist = { "LivingRoomShelfClassy" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E164
            note = "shelves @ bedroom",
            coords = { x = 13441, y = 1892, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E165
            note = "wardrobe @ bedroom",
            coords = { x = 13440, y = 1894, z = 1 },
            dist = { "SurvivalGear", },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E166
            note = "dresser @ bedroom",
            coords = { x = 13444, y = 1896, z = 1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E167
            note = "dresser @ bedroom",
            coords = { x = 13444, y = 1893, z = 1 },
            dist = { "SurvivalGear", },
            distIncludeJunk = false,
            tag = "DWAPLockers",
        },
        { -- E168
            note = "clothingrack @ clothesstore",
            coords = { x = 13439, y = 1893, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPTools",
        },
        { -- E169
            note = "clothingrack @ clothesstore",
            coords = { x = 13439, y = 1892, z = 1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E170
            note = "clothingrack @ clothesstore",
            coords = { x = 13439, y = 1891, z = 1 },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        -- attic
        { -- E171
            note = "crate @ attic",
            coords = { x = 13432, y = 1896, z = 2 },
            distIncludeJunk = true,
            tag = "DWAPFarm",
        },
        { -- E172
            note = "crate @ attic",
            coords = { x = 13432, y = 1901, z = 2 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E173
            note = "crate @ attic",
            coords = { x = 13437, y = 1901, z = 2 },
            distIncludeJunk = false,
            tag = "DWAPTools",
        },
        { -- E174
            note = "cardboardbox @ attic",
            coords = { x = 13434, y = 1895, z = 2 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E175
            note = "cardboardbox @ attic",
            coords = { x = 13434, y = 1894, z = 2 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E176
            note = "cardboardbox @ attic",
            coords = { x = 13434, y = 1894, z = 2 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E177
            note = "cardboardbox @ attic",
            coords = { x = 13435, y = 1894, z = 2 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(CentralLVilleMansion.objectSpawns,
        { enabled = "EnableLadders", sprite = "walls_interior_house_03_43", x = 13451, y = 1874, z = 0, clearExisting = true, })
    table.insert(CentralLVilleMansion.objectSpawns,
        { enabled = "EnableLadders", sprite = "fixtures_doors_01_5", x = 13451, y = 1874, z = 0, isDoor = true, doorN = true, })
    table.insert(CentralLVilleMansion.objectSpawns,
        { enabled = "EnableLadders", sprite = "walls_interior_house_03_33", x = 13452, y = 1874, z = 0, removeFloor = true, clearExisting = true, })
    table.insert(CentralLVilleMansion.objectSpawns,
        { enabled = "EnableLadders", sprite = "walls_interior_house_03_32", x = 13453, y = 1874, z = 0, })
else
    table.insert(CentralLVilleMansion.objectSpawns,
        { sprite = "industry_trucks_01_50", x = 13452, y = 1874, z = -2, removeWall = "north", })
end
-- if FA is activated, plumb the soda machines
if getActivatedMods():contains("\\FunctionalAppliances2") then
    table.insert(CentralLVilleMansion.waterFixtures,
        { sprite = "location_shop_zippee_01_57", x = 13434, y = 1883, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } })
    table.insert(CentralLVilleMansion.waterFixtures,
        { sprite = "location_shop_accessories_01_9", x = 13434, y = 1882, z = -2, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } })
end

return CentralLVilleMansion
