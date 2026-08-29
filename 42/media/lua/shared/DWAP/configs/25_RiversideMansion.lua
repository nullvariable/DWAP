local wtc = { x = 6660, y = 5516, z = -1, }
local pb1 = { x = 6659, y = 5514, z = -1, }
local RiversideMansion = {
    group = "Riverside",
    baseBuildings = {
        { x = 6680, y = 5509, z = 1 },  -- mansion
        { x = 6669, y = 5519, z = -1 }, -- basement
    },
    spawn = { x = 6680, y = 5509, z = 1 },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 6663, y = 5513, z = -1, },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 6661, y = 5513, z = -1, },
            fakeGenerators = {
                { x = 6671, y = 5523, z = -2, },
            },
        },
    },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = { x = 6666, y = 5500, z = -1 } },
    },
    waterFixtures = {
        { sprite = "fixtures_sinks_01_16",    x = 6659, y = 5531, z = -1, sourceType = "tank", source = wtc, }, -- kitchen, bld 26,21#22
        { sprite = "fixtures_sinks_01_34",    x = 6668, y = 5521, z = -1, sourceType = "tank", source = wtc, }, -- workshop, bld 26,21#22
        { sprite = "fixtures_sinks_01_24",    x = 6664, y = 5517, z = -1, sourceType = "tank", source = wtc, }, -- hall, bld 26,21#22
        { sprite = "fixtures_sinks_01_12",    x = 6673, y = 5512, z = -1, sourceType = "tank", source = wtc, }, -- medclinic, bld 26,21#22
        { sprite = "fixtures_bathroom_01_3",  x = 6672, y = 5522, z = -1, sourceType = "tank", source = wtc, }, -- bathroom, bld 26,21#22
        { sprite = "fixtures_sinks_01_28",    x = 6673, y = 5522, z = -1, sourceType = "tank", source = wtc, }, -- bathroom, bld 26,21#22
        { sprite = "fixtures_sinks_01_14",    x = 6672, y = 5511, z = 0,  sourceType = "tank", source = wtc, }, -- laundry, bld 26,21#17
        { sprite = "appliances_laundry_01_0", x = 6673, y = 5511, z = 0,  sourceType = "tank", source = wtc, }, -- laundry, bld 26,21#17
        { sprite = "fixtures_sinks_01_12",    x = 6672, y = 5515, z = 0,  sourceType = "tank", source = wtc, }, -- bathroom, bld 26,21#17
        { sprite = "fixtures_bathroom_01_0",  x = 6673, y = 5515, z = 0,  sourceType = "tank", source = wtc, }, -- bathroom, bld 26,21#17
        { sprite = "fixtures_bathroom_01_33", x = 6672, y = 5517, z = 0,  sourceType = "tank", source = wtc, }, -- bathroom, bld 26,21#17
        { sprite = "fixtures_sinks_01_18",    x = 6681, y = 5508, z = 0,  sourceType = "tank", source = wtc, }, -- kitchen, bld 26,21#17
        { sprite = "fixtures_bathroom_01_1",  x = 6669, y = 5515, z = 1,  sourceType = "tank", source = wtc, }, -- bathroom, bld 26,21#17
        { sprite = "fixtures_bathroom_01_25", x = 6671, y = 5515, z = 1,  sourceType = "tank", source = wtc, }, -- bathroom, bld 26,21#17
        { sprite = "fixtures_sinks_01_1",     x = 6669, y = 5516, z = 1,  sourceType = "tank", source = wtc, }, -- bathroom, bld 26,21#17
        { sprite = "fixtures_bathroom_01_24", x = 6671, y = 5516, z = 1,  sourceType = "tank", source = wtc, }, -- bathroom, bld 26,21#17
        { sprite = "fixtures_bathroom_01_26", x = 6680, y = 5511, z = 1,  sourceType = "tank", source = wtc, }, -- bathroom, bld 26,21#17
        { sprite = "fixtures_bathroom_01_27", x = 6681, y = 5511, z = 1,  sourceType = "tank", source = wtc, }, -- bathroom, bld 26,21#17
        { sprite = "fixtures_bathroom_01_3",  x = 6680, y = 5514, z = 1,  sourceType = "tank", source = wtc, }, -- bathroom, bld 26,21#17
        { sprite = "fixtures_sinks_01_0",     x = 6681, y = 5514, z = 1,  sourceType = "tank", source = wtc, }, -- bathroom, bld 26,21#17

    },
    doorKeys = {
        name = "Riverside Mansion",
        doors = {
            { sprite = "fixtures_doors_02_5",  x = 6674, y = 5516, z = 0, },
            { sprite = "fixtures_doors_02_4",  x = 6676, y = 5506, z = -1, },
            { sprite = "fixtures_doors_01_32", x = 6668, y = 5503, z = -1, },
        },
    },
    map = { name = "DWAPStashMap25", },
    objectSpawns = {
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_24", x = 6682, y = 5516, z = 0, },     -- window W | office, bld 26,21#17
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_24", x = 6682, y = 5518, z = 0, },     -- window W | office, bld 26,21#17
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_25", x = 6680, y = 5520, z = 0, },     -- window N | office, bld 26,21#17
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_25", x = 6679, y = 5520, z = 0, },     -- window N | office, bld 26,21#17
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_24", x = 6683, y = 5513, z = 0, },     -- window W | kitchen, bld 26,21#17
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_24", x = 6682, y = 5508, z = 0, },     -- window W | kitchen, bld 26,21#17
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_24", x = 6683, y = 5511, z = 0, },     -- window W | kitchen, bld 26,21#17
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_25", x = 6673, y = 5507, z = 0, },     -- window N | livingroom, bld 26,21#17
        { barricade = "metalbar", enabled = "Barricade", target = "fixtures_windows_01_25", x = 6673, y = 5518, z = 0, },     -- window N | bathroom, bld 26,21#17
    },
    loot = {

        -- basement
        -- armory
        { -- E1
            note = "militarylocker @ armysurplus",
            coords = { x = 6670, y = 5524, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E2
            note = "militarylocker @ armysurplus",
            coords = { x = 6670, y = 5525, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E3
            note = "militarylocker @ armysurplus",
            coords = { x = 6670, y = 5526, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E4
            note = "militarylocker @ armysurplus",
            coords = { x = 6670, y = 5527, z = -1 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E5
            note = "militarylocker @ armysurplus",
            coords = { x = 6670, y = 5528, z = -1 },
            dist = { "ArmyStorageAmmunition", },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E6
            note = "militarycrate @ armysurplus",
            coords = { x = 6670, y = 5529, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E7
            note = "militarycrate @ armysurplus",
            coords = { x = 6670, y = 5529, z = -1 },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E8
            note = "militarycrate @ armysurplus",
            coords = { x = 6670, y = 5530, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E9
            note = "militarycrate @ armysurplus",
            coords = { x = 6670, y = 5530, z = -1 },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E10
            note = "militarycrate @ armysurplus",
            coords = { x = 6670, y = 5532, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E11
            note = "militarycrate @ armysurplus",
            coords = { x = 6670, y = 5532, z = -1 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E12
            note = "militarycrate @ armysurplus",
            coords = { x = 6670, y = 5533, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E13
            note = "militarycrate @ armysurplus",
            coords = { x = 6670, y = 5533, z = -1 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E14
            note = "militarycrate @ armysurplus",
            coords = { x = 6670, y = 5534, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E15
            note = "militarycrate @ armysurplus",
            coords = { x = 6670, y = 5534, z = -1 },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E16
            note = "militarylocker @ armysurplus",
            coords = { x = 6673, y = 5527, z = -1 },
            special = "essentials",
        },
        { -- E17
            note = "militarylocker @ armysurplus",
            coords = { x = 6673, y = 5528, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E18
            note = "militarylocker @ armysurplus",
            coords = { x = 6673, y = 5529, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E19
            note = "militarycrate @ armysurplus",
            coords = { x = 6673, y = 5530, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E20
            note = "militarycrate @ armysurplus",
            coords = { x = 6673, y = 5531, z = -1 },
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = { 9, 12 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E21
            note = "militarycrate @ armysurplus",
            coords = { x = 6673, y = 5532, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E22
            note = "militarycrate @ armysurplus",
            coords = { x = 6673, y = 5533, z = -1 },
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = { 8, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E23
            note = "militarycrate @ armysurplus",
            coords = { x = 6673, y = 5534, z = -1 },
            dist = { "ArtStorePottery", },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        -- infirmary
        { -- E24
            note = "medicine @ medclinic",
            coords = { x = 6669, y = 5516, z = -1 },
            dist = { "LaboratoryLockers", },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E25
            note = "medicine @ medclinic",
            coords = { x = 6669, y = 5515, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E26
            note = "sidetable @ medclinic",
            coords = { x = 6669, y = 5514, z = -1 },
            dist = { "MedicalClinicDrugs" },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E27
            note = "medicine @ medclinic",
            coords = { x = 6669, y = 5514, z = -1 },
            slot = "upper",
            dist = { "MedicalCabinet" },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E28
            note = "metal_shelves @ medclinic",
            coords = { x = 6669, y = 5512, z = -1 },
            dist = { "MedicalCabinet", },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E29
            note = "metal_shelves @ medclinic",
            coords = { x = 6673, y = 5515, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E30
            note = "fridge @ medclinic",
            coords = { x = 6673, y = 5516, z = -1 },
            dist = { "SafehouseMedical_Late", },
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        -- study
        { -- E31
            note = "shelves @ security",
            coords = { x = 6668, y = 5516, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E32
            note = "shelves @ security",
            coords = { x = 6667, y = 5516, z = -1 },
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E33
            note = "dishescabinet @ security",
            coords = { x = 6668, y = 5512, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E34
            note = "dishescabinet @ security",
            coords = { x = 6667, y = 5512, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E35
            note = "shelves @ security",
            coords = { x = 6664, y = 5513, z = -1 },
            items = {
                { name = 'Base.Firewood', chance = 1, count = { 10, 10 } },
            },
            level = "Loot_FarmLevel",
        },
        { -- E36
            note = "shelves @ security",
            coords = { x = 6664, y = 5514, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E37
            note = "shelves @ security",
            coords = { x = 6664, y = 5515, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        -- west storage
        { -- E38
            note = "crate @ storageunit",
            coords = { x = 6661, y = 5521, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E39
            note = "crate @ storageunit",
            coords = { x = 6661, y = 5522, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E40
            note = "locker @ storageunit",
            coords = { x = 6663, y = 5519, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E41
            note = "locker @ storageunit",
            coords = { x = 6660, y = 5519, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E42
            note = "crate @ storageunit",
            coords = { x = 6659, y = 5519, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E43
            note = "crate @ storageunit",
            coords = { x = 6659, y = 5519, z = -1 },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E44
            note = "crate @ storageunit",
            coords = { x = 6659, y = 5521, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E45
            note = "crate @ storageunit",
            coords = { x = 6659, y = 5521, z = -1 },
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E46
            note = "crate @ storageunit",
            coords = { x = 6659, y = 5522, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E47
            note = "crate @ storageunit",
            coords = { x = 6659, y = 5522, z = -1 },
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E48
            note = "crate @ storageunit",
            coords = { x = 6659, y = 5522, z = -1 },
            stack = 3,
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E49
            note = "crate @ storageunit",
            coords = { x = 6659, y = 5523, z = -1 },
            dist = { "ArmyStorageAmmunition", },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E50
            note = "crate @ storageunit",
            coords = { x = 6659, y = 5523, z = -1 },
            stack = 2,
            dist = { "ArmyStorageAmmunition", },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E51
            note = "crate @ storageunit",
            coords = { x = 6659, y = 5523, z = -1 },
            stack = 3,
            dist = { "ArmyStorageAmmunition", },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E52
            note = "clothingrack @ storageunit",
            coords = { x = 6663, y = 5520, z = -1 },
            items = {
                { name = 'Base.Shoes_ArmyBoots',       chance = 1, count = { 7, 13 } },
                { name = 'Base.Shoes_ArmyBootsDesert', chance = 1, count = { 3, 7 } },
            },
        },
        { -- E53
            note = "clothingrack @ storageunit",
            coords = { x = 6663, y = 5521, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E54
            note = "clothingrack @ storageunit",
            coords = { x = 6663, y = 5522, z = -1 },
            dist = { "SafehouseArmor", },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E55
            note = "clothingrack @ storageunit",
            coords = { x = 6663, y = 5523, z = -1 },
            dist = { "SafehouseArmor", },
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -- workshop
        { -- E56
            note = "metal_shelves @ workshop",
            coords = { x = 6668, y = 5523, z = -1 },
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            level = "Loot_BuildMatsLevel",
        },
        { -- E57
            note = "metal_shelves @ workshop",
            coords = { x = 6668, y = 5522, z = -1 },
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E58
            note = "metal_shelves @ workshop",
            coords = { x = 6665, y = 5519, z = -1 },
            dist = { "CrateTools", },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E59
            note = "crate @ workshop",
            coords = { x = 6668, y = 5520, z = -1 },
            dist = { "ToolFactoryHandles", },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        -- living room
        { -- E60
            note = "sidetable @ livingroom",
            coords = { x = 6667, y = 5531, z = -1 },
            dist = { "CrateVHSTapes" },
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E61
            note = "shelves @ livingroom",
            coords = { x = 6665, y = 5524, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E62
            note = "shelves @ livingroom",
            coords = { x = 6666, y = 5524, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E63
            note = "shelves @ livingroom",
            coords = { x = 6667, y = 5524, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        -- kitchen
        { -- E64
            note = "counter @ kitchen",
            coords = { x = 6663, y = 5527, z = -1 },
            dist = { "TheatrePopcorn" },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E65
            note = "counter @ kitchen",
            coords = { x = 6663, y = 5528, z = -1 },
            dist = { "TheatreSnacks" },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E66
            note = "counter @ kitchen",
            coords = { x = 6663, y = 5529, z = -1 },
            dist = { "BarCounterMisc" },
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E67
            note = "counter @ kitchen",
            coords = { x = 6663, y = 5530, z = -1 },
            dist = { "CafeKitchenCoffee" },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E68
            note = "counter @ kitchen",
            coords = { x = 6663, y = 5531, z = -1 },
            dist = { "BakeryKitchenFreezer" },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E69
            note = "freezer @ kitchen",
            coords = { x = 6662, y = 5534, z = -1 },
            dist = { "SushiKitchenFreezer" },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E70
            note = "freezer @ kitchen",
            coords = { x = 6661, y = 5534, z = -1 },
            dist = { "FreezerIceCream", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E71
            note = "fridge @ kitchen",
            coords = { x = 6659, y = 5534, z = -1 },
            dist = { "PizzaKitchenFridge" },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E72
            note = "freezer @ kitchen",
            coords = { x = 6659, y = 5534, z = -1 },
            slot = "freezer",
            dist = { "PizzaKitchenFreezer", },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E73
            note = "fridge @ kitchen",
            coords = { x = 6659, y = 5533, z = -1 },
            dist = { "SpiffosKitchenFridge", },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E74
            note = "freezer @ kitchen",
            coords = { x = 6659, y = 5533, z = -1 },
            slot = "freezer",
            dist = { "SpiffosKitchenFreezer" },
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E75
            note = "fridge @ kitchen",
            coords = { x = 6659, y = 5527, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFridge",
        },
        { -- E76
            note = "freezer @ kitchen",
            coords = { x = 6659, y = 5527, z = -1 },
            slot = "freezer",
            distIncludeJunk = false,
            tag = "DWAPFreezer",
        },
        { -- E77
            note = "counter @ kitchen",
            coords = { x = 6659, y = 5532, z = -1 },
            dist = { "GigamartBreakfast" },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E78
            note = "counter @ kitchen",
            coords = { x = 6659, y = 5532, z = -1 },
            slot = "upper",
            dist = { "StoreKitchenPotatoes" },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E79
            note = "counter @ kitchen",
            coords = { x = 6659, y = 5531, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E80
            note = "counter @ kitchen",
            coords = { x = 6659, y = 5531, z = -1 },
            slot = "upper",
            dist = { "ArenaKitchenSauce" },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E81
            note = "counter @ kitchen",
            coords = { x = 6659, y = 5530, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E82
            note = "counter @ kitchen",
            coords = { x = 6659, y = 5530, z = -1 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E83
            note = "counter @ kitchen",
            coords = { x = 6659, y = 5529, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E84
            note = "counter @ kitchen",
            coords = { x = 6659, y = 5529, z = -1 },
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E85
            note = "shelves @ kitchen",
            coords = { x = 6662, y = 5524, z = -1 },
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E86
            note = "desk @ kidsbedroom",
            coords = { x = 6680, y = 5507, z = 1 },
            tag = "DWAPMedia",
        },
        { -- E87
            note = "dresser @ kidsbedroom",
            coords = { x = 6679, y = 5507, z = 1 },
            tag = "DWAPLockers",
        },
        { -- E88
            note = "wardrobe @ kidsbedroom",
            coords = { x = 6678, y = 5509, z = 1 },
            tag = "DWAPLockers",
        },
        { -- E89
            note = "wardrobe @ kidsbedroom",
            coords = { x = 6678, y = 5510, z = 1 },
            tag = "DWAPLockers",
        },
        { -- E90
            note = "counter @ bathroom",
            coords = { x = 6681, y = 5514, z = 1 },
            tag = "DWAPMed",
        },
        { -- E91
            note = "shelves @ kidsbedroom",
            coords = { x = 6681, y = 5515, z = 1 },
            tag = "DWAPMedia",
        },
        { -- E92
            note = "dresser @ kidsbedroom",
            coords = { x = 6678, y = 5518, z = 1 },
            tag = "DWAPLockers",
        },
        { -- E93
            note = "wardrobe @ hall",
            coords = { x = 6672, y = 5511, z = 1 },
            tag = "DWAPLockers",
        },
        { -- E94
            note = "wardrobe @ hall",
            coords = { x = 6673, y = 5511, z = 1 },
            tag = "DWAPLockers",
        },
        { -- E95
            note = "dresser @ hall",
            coords = { x = 6673, y = 5517, z = 1 },
            tag = "DWAPLockers",
        },
        { -- E96
            note = "counter @ bathroom",
            coords = { x = 6669, y = 5516, z = 1 },
            tag = "DWAPMed",
        },
        { -- E97
            note = "wardrobe @ closet",
            coords = { x = 6667, y = 5515, z = 1 },
            tag = "DWAPLockers",
        },
        { -- E98
            note = "wardrobe @ closet",
            coords = { x = 6667, y = 5516, z = 1 },
            tag = "DWAPLockers",
        },
        { -- E99
            note = "dresser @ bedroom",
            coords = { x = 6667, y = 5511, z = 1 },
            tag = "DWAPLockers",
        },
        { -- E100
            note = "shelves @ bedroom",
            coords = { x = 6670, y = 5511, z = 1 },
            tag = "DWAPMedia",
        },
        { -- E101
            note = "dresser @ bedroom",
            coords = { x = 6667, y = 5514, z = 1 },
            tag = "DWAPLockers",
        },
        { -- E102
            note = "fireplace @ livingroom",
            coords = { x = 6675, y = 5507, z = 1 },
            tag = "DWAPMedia",
        },
        { -- E103
            note = "sidetable @ livingroom",
            coords = { x = 6677, y = 5508, z = 1 },
            tag = "DWAPMedia",
        },
        { -- E104
            note = "shelves @ livingroom",
            coords = { x = 6677, y = 5509, z = 1 },
            tag = "DWAPMedia",
        },
        { -- E105
            note = "shelves @ livingroom",
            coords = { x = 6677, y = 5510, z = 1 },
            tag = "DWAPMedia",
        },
        { -- E106
            note = "medicine @ bathroom",
            coords = { x = 6672, y = 5515, z = 0 },
            slot = "upper",
            tag = "DWAPMed",
        },
        { -- E107
            note = "metal_shelves @ garagestorage",
            coords = { x = 6667, y = 5511, z = 0 },
            tag = "DWAPTools",
        },
        { -- E108
            note = "barbecue @ garagestorage",
            coords = { x = 6671, y = 5511, z = 0 },
            tag = "DWAPFood",
        },
        { -- E109
            note = "counter @ garagestorage",
            coords = { x = 6667, y = 5512, z = 0 },
            tag = "DWAPTools",
        },
        { -- E110
            note = "counter @ garagestorage",
            coords = { x = 6667, y = 5513, z = 0 },
            tag = "DWAPTools",
        },
        { -- E111
            note = "locker @ garagestorage",
            coords = { x = 6671, y = 5514, z = 0 },
            tag = "DWAPLockers",
        },
        { -- E112
            note = "cardboardbox @ garagestorage",
            coords = { x = 6671, y = 5515, z = 0 },
            tag = "DWAPBuildMats",
        },
        { -- E113
            note = "metal_shelves @ garagestorage",
            coords = { x = 6667, y = 5516, z = 0 },
            slot = "upper",
            tag = "DWAPTools",
        },
        { -- E114
            note = "cardboardbox @ garagestorage",
            coords = { x = 6671, y = 5516, z = 0 },
            tag = "DWAPBuildMats",
        },
        { -- E115
            note = "metal_shelves @ garagestorage",
            coords = { x = 6667, y = 5517, z = 0 },
            slot = "upper",
            tag = "DWAPTools",
        },
        { -- E116
            note = "cardboardbox @ garagestorage",
            coords = { x = 6671, y = 5517, z = 0 },
            tag = "DWAPBuildMats",
        },
        { -- E117
            note = "cardboardbox @ garagestorage",
            coords = { x = 6671, y = 5517, z = 0 },
            slot = "upper",
            tag = "DWAPBuildMats",
        },
        { -- E118
            note = "metal_shelves @ laundry",
            coords = { x = 6674, y = 5511, z = 0 },
            tag = "DWAPLockers",
        },
        { -- E119
            note = "counter @ laundry",
            coords = { x = 6672, y = 5513, z = 0 },
            tag = "DWAPFood",
        },
        { -- E120
            note = "overhead @ laundry",
            coords = { x = 6672, y = 5513, z = 0 },
            slot = "upper",
            tag = "DWAPFood",
        },
        { -- E121
            note = "overhead @ laundry",
            coords = { x = 6672, y = 5514, z = 0 },
            slot = "upper",
            tag = "DWAPFood",
        },
        { -- E122
            note = "shelves @ livingroom",
            coords = { x = 6672, y = 5507, z = 0 },
            tag = "DWAPMedia",
        },
        { -- E123
            note = "fireplace @ livingroom",
            coords = { x = 6675, y = 5507, z = 0 },
            tag = "DWAPMedia",
        },
        { -- E124
            note = "counter @ kitchen",
            coords = { x = 6681, y = 5507, z = 0 },
            tag = "DWAPFood",
        },
        { -- E125
            note = "overhead @ kitchen",
            coords = { x = 6681, y = 5507, z = 0 },
            slot = "upper",
            tag = "DWAPFood",
        },
        { -- E126
            note = "counter @ kitchen",
            coords = { x = 6681, y = 5508, z = 0 },
            tag = "DWAPFood",
        },
        { -- E127
            note = "counter @ kitchen",
            coords = { x = 6681, y = 5509, z = 0 },
            tag = "DWAPFood",
        },
        { -- E128
            note = "fridge @ kitchen",
            coords = { x = 6678, y = 5507, z = 0 },
            tag = "DWAPFridge",
        },
        { -- E129
            note = "freezer @ kitchen",
            coords = { x = 6678, y = 5507, z = 0 },
            slot = "freezer",
            tag = "DWAPFreezer",
        },
        { -- E130
            note = "overhead @ kitchen",
            coords = { x = 6678, y = 5507, z = 0 },
            slot = "upper",
            tag = "DWAPFood",
        },
        { -- E131
            note = "counter @ kitchen",
            coords = { x = 6679, y = 5507, z = 0 },
            tag = "DWAPFood",
        },
        { -- E132
            note = "overhead @ kitchen",
            coords = { x = 6679, y = 5507, z = 0 },
            slot = "upper",
            tag = "DWAPFood",
        },
        { -- E133
            note = "dishescabinet @ kitchen",
            coords = { x = 6678, y = 5513, z = 0 },
            tag = "DWAPFood",
        },
        { -- E134
            note = "dishescabinet @ kitchen",
            coords = { x = 6678, y = 5514, z = 0 },
            tag = "DWAPFood",
        },
        { -- E135
            note = "dresser @ hall",
            coords = { x = 6677, y = 5513, z = 0 },
            tag = "DWAPLockers",
        },
        { -- E136
            note = "dresser @ office",
            coords = { x = 6681, y = 5515, z = 0 },
            tag = "DWAPLockers",
        },
        { -- E137
            note = "desk @ office",
            coords = { x = 6681, y = 5519, z = 0 },
            tag = "DWAPMedia",
        },
        { -- E138
            note = "dresser @ office",
            coords = { x = 6678, y = 5515, z = 0 },
            tag = "DWAPLockers",
        },
        { -- E139
            note = "filingcabinet @ office",
            coords = { x = 6678, y = 5519, z = 0 },
            tag = "DWAPMedia",
        },
    },
}

return RiversideMansion
