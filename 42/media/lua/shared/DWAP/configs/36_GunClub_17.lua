-- @TODO (2026-08-07 audit) unresolved - delete lines as they are fixed
--   * entry 30: square holds no container at all - coords are stale or the
--     object was removed
--   * entry 17: duplicate coordinates with an earlier entry - one of each
--     pair needs slot or stack addressing, or is redundant
--   * systems: generator controls declare industry_02_67 but no such object
--     is on the square. 11 configs name that sprite and ALL 11 fail, while 32
--     configs use dwap_tiles_01_22 - the maps look to have moved on and these
--     configs did not. Confirm what is actually there before editing
--   * systems: waterTank 2 at 1858,14163,1 present but carrying no fluid
--     container - the conversion started and did not finish, so this one is a
--     bug rather than bad coords
local wtc1 = {x = 1835, y = 14134, z = -2,}
local wtc2 = {x = 1858, y = 14163, z = 1,}
local pb1 = { x = 1835, y = 14137, z = -2 }
local GunClub = {
    group = "Irvington",
    baseBuildings = {
        { x = 1850, y = 14165, z = 0 }, -- gun club
        { x = 1845, y = 14125, z = 0 }, -- gun range room
        { x = 1833, y = 14111, z = 0 }, -- utility bldg
        { x = 1860, y = 14166, z = -1 }, -- range basement
        { x = 1860, y = 14150, z = -1 }, -- bunker basement
    },
    spawn = { x = 1850, y = 14165, z = 0 },
    generators = {
        {
            controls = { sprite = "industry_02_67", x = pb1.x-1, y = pb1.y, z = pb1.z },
            fakeGenerators = {
                { x = 1858, y = 14154, z = -1, createTile = true },
                { x = 1842, y = 14127, z = -1, createTile = true },
            },
        },
    },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc1.x, y = wtc1.y, z = wtc1.z, sourceType="generator", source = {x = 1835, y = 14137, z = -2} },
        { sprite = "crafted_01_11", x = wtc2.x, y = wtc2.y, z = wtc2.z, sourceType="generator", source = {x = 1835, y = 14137, z = -2} },
    },
    waterFixtures = {
        { sprite = "fixtures_bathroom_01_2", x = 1860, y = 14163, z = 0, sourceType="tank", source = {x = wtc2.x, y = wtc2.y, z = wtc2.z} },
        { sprite = "fixtures_sinks_01_23", x = 1860, y = 14164, z = 0, sourceType="tank", source = {x = wtc2.x, y = wtc2.y, z = wtc2.z} },

        -- basement
        { sprite = "location_shop_zippee_01_57", x = 1840, y = 14132, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_32", x = 1840, y = 14129, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_32", x = 1858, y = 14134, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_4", x = 1860, y = 14134, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_4", x = 1861, y = 14134, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_0", x = 1858, y = 14137, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_0", x = 1859, y = 14137, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },

        { sprite = "fixtures_sinks_01_24", x = 1854, y = 14145, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "appliances_laundry_01_7", x = 1846, y = 14148, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "appliances_laundry_01_5", x = 1847, y = 14151, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_19", x = 1865, y = 14152, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },

        -- shower entry
        { sprite = "fixtures_bathroom_01_31", x = 1859, y = 14156, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_31", x = 1859, y = 14155, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_31", x = 1859, y = 14154, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_23", x = 1863, y = 14156, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_23", x = 1863, y = 14155, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_23", x = 1863, y = 14154, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
    },
    doorKeys = {
        name = "Irvington Gun Club",
        doors = {
            { sprite = "fixtures_doors_02_5", x = 1856, y = 14168, z = 0, },
            { sprite = "walls_garage_01_3", x = 1861, y = 14157, z = -1, },
        },
    },
    map = { name = "DWAPStashMap36", },
    objectSpawns = {
        { sprite = "industry_02_175", x = pb1.x, y = pb1.y, z = pb1.z, disabled = "EnableGenSystemSolar", clearExisting = true, },
        -- { sprite = "camping_01_16", x = 1843, y = 14155, z = 0, enabled = "EnableWaterSystem", }, -- well
        { sprite = "crafted_01_11", x = wtc2.x, y = wtc2.y, z = wtc2.z, enabled = "EnableWaterSystem", },


        -- { x = 1866, y = 14163, z = -1, clearExisting = true, },

        { barricade = "metal", enabled = "Barricade", target="walls_commercial_01_113", x = 1848, y = 14169, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target="walls_commercial_01_113", x = 1849, y = 14169, z = 0, },
        { barricade = "metal", enabled = "Barricade", target="walls_commercial_01_113", x = 1852, y = 14169, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target="walls_commercial_01_113", x = 1853, y = 14169, z = 0, },
        { barricade = "wood", enabled = "Barricade", target="fixtures_doors_02_41", x = 1856, y = 14169, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_doors_02_45", x = 1857, y = 14169, z = 0, },
        { barricade = "metal", enabled = "Barricade", target="walls_commercial_01_113", x = 1860, y = 14169, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target="walls_commercial_01_113", x = 1861, y = 14169, z = 0, },
        { barricade = "metal", enabled = "Barricade", target="walls_commercial_01_113", x = 1864, y = 14169, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target="walls_commercial_01_113", x = 1865, y = 14169, z = 0, },

    },
    loot = {
        -----------------------
        ---- Crafting room ----
        -----------------------
        { -- E1
            note = "logs @ crafting room",
            coords = {x=1829,y=14135,z=-2},
            items = {
                { name = 'Base.Firewood', chance = 1, count = {10,10} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E2
            note = "metal_shelves @ crafting room",
            coords = {x=1834,y=14141,z=-2},
            dist = {"SafehouseFireplace", "SafehouseLighting", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E3
            note = "metal_shelves @ crafting room",
            coords = {x=1835,y=14141,z=-2},
            dist = {"CrateLongStick"},
            items = {
                { name = 'Base.LongStick', chance = 1, count = {10,10} },
                { name = 'Base.Firewood', chance = 1, count = {10,10} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E4
            note = "metal_shelves @ crafting room",
            coords = {x=1833,y=14131,z=-2},
            dist = {"CrateLumber", "CrateSheetMetal"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E5
            note = "metal_shelves @ crafting room",
            coords = {x=1833,y=14130,z=-2},
            dist = {"CrateLumber", "CrateSheetMetal"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E6
            note = "metal_shelves @ crafting room",
            coords = {x=1833,y=14129,z=-2},
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = {8,10} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E7
            note = "metal_shelves @ crafting room",
            coords = {x=1833,y=14128,z=-2},
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = {9,12} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E8
            note = "metal_shelves @ crafting room",
            coords = {x=1835,y=14131,z=-2},
            dist = {"CrateLumber", "CrateSheetMetal"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E9
            note = "metal_shelves @ crafting room",
            coords = {x=1835,y=14130,z=-2},
            dist = {"CrateLumber", "CrateSheetMetal"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E10
            note = "metal_shelves @ crafting room",
            coords = {x=1835,y=14129,z=-2},
            dist = {"ArtStorePottery","CrateMasonry" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E11
            note = "metal_shelves @ crafting room",
            coords = {x=1835,y=14128,z=-2},
            dist = {"ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E12
            note = "metal_shelves @ crafting room",
            coords = {x=1838,y=14131,z=-2},
            dist = {"CrateTailoring", "CrateFabric_Cotton", "CrateFabric_DenimBlack", "CrateLeather","SewingStoreFabric"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- E13
            note = "metal_shelves @ crafting room",
            coords = {x=1838,y=14130,z=-2},
            dist = {"CrateToiletPaper", "CrateLinens"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E14
            note = "metal_shelves @ crafting room",
            coords = {x=1838,y=14129,z=-2},
            dist = {"BurglarTools", "CarpenterTools", "BarnTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E15
            note = "metal_shelves @ crafting room",
            coords = {x=1838,y=14128,z=-2},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E16
            note = "counter @ crafting room",
            coords = {x=1838,y=14136,z=-2},
            dist = {"CrateTools", "GarageTools", "BarnTools",  },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E17 @TODO duplicate coords with entry 16
            note = "counter @ crafting room",
            coords = {x=1838,y=14136,z=-2},
            dist = {"ToolStoreMetalwork","CrateBlacksmithing", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        ----------------------------
        ---- Bar/Kitchen/Lounge ----
        ----------------------------
        { -- E18
            note = "shelves @ bar",
            coords = {x=1840,y=14134,z=-1},
            dist = {"CrateLiquor", "LiquorStoreWhiskey"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E19
            note = "shelves @ bar",
            coords = {x=1840,y=14133,z=-1},
            dist = {"LiquorStoreBeer","LiquorStoreBeerFancy"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E20
            note = "counter @ bar",
            coords = {x=1842,y=14134,z=-1},
            dist = {"GigamartCrisps","ArmyStorageElectronics" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E21
            note = "counter @ bar",
            coords = {x=1840,y=14130,z=-1},
            dist = {"GigamartBakingMisc", "CrateFlour", "CrateOilVegetable" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E22
            note = "counter @ bar",
            coords = {x=1840,y=14128,z=-1},
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E23
            note = "counter @ bar",
            coords = {x=1841,y=14128,z=-1},
            dist = {"ButcherSpices","GigamartSpices","GroceryBagGourmet",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E24
            note = "counter @ bar",
            coords = {x=1842,y=14128,z=-1},
            dist = {"ButcherSpices","GigamartSpices","GroceryBagGourmet","CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E25
            note = "fridge @ bar",
            coords = {x=1843,y=14128,z=-1},
            dist = {"ArenaKitchenFreezer", "WesternKitchenFreezer", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E26
            note = "sidetable @ bar",
            coords = {x=1847,y=14128,z=-1},
            dist = {"CrateVHSTapes"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        -----------------------------
        ---- Bunk Rooms/Bathroom ----
        -----------------------------
        { -- E27
            note = "desk @ bedroom",
            coords = {x=1852,y=14141,z=-1},
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E28
            note = "locker @ bedroom",
            coords = {x=1855,y=14141,z=-1},
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E29
            note = "locker @ bedroom",
            coords = {x=1854,y=14139,z=-1},
            dist = {"CrateToiletPaper", "GasStoreToiletries"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E30
            coords = {x=1824,y=14138,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E31
            note = "militarylocker @ bedroom",
            coords = {x=1852,y=14136,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E32
            note = "locker @ bedroom",
            coords = {x=1852,y=14135,z=-1},
            dist = {"ArmyStorageOutfit",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E33
            note = "desk @ bedroom",
            coords = {x=1854,y=14134,z=-1},
            dist = {"BookstoreMilitaryHistory"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E34
            note = "militarylocker @ bedroom",
            coords = {x=1852,y=14133,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E35
            note = "locker @ bedroom",
            coords = {x=1852,y=14131,z=-1},
            dist = {"ClothingStorageWinter",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E36
            note = "desk @ bedroom",
            coords = {x=1854,y=14130,z=-1},
            dist = {"LivingRoomShelfClassy"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E37
            note = "militarylocker @ bedroom",
            coords = {x=1860,y=14133,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E38
            note = "locker @ bedroom",
            coords = {x=1861,y=14131,z=-1},
            dist = {"DrugLabOutfit",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E39
            note = "desk @ bedroom",
            coords = {x=1858,y=14130,z=-1},
            dist = {"MusicStoreCDs"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E40
            note = "counter @ bathroom",
            coords = {x=1859,y=14137,z=-1},
            dist = {"BathroomCounter", "GasStoreToiletries",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E41
            note = "dresser @ bathroom",
            coords = {x=1860,y=14137,z=-1},
            dist = {"LaundryCleaning", "JanitorCleaning", "MedicalStorageDrugs"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E42
            note = "militarylocker @ bedroom",
            coords = {x=1860,y=14141,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E43
            note = "locker @ bedroom",
            coords = {x=1861,y=14139,z=-1},
            dist = {"CrateBootsArmy",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E44
            note = "desk @ bedroom",
            coords = {x=1858,y=14138,z=-1},
            dist = {"BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E45
            note = "cardboardbox @ bedroom",
            coords = {x=1861,y=14141,z=-1},
            dist = {"CrateVHSTapes"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        ---------------
        --- Medical ---
        ---------------
        { -- E46
            note = "medicine @ medical",
            coords = {x=1862,y=14150,z=-1},
            slot = "upper",
            dist = {"SafehouseMedical" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E47
            note = "medicine @ medical",
            coords = {x=1867,y=14149,z=-1},
            slot = "upper",
            dist = {"MedicalCabinet" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E48
            note = "medicine @ medical",
            coords = {x=1868,y=14149,z=-1},
            slot = "upper",
            dist = {"MedicalClinicDrugs" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E49
            note = "metal_shelves @ medical",
            coords = {x=1868,y=14152,z=-1},
            dist = {"ArmyStorageMedical", "ArmyBunkerMedical" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E50
            note = "metal_shelves @ medical",
            coords = {x=1866,y=14152,z=-1},
            dist = {"SafehouseMedical_Late", "StoreShelfMedical", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        -- entry lockers
        { -- E51
            note = "locker @ entry",
            coords = {x=1859,y=14157,z=-1},
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
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E52
            note = "locker @ entry",
            coords = {x=1863,y=14157,z=-1},
            items = {
                { name = 'Base.Oxygen_Tank', },
            },
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        --------------------------
        --- Big Warehouse room ---
        --------------------------
        -- cold stuff
        { -- E53
            note = "fridge @ gunstore",
            coords = {x=1842,y=14151,z=-1},
            dist = {"SushiKitchenFreezer", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E54
            note = "fridge @ gunstore",
            coords = {x=1843,y=14151,z=-1},
            dist = {"WesternKitchenFreezer", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E55
            note = "freezer @ gunstore",
            coords = {x=1841,y=14145,z=-1},
            dist = { "FreezerRich"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E56
            note = "freezer @ gunstore",
            coords = {x=1842,y=14145,z=-1},
            dist = {"ArenaKitchenFreezer", "WesternKitchenFreezer", "BakeryKitchenFreezer"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E57
            note = "freezer @ gunstore",
            coords = {x=1843,y=14145,z=-1},
            dist = {"FridgeFarmStorage", "FridgeGeneric"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E58
            note = "freezer @ gunstore",
            coords = {x=1844,y=14145,z=-1},
            dist = {"FreezerIceCream", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- end cold stuff
        { -- E59
            note = "militarycrate @ gunstore",
            coords = {x=1846,y=14147,z=-1},
            dist = {"ArmyStorageOutfit", "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateLinens"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E60
            note = "locker @ gunstore",
            coords = {x=1845,y=14145,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E61
            note = "militarycrate @ gunstore",
            coords = {x=1846,y=14145,z=-1},
            special = "essentials",
        },
        { -- E62
            note = "locker @ gunstore",
            coords = {x=1847,y=14145,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E63
            note = "militarycrate @ gunstore",
            coords = {x=1848,y=14145,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E64
            note = "locker @ gunstore",
            coords = {x=1849,y=14145,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E65
            note = "militarylocker @ gunstore",
            coords = {x=1850,y=14145,z=-1},
            dist = {"CrateGravelBags", "CrateSandBags", "CrateClayBags"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E66
            note = "militarylocker @ gunstore",
            coords = {x=1851,y=14145,z=-1},
            dist = {"GasStoreEmergency","CarSupplyTools","GasStorageMechanics",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E67
            note = "militarylocker @ gunstore",
            coords = {x=1852,y=14145,z=-1},
            dist = {"CrateRandomJunk","GunStoreMagsAmmo", "GunStoreAmmunition", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E68
            note = "militarylocker @ gunstore",
            coords = {x=1853,y=14145,z=-1},
            dist = {"SafehouseTraps",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E69
            note = "militarylocker @ gunstore",
            coords = {x=1855,y=14145,z=-1},
            dist = { "SafehouseArmor", "SafehouseArmor_Late", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E70
            note = "militarylocker @ gunstore",
            coords = {x=1856,y=14145,z=-1},
            dist = {"CrateBlacksmithing" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E71
            note = "militarylocker @ gunstore",
            coords = {x=1857,y=14145,z=-1},
            dist = {"BurglarTools", "CarpenterTools", "BarnTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E72
            note = "militarylocker @ gunstore",
            coords = {x=1858,y=14145,z=-1},
            dist = {"MeleeWeapons", "MeleeWeapons_Mid", "CampingStoreBackpacks"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E73
            note = "militarylocker @ gunstore",
            coords = {x=1859,y=14145,z=-1},
            dist = {"LiquorStoreBeer", "JanitorCleaning", "DrugLabGuns", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },

        { -- E74
            note = "militarylocker @ gunstore",
            coords = {x=1850,y=14150,z=-1},
            dist = {"CrateFlour", "CrateOilVegetable"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E75
            note = "militarylocker @ gunstore",
            coords = {x=1851,y=14150,z=-1},
            dist = {"CafeKitchenSupplies", "CafeKitchenTea", "CrateSodaBottles"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E76
            note = "militarylocker @ gunstore",
            coords = {x=1850,y=14149,z=-1},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E77
            note = "militarylocker @ gunstore",
            coords = {x=1851,y=14149,z=-1},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E78
            note = "militarylocker @ gunstore",
            coords = {x=1850,y=14148,z=-1},
            dist = {"CrateTortillaChips", "KitchenDryFood"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E79
            note = "militarylocker @ gunstore",
            coords = {x=1851,y=14148,z=-1},
            dist = {"GigamartDryGoods", "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E80
            note = "militarycrate @ gunstore",
            coords = {x=1850,y=14147,z=-1},
            dist = {"CrateFlour", "CrateOilVegetable"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },

        { -- E81
            note = "militarylocker @ gunstore",
            coords = {x=1854,y=14150,z=-1},
            dist = {"CrateFishing", "FishermanTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E82
            note = "militarylocker @ gunstore",
            coords = {x=1855,y=14150,z=-1},
            dist = {"HuntingLockers", "RangerTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E83
            note = "militarylocker @ gunstore",
            coords = {x=1854,y=14149,z=-1},
            dist = {"TheatrePopcorn", "FridgeSoda",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E84
            note = "militarylocker @ gunstore",
            coords = {x=1855,y=14149,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E85
            note = "militarylocker @ gunstore",
            coords = {x=1854,y=14148,z=-1},
            dist = {"MovieRentalShelves"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E86
            note = "militarylocker @ gunstore",
            coords = {x=1855,y=14148,z=-1},
            dist = {"BookstoreBiography", "BookstoreBusiness", "MusicStoreCDs", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E87
            note = "militarycrate @ gunstore",
            coords = {x=1854,y=14147,z=-1},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E88
            note = "militarycrate @ gunstore",
            coords = {x=1855,y=14147,z=-1},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },

        { -- E89
            note = "militarycrate @ gunstore",
            coords = {x=1858,y=14151,z=-1},
            dist = {"LaundryLoad1", "LaundryLoad2", "LaundryLoad3", "LaundryLoad4", "LaundryLoad5", "LaundryLoad6", "LaundryLoad7", "CrateBootsArmy"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E90
            note = "militarycrate @ gunstore",
            coords = {x=1859,y=14151,z=-1},
            dist = {"ArmyStorageOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "ToolStoreOutfit"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(GunClub.objectSpawns, { enabled = "EnableLadders", x = 1831, y = 14111, z = 0, removeFloor = true, clearExisting = true, })
    table.insert(GunClub.objectSpawns, { enabled = "EnableLadders", sprite = "fencing_01_27", x = 1832, y = 14111, z = 0,  })
end

return GunClub