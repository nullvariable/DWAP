local wtc = {x = 8177, y = 11259, z = -1}
local RosewoodGas = {
    spawn = { x = 8179, y = 11269, z = 1 },
    generators = {
        {
            controls = { sprite = "industry_02_67", x = 8172, y = 11255, z = -1, },
            chunks = {
                {1021, 1408},
                {1021, 1409},
                {1022, 1407},
                {1022, 1408},
                {1022, 1409},
                {1023, 1408},
                {1023, 1409},
                -- gas pumps
                {1019, 1407},
                {1019, 1408},
                {1018, 1407},
                {1018, 1408},
                {1017, 1407},
                {1017, 1408},
                {1020, 1406},
                {1020, 1407},
                {1021, 1406},
                {1021, 1407},
                {1021, 1404},
                {1021, 1405},
            },
        },
    },
    waterTanks = {
        { sprite = "industry_02_73", x = wtc.x, y = wtc.y, z = wtc.z, sourceType="generator", source = {x = 8172, y = 11255, z = -1} },
        { sprite = "industry_02_73", x = 8168, y = 11255, z = -1, },
    },
    waterFixtures = {
        -- basement
        { sprite = "fixtures_sinks_01_5", x = 8180, y = 11267, z = -1, sourceType="tank", source = wtc },
        { sprite = "fixtures_bathroom_01_4", x = 8181, y = 11267, z = -1, sourceType="tank", source = wtc },
        -- 1st floor
        { sprite = "fixtures_sinks_01_19", x = 8182, y = 11272, z = 0, sourceType="tank", source = wtc },
        -- 2nd floor
        { sprite = "fixtures_sinks_01_8", x = 8175, y = 11268, z = 1, sourceType="tank", source = wtc },
        { sprite = "fixtures_bathroom_01_52", x = 8180, y = 11272, z = 1, sourceType="tank", source = wtc },
        { sprite = "fixtures_bathroom_01_3", x = 8181, y = 11272, z = 1, sourceType="tank", source = wtc },
        { sprite = "fixtures_bathroom_01_37", x = 8182, y = 11272, z = 1, sourceType="tank", source = wtc },
    },
    doorKeys = {
        name = "Rosewood Gas Station Key",
        doors = {
            { sprite = "fixtures_doors_02_4", x = 8175, y = 11268, z = 0, },
            { sprite = "fixtures_doors_01_56", x = 8174, y = 11260, z = -1, },
        },
    },
    map = {name = "DWAPStashMap7",},
    objectSpawns = {
        { sprite = "camping_01_16", x = 8190, y = 11270, z = 0, enabled = "EnableWaterSystem", }, -- fountain

        -- { sprite = "industry_02_64", x = 8178, y = 11259, z = -1, enabled = "EnableGenSystem", clearExisting = true, }, -- generator
        -- { sprite = "industry_02_68", x = 8178, y = 11258, z = -1, enabled = "EnableGenSystem", clearExisting = true, },
        -- { sprite = "industry_02_65", x = 8179, y = 11259, z = -1, enabled = "EnableGenSystem", clearExisting = true, },
        -- { sprite = "industry_02_69", x = 8179, y = 11258, z = -1, enabled = "EnableGenSystem", clearExisting = true, },
        -- { sprite = "industry_02_66", x = 8180, y = 11259, z = -1, enabled = "EnableGenSystem", clearExisting = true, },
        -- { sprite = "industry_02_70", x = 8180, y = 11258, z = -1, enabled = "EnableGenSystem", clearExisting = true, },
        -- { sprite = "industry_02_67", x = 8181, y = 11259, z = -1, enabled = "EnableGenSystem", clearExisting = true, },
        -- { sprite = "industry_02_71", x = 8181, y = 11258, z = -1, enabled = "EnableGenSystem", clearExisting = true, },

        { sprite = "walls_commercial_03_35", x = 8176, y = 11260, z = -1, removeWall = "west", clearExisting = true, },
        -- { sprite = "walls_exterior_wooden_01_38", x = 8175, y = 11261, z = -1 },
        -- { sprite = "fixtures_doors_frames_01_8", x = 8175, y = 11261, z = -1 },
        -- { sprite = "fixtures_doors_01_28", x = 8175, y = 11261, z = -1, isDoor = true, doorN = false, },
        { sprite = "walls_commercial_03_49", x = 8175, y = 11260, z = -1,  },
        { sprite = "floors_exterior_street_01_16", x = 8175, y = 11260, z = -1, isFloor = true, },
        { sprite = "walls_commercial_03_49", x = 8175, y = 11261, z = -1 },

        { sprite = "appliances_cooking_01_17", x = 8179, y = 11267, z = 1, isFireplace = true,},

        { barricade = "woodhalf", enabled = "Barricade", target="walls_commercial_01_40", x = 8175, y = 11271, z = 0, },
        { barricade = "wood", enabled = "Barricade", target="walls_commercial_01_40", x = 8175, y = 11270, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_doors_02_4", x = 8175, y = 11268, z = 0, },
        { barricade = "metal", enabled = "Barricade", target="walls_commercial_01_40", x = 8176, y = 11264, z = 0, },
        { barricade = "metal", enabled = "Barricade", target="walls_commercial_01_40", x = 8176, y = 11263, z = 0, },
        { barricade = "metal", enabled = "Barricade", target="walls_commercial_01_40", x = 8176, y = 11260, z = 0, },
        { barricade = "metal", enabled = "Barricade", target="walls_commercial_01_40", x = 8176, y = 11259, z = 0, },
        { barricade = "wood", enabled = "Barricade", target="walls_commercial_01_41", x = 8177, y = 11258, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_commercial_01_41", x = 8178, y = 11258, z = 0, },
    },
    loot = {
        -- ground floor
        {
            type = 'container',
            coords = {x=8179,y=11270,z=0},
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        {
            type = 'container',
            coords = {x=8180,y=11270,z=0},
            dist = {"StoreCounterTobacco"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=8181,y=11270,z=0},
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=8182,y=11272,z=0},
            dist = {"LaundryCleaning", "JanitorCleaning"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=8182,y=11269,z=0},
            dist = {"CafeteriaSnacks"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=8182,y=11268,z=0},
            special = "essentials",
        },
        {
            type = 'container',
            coords = {x=8182,y=11267,z=0},
            dist = {"CrateFishing", "FishermanTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        {
            type = 'container',
            coords = {x=8185,y=11269,z=0},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=8185,y=11270,z=0},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=8185,y=11271,z=0},
            dist = {"ArmyStorageElectronics", "RandomFiller" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=8185,y=11272,z=0},
            dist = {"CrateLumber", "CrateSheetMetal"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=8184,y=11272,z=0},
            dist = {"WeldingWorkshopMetal"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        -- upstairs apt
        {
            type = 'container',
            coords = {x=8178,y=11267,z=1},
            dist = {"FreezerRich", },
            distIncludeJunk = true,
            randUntilFull = true,
            frozen = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=8175,y=11269,z=1},
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=8175,y=11268,z=1},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=8175,y=11267,z=1},
            dist = {"GroceryBagGourmet","CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=8176,y=11267,z=1},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=8180,y=11267,z=1},
            dist = {"GunStoreGuns", "GunStoreMagsAmmo", "GunStoreAmmunition", "GunStoreAccessories", "DrugShackWeapons" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=8181,y=11267,z=1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=8185,y=11272,z=1},
            dist = { "ArmyStorageAmmunition","GunStoreKnives", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=8182,y=11272,z=1.5},
            dist = {"MedicalCabinet", "MedicalClinicTools", "MedicalStorageDrugs", "ArmyStorageMedical", "ArmyBunkerMedical"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        -- addon basement
        {
            type = 'container',
            coords = {x=8166,y=11259,z=-1},
            dist = {"ArtStorePottery","CrateMasonry" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=8166,y=11258,z=-1},
            dist = {"CrateCannedFood","LiquorStoreBeer","CafeKitchenSupplies", "CafeKitchenTea", "CrateSodaBottles"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=8166,y=11257,z=-1},
            dist = {"FreezerRich", },
            distIncludeJunk = true,
            randUntilFull = true,
            frozen = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=8166,y=11256,z=-1},
            dist = {"FreezerIceCream", "WesternKitchenFreezer", "BakeryKitchenFreezer"},
            distIncludeJunk = true,
            randUntilFull = true,
            frozen = true,
            level = "Loot_FoodLevel",
        },
        
        -- basement
        {
            type = 'container',
            coords = {x=8180,y=11267,z=-1},
            dist = {"CrateLiquor", "DishCabinetVIPLounge", "JanitorCleaning", "BathroomCounter", "CrateLinens"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=8175,y=11267,z=-1},
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        {
            type = 'container',
            coords = {x=8175,y=11268,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        {
            type = 'container',
            coords = {x=8175,y=11269,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        {
            type = 'container',
            coords = {x=8175,y=11270,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        {
            type = 'container',
            coords = {x=8175,y=11271,z=-1},
            dist = {"CampingStoreTools", "ArmyHangarTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=8175,y=11272,z=-1},
            dist = {"CrateFishing", "FishermanTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        {
            type = 'container',
            coords = {x=8181,y=11265,z=-1},
            dist = {"CrateTools", "GarageTools", "BarnTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=8181,y=11266,z=-1},
            dist = {"BurglarTools", "CarpenterTools", "BarnTools", "WeldingWorkshopTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=8181,y=11262,z=-1},
            dist = {"LoggingFactoryTools", "CrateTools", "GarageTools", "BurglarTools", "CarpenterTools", "BarnTools", "WeldingWorkshopTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        -- store
        {
            type = 'container',
            coords = {x=8181,y=11258,z=0},
            dist = {"CrateVHSTapes"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        {
            type = 'container',
            coords = {x=8180,y=11258,z=0},
            dist = {"MusicStoreCDs"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        {
            type = 'container',
            coords = {x=8176,y=11261,z=0},
            dist = {"BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        {
            type = 'container',
            coords = {x=8176,y=11262,z=0},
            dist = {"BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        -- external bathrooms
        {
            type = 'container',
            coords = {x=8177,y=11278,z=0},
            dist = {"CrateToiletPaper"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=8177,y=11282,z=0},
            dist = {"CrateToiletPaper"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(RosewoodGas.objectSpawns, { x = 8174, y = 11255, z = -1, removeWall = "north" })
    table.insert(RosewoodGas.objectSpawns, { x = 8174, y = 11215, z = 0, removeFloor = true, })
    table.insert(RosewoodGas.objectSpawns, { sprite = "fencing_01_59", x = 8175, y = 11215, z = 0 })
    table.insert(RosewoodGas.doorKeys.doors, { sprite = "fixtures_doors_fences_01_25", x = 8175, y = 11213, z = 0, })
    table.insert(RosewoodGas.doorKeys.doors, { sprite = "fixtures_doors_01_57", x = 8175, y = 11214, z = 0, })
    table.insert(RosewoodGas.generators[1].chunks, { 1021, 1401 })
    table.insert(RosewoodGas.generators[1].chunks, { 1021, 1402 })
    table.insert(RosewoodGas.generators[1].chunks, { 1021, 1403 })
    table.insert(RosewoodGas.generators[1].chunks, { 1022, 1401 })
    table.insert(RosewoodGas.generators[1].chunks, { 1022, 1402 })
end

return RosewoodGas
