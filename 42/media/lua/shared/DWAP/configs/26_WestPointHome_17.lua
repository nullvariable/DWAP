local wtc1 = {x = 11755, y = 6670, z = -1,}
local pb1 = { x = 11754, y = 6667, z = -1 }
local WestPointHome = {
    group = "West Point",
    baseBuildings = {
        { x = 11766, y = 6667, z = 0 }, -- house
        { x = 11759, y = 6658, z = 0 }, -- garage
        { x = 11766, y = 6638, z = 0 }, -- greenhouse
        { x = 11774, y = 6639, z = 0 }, -- shed
        { x = 11764, y = 6665, z = -1 }, -- basement
    },
    spawn = { x = 11766, y = 6667, z = 0 },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 11757, y = 6664, z = pb1.z },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 11755, y = 6664, z= -1, },
            solar = {
                powerbank = { sprite = "dwap_tiles_01_0", x = pb1.x, y = pb1.y, z = pb1.z },
                panels = {
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_9",
                        x = 11595,
                        y = 6723,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_9",
                        x = 11595,
                        y = 6722,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_9",
                        x = 11595,
                        y = 6721,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_9",
                        x = 11595,
                        y = 6720,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_9",
                        x = 11595,
                        y = 6719,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_6",
                        x = 11593,
                        y = 6723,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_6",
                        x = 11593,
                        y = 6722,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_6",
                        x = 11593,
                        y = 6721,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_6",
                        x = 11593,
                        y = 6720,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_6",
                        x = 11593,
                        y = 6719,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                },
            },
            fakeGenerators = {
                { x = 11764, y = 6673, z = -1, createTile = false },
            },
        },
    },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc1.x, y = wtc1.y, z = wtc1.z, sourceType="generator", source = {x = 11601, y = 6724, z = -1} },
    },
    waterFixtures = {
        -- 2nd floor
        { sprite = "fixtures_bathroom_01_26", x = 11600, y = 6723, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_21", x = 11600, y = 6725, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_21", x = 11600, y = 6726, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_2", x = 11602, y = 6725, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_26", x = 11605, y = 6732, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_0", x = 11605, y = 6730, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_22", x = 11606, y = 6730, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_22", x = 11607, y = 6730, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        -- 1st floor
        { sprite = "fixtures_bathroom_01_1", x = 11600, y = 6724, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_13", x = 11600, y = 6723, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "appliances_laundry_01_4", x = 11600, y = 6721, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_9", x = 11606, y = 6721, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        -- basement
        { sprite = "fixtures_bathroom_01_2", x = 11605, y = 6717, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_31", x = 11603, y = 6717, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_4", x = 11603, y = 6718, z = -1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },

    },
    doorKeys = {
        name = "West Point Home",
        doors = {
            { sprite = "fixtures_doors_02_5", x = 11606, y = 6732, z = 0, },
            { sprite = "walls_garage_01_3", x = 11592, y = 6724, z = 0, },
            { sprite = "walls_garage_01_3", x = 11592, y = 6723, z = 0, },
        },
    },
    map = { name = "DWAPStashMap26", },
    objectSpawns = {
        { sprite = "industry_02_175", x = pb1.x, y = pb1.y, z = pb1.z, disabled = "EnableGenSystemSolar", clearExisting = true, },

        { barricade = "wood", enabled = "Barricade", target="walls_exterior_house_01_24", x = 11596, y = 6721, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target="walls_interior_house_01_12", x = 11600, y = 6729, z = 0, },
        { barricade = "wood", enabled = "Barricade", target="walls_exterior_house_01_25", x = 11601, y = 6734, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="walls_exterior_house_01_25", x = 11603, y = 6734, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_doors_02_5", x = 11606, y = 6733, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target="walls_exterior_house_01_24", x = 11608, y = 6723, z = 0, },
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_doors_02_5", x = 11604, y = 6721, z = 0, },

    },
    loot = {
        -- basement
        -- rec room
        {
            type = 'container',
            coords = {x=11770,y=6672,z=-1},
            dist = {"LiquorStoreBeer","LiquorStoreBeerFancy","LiquorStoreWine"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=11770,y=6671,z=-1},
            dist = {"CrateLiquor", "LiquorStoreBrandy"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=11770,y=6663,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        {
            type = 'container',
            coords = {x=11765,y=6663,z=-1},
            dist = {"LiquorStoreBeer","LiquorStoreBeerFancy","LiquorStoreWine"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=11764,y=6663,z=-1},
            dist = {"CrateLiquor", "LiquorStoreBrandy"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=11763,y=6663,z=-1},
            dist = {"TheatreSnacks", "TheatrePopcorn"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=11767,y=6667,z=-1},
            dist = {"TheatreSnacks", "CrateSodaBottles", "CrateSodaCans"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=11764,y=6666,z=-1},
            dist = {"LivingRoomShelfClassy"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        {
            type = 'container',
            coords = {x=11764,y=6667,z=-1},
            dist = {"CrateVHSTapes"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        {
            type = 'container',
            coords = {x=11764,y=6668,z=-1},
            dist = {"CrateVHSTapes"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        -- shelter room
        {
            type = 'container',
            coords = {x=11761,y=6662,z=-1},
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        {
            type = 'container',
            coords = {x=11759,y=6660,z=-1},
            special = "essentials",
        },
        {
            type = 'container',
            coords = {x=11759,y=6659,z=-1},
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        {
            type = 'container',
            coords = {x=11759,y=6658,z=-1},
            dist = {"BathroomCounter", "SafehouseMedical"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        {
            type = 'container',
            coords = {x=11759,y=6658,z=-1},
            slot = "upper",
            dist = {"CrateToiletPaper", "GasStoreToiletries"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        -- main storage room
        {
            type = 'container',
            coords = {x=11762,y=6663,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=11761,y=6663,z=-1},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=11759,y=6663,z=-1},
            dist = {"ArmyStorageAmmunition", "SafehouseTraps", "GunStoreKnives", "PawnShopKnives",},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=11758,y=6663,z=-1},
            dist = {"ArmyStorageGuns","ArmyStorageAmmunition","FirearmWeapons_Late"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        {
            type = 'container',
            coords = {x=11762,y=6665,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        {
            type = 'container',
            coords = {x=11761,y=6665,z=-1},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        {
            type = 'container',
            coords = {x=11759,y=6666,z=-1},
            dist = {"SewingStoreTools","SewingStoreFabric", "CrateLeather"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        {
            type = 'container',
            coords = {x=11758,y=6666,z=-1},
            dist = {"JewelerTools","SewingStoreFabric", "CrateLeather"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_TailorLevel",
        },
        {
            type = 'container',
            coords = {x=11757,y=6666,z=-1},
            dist = {"CrateLongStick"},
            items = {
                { name = 'Base.LongStick', chance = 1, count = {10,10} },
                { name = 'Base.Firewood', chance = 1, count = {10,10} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        {
            type = 'container',
            coords = {x=11762,y=6667,z=-1},
            dist = {"CrateAntiqueStove", "CampingStoreLighting"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = 1,
        },
        {
            type = 'container',
            coords = {x=11761,y=6667,z=-1},
            items = {
                { name = 'Base.Firewood', chance = 1, count = {10,10} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        {
            type = 'container',
            coords = {x=11759,y=6668,z=-1},
            dist = {"HuntingLockers", "RangerTools", "CrateFishing", "FishermanTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        {
            type = 'container',
            coords = {x=11758,y=6668,z=-1},
            dist = {"Trapper", "CrateFishing", "FishermanTools"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        {
            type = 'container',
            coords = {x=11757,y=6668,z=-1},
            dist = {"GigamartDryGoods", "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=11754,y=6668,z=-1},
            dist = { "CarSupplyTools", "GasStoreEmergency"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=11762,y=6669,z=-1},
            dist = {"GigamartDryGoods", "CafeKitchenCoffee"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=11761,y=6669,z=-1},
            dist = {"GigamartDryGoods", "GigamartBreakfast"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=11759,y=6670,z=-1},
            dist = {"GigamartDryGoods", "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=11758,y=6670,z=-1},
            dist = {"GigamartBakingMisc", "CrateFlour", "CrateOilVegetable" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=11757,y=6670,z=-1},
            dist = {"CrateTortillaChips", "KitchenDryFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=11762,y=6671,z=-1},
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=11761,y=6671,z=-1},
            dist = {"CrateLumber", "CrateSheetMetal", "ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal","ToolFactoryIngots"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        {
            type = 'container',
            coords = {x=11759,y=6672,z=-1},
            dist = {"LoggingFactoryTools", "CrateTools", "GarageTools", "BurglarTools", "CarpenterTools", "BarnTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=11758,y=6672,z=-1},
            dist = {"CrateBlacksmithing", "CrateCarpentry", "CrateMetalwork", "CrateMechanics", "CrateMasonry", "CrateTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=11757,y=6672,z=-1},
            dist = {"GardenStoreTools", "Homesteading", "ToolStoreFarming", "CrateFarming"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        {
            type = 'container',
            coords = {x=11756,y=6672,z=-1},
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = {9,12} },
                { name = 'Base.Fertilizer', chance = 1, count = {8,10} },
            },
            randUntilFull = true,
            level = "Loot_FarmLevel",
        },
        -- house and out buildings
        { type = 'container', coords = {x=11767,y=6665,z=0}, }, -- dresser @ bedroom
        { type = 'container', coords = {x=11768,y=6667,z=0}, }, -- medicine @ bathroom
        { type = 'container', coords = {x=11772,y=6665,z=0}, }, -- dresser @ bedroom
        { type = 'container', coords = {x=11764,y=6669,z=0}, }, -- dresser @ livingroom
        { type = 'container', coords = {x=11772,y=6668,z=0}, }, -- shelves @ livingroom
        { type = 'container', coords = {x=11772,y=6669,z=0}, }, -- shelves @ livingroom
        { type = 'container', coords = {x=11772,y=6670,z=0}, }, -- shelves @ livingroom
        { type = 'container', coords = {x=11770,y=6671,z=0}, }, -- counter @ kitchen
        { type = 'container', coords = {x=11770,y=6671,z=0}, }, -- counter @ kitchen
        { type = 'container', coords = {x=11772,y=6671,z=0}, }, -- counter @ kitchen
        { type = 'container', coords = {x=11772,y=6671,z=0}, }, -- counter @ kitchen
        { type = 'container', coords = {x=11770,y=6672,z=0}, }, -- counter @ kitchen
        { type = 'container', coords = {x=11770,y=6672,z=0}, }, -- counter @ kitchen
        { type = 'container', coords = {x=11772,y=6673,z=0}, }, -- counter @ kitchen
        { type = 'container', coords = {x=11772,y=6673,z=0}, }, -- counter @ kitchen
        { type = 'container', coords = {x=11772,y=6674,z=0}, }, -- counter @ kitchen
        { type = 'container', coords = {x=11772,y=6674,z=0}, }, -- counter @ kitchen
        { type = 'container', coords = {x=11770,y=6675,z=0}, }, -- fridge @ kitchen
        { type = 'container', coords = {x=11770,y=6675,z=0}, }, -- freezer @ kitchen
        { type = 'container', coords = {x=11771,y=6675,z=0}, }, -- dishwasher @ kitchen
        { type = 'container', coords = {x=11772,y=6675,z=0}, }, -- counter @ kitchen
        { type = 'container', coords = {x=11772,y=6675,z=0}, }, -- counter @ kitchen
        { type = 'container', coords = {x=11764,y=6673,z=0}, }, -- dresser @ livingroom
        { type = 'container', coords = {x=11764,y=6677,z=0}, }, -- shelves @ livingroom
        { type = 'container', coords = {x=11765,y=6677,z=0}, }, -- dresser @ livingroom
        { type = 'container', coords = {x=11766,y=6677,z=0}, }, -- sidetable @ livingroom
        { type = 'container', coords = {x=11769,y=6677,z=0}, }, -- metal_shelves @ closet
        { type = 'container', coords = {x=11765,y=6640,z=0}, }, -- composter @ greenhouse
        { type = 'container', coords = {x=11767,y=6640,z=0}, }, -- composter @ greenhouse
        { type = 'container', coords = {x=11765,y=6637,z=0}, }, -- counter @ greenhouse
        { type = 'container', coords = {x=11767,y=6637,z=0}, }, -- composter @ greenhouse
        { type = 'container', coords = {x=11767,y=6638,z=0}, }, -- composter @ greenhouse
        { type = 'container', coords = {x=11767,y=6639,z=0}, }, -- composter @ greenhouse
        { type = 'container', coords = {x=11773,y=6640,z=0}, }, -- metal_shelves @ garagestorage
        { type = 'container', coords = {x=11773,y=6638,z=0}, }, -- counter @ garagestorage
        { type = 'container', coords = {x=11773,y=6639,z=0}, }, -- counter @ garagestorage


    },
}

return WestPointHome