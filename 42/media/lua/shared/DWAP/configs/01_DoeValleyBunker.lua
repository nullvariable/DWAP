local bunkerTopLeft = {x = 5575, y = 9363, z = -1}
local wtc = {x = 5575, y = 9364, z = 0}
local DoeValleyBunker = {
    spawn = { x = 5576, y = 9365, z = -1 },
    waterTanks = {
        { sprite = "industry_02_73", x = wtc.x, y = wtc.y, z = wtc.z, isProp = true, sourceType="generator", source = {x = 5579, y = 9364, z = 0} },
    },
    waterFixtures = {
        { sprite = "fixtures_bathroom_01_6", x = 5577, y = 9371, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_16", x = 5575, y = 9367, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
    },
    -- generators = {
    --     { sprite = "industry_02_67", x = 5579, y = 9364, z = 0, ghost = false, isProp = true, },
    -- },
    generators = {
        {
            controls = { sprite = "industry_02_67", x = 5579, y = 9364, z = 0, ghost = false, isProp = true, },
            chunks = {
                {696, 1170},
                {696, 1171},
                {697, 1170},
                {697, 1171},
            },
        },
    },
    doorKeys = {
        name = "Doe Valley Bunker",
        doors = {
            { sprite = "fixtures_doors_01_53", x = 5576, y = 9375, z = 0, },
            { sprite = "fixtures_doors_01_53", x = 5576, y = 9372, z = -1, },
            { sprite = "fixtures_doors_fences_01_128", x = 5581, y = 9367, z = 0, isProp=true, },
            { sprite = "fixtures_doors_fences_01_128", x = 5579, y = 9367, z = 0, isProp=true, },
        },
    },
    map = { name = "DWAPStashMap1", },
    objectSpawns = {
        { sprite = "camping_01_64", x = 5575, y = 9379, z = 0, enabled = "EnableWaterSystem", }, -- fountain

        { sprite = "industry_02_72", x = 5574, y = 9364, z = 0, enabled = "EnableWaterSystem", }, -- tank left
        { sprite = "industry_02_73", x = 5575, y = 9364, z = 0, enabled = "EnableWaterSystem", }, --tank right
        { sprite = "industry_02_74", x = 5574, y = 9363, z = 0, enabled = "EnableWaterSystem", }, -- tank back left
        { sprite = "industry_02_75", x = 5575, y = 9363, z = 0, enabled = "EnableWaterSystem", }, -- tank back right

        -- generator
        { sprite = "industry_02_64", x = 5576, y = 9364, z = 0, enabled = "EnableGenSystem", },
        { sprite = "industry_02_68", x = 5576, y = 9363, z = 0, enabled = "EnableGenSystem", },
        { sprite = "industry_02_65", x = 5577, y = 9364, z = 0, enabled = "EnableGenSystem", },
        { sprite = "industry_02_69", x = 5577, y = 9363, z = 0, enabled = "EnableGenSystem", },
        { sprite = "industry_02_66", x = 5578, y = 9364, z = 0, enabled = "EnableGenSystem", },
        { sprite = "industry_02_70", x = 5578, y = 9363, z = 0, enabled = "EnableGenSystem", },
        { sprite = "industry_02_67", x = 5579, y = 9364, z = 0, enabled = "EnableGenSystem", },
        { sprite = "industry_02_71", x = 5579, y = 9363, z = 0, enabled = "EnableGenSystem", },
        -- utilities fence
        { sprite = "fencing_01_59", x = 5573, y = 9367, z = 0, },
        { sprite = "fencing_01_59", x = 5573, y = 9366, z = 0, },
        { sprite = "fencing_01_59", x = 5573, y = 9365, z = 0, },
        { sprite = "fencing_01_59", x = 5573, y = 9364, z = 0, },
        { sprite = "fencing_01_60", x = 5573, y = 9363, z = 0, },
        { sprite = "fencing_01_56", x = 5574, y = 9363, z = 0, },
        { sprite = "fencing_01_56", x = 5575, y = 9363, z = 0, },
        { sprite = "fencing_01_56", x = 5576, y = 9363, z = 0, },
        { sprite = "fencing_01_56", x = 5577, y = 9363, z = 0, },
        { sprite = "fencing_01_56", x = 5578, y = 9363, z = 0, },
        { sprite = "fencing_01_56", x = 5579, y = 9363, z = 0, },
        { sprite = "fencing_01_56", x = 5580, y = 9363, z = 0, },
        { sprite = "fencing_01_59", x = 5581, y = 9363, z = 0, },
        { sprite = "fencing_01_59", x = 5581, y = 9364, z = 0, },
        { sprite = "fencing_01_59", x = 5581, y = 9365, z = 0, },
        { sprite = "fencing_01_59", x = 5581, y = 9366, z = 0, },
        { sprite = "fixtures_doors_fences_01_128", x = 5581, y = 9367, z = 0, isDoor = true, doorN = false, },

        -- shelf replacements
        { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+7, z = -1, renderYOffset = 0, enabled = "Loot", clearExisting = true, isContainer = true, },
        { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+7, z = -1, renderYOffset = 32, enabled = "Loot", clearExisting = false, isContainer = true, },
        { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+6, z = -1, renderYOffset = 0, enabled = "Loot", clearExisting = true, isContainer = true, },
        { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+6, z = -1, renderYOffset = 32, enabled = "Loot", clearExisting = false, isContainer = true, },
        { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+5, z = -1, renderYOffset = 0, enabled = "Loot", clearExisting = true, isContainer = true, },
        { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+5, z = -1, renderYOffset = 32, enabled = "Loot", clearExisting = false, isContainer = true, },

        -- extra loot crates
        -- { sprite = "constructedobjects_01_45", x = 5573, y = 9365, z = 0, enabled = "Loot", clearExisting = false, isContainer = true, },
        -- { sprite = "constructedobjects_01_45", x = 5573, y = 9366, z = 0, enabled = "Loot", clearExisting = false, isContainer = true, },
        -- { sprite = "constructedobjects_01_45", x = 5573, y = 9367, z = 0, enabled = "Loot", clearExisting = false, isContainer = true, },
        -- { sprite = "constructedobjects_01_45", x = 5574, y = 9367, z = 0, enabled = "Loot", clearExisting = false, isContainer = true, },
        { sprite = "constructedobjects_01_45", x = 5575, y = 9367, z = 0, enabled = "Loot", clearExisting = false, isContainer = true, },
        -- { sprite = "constructedobjects_01_45", x = 5576, y = 9367, z = 0, enabled = "Loot", clearExisting = false, isContainer = true, },
        { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y, z = -1, renderYOffset = 0, enabled = "Loot", clearExisting = true, isContainer = true, },
        { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y, z = -1, renderYOffset = 32, enabled = "Loot", clearExisting = false, isContainer = true, },
        { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+1, z = -1, renderYOffset = 0, enabled = "Loot", clearExisting = true, isContainer = true, },
        { sprite = "location_military_generic_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+1, z = -1, renderYOffset = 32, enabled = "Loot", clearExisting = false, isContainer = true, },

        { sprite = "furniture_tables_high_01_16", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+2, z = -1, clearExisting = true },
        { sprite = "appliances_com_01_0", x = bunkerTopLeft.x+2, y = bunkerTopLeft.y+2, z = -1,  IsoType = "IsoRadio" }, -- renderYOffset = 34,

    },
    loot = {
        { -- cabinet next to bunk beds (9365)
            type = 'container',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+2,z=bunkerTopLeft.z},
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- upper
            type = 'container',
            sprite = 'location_trailer_02_23',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+3,z=bunkerTopLeft.z+0.5},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- lower (66)
            type = 'container',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+3,z=bunkerTopLeft.z},
            dist = {"StoreKitchenGlasses", "StoreKitchenPots", "StoreKitchenDishes", "StoreKitchenCutlery", "JanitorCleaning" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- upper
            type = 'container',
            sprite = 'location_trailer_02_23',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+4,z=bunkerTopLeft.z+0.5},
            dist = {"ButcherSpices","GigamartSpices","GroceryBagGourmet",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- lower (67)
            type = 'container',
            sprite = 'location_trailer_02_19',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+4,z=bunkerTopLeft.z},
            dist = {"TestingLab","MedicalCabinet","ArmyStorageMedical", "ArmyBunkerMedical"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        { -- upper
            type = 'container',
            sprite = 'location_trailer_02_23',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+5,z=bunkerTopLeft.z+0.5},
            dist = {"CrateFishing", "FishermanTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- lower (68)
            type = 'container',
            sprite = 'location_trailer_02_19',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+5,z=bunkerTopLeft.z},
            dist = {"SewingStoreTools"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        { -- metal shelves (70)
            type = 'container',
            sprite = 'location_trailer_02_23',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+7,z=bunkerTopLeft.z},
            dist = {"GardenStoreTools", "Homesteading", "CrateLinens", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        { -- metal shelves (71)
            type = 'container',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+8,z=bunkerTopLeft.z},
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- next to inner door (9372)
            type = 'container',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+9,z=bunkerTopLeft.z},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- (73)
            type = 'container',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+10,z=bunkerTopLeft.z},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- (9374)
            type = 'container',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+11,z=bunkerTopLeft.z},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- far end next to stairs (9375)
            type = 'container',
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+12,z=bunkerTopLeft.z},
            sandboxEnable = 'Loot',
            special = "essentials",
        },
        { -- metal wall shelves
            type = 'container',
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y+5,z=bunkerTopLeft.z},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- metal wall shelves
            type = 'container',
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y+6,z=bunkerTopLeft.z},
            dist = {"CrateLiquor", "DishCabinetVIPLounge", "MusicStoreCDs", "CrateVHSTapes", "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- metal wall shelves
            type = 'container',
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y+7,z=bunkerTopLeft.z},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },

        -- extra spawns
        {
            type = 'container',
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y,z=bunkerTopLeft.z},
            dist = {"GasStoreEmergency","StoreCounterTobacco", "BurglarTools", "CarpenterTools", "BarnTools","SafehouseArmor", "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y+1,z=bunkerTopLeft.z},
            dist = {"SafehouseTraps","GunStoreKnives","CampingStoreBackpacks","CrateLiquor", "CarSupplyTools","DrugLabOutfit"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },

        -- exterior crates
        --[[
        { sprite = "constructedobjects_01_45", x = 5573, y = 9365, z = 0, enabled = "Loot", clearExisting = false, isContainer = true, },
        { sprite = "constructedobjects_01_45", x = 5573, y = 9366, z = 0, enabled = "Loot", clearExisting = false, isContainer = true, },
        { sprite = "constructedobjects_01_45", x = 5573, y = 9367, z = 0, enabled = "Loot", clearExisting = false, isContainer = true, },
        { sprite = "constructedobjects_01_45", x = 5574, y = 9367, z = 0, enabled = "Loot", clearExisting = false, isContainer = true, },
        { sprite = "constructedobjects_01_45", x = 5575, y = 9367, z = 0, enabled = "Loot", clearExisting = false, isContainer = true, },
        { sprite = "constructedobjects_01_45", x = 5576, y = 9367, z = 0, enabled = "Loot", clearExisting = false, isContainer = true, },
        ]]
        {
            type = 'container',
            coords = {x = 5573, y = 9365, z = 0},
            dist = {"HuntingLockers", "RangerTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        {
            type = 'container',
            coords = {x = 5573, y = 9366, z = 0},
            dist = {"BurglarTools", "CarpenterTools", "BarnTools","SafehouseArmor", "SafehouseLighting"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x = 5573, y = 9367, z = 0},
            dist = {"CarSupplyTools","CampingLockers"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x = 5574, y = 9367, z = 0},
            dist = {"SafehouseTraps","GunStoreKnives","CampingStoreBackpacks","CrateLiquor",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x = 5575, y = 9367, z = 0},
            items = {
                { name = 'NailsBox', chance = 1, count = {1,5} },
                { name = 'ScrewsBox', chance = 1, count = {1,2} },
                { name = 'Firewood', chance = 1, count = {1,1} },
                { name = 'TvWideScreen', chance = 1, count = {1,1} },
                { name = 'Mov_AntiqueStove', chance = 1, count = {1,1} },
            },
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        {
            type = 'container',
            coords = {x = 5576, y = 9367, z = 0},
            dist = {"GasStoreEmergency","StoreCounterTobacco"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = 2,
        },
    },
}

local sandX = 5573
local sandY = 9363
-- floors
for i = 0, 7 do
    for j = 0, 7 do
        table.insert(DoeValleyBunker.objectSpawns, {
            sprite = "blends_street_01_55",
            x = sandX + i,
            y = sandY + j,
            z = 0,
            isFloor = true,
        })
        -- table.insert(DoeValleyBunker.objectSpawns, {
        --     sprite = "roofs_03_23",
        --     x = sandX + i,
        --     y = sandY + j,
        --     z = 1,
        --     isFloor = true,
        -- })
    end
end
        -- { sprite = "blends_street_01_55", x = 5580, y = 9367, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5579, y = 9367, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5578, y = 9367, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5577, y = 9367, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5576, y = 9367, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5575, y = 9367, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5574, y = 9367, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5573, y = 9367, z = 0, isFloor = true, },

        -- { sprite = "blends_street_01_55", x = 5580, y = 9366, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5579, y = 9366, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5578, y = 9366, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5577, y = 9366, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5576, y = 9366, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5575, y = 9366, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5574, y = 9366, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5573, y = 9366, z = 0, isFloor = true, },

        -- { sprite = "blends_street_01_55", x = 5580, y = 9365, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5579, y = 9365, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5578, y = 9365, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5577, y = 9365, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5576, y = 9365, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5575, y = 9365, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5574, y = 9365, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5573, y = 9365, z = 0, isFloor = true, },

        -- { sprite = "blends_street_01_55", x = 5580, y = 9364, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5579, y = 9364, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5578, y = 9364, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5577, y = 9364, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5576, y = 9364, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5575, y = 9364, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5574, y = 9364, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5573, y = 9364, z = 0, isFloor = true, },

        -- { sprite = "blends_street_01_55", x = 5580, y = 9363, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5579, y = 9363, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5578, y = 9363, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5577, y = 9363, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5576, y = 9363, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5575, y = 9363, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5574, y = 9363, z = 0, isFloor = true, },
        -- { sprite = "blends_street_01_55", x = 5573, y = 9363, z = 0, isFloor = true, },

return DoeValleyBunker