local wtc1 = {x = 6119, y = 6640, z = -1,}
local pb1  = {x = 6123, y = 6640, z = -1,}
local WestMaple = {
    group = "Riverside",
    baseBuildings = {
        { x = 6117, y = 6638, z = 1 }, -- house
        { x = 6116, y = 6634, z = -1 }, -- basegame basement
        { x = 6116, y = 6634, z = -1 }, -- basegame basement
        { x = 6125, y = 6641, z = -1 }, -- generator/storage basement
    },
    spawn = { x = 6117, y = 6638, z = 1 },
    generators = {
        {
            controls = { sprite = "industry_02_67", x = pb1.x-1, y = pb1.y, z = pb1.z, },
            solar = {
                powerbank = { sprite = "dwap_tiles_01_0", x = pb1.x, y = pb1.y, z = pb1.z },
                panels = {
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_6",
                        x = 6125,
                        y = 6635,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_6",
                        x = 6125,
                        y = 6636,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_6",
                        x = 6125,
                        y = 6637,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_6",
                        x = 6125,
                        y = 6638,
                        z = 1,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_6",
                        x = 6126,
                        y = 6635,
                        z = 0,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_6",
                        x = 6126,
                        y = 6636,
                        z = 0,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_6",
                        x = 6126,
                        y = 6637,
                        z = 0,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_6",
                        x = 6126,
                        y = 6638,
                        z = 0,
                        pb = 1,
                        spawn = false,
                    },
                },
            },
            fakeGenerators = {
                { x = 6127, y = 6635, z = -1, createTile = true },
            },
        },
    },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc1.x, y = wtc1.y, z = wtc1.z, sourceType="generator", source = {x = 1666, y = 5746, z = -4} },
    },
    waterFixtures = {
        { sprite = "fixtures_bathroom_01_1", x = 1661, y = 5749, z = -4, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_9", x = 1663, y = 5749, z = -4, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_30", x = 1658, y = 5750, z = -4, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_32", x = 1665, y = 5749, z = -3, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "appliances_laundry_01_7", x = 1659, y = 5746, z = -2, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },

        { sprite = "fixtures_bathroom_01_4", x = 1658, y = 5747, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_9", x = 1659, y = 5747, z = 0, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },

        { sprite = "fixtures_sinks_01_9", x = 1661, y = 5744, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_33", x = 1657, y = 5748, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_bathroom_01_2", x = 1659, y = 5748, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
        { sprite = "fixtures_sinks_01_23", x = 1659, y = 5747, z = 1, sourceType="tank", source = {x = wtc1.x, y = wtc1.y, z = wtc1.z} },
    },
    doorKeys = {
        name = "West Maple Home Key",
        doors = {
            { sprite = "fixtures_doors_02_5", x = 6118, y = 6640, z = 0, },
            { sprite = "fixtures_doors_02_5", x = 6122, y = 6650, z = -1, },
        },
    },
    map = { name = "DWAPStashMap40", },
    objectSpawns = {

        { barricade = "metalbar", enabled = "Barricade", target="fixtures_windows_01_1", x = 6113, y = 6641, z = 0, },
        { barricade = "metal", enabled = "Barricade", target="fixtures_windows_01_1", x = 6115, y = 6641, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target="fixtures_windows_01_0", x = 6124, y = 6629, z = 0, },
        { barricade = "metal", enabled = "Barricade", target="fixtures_door_02_5", x = 6120, y = 6628, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target="fixtures_windows_01_1", x = 6115, y = 6628, z = 0, },
        { barricade = "metalbar", enabled = "Barricade", target="fixtures_windows_01_0", x = 6112, y = 6632, z = 0, },

    },
    loot = {
        -- store basement
        {
            type = 'container',
            coords = {x=6117,y=6650,z=-1},
            slot = "upper",
            dist = {"CrateToiletPaper", "CrateLinens"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=6117,y=6649,z=-1},
            dist = {"BurglarTools", "CarpenterTools", "BarnTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=6117,y=6648,z=-1},
            dist = {"CrateBlacksmithing" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        {
            type = 'container',
            coords = {x=6123,y=6647,z=-1},
            slot = "upper",
            dist = {"ArmyStorageOutfit",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=6124,y=6647,z=-1},
            slot = "upper",
            dist = {"DrugLabOutfit",},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        {
            type = 'container',
            coords = {x=6121,y=6649,z=-1},
            dist = {"CrateCannedFood", "KitchenCannedFood"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=6122,y=6649,z=-1},
            dist = {"CrateFlour", "CrateOilVegetable", "CafeKitchenSupplies", "CafeKitchenTea", "CrateSodaBottles"},
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=6123,y=6649,z=-1},
            dist = {"SafehouseMedical", "LiquorStoreWhiskey" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_MedLevel",
        },
        {
            type = 'container',
            coords = {x=6122,y=6650,z=-1},
            dist = {"LiquorStoreBeer","LiquorStoreBeerFancy"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        {
            type = 'container',
            coords = {x=6123,y=6650,z=-1},
            dist = {"CrateVHSTapes"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        {
            type = 'container',
            coords = {x=6123,y=6651,z=-1},
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        {
            type = 'container',
            coords = {x=6122,y=6654,z=-1},
            dist = {"CrateLiquor", "LiquorStoreWhiskey"},
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(WestMaple.objectSpawns, { enabled = "EnableLadders", sprite = "fencing_01_27", x = 1628, y = 5760, z = 0, removeFloor = true, clearExisting = true, })
end

return WestMaple