-- @TODO (2026-08-07 audit) unresolved - delete lines as they are fixed
--   * 2 skeleton entries carry coords but no loot yet - entries 25-26
local wtc = { x = 13141, y = 3042, z = -1 } -- waterTankCoords
local pb1 = { x = 13142, y = 3041, z = -1 }
local bunkerTopLeft = { x = 13135, y = 3019, z = -1 }

-- The E1-E25 "bunker shell" is the shared preset emitted at this site's E1
-- tile (the maps dresser at bunkerTopLeft + (0,2,0)). Config 01 is the
-- preset's source of truth. Overrides preserve this site's identity: E2/E4
-- keep the location_trailer sprite, E4 keeps its expanded spice list, E6
-- keeps laundry/janitor, E7 keeps leather/fabric, E8 keeps the SafehouseFridge
-- brand, E9 turns junk off, and E22/E24 keep their expanded lower-crate lists.
-- E17/E21/E23/E25 intentionally take the preset's differentiated upper-crate
-- defaults (they used to duplicate their sibling crate). E26-E65 are
-- site-specific and stay inline below.
local BunkerShell = require("DWAP/configs/presets/BunkerShell_17")
local loot = BunkerShell(
    { x = bunkerTopLeft.x, y = bunkerTopLeft.y + 2, z = bunkerTopLeft.z },
    {
        E2  = { sprite = "location_trailer_02_23" },
        E4  = { sprite = "location_trailer_02_23", dist = { "ButcherSpices", "GigamartSpices", "GroceryBagGourmet", "CrateCannedFood", "KitchenCannedFood" } },
        E6  = { dist = { "LaundryCleaning", "JanitorCleaning" }, level = "Loot_FoodLevel" },
        E7  = { dist = { "SewingStoreTools", "CrateLeather", "SewingStoreFabric" } },
        E8  = { dist = { "SafehouseFridge" } },
        E9  = { distIncludeJunk = false },
        E22 = { dist = { "GasStoreEmergency", "StoreCounterTobacco", "BurglarTools", "CarpenterTools", "BarnTools", "SafehouseArmor", "SafehouseLighting" } },
        E24 = { dist = { "SafehouseTraps", "GunStoreKnives", "CampingStoreBackpacks", "CrateLiquor", "CarSupplyTools", "DrugLabOutfit" } },
    }
)

local extra = {
        -- generator room
        { -- E26
            note = "metal_shelves @ hallway",
            coords = { x = 13140, y = 3033, z = -1 },
            dist = { "ArmyStorageOutfit", "DrugLabOutfit", "LockerArmyBedroom", "LockerArmyBedroomHome", "ArmySurplusOutfit", "CrateLinens" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E27
            note = "metal_shelves @ hallway",
            coords = { x = 13140, y = 3034, z = -1 },
            dist = { "ArmyStorageOutfit", "LockerArmyBedroom", "SafehouseArmor", "DerelictHouseCrime", "CrateBootsArmy", "SafehouseLighting" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E28
            note = "metal_shelves @ hallway",
            coords = { x = 13140, y = 3035, z = -1 },
            dist = { "GunStoreGuns", "GunStoreMagsAmmo", "GunStoreAmmunition", "GunStoreAccessories", "DrugShackWeapons" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E29
            note = "metal_shelves @ hallway",
            coords = { x = 13140, y = 3036, z = -1 },
            dist = { "ArmyStorageAmmunition", "GunStoreKnives", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_GunLevel",
        },
        { -- E30
            note = "metal_shelves @ hallway",
            coords = { x = 13142, y = 3033, z = -1 },
            items = {
                { name = 'TvWideScreen',   chance = 1, count = { 1, 1 } },
                { name = 'Base.Remote',    chance = 1, count = { 1, 3 } },
                { name = 'Base.VideoGame', chance = 1, count = { 3, 3 } },
            },
        },
        { -- E31
            note = "metal_shelves @ hallway",
            coords = { x = 13142, y = 3034, z = -1 },
            dist = { "KitchenDryFood", "GigamartDryGoods" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E32
            note = "metal_shelves @ hallway",
            coords = { x = 13142, y = 3035, z = -1 },
            dist = { "CarvingWorkshopMaterials", "CarvingWorkshopTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E33
            note = "metal_shelves @ hallway",
            coords = { x = 13142, y = 3036, z = -1 },
            dist = { "StoreKitchenBaking", "WesternKitchenBaking" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },

        -- auto shop
        { -- E34
            note = "metal_shelves @ mechanic",
            coords = { x = 13150, y = 3018, z = 0 },
            slot = "upper",
            dist = { "CarSupplyTools", "GasStorageMechanics", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E35
            note = "metal_shelves @ mechanic",
            coords = { x = 13143, y = 3024, z = 0 },
            dist = { "CampingStoreTools", "ArmyHangarTools", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E36
            note = "metal_shelves @ mechanic",
            coords = { x = 13143, y = 3025, z = 0 },
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E37
            note = "metal_shelves @ mechanic",
            coords = { x = 13143, y = 3026, z = 0 },
            dist = { "ToolFactoryBarStock", "ToolFactoryHandles", "WeldingWorkshopMetal", "ToolFactoryIngots" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        -- north office
        { -- E38
            note = "filingcabinet @ empty",
            coords = { x = 13139, y = 3020, z = 0 },
            dist = { "CrateVHSTapes" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E39
            note = "filingcabinet @ empty",
            coords = { x = 13140, y = 3020, z = 0 },
            dist = { "MusicStoreCDs" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },

        -- office converted to shelter room
        { -- E40
            note = "crate @ empty",
            coords = { x = 13139, y = 3024, z = 0 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E41
            note = "militarycrate @ empty",
            coords = { x = 13140, y = 3024, z = 0 },
            dist = { "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E42
            note = "crate @ empty",
            coords = { x = 13140, y = 3024, z = 0 },
            stack = 2,
            dist = { "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E43
            note = "cardboardbox @ empty",
            coords = { x = 13142, y = 3025, z = 0 },
            dist = { "BathroomCounter", "GasStoreToiletries", },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_LockersLevel",
        },
        { -- E44
            note = "crate @ empty",
            coords = { x = 13142, y = 3026, z = 0 },
            dist = { "CrateCannedFood", "ArmySurplusTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E45
            note = "crate @ empty",
            coords = { x = 13142, y = 3026, z = 0 },
            stack = 2,
            dist = { "CrateCannedFood", "ArmySurplusTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E46
            note = "crate @ empty",
            coords = { x = 13141, y = 3026, z = 0 },
            dist = { "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E47
            note = "crate @ empty",
            coords = { x = 13141, y = 3026, z = 0 },
            stack = 2,
            dist = { "CrateCannedFood", "KitchenCannedFood" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E48
            note = "crate @ empty",
            coords = { x = 13140, y = 3026, z = 0 },
            dist = { "CrateFishing", "FishermanTools" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E49
            note = "crate @ empty",
            coords = { x = 13140, y = 3026, z = 0 },
            stack = 2,
            dist = { "CrateFishing", "FishermanTools" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FishLevel",
        },
        { -- E50
            note = "locker @ empty",
            coords = { x = 13139, y = 3026, z = 0 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E51
            note = "locker @ empty",
            coords = { x = 13138, y = 3026, z = 0 },
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        -- lobby
        { -- E52
            note = "counter @ empty",
            coords = { x = 13138, y = 3016, z = 0 },
            dist = { "WeldingWorkshopMetal", "MetalShopTools", "MetalWorkerTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E53
            note = "counter @ empty",
            coords = { x = 13138, y = 3015, z = 0 },
            dist = { "CrateBlacksmithing", "CrateSheetMetal", "CrateMetalwork" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E54
            note = "counter @ empty",
            coords = { x = 13138, y = 3014, z = 0 },
            dist = { "CrateLumber", "ArtStorePottery", "CrateMasonry" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E55
            note = "counter @ empty",
            coords = { x = 13138, y = 3013, z = 0 },
            dist = { "ToolFactoryHandles", "ToolFactoryIngots" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        -- back storage room
        { -- E56
            note = "metal_shelves @ bathroom",
            coords = { x = 13139, y = 3027, z = 0 },
            dist = { "CrateLiquor", "DishCabinetVIPLounge" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E57
            note = "metal_shelves @ bathroom",
            coords = { x = 13140, y = 3027, z = 0 },
            dist = { "CampingStoreTools", "ArmyHangarTools", "BurglarTools", "CarpenterTools", "BarnTools", "CrateTools", "GarageTools", "GigamartTools", "JanitorTools", "LoggingFactoryTools" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E58
            note = "metal_shelves @ bathroom",
            coords = { x = 13141, y = 3027, z = 0 },
            dist = { "ArmyStorageElectronics", "RandomFiller" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_BuildMatsLevel",
        },
        { -- E59
            note = "metal_shelves @ bathroom",
            coords = { x = 13142, y = 3027, z = 0 },
            dist = { "CrateToiletPaper" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = 1,
        },
        { -- E60
            note = "metal_shelves @ bathroom",
            coords = { x = 13140, y = 3030, z = 0 },
            dist = { "GasStoreEmergency", "StoreCounterTobacco" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_ToolsLevel",
        },
        { -- E61
            note = "metal_shelves @ bathroom",
            coords = { x = 13139, y = 3030, z = 0 },
            dist = { "BookstoreBiography", "BookstoreBusiness", "BookstoreChilds", "BookstoreComputer", "BookstoreCrimeFiction" },
            distIncludeJunk = false,
            randUntilFull = true,
            level = "Loot_MediaLevel",
        },
        { -- E62
            note = "crate @ bathroom",
            coords = { x = 13138, y = 3030, z = 0 },
            dist = { "CandyStoreSnacks", "CrateTortillaChips" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E63
            note = "crate @ bathroom",
            coords = { x = 13138, y = 3030, z = 0 },
            stack = 2,
            dist = { "CandyStoreSnacks", "CrateTortillaChips" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E64
            note = "crate @ bathroom",
            coords = { x = 13138, y = 3029, z = 0 },
            dist = { "CrateFlour", "CrateOilVegetable" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
        { -- E65
            note = "crate @ bathroom",
            coords = { x = 13138, y = 3029, z = 0 },
            stack = 2,
            dist = { "CrateFlour", "CrateOilVegetable" },
            distIncludeJunk = true,
            randUntilFull = true,
            level = "Loot_FoodLevel",
        },
}
for i = 1, #extra do loot[#loot + 1] = extra[i] end

local LVAutoshop = {
    group = "Louisville",
    baseBuildings = {
        { x = 13140, y = 3028, z = 0 },  -- autoshop
        { x = 13135, y = 3019, z = -1 }, -- bunker
        { x = 13140, y = 3031, z = -1 }, -- generator room
    },
    spawn = { x = 13140, y = 3028, z = 0 },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc.x, y = wtc.y, z = wtc.z, sourceType = "generator", source = { x = 13141, y = 3032, z = 0 } },
    },
    waterFixtures = {
        { sprite = "fixtures_bathroom_01_31", x = 13137, y = 3026, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_bathroom_01_4",  x = 13137, y = 3018, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_14",    x = 13138, y = 3018, z = 0,  sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },

        { sprite = "fixtures_bathroom_01_6",  x = 13137, y = 3027, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
        { sprite = "fixtures_sinks_01_16",    x = 13135, y = 3023, z = -1, sourceType = "tank", source = { x = wtc.x, y = wtc.y, z = wtc.z } },
    },
    doorKeys = {
        name = "Autoshop",
        doors = {
            { sprite = "fixtures_doors_fences_01_64", x = 13151, y = 3034, z = 0, },
            { sprite = "fixtures_doors_fences_01_21", x = 13150, y = 3024, z = 0, },
            { sprite = "fixtures_doors_01_52",        x = 13142, y = 3030, z = 0, },
            { sprite = "fixtures_doors_01_53",        x = 13136, y = 3027, z = -1, },
            { sprite = "walls_garage_02_52",          x = 13146, y = 3018, z = 0, },
        },
    },
    map = { name = "DWAPStashMap14", },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 13142, y = 3038, z = pb1.z },
            fuelTank = { sprite = "dwap_tiles_01_24", x = 13140, y = 3038, z = -1, },
            fakeGenerators = {
                { x = 13139, y = 3030, z = -1, createTile = true },
            },
        },
    },
    objectSpawns = {
        { sprite = "industry_02_175", x = pb1.x,             y = pb1.y,                           z = pb1.z, disabled = "EnableGenSystemSolar", clearExisting = true, },

        { barricade = "wood",         enabled = "Barricade", target = "walls_commercial_01_41",   x = 13138, y = 3012,                          z = 0, },
        { barricade = "wood",         enabled = "Barricade", target = "walls_commercial_01_41",   x = 13139, y = 3012,                          z = 0, },
        { barricade = "wood",         enabled = "Barricade", target = "walls_commercial_01_41",   x = 13140, y = 3012,                          z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_commercial_01_41",   x = 13141, y = 3012,                          z = 0, },
        { barricade = "wood",         enabled = "Barricade", target = "fixtures_doors_02_40",     x = 13143, y = 3012,                          z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "fixtures_doors_02_44",     x = 13143, y = 3013,                          z = 0, },
        { barricade = "wood",         enabled = "Barricade", target = "walls_commercial_01_40",   x = 13143, y = 3014,                          z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_commercial_01_40",   x = 13143, y = 3015,                          z = 0, },
        { barricade = "wood",         enabled = "Barricade", target = "walls_commercial_01_40",   x = 13143, y = 3016,                          z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "industry_trucks_01_56",    x = 13143, y = 3029,                          z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_interior_house_02_56", x = 13137, y = 3019,                        z = 0, },
        { barricade = "woodhalf",     enabled = "Barricade", target = "walls_interior_house_02_56", x = 13137, y = 3022,                        z = 0, },
        { barricade = "metalbar",     enabled = "Barricade", target = "fixtures_windows_01_56",   x = 13137, y = 3025,                          z = 0, },
        { barricade = "metal",        enabled = "Barricade", target = "fixtures_doors_01_21",     x = 13141, y = 3024,                          z = 0, },
    },
    loot = loot,
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(LVAutoshop.objectSpawns,
        { enabled = "EnableLadders", sprite = "walls_interior_house_02_48", x = 13143, y = 3051, z = 0, removeFloor = true, clearExisting = true, })
end

return LVAutoshop
