local wtc = {x = 14556, y = 3044, z = -1} -- waterTankCoords
local ELVilleFarm = {
    spawn = { x = 14584, y = 3036, z = 1 },
    waterTanks = {
        { sprite = "industry_02_73", x = wtc.x, y = wtc.y, z = wtc.z, sourceType="generator", source = {x = 14556, y = 3041, z = 0} },
    },
    waterFixtures = {
        { sprite = "fixtures_sinks_01_17", x = 14576, y = 3035, z = 0, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_0", x = 14577, y = 3035, z = 0, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_17", x = 14585, y = 3035, z = 0, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_19", x = 14590, y = 3039, z = 0, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "appliances_laundry_01_7", x = 14592, y = 3038, z = 0, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },

        -- 2nd floor
        { sprite = "fixtures_sinks_01_21", x = 14581, y = 3043, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_21", x = 14581, y = 3042, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_2", x = 14583, y = 3043, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_25", x = 14583, y = 3041, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_1", x = 14581, y = 3038, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_21", x = 14581, y = 3037, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_21", x = 14581, y = 3036, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_26", x = 14582, y = 3035, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },

        -- basement fixtures
        { sprite = "fixtures_sinks_01_8", x = 14566, y = 3033, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_8", x = 14567, y = 3037, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_33", x = 14561, y = 3039, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_3", x = 14563, y = 3039, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "appliances_laundry_01_0", x = 14563, y = 3037, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_2", x = 14561, y = 3037, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
    },
    doorKeys = {
        name = "E Lville Farm",
        doors = {
            { sprite = "fixtures_doors_02_5", x = 14579, y = 3043, z = 0, },
            { sprite = "fixtures_doors_01_28", x = 14576, y = 3068, z = 0, },
            { sprite = "fixtures_doors_01_33", x = 14565, y = 3037, z = -1, },
            { sprite = "fixtures_doors_01_33", x = 14565, y = 3036, z = -1, },
        },
    },
    map = { name = "DWAPStashMap16", },
    generators = {
        {
            -- controls = { sprite = "industry_02_67", x = 14556, y = 3041, z = 0, isProp=true, },
            controls = { sprite = "industry_02_67", x = 14560, y = 3038, z = -1, isProp=true, },
            chunks = {
                {1821, 379},
                {1821, 380},
                {1822, 379},
                {1822, 380},
                {1823, 379},
                {1823, 380},
                {1823, 378},
                {1824, 379},
                {1818, 380},
                {1819, 380},
                {1820, 380},
                {1820, 379},
                {1821, 383},
                {1822, 383},
                {1821, 377},
                {1821, 378},
                {1822, 378},
                {1823, 377},
                {1822, 377},
                {1819, 377},
                {1819, 378},
                {1819, 379},
                {1820, 377},
                {1820, 378},
            },
        },
    },
    objectSpawns = {
        { sprite = "camping_01_16", x = 14592, y = 3045, z = 0, enabled = "EnableWaterSystem", }, -- fountain

        { sprite = "furniture_shelving_01_24", x = 14562, y = 3045, z = 0, clearExisting = false, isContainer = true, },
        { sprite = "furniture_shelving_01_25", x = 14562, y = 3044, z = 0, clearExisting = false, isContainer = true, },
        { sprite = "carpentry_01_16", x = 14562, y = 3043, z = 0, renderYOffset = 0, clearExisting = false, isContainer = true, },
        { sprite = "carpentry_01_16", x = 14562, y = 3043, z = 0, renderYOffset = 32, clearExisting = false, isContainer = true, },
        { sprite = "carpentry_01_16", x = 14562, y = 3042, z = 0, renderYOffset = 0, clearExisting = false, isContainer = true, },
        { sprite = "carpentry_01_16", x = 14562, y = 3042, z = 0, renderYOffset = 32, clearExisting = false, isContainer = true, },
        { x = 14563, y = 3042, z = 0, clearExisting = true, },

        { sprite = "fixtures_doors_frames_01_9", x = 14578, y = 3036, z = 0, replaceWall = true, clearExisting = true, },
        { sprite = "walls_interior_house_02_59", x = 14578, y = 3036, z = 0, },
        { sprite = "walls_interior_house_02_48", x = 14578, y = 3036, z = 0, },
        { sprite = "fixtures_doors_01_5", x = 14578, y = 3036, z = 0, isDoor = true, doorN = true, },

        -- { sprite = "industry_02_64", x = 14553, y = 3041, z = 0, enabled = "EnableGenSystem", clearExisting = true, }, -- generator
        -- { sprite = "industry_02_68", x = 14553, y = 3040, z = 0, enabled = "EnableGenSystem", clearExisting = true, },
        -- { sprite = "industry_02_65", x = 14554, y = 3041, z = 0, enabled = "EnableGenSystem", clearExisting = true, },
        -- { sprite = "industry_02_69", x = 14554, y = 3040, z = 0, enabled = "EnableGenSystem", clearExisting = true, },
        -- { sprite = "industry_02_66", x = 14555, y = 3041, z = 0, enabled = "EnableGenSystem", clearExisting = true, },
        -- { sprite = "industry_02_70", x = 14555, y = 3040, z = 0, enabled = "EnableGenSystem", clearExisting = true, },
        -- { sprite = "industry_02_67", x = 14556, y = 3041, z = 0, enabled = "EnableGenSystem", clearExisting = true, },
        -- { sprite = "industry_02_71", x = 14556, y = 3040, z = 0, enabled = "EnableGenSystem", clearExisting = true, },

        -- { x = 14575, y = 3032, z = -1, clearExisting = true, },
        -- { x = 14575, y = 3033, z = -1, clearExisting = true, },

        -- -- shelf replacements
        -- { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+7, z = -1, renderYOffset = 0, enabled = "Loot", clearExisting = true, isContainer = true, },
        -- { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+7, z = -1, renderYOffset = 32, enabled = "Loot", clearExisting = false, isContainer = true, },
        -- { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+6, z = -1, renderYOffset = 0, enabled = "Loot", clearExisting = true, isContainer = true, },
        -- { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+6, z = -1, renderYOffset = 32, enabled = "Loot", clearExisting = false, isContainer = true, },
        -- { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+5, z = -1, renderYOffset = 0, enabled = "Loot", clearExisting = true, isContainer = true, },
        -- { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+5, z = -1, renderYOffset = 32, enabled = "Loot", clearExisting = false, isContainer = true, },
        -- { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y, z = -1, renderYOffset = 0, enabled = "Loot", clearExisting = true, isContainer = true, },
        -- { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y, z = -1, renderYOffset = 32, enabled = "Loot", clearExisting = false, isContainer = true, },
        -- { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+1, z = -1, renderYOffset = 0, enabled = "Loot", clearExisting = true, isContainer = true, },
        -- { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+1, z = -1, renderYOffset = 32, enabled = "Loot", clearExisting = false, isContainer = true, },

        -- { sprite = "furniture_tables_high_01_16", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+2, z = -1, clearExisting = true },
        -- { sprite = "appliances_com_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+2, z = -1,  IsoType = "IsoRadio" }, -- renderYOffset = 34,
        { barricade = "wood", enabled = "Barricade", target="location_shop_bargNclothes_01_32", x = 14564, y = 3043, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_exterior_house_01_41", x = 14574, y = 3046, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_exterior_house_01_41", x = 14576, y = 3046, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="location_restaurant_pileocrepe_01_8", x = 14573, y = 3036, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_interior_house_02_57", x = 14585, y = 3035, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_exterior_house_01_41", x = 14591, y = 3040, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_exterior_house_01_41", x = 14586, y = 3044, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_exterior_house_01_41", x = 14583, y = 3044, z = 0, },
    },
    loot = {
        { -- cardboardbox in orange bunk room
            type = 'container',
            coords = {x=14572,y=3031,z=-1},
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- east bluish bunk room
            type = 'container',
            coords = {x=14577,y=3039,z=-1},
            sandboxEnable = 'Loot',
            special = "essentials",
        },
        { -- center hallway crates
            type = 'container',
            coords = {x=14576,y=3035,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        {
            type = 'container',
            coords = {x=14573,y=3035,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        {
            type = 'container',
            coords = {x=14570,y=3035,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        -- crates by stairs
        {
            type = 'container',
            coords = {x=14584,y=3034,z=-1},
            dist = {"CrateRandomJunk", "RandomFiller", "CrateLiquor", "LiquorStoreWhiskey"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=14584,y=3035,z=-1},
            dist = {"LiquorStoreBeer","LiquorStoreBeerFancy","CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=14584,y=3036,z=-1},
            dist = {"CrateGravelBags", "CrateSandBags", "CrateClayBags"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- north gray bunk room
            type = 'container',
            coords = {x=14575,y=3033,z=-1},
            dist = {"GasStoreEmergency","StoreCounterTobacco", "BurglarTools", "CarpenterTools", "BarnTools","SafehouseArmor", "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- north gray bunk room
            type = 'container',
            coords = {x=14577,y=3031,z=-1},
            dist = {"CrateLiquor", "DishCabinetVIPLounge", "MusicStoreCDs", "CrateVHSTapes", "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- north orange bunk room
            type = 'container',
            coords = {x=14574,y=3031,z=-1},
            dist = {"CrateLiquor", "ArmyStorageOutfit", "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateLinens"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- south gray bunk room (foot locker)
            type = 'container',
            coords = {x=14572,y=3037,z=-1},
            dist = {"SewingStoreTools"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- south gray bunk room (lockers)
            type = 'container',
            coords = {x=14574,y=3039,z=-1},
            dist = {"CrateLiquor", "MusicStoreCDs", "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "CrateLinens"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        -- security/armory
        {
            type = 'container',
            coords = {x=14569,y=3033,z=-1},
            dist = {"SafehouseTraps","GunStoreKnives","CampingStoreBackpacks","CrateLiquor", "CarSupplyTools","GasStorageMechanics","DrugLabOutfit"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=14569,y=3032,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=14569,y=3031,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=14571,y=3033,z=-1},
            dist = {"ArmySurplusMisc", "GunStoreGuns", "GunStoreMagsAmmo", "GunStoreAmmunition", "GunStoreAccessories", "DrugShackWeapons" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        -- infirmary
        {
            type = 'container',
            coords = {x=14571,y=3038,z=-1},
            dist = {"TestingLab","MedicalCabinet",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        {
            type = 'container',
            coords = {x=14571,y=3039,z=-1},
            dist = {"ArmyStorageMedical", "ArmyBunkerMedical"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        {
            type = 'container',
            coords = {x=14567,y=3037,z=-1},
            dist = {"MedicalClinicDrugs", "SafehouseMedical" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        {
            type = 'container',
            coords = {x=14567,y=3039,z=-1},
            dist = {"CrateRandomJunk", "RandomFiller", "ArmySurplusMisc", "MedicalOfficeBooks" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=14569,y=3037,z=-0.5},
            dist = {"MedicalCabinet" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        -- shooting range
        {
            type = 'container',
            coords = {x=14563,y=3031,z=-1},
            dist = {"SafehouseTraps",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=14562,y=3031,z=-1},
            dist = {"ArmySurplusMisc","ArmyStorageAmmunition", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=14561,y=3031,z=-1},
            dist = { "GunStoreKnives", "PawnShopKnives",  },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=14560,y=3031,z=-1},
            dist = { "SafehouseArmor", "SafehouseArmor_Late", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=14559,y=3031,z=-1},
            dist = { "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=14558,y=3031,z=-1},
            dist = {"CrateRandomJunk","GunStoreMagsAmmo", "GunStoreAmmunition", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=14557,y=3031,z=-1},
            dist = { "GunStoreKnives", "PawnShopKnives",  },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=14556,y=3031,z=-1},
            dist = {"LiquorStoreBeer", "JanitorCleaning", "DrugLabGuns", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        -- bathroom
        {
            type = 'container',
            coords = {x=14561,y=3037,z=-0.5},
            dist = {"SafehouseMedical", "BathroomCounter", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        {
            type = 'container',
            coords = {x=14561,y=3037,z=-1},
            dist = {"LaundryCleaning", "JanitorCleaning", "BathroomCounter", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        -- workroom/ utility room
        {
            type = 'container',
            coords = {x=14555,y=3037,z=-1},
            dist = {"GardenStoreTools", "Homesteading", "CrateLinens", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        {
            type = 'container',
            coords = {x=14555,y=3038,z=-1},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        {
            type = 'container',
            coords = {x=14560,y=3040,z=-1},
            dist = {"BurglarTools", "CarpenterTools", "BarnTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=14560,y=3042,z=-1},
            dist = {"LoggingFactoryTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- double crate
            type = 'container',
            coords = {x=14560,y=3046,z=-1},
            dist = {"ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=14559,y=3046,z=-1},
            dist = {"CrateBlacksmithing" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=14558,y=3046,z=-1},
            dist = {"ArtStorePottery","CrateMasonry" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },

        -- kitchen
        {
            type = 'container',
            coords = {x=14568,y=3033,z=-1},
            dist = {"FreezerIceCream", "WesternKitchenFreezer", "BakeryKitchenFreezer"},
            distIncludeJunk = true,
            randUntilFull = true,
            frozen = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=14568,y=3032,z=-1},
            dist = {"SushiKitchenFreezer", "WesternKitchenFreezer", "FreezerRich"},
            distIncludeJunk = true,
            randUntilFull = true,
            frozen = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=14568,y=3031,z=-1},
            dist = {"ArenaKitchenFreezer", "WesternKitchenFreezer", "BakeryKitchenFreezer"},
            distIncludeJunk = true,
            randUntilFull = true,
            frozen = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=14566,y=3031,z=-1},
            dist = {"CrateFlour", "CrateOilVegetable"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=14566,y=3031,z=-0.5},
            dist = {"CafeKitchenSupplies", "CafeKitchenTea", "CrateSodaBottles"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=14566,y=3032,z=-0.5},
            dist = {"ButcherSpices","GigamartSpices","GroceryBagGourmet",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=14566,y=3033,z=-1},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=14566,y=3033,z=-0.5},
            dist = {"CrateLiquor", "DishCabinetVIPLounge"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },

        -- first floor
        {
            type = 'container',
            coords = {x=14576,y=3035,z=0},
            dist = {"MedicalCabinet", "SafehouseMedical" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        {
            type = 'container',
            coords = {x=14573,y=3035,z=0},
            dist = {"CrateTortillaChips", "KitchenDryFood"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=14574,y=3035,z=0},
            dist = {"GigamartDryGoods", "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=14575,y=3035,z=0},
            dist = {"CrateFishing", "FishermanTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        {
            type = 'container',
            coords = {x=14575,y=3036,z=0},
            dist = {"HuntingLockers", "RangerTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        {
            type = 'container',
            coords = {x=14573,y=3037,z=0},
            dist = {"CrateToiletPaper", "CrateLinens"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=14573,y=3038,z=0},
            dist = {"CrateLumber", "CrateSheetMetal"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=14574,y=3038,z=0},
            dist = {"WeldingWorkshopMetal"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        -- living room
        {
            type = 'container',
            coords = {x=14573,y=3039,z=0},
            dist = {"LockerArmyBedroomHome", "BookstoreMilitaryHistory"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        {
            type = 'container',
            coords = {x=14573,y=3044,z=0},
            dist = {"BookstoreBiography", "BookstoreBusiness", "MusicStoreCDs", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        {
            type = 'container',
            coords = {x=14573,y=3045,z=0},
            dist = {"BookstoreBiography", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        -- kitchen
        {
            type = 'container',
            coords = {x=14584,y=3039,z=0.5},
            dist = {"TheatrePopcorn", "FridgeSoda",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=14589,y=3036,z=0},
            dist = {"FreezerRich", "ArenaKitchenFreezer",},
            distIncludeJunk = true,
            randUntilFull = true,
            frozen = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=14584,y=3035,z=0},
            dist = {"CrateFlour", "CrateOilVegetable"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=14585,y=3035,z=0},
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=14586,y=3035,z=0},
            dist = {"ButcherSpices","GigamartSpices","GroceryBagGourmet","CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=14587,y=3035,z=0},
            dist = {"KitchenDryFood",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=14588,y=3039,z=0},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=14590,y=3039,z=0},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=14591,y=3039,z=0},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=14592,y=3039,z=0},
            items = {
                { name = 'TvWideScreen', chance = 1, count = {1,1} },
                { name = 'Base.Remote', chance = 1, count = {1,3} },
                { name = 'Base.VideoGame', chance = 1, count = {3,3} },
                { name = 'Base.Headphones', chance = 1, count = {3,3} },
                { name = 'Base.CDplayer', chance = 1, count = {3,3} },
                { name = 'Base.Bullhorn', chance = 0.5, count = {1,1} },
            },
        },
        {
            type = 'container',
            coords = {x=14592,y=3039,z=0},
            dist = {"MovieRentalShelves"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        -- 2nd floor
        {
            type = 'container',
            coords = {x=14573,y=3037,z=1},
            dist = {"SewingStoreTools"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        {
            type = 'container',
            coords = {x=14573,y=3037,z=1},
            dist = {"SewingStoreFabric"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        {
            type = 'container',
            coords = {x=14577,y=3039,z=1},
            dist = {"CrateCannedFood", "ArmySurplusTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=14577,y=3038,z=1},
            dist = {"CrateCannedFood", "ArmySurplusTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=14579,y=3040,z=1},
            dist = {"SafehouseArmor", "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=14579,y=3041,z=1},
            dist = {"ArmyStorageOutfit", "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateLinens"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=14581,y=3042,z=1},
            dist = {"MedicalClinicTools", "MedicalStorageDrugs"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        {
            type = 'container',
            coords = {x=14573,y=3040,z=1},
            dist = {"CrateLeather"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        {
            type = 'container',
            coords = {x=14575,y=3043,z=1},
            dist = {"LaundryLoad1", "LaundryLoad2", "LaundryLoad3", "LaundryLoad4", "LaundryLoad5", "LaundryLoad6", "LaundryLoad7", "LaundryLoad8"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=14576,y=3043,z=1},
            dist = {"ArmyStorageOutfit", "DrugLabOutfit"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=14585,y=3038,z=1},
            dist = {"SafehouseArmor", "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=14586,y=3038,z=1},
            dist = {"ArmyStorageOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "ToolStoreOutfit"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=14584,y=3035,z=1},
            dist = {"CrateLiquor", "DishCabinetVIPLounge"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=14581,y=3036,z=1},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        {
            type = 'container',
            coords = {x=14584,y=3041,z=1},
            dist = {"BookstoreBiography", "BookstoreBusiness", "MusicStoreCDs", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },

        -- shed
        {
            type = 'container',
            coords = {x=14573,y=3069,z=0.5},
            dist = {"ArmyStorageElectronics", "RandomFiller" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=14573,y=3068,z=0.5},
            dist = {"ToolFactoryHandles" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=14573,y=3065,z=0},
            dist = {"GasStoreEmergency"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = 2,
        },
        -- barn
        {
            type = 'container',
            coords = {x=14557,y=3040,z=0},
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=14558,y=3040,z=0},
            dist = {"CrateLumber"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=14563,y=3040,z=0},
            dist = {"CrateTools", "GarageTools", "BarnTools", "MetalShopTools", "MetalWorkerTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
        },
        coords = {x=14563,y=3041,z=0},
        dist = {"ArmyStorageAmmunition", },
        distIncludeJunk = true,
        randUntilFull = true,
        level = "Loot_GunLevel",
        {
            type = 'container',
            coords = {x=14562,y=3043,z=0},
            dist = {"CrateSheetMetal", "CrateLumber", },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=14562,y=3044,z=0},
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = {9,12} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        {
            type = 'container',
            coords = {x=14562,y=3045,z=0},
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        {
            type = 'container',
            coords = {x=14552,y=3040,z=0},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming", "MetalShopTools", "MetalWorkerTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        {
            type = 'container',
            coords = {x=14549,y=3040,z=0},
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = {8,10} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
    },
}

return ELVilleFarm