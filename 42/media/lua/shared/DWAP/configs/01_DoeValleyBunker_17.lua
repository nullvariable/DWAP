-- @TODO (2026-08-07 audit) unresolved - delete lines as they are fixed
--   * solar is UNVERIFIED - every systems run so far skipped it ("ISA mod
--     inactive or EnableGenSystemSolar off"). Definitions now live in
--     configs/ISA/01_DoeValleyBunker_17.lua and only load when ISA is active;
-- solar should be fine when we get it patched, no map changes to adjust for.
--     a run with ISA loaded is still owed. Applies to all 38 solar configs
--   * the only config with an empty objectSpawns table, yet it has a surface
--     door at 5576,9375,z=0 - confirm with FindUnbarricaded() that no
--     barricades are wanted here
-- no barricades, the location is fully underground and we don't want to block the only entrance/exit

--- Notes:
--- Lives in the woods, remote with poor car access
--- fairly small but low local zombies and plenty of room to
--- do custom building. Not a bad walk West to Doe Valley which is
--- a small town with a big survivalist gun store, mechanic, gas station,
--- clinic, grocery, and restaurant
local DoeValleyBunker = {
    group = "Doe Valley",
    baseBuildings = {
        { x = 5576, y = 9365, z = -1}, -- bunker
    },
    spawn = { x = 5576, y = 9365, z = -1 },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = 5579, y = 9372, z = -1, sourceType="generator", source = {x = 5583, y = 9371, z = -1} },
    },
    waterFixtures = {
        { sprite = "fixtures_bathroom_01_6", x = 5577, y = 9371, z = -1, sourceType="tank", source = 1 },
        { sprite = "fixtures_sinks_01_16", x = 5575, y = 9367, z = -1, sourceType="tank", source = 1 },
        { sprite = "appliances_laundry_01_1", x = 5578, y = 9373, z = -1, sourceType="tank", source = 1 },
    },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 5583, y = 9372, z = -1 },
            fuelTank = { sprite = "dwap_tiles_01_24", x= 5581, y= 9372, z= -1, },
            fakeGenerators = {
                { x = 5579, y = 9370, z = -1, },
            },
        },
    },
    doorKeys = {
        name = "Doe Valley Bunker",
        doors = {
            { sprite = "fixtures_doors_01_53", x = 5576, y = 9375, z = 0, },
            { sprite = "fixtures_doors_01_53", x = 5576, y = 9372, z = -1, },
        },
    },
    map = { name = "DWAPStashMap1", },
    objectSpawns = {

    },
    loot = {
        { -- E1 cabinet next to bunk beds (9365)
            note = "dresser @ bunker",
            coords = {x=5575,y=9365,z=-1},
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E2 upper
            note = "overhead @ bunker",
            coords = {x=5575,y=9366,z=-1},
            slot = "upper",
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E3 lower (66)
            note = "counter @ bunker",
            coords = {x=5575,y=9366,z=-1},
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E4 upper
            note = "overhead @ bunker",
            coords = {x=5575,y=9367,z=-1},
            slot = "upper",
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E5 lower (67)
            sprite = 'location_trailer_02_19',
            note = "counter @ bunker",
            coords = {x=5575,y=9367,z=-1},
            dist = {"TestingLab","MedicalCabinet","ArmyStorageMedical", "ArmyBunkerMedical"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- E6 upper
            sprite = 'location_trailer_02_23',
            note = "overhead @ bunker",
            coords = {x=5575,y=9368,z=-1},
            slot = "upper",
            dist = {"CrateFishing", "FishermanTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E7 lower (68)
            sprite = 'location_trailer_02_19',
            note = "counter @ bunker",
            coords = {x=5575,y=9368,z=-1},
            dist = {"SewingStoreTools"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- E8 index 8, fridge/freezer
            note = "fridge @ bunker",
            coords = {x=5575,y=9369,z=-1},
            dist = {"FridgeFarmStorage", "FridgeGeneric"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E9 index 9, fridge/freezer
            slot = "freezer",
            note = "freezer @ bunker",
            coords = {x=5575,y=9369,z=-1},
            dist = {"FreezerIceCream", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E10 metal shelves (70)
            sprite = 'location_trailer_02_23',
            note = "metal_shelves @ bunker",
            coords = {x=5575,y=9370,z=-1},
            dist = {"GardenStoreTools", "Homesteading", "CrateLinens", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E11 metal shelves (71)
            note = "metal_shelves @ bunker",
            coords = {x=5575,y=9371,z=-1},
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E12 next to inner door (9372)
            note = "metal_shelves @ bunker",
            coords = {x=5575,y=9372,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E13 (73)
            note = "metal_shelves @ bunker",
            coords = {x=5575,y=9373,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E14 (9374)
            note = "metal_shelves @ bunker",
            coords = {x=5575,y=9374,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E15 far end next to stairs (9375)
            note = "metal_shelves @ bunker",
            coords = {x=5575,y=9375,z=-1},
            special = "essentials",
        },
        { -- E16
            stack = 1,
            note = "militarycrate @ bunker",
            coords = {x=5577,y=9368,z=-1},
            dist = {"CrateLiquor", "DishCabinetVIPLounge", "MusicStoreCDs", "CrateVHSTapes", "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E17
            stack = 2,
            note = "militarycrate @ bunker",
            coords = {x=5577,y=9368,z=-1},
            dist = {"MeleeWeapons", "MeleeWeapons_Mid", "SafehouseTraps","CampingLockers"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E18
            stack = 1,
            note = "militarycrate @ bunker",
            coords = {x=5577,y=9369,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E19
            stack = 2,
            note = "militarycrate @ bunker",
            coords = {x=5577,y=9369,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E20
            stack = 1,
            note = "militarycrate @ bunker",
            coords = {x=5577,y=9370,z=-1},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- E21
            stack = 2,
            note = "militarycrate @ bunker",
            coords = {x=5577,y=9370,z=-1},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },

        -- extra spawns. Both crate stacks used to repeat the lower crate's dist
        -- list verbatim on the upper one, so a stack of two read as one big
        -- container. Each ordinal now takes a different half of its theme:
        -- more to find, same categories present in the base overall.
        { -- E22 9363 lower: hand tools and safehouse hardware
            note = "crate @ bunker",
            coords = {x=5577,y=9363,z=-1},
            stack = 1,
            dist = {"BurglarTools", "CarpenterTools", "BarnTools","SafehouseArmor", "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E23 9363 upper: the base's only build-materials source - every other
          -- level appears somewhere in this config, Loot_BuildMatsLevel did
          -- not, and stockpiled lumber suits a prepper bunker
            
            note = "crate @ bunker",
            coords = {x=5577,y=9363,z=-1},
            stack = 2,
            dist = {"CrateLumber", "CrateSheetMetal", "CrateMasonry", "ArtStorePottery"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E24 9364 lower: defence and vehicle gear
            note = "crate @ bunker",
            coords = {x=5577,y=9364,z=-1},
            stack = 1,
            dist = {"SafehouseTraps","GunStoreKnives","CarSupplyTools"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E25 9364 upper: camping, comfort and outfits
            note = "crate @ bunker",
            coords = {x=5577,y=9364,z=-1},
            stack = 2,
            dist = {"CampingStoreBackpacks","CrateLiquor","DrugLabOutfit","GasStoreEmergency","StoreCounterTobacco"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },

        -- addon room
        { -- E26
            note = "clothingwasher @ warehouse",
            coords = {x = 5578, y = 9373, z = -1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E27 [20]
            note = "counter @ warehouse",
            coords = {x = 5581, y = 9376, z = -1},
            dist = {"HuntingLockers", "RangerTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E28
            note = "counter @ warehouse",
            coords = {x = 5582, y = 9376, z = -1},
            dist = {"BurglarTools", "CarpenterTools", "BarnTools","SafehouseArmor", "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E29
            note = "counter @ warehouse",
            coords = {x = 5583, y = 9376, z = -1},
            dist = {"CarSupplyTools", "GasStorageMechanics", "CampingLockers"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E30
            note = "counter @ warehouse",
            coords = {x = 5584, y = 9376, z = -1},
            dist = {"SafehouseTraps","GunStoreKnives","CampingStoreBackpacks","CrateLiquor",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E31
            note = "counter @ warehouse",
            coords = {x = 5584, y = 9375, z = -1},
            dist = {"GasStoreEmergency","StoreCounterTobacco"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E32
            note = "counter @ warehouse",
            coords = {x = 5584, y = 9374, z = -1},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
    },
}

return DoeValleyBunker
