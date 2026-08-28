-- @TODO (2026-08-07 audit) unresolved - delete lines as they are fixed
--   * systems: generator controls declare industry_02_67 but no such object
--     is on the square. 11 configs name that sprite and ALL 11 fail, while 32
--     configs use dwap_tiles_01_22 - the maps look to have moved on and these
--     configs did not. Confirm what is actually there before editing
local bunkerTopLeft = {x = 2607, y = 14436, z = -1}
local wtc = {x = 2609, y = 14446, z = -1}
local pb1 = { x = 2614, y = 14446, z = -1 }
local IrvingtonTH = {
    group = "Irvington",
    baseBuildings = {
        { x = 2609, y = 14458, z = 1 }, -- townhome
        { x = 2609, y = 14458, z = -1 }, -- townhome basement
        { x = 2609, y = 14449, z = -1 }, -- bunker
    },
    spawn = { x = 2609, y = 14458, z = 1 },
    waterTanks = {
        { sprite = "dwap_tiles_01_8", x = wtc.x, y = wtc.y, z = wtc.z, sourceType="generator", source = {x = 2614, y = 14446, z = -1} },
    },
    waterFixtures = {
        { sprite = "fixtures_bathroom_01_6", x = 2609, y = 14444, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_16", x = 2607, y = 14440, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "appliances_laundry_01_7", x = 2612, y = 14464, z = -1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_11", x = 2611, y = 14465, z = 0, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_0", x = 2606, y = 14465, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_3", x = 2607, y = 14465, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_33", x = 2606, y = 14463, z = 1, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
    },
    generators = {
        {
            controls = { sprite = "industry_02_67", x = pb1.x-1, y = pb1.y, z = pb1.z },
            fakeGenerators = {
                { x = 2606, y = 14454, z = -1, createTile = true },
            },
        },
    },
    doorKeys = {
        name = "Irvington Townhome",
        doors = {
            { sprite = "fixtures_doors_01_45", x = 2611, y = 14456, z = 0, },
            { sprite = "fixtures_doors_01_53", x = 2608, y = 14449, z = -1, },
        },
    },
    map = { name = "DWAPStashMap30", },
    objectSpawns = {
        { barricade = "woodhalf", enabled = "Barricade", target="walls_commercial_01_41", x = 2608, y = 14456, z = 0, }, -- window N | livingroom, bld 10,56#16
        { barricade = "woodhalf", enabled = "Barricade", target="walls_commercial_01_41", x = 2609, y = 14456, z = 0, }, -- window N | livingroom, bld 10,56#16
        { barricade = "metal", enabled = "Barricade", target="walls_exterior_house_01_25", x = 2611, y = 14466, z = 0, },
    },
    loot = {
        { -- E1 cabinet next to bunk beds (9365)
            note = "filingcabinet @ bunker",
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+2,z=bunkerTopLeft.z},
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        { -- E2 upper
            sprite = 'location_trailer_02_23',
            note = "overhead @ bunker",
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+3,z=bunkerTopLeft.z},
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E3 lower (66)
            note = "counter @ bunker",
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+3,z=bunkerTopLeft.z},
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E4 upper
            sprite = 'location_trailer_02_23',
            note = "overhead @ bunker",
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+4,z=bunkerTopLeft.z},
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E5 lower (67)
            sprite = 'location_trailer_02_19',
            note = "counter @ bunker",
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+4,z=bunkerTopLeft.z},
            distIncludeJunk = false,
            tag = "DWAPMed",
        },
        { -- E6 upper
            sprite = 'location_trailer_02_23',
            note = "overhead @ bunker",
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+5,z=bunkerTopLeft.z},
            slot = "upper",
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E7 lower (68)
            sprite = 'location_trailer_02_19',
            note = "counter @ bunker",
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+5,z=bunkerTopLeft.z},
            dist = {"SewingStoreTools"},
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E8 metal shelves (70)
            sprite = 'location_trailer_02_23',
            note = "metal_shelves @ bunker",
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+7,z=bunkerTopLeft.z},
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E9 metal shelves (71)
            note = "metal_shelves @ bunker",
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+8,z=bunkerTopLeft.z},
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E10 next to inner door (9372)
            note = "metal_shelves @ bunker",
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+9,z=bunkerTopLeft.z},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillmags",
        },
        { -- E11 (73)
            note = "metal_shelves @ bunker",
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+10,z=bunkerTopLeft.z},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks2",
        },
        { -- E12 (9374)
            note = "metal_shelves @ bunker",
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+11,z=bunkerTopLeft.z},
            sandboxEnable = 'Loot_EnableBooks',
            special = "skillbooks1",
        },
        { -- E13 far end next to stairs (9375)
            note = "metal_shelves @ bunker",
            coords = {x=bunkerTopLeft.x,y=bunkerTopLeft.y+12,z=bunkerTopLeft.z},
            special = "essentials",
        },
        { -- E14
            note = "militarycrate @ bunker",
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y+5,z=bunkerTopLeft.z},
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E15
            note = "militarycrate @ bunker",
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y+5,z=bunkerTopLeft.z},
            stack = 2,
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E16
            note = "militarylocker @ bunker",
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y+6,z=bunkerTopLeft.z},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E17
            note = "militarylocker @ bunker",
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y+7,z=bunkerTopLeft.z},
            distIncludeJunk = true,
            tag = "DWAPFarm",
        },
        { -- E18
            note = "militarycrate @ bunker",
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y,z=bunkerTopLeft.z},
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E19
            note = "militarycrate @ bunker",
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y,z=bunkerTopLeft.z},
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E20
            note = "militarycrate @ bunker",
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y+1,z=bunkerTopLeft.z},
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E21
            note = "militarycrate @ bunker",
            coords = {x=bunkerTopLeft.x+2,y=bunkerTopLeft.y+1,z=bunkerTopLeft.z},
            stack = 2,
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E22
            note = "metal_shelves @ bunker",
            coords = {x=2609,y=14448,z=-1},
            items = {
                { name = 'Base.Firewood', chance = 1, count = {30,30} },
            },
            level = "Loot_FarmLevel",
        },
        { -- E23
            note = "metal_shelves @ bunker",
            coords = {x=2610,y=14448,z=-1},
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(IrvingtonTH.objectSpawns, { enabled = "EnableLadders", x = 2559, y = 14454, z = 0, removeFloor = true, clearExisting = true, })
else
    table.insert(IrvingtonTH.objectSpawns, { sprite = "industry_trucks_01_4", x = 2607, y = 14453, z = -1, replaceWall = true, })
end
return IrvingtonTH