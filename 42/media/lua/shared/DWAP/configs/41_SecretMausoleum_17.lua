-- @TODO (2026-08-07 audit) unresolved - delete lines as they are fixed
--   * entries 1,2,3,4,5,6,7,8,9,10,11: square holds no container at all -
--     coords are stale or the object was removed
--   * systems: generator controls declare industry_02_67 but no such object
--     is on the square. 11 configs name that sprite and ALL 11 fail, while 32
--     configs use dwap_tiles_01_22 - the maps look to have moved on and these
--     configs did not. Confirm what is actually there before editing
--   * systems: 4 components at 8136-8139,11510-11513 z=0 name a sprite that
--     is not on the square, though the square itself loads - config drifted
--     from the map
--   * every loot entry fails with "no containers on square" - the whole table
--     addresses squares that hold no container, so this is a re-pick, not a
--     per-entry fix
local wtc1 = {x = 8146, y = 11509, z = -2,}
local pb1  = {x = 8145, y = 11509, z = -2,}
local SecretMausoleum = {
    group = "",
    baseBuildings = {
        { x = 8143, y = 11515, z = 0 }, -- church
        { x = 8141, y = 11513, z = -1 }, -- Mausoleum
    },
    spawn = { x = 8143, y = 11515, z = 0 },
    generators = {
        {
            controls = { sprite = "industry_02_67", x = pb1.x-1, y = pb1.y, z = pb1.z, },
            fakeGenerators = {
                { x = 8131, y = 11519, z = -1 },
            },
        },
    },
    waterTanks = {
        { sprite = "dwap_tiles_01_8", x = wtc1.x, y = wtc1.y, z = wtc1.z, sourceType="generator", source = 1 },
    },
    waterFixtures = {
        { sprite = "fixtures_sinks_01_9", x = 8136, y = 11510, z = 0, sourceType="tank", source = 1 },
        { sprite = "fixtures_sinks_01_13", x = 8138, y = 11513, z = 0, sourceType="tank", source = 1 },
        { sprite = "fixtures_bathroom_01_32", x = 8138, y = 11511, z = 0, sourceType="tank", source = 1 },
        { sprite = "fixtures_bathroom_01_0", x = 8139, y = 11511, z = 0, sourceType="tank", source = 1 },
        { sprite = "fixtures_sinks_01_16", x = 8137, y = 11508, z = -2, sourceType="tank", source = 1 },
    },
    doorKeys = {
        name = "Secret Mausoleum Key",
        doors = {
            { sprite = "fixtures_doors_02_5", x = 8141, y = 11516, z = 0, },
            { sprite = "fixtures_doors_02_5", x = 8130, y = 11516, z = -1, },
        },
    },
    map = { name = "DWAPStashMap41", },
    objectSpawns = {

        { barricade = "metal", enabled = "Barricade", target="fixtures_windows_01_1", x = 8139, y = 11517, z = 0, },
        { barricade = "metal", enabled = "Barricade", target="fixtures_windows_01_1", x = 8143, y = 11517, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target="fixtures_windows_01_1", x = 8136, y = 11510, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target="walls_exterior_house_02_24", x = 8145, y = 11512, z = 0, },

    },
    loot = {
        -- main house
        -- kitchen
        { -- E1
            type = 'container',
            coords = {x=8135,y=11513,z=0},
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E2
            type = 'container',
            coords = {x=8135,y=11510,z=0},
            dist = {"CrateFlour", "CrateOilVegetable", "CafeKitchenSupplies", "CafeKitchenTea", "CrateSodaBottles"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E3
            type = 'container',
            coords = {x=8136,y=11510,z=0},
            dist = {"CrateFishing","MusicStoreCDs"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E4
            type = 'container',
            coords = {x=8137,y=11510,z=0},
            dist = {"GigamartDryGoods", "CrateCannedFood", "KitchenCannedFood", "CrateLiquor", "StoreCounterTobacco"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E5 fridge
            type = 'container',
            coords = {x=8137,y=11511,z=0},
            dist = {"FridgeFarmStorage", "FreezerIceCream"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E6 mini fridge
            type = 'container',
            coords = {x=8137,y=11512,z=0},
            dist = {"FreezerIceCream", "WesternKitchenFreezer", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- bathroom
        { -- E7
            type = 'container',
            coords = {x=8138,y=11513,z=0},
            slot = "upper",
            dist = {"MedicalCabinet", "GasStoreToiletries"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        -- living room
        { -- E8
            type = 'container',
            coords = {x=8140,y=11511,z=0},
            dist = {"SafehouseFireplace", "SafehouseLighting", "LivingRoomShelfClassy" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        -- bedrooms
        { -- E9
            type = 'container',
            coords = {x=8143,y=11514,z=0},
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E10
            type = 'container',
            coords = {x=8144,y=11513,z=0},
            dist = {"GunStoreKnives","ClothingStorageWinter",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        -- entrance hall
        { -- E11
            type = 'container',
            coords = {x=8138,y=11510,z=0},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },

        -- below crypts
        -- crates by stairs
        { -- E12
            type = 'container',
            coords = {x=8128,y=11520,z=-2},
            dist = {"MeleeWeapons", "MeleeWeapons_Mid", "CrateBootsArmy", "CampingStoreBackpacks"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E13
            type = 'container',
            coords = {x=8129,y=11520,z=-2},
            dist = {"SafehouseMedical_Late", "StoreShelfMedical", "ArmyStorageMedical", "ArmyBunkerMedical" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        -- chests by cots
        { -- E14
            type = 'container',
            coords = {x=8128,y=11515,z=-2},
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E15
            type = 'container',
            coords = {x=8128,y=11512,z=-2},
            dist = { "SafehouseArmor", "SafehouseArmor_Late", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E16
            type = 'container',
            coords = {x=8128,y=11509,z=-2},
            dist = { "SafehouseTraps", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E17
            type = 'container',
            coords = {x=8132,y=11512,z=-2},
            dist = {"LiquorStoreBeer", "JanitorCleaning", "DrugLabGuns", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E18
            type = 'container',
            coords = {x=8132,y=11509,z=-2},
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.Sheet', },
                { name = 'Base.WoodAxe', },
                { name = 'Base.Machete', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        -- crates by cots
        { -- E19
            type = 'container',
            coords = {x=8131,y=11513,z=-2},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E20
            type = 'container',
            coords = {x=8132,y=11513,z=-2},
            dist = {"ToolStoreMetalwork","CrateBlacksmithing", "BurglarTools", "CarpenterTools", "BarnTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        -- shelving
        { -- E21
            type = 'container',
            coords = {x=8135,y=11508,z=-2},
            dist = {"CrateTailoring", "CrateFabric_Cotton", "CrateFabric_DenimBlack", "CrateLeather","SewingStoreFabric"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- E22
            type = 'container',
            coords = {x=8135,y=11509,z=-2},
            dist = {"CrateBlacksmithing" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E23
            type = 'container',
            coords = {x=8135,y=11510,z=-2},
            dist = {"BurglarTools", "CarpenterTools", "BarnTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E24
            type = 'container',
            coords = {x=8135,y=11511,z=-2},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E25
            type = 'container',
            coords = {x=8135,y=11512,z=-2},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E26
            type = 'container',
            coords = {x=8135,y=11513,z=-2},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E27
            type = 'container',
            coords = {x=8137,y=11512,z=-2},
            dist = {"SafehouseMedical" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E28
            type = 'container',
            coords = {x=8137,y=11513,z=-2},
            special = "essentials",
        },
        -- kitchen cabinets
        { -- E29
            type = 'container',
            coords = {x=8137,y=11508,z=-2},
            dist = {"CrateTortillaChips", "KitchenDryFood", "JanitorCleaning"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E30
            type = 'container',
            coords = {x=8137,y=11509,z=-2},
            dist = {"CrateFlour", "CrateOilVegetable"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E31 fridge
            type = 'container',
            coords = {x=8137,y=11511,z=-2},
            dist = {"FridgeFarmStorage", "FreezerIceCream"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        -- crates
        { -- E32
            type = 'container',
            coords = {x=8144,y=11513,z=-2},
            dist = {"CrateToiletPaper", "CrateLinens", "BathroomCounter", "GasStoreToiletries",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E33
            type = 'container',
            coords = {x=8145,y=11513,z=-2},
            dist = {"CrateLumber", "CrateSheetMetal", "CrateClayBags", "CrateMasonry"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(SecretMausoleum.objectSpawns, { enabled = "EnableLadders", x = 8128, y = 11514, z = 0, removeFloor = true, })
    table.insert(SecretMausoleum.objectSpawns, { enabled = "EnableLadders", x = 8128, y = 11515, z = -1, removeWall = "north", })
end

return SecretMausoleum