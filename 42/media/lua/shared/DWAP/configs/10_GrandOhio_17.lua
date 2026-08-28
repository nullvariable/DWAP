local generatorStartCoords = { x = 13636, y = 1262, z = -4, }
local wtc = { x = generatorStartCoords.x+8, y = generatorStartCoords.y+4, z = -4, }
local GrandOhioConfig = {
    group = "Louisville",
    baseBuildings = {
        { x = 13649, y = 1272, z = -4 }, -- fallout shelter
    },
    spawn = { x = 13649, y = 1272, z = -4, },
    doorKeys = {
        name = "Fallout Shelter",
        doors = {
            { sprite = "fixtures_doors_01_56", x = 13614, y = 1269, z = 0, }, -- storage room door
            { sprite = "fixtures_doors_01_54", x = generatorStartCoords.x+3, y = generatorStartCoords.y+9, z = -4, },
        },
    },
    map = { name = "DWAPStashMap10", },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = generatorStartCoords.x, y = generatorStartCoords.y, z = -4, },
            fuelTank = { sprite = "dwap_tiles_01_24", x= generatorStartCoords.x-2, y= generatorStartCoords.y, z= -4, },
            fakeGenerators = {
                { x = generatorStartCoords.x-22, y = generatorStartCoords.y+12, z = -4, createTile = false },
                { x = generatorStartCoords.x-5, y = generatorStartCoords.y+12, z = -4, createTile = false },
                { x = generatorStartCoords.x+1, y = generatorStartCoords.y+36, z = -4, createTile = false },
                { x = generatorStartCoords.x+30, y = generatorStartCoords.y+22, z = -4, createTile = false },
                { x = generatorStartCoords.x+15, y = generatorStartCoords.y-12, z = -4, createTile = false },
                -- { x = generatorStartCoords.x-18, y = generatorStartCoords.y+11, z = -1, createTile = true }, -- this ends up powering a huge amount of the mall which is probably not what we want
            },
        }
    },
    waterTanks = {
        { sprite = "industry_02_72", x = wtc.x, y = wtc.y, z = wtc.z, sourceType="generator", source = {x = generatorStartCoords.x, y = generatorStartCoords.y, z = -4}},
    },
    waterFixtures = {
        -- wash room sinks
        { sprite = "fixtures_sinks_01_6", x = generatorStartCoords.x+9, y = generatorStartCoords.y-12, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_6", x = generatorStartCoords.x+9, y = generatorStartCoords.y-13, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_6", x = generatorStartCoords.x+9, y = generatorStartCoords.y-14, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_6", x = generatorStartCoords.x+9, y = generatorStartCoords.y-15, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- wash room toilets
        { sprite = "fixtures_bathroom_01_5", x = generatorStartCoords.x+5, y = generatorStartCoords.y-11, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_5", x = generatorStartCoords.x+5, y = generatorStartCoords.y-12, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_5", x = generatorStartCoords.x+5, y = generatorStartCoords.y-13, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_5", x = generatorStartCoords.x+5, y = generatorStartCoords.y-14, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_5", x = generatorStartCoords.x+5, y = generatorStartCoords.y-15, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- washroom showers
        { sprite = "fixtures_bathroom_01_31", x = generatorStartCoords.x+1, y = generatorStartCoords.y-11, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_31", x = generatorStartCoords.x+1, y = generatorStartCoords.y-9, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_31", x = generatorStartCoords.x+1, y = generatorStartCoords.y-7, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_23", x = generatorStartCoords.x+4, y = generatorStartCoords.y-11, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_23", x = generatorStartCoords.x+4, y = generatorStartCoords.y-9, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_23", x = generatorStartCoords.x+4, y = generatorStartCoords.y-7, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- laundry room washers
        { sprite = "appliances_laundry_01_6", x = generatorStartCoords.x+13, y = generatorStartCoords.y-9, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "appliances_laundry_01_6", x = generatorStartCoords.x+14, y = generatorStartCoords.y-9, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- kitchen sink
        { sprite = "fixtures_sinks_01_17", x = generatorStartCoords.x+20, y = generatorStartCoords.y-6, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- utility sink
        { sprite = "fixtures_sinks_01_34", x = generatorStartCoords.x+23, y = generatorStartCoords.y+23, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- gym fountain
        { sprite = "fixtures_sinks_01_24", x = generatorStartCoords.x+15, y = generatorStartCoords.y+20, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- laundry room washers
        { sprite = "appliances_laundry_01_4", x = generatorStartCoords.x+13, y = generatorStartCoords.y+27, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "appliances_laundry_01_4", x = generatorStartCoords.x+14, y = generatorStartCoords.y+27, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- wash room sinks
        { sprite = "fixtures_sinks_01_6", x = generatorStartCoords.x+9, y = generatorStartCoords.y+27, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_6", x = generatorStartCoords.x+9, y = generatorStartCoords.y+28, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_6", x = generatorStartCoords.x+9, y = generatorStartCoords.y+29, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_sinks_01_6", x = generatorStartCoords.x+9, y = generatorStartCoords.y+30, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- wash room toilets
        { sprite = "fixtures_bathroom_01_5", x = generatorStartCoords.x+5, y = generatorStartCoords.y+27, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_5", x = generatorStartCoords.x+5, y = generatorStartCoords.y+26, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        -- washroom showers
        { sprite = "fixtures_bathroom_01_31", x = generatorStartCoords.x+1, y = generatorStartCoords.y+31, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_31", x = generatorStartCoords.x+1, y = generatorStartCoords.y-29, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_31", x = generatorStartCoords.x+1, y = generatorStartCoords.y-27, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_23", x = generatorStartCoords.x+4, y = generatorStartCoords.y+31, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_23", x = generatorStartCoords.x+4, y = generatorStartCoords.y-29, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_23", x = generatorStartCoords.x+4, y = generatorStartCoords.y-27, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },

        -- decon showers
        { sprite = "fixtures_bathroom_01_22", x = generatorStartCoords.x-3, y = generatorStartCoords.y+12, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_22", x = generatorStartCoords.x-2, y = generatorStartCoords.y+12, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_22", x = generatorStartCoords.x-1, y = generatorStartCoords.y+12, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_22", x = generatorStartCoords.x, y = generatorStartCoords.y+12, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_22", x = generatorStartCoords.x+1, y = generatorStartCoords.y+12, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_22", x = generatorStartCoords.x+2, y = generatorStartCoords.y+12, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_30", x = generatorStartCoords.x-1, y = generatorStartCoords.y+10, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_30", x = generatorStartCoords.x, y = generatorStartCoords.y+10, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_22", x = generatorStartCoords.x-1, y = generatorStartCoords.y+8, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_22", x = generatorStartCoords.x, y = generatorStartCoords.y+8, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_30", x = generatorStartCoords.x-3, y = generatorStartCoords.y+6, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_30", x = generatorStartCoords.x-2, y = generatorStartCoords.y+6, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_30", x = generatorStartCoords.x-1, y = generatorStartCoords.y+6, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_30", x = generatorStartCoords.x, y = generatorStartCoords.y+6, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_30", x = generatorStartCoords.x+1, y = generatorStartCoords.y+6, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
        { sprite = "fixtures_bathroom_01_30", x = generatorStartCoords.x+2, y = generatorStartCoords.y+6, z = -4, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} },
    },
    objectSpawns = {
        { sprite = "industry_02_52", x = 13639, y = 1261, z = -4, clearExisting = false, enabled = "EnableWaterSystem", },

        { x = 13610, y = 1269, z = 0, clearExisting = true, },
        { x = 13610, y = 1270, z = 0, clearExisting = true, },
        { x = 13610, y = 1271, z = 0, clearExisting = true, },
        { x = 13610, y = 1272, z = 0, clearExisting = true, },

        -- { sprite = "constructedobjects_01_45", x = 12994, y = 1908, z = 2, clearExisting = false, isContainer = true, },
        -- { sprite = "appliances_cooking_01_16", x = 12989, y = 1915, z = 2, },
    },
    loot = {
        { -- E1
            -- filingcabinet next to spawn in operations room
            
            note = "filingcabinet @ empty",
            coords = {x=generatorStartCoords.x+12,y=generatorStartCoords.y+11,z=-4},
            items = {
                { name = 'Base.Pencil', chance = 1, count = {2,5} },
                { name = 'Base.Notebook', chance = 1, count = {1,1} },
                { name = 'Base.Notebook', chance = 1, count = {1,1} },
                { name = 'Base.WristWatch_Left_DigitalBlack', chance = 1, count = {1,1} },
                { name = 'Base.WristWatch_Left_ClassicMilitary', chance = 1, count = {1,1} },
            },
        },
        { -- E2
            -- 2nd filingcabinet next to spawn in operations room
            
            note = "filingcabinet @ empty",
            coords = {x=generatorStartCoords.x+12,y=generatorStartCoords.y+12,z=-4},
            sandboxEnable = 'Loot_EnableMaps',
            special = "maps",
        },
        -- kitchen
        { -- E3
            note = "counter @ oldarmy",
            coords = {x=generatorStartCoords.x+20,y=generatorStartCoords.y-6,z=-4},
            special = "kitchentools",
            level = "Loot_FoodLevel",
        },
        { -- E4
            note = "counter @ oldarmy",
            coords = {x=generatorStartCoords.x+19,y=generatorStartCoords.y-6,z=-4},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E5
            note = "counter @ oldarmy",
            coords = {x=generatorStartCoords.x+16,y=generatorStartCoords.y-6,z=-4},
            dist = {"CrateCannedFood",},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E6
            note = "counter @ oldarmy",
            coords = {x=generatorStartCoords.x+16,y=generatorStartCoords.y-4,z=-4},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E7
            note = "counter @ oldarmy",
            coords = {x=generatorStartCoords.x+15,y=generatorStartCoords.y-6,z=-4},
            dist = {"CrateCannedFood",},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E8
            note = "counter @ oldarmy",
            coords = {x=generatorStartCoords.x+17,y=generatorStartCoords.y-4,z=-4},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E9
            note = "counter @ oldarmy",
            coords = {x=generatorStartCoords.x+18,y=generatorStartCoords.y-4,z=-4},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E10
            note = "counter @ oldarmy",
            coords = {x=generatorStartCoords.x+19,y=generatorStartCoords.y-4,z=-4},
            dist = {"StoreKitchenBaking",},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        -- Armory
        { -- E11
            note = "locker @ empty",
            coords = {x=generatorStartCoords.x+27,y=generatorStartCoords.y-2,z=-4},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E12
            note = "locker @ empty",
            coords = {x=generatorStartCoords.x+28,y=generatorStartCoords.y-2,z=-4},
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E13
            note = "locker @ empty",
            coords = {x=generatorStartCoords.x+29,y=generatorStartCoords.y-2,z=-4},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E14
            note = "locker @ empty",
            coords = {x=generatorStartCoords.x+30,y=generatorStartCoords.y-2,z=-4},
            special = "gunlocker",
            level = "Loot_GunLevel",
        },
        { -- E15
            note = "locker @ empty",
            coords = {x=generatorStartCoords.x+27,y=generatorStartCoords.y+1,z=-4},
            dist = {"FirearmWeapons_Late",},
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E16
            note = "locker @ empty",
            coords = {x=generatorStartCoords.x+28,y=generatorStartCoords.y+1,z=-4},
            dist = {"DrugLabGuns"},
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E17
            note = "locker @ empty",
            coords = {x=generatorStartCoords.x+29,y=generatorStartCoords.y+1,z=-4},
            distIncludeJunk = false,
            tag = "DWAPGun",
        },
        { -- E18
            note = "locker @ empty",
            coords = {x=generatorStartCoords.x+30,y=generatorStartCoords.y+1,z=-4},
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        -- medical
        { -- E19
            note = "medicine @ oldmedical",
            coords = {x=generatorStartCoords.x+22,y=generatorStartCoords.y+9,z=-4},
            slot = "upper",
            dist = {"MedicalCabinet"},
            distIncludeJunk = false,
            tag = "DWAPMed",
        },
        { -- E20
            note = "metal_shelves @ oldmedical",
            coords = {x=generatorStartCoords.x+22,y=generatorStartCoords.y+10,z=-4},
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        { -- E21
            note = "metal_shelves @ oldmedical",
            coords = {x=generatorStartCoords.x+23,y=generatorStartCoords.y+10,z=-4},
            distIncludeJunk = true,
            tag = "DWAPMed",
        },
        -- book shelves
        { -- E22
            note = "shelves @ empty",
            coords = {x=generatorStartCoords.x+33,y=generatorStartCoords.y+16,z=-4},
            dist = {"BookstoreNonFiction"},
            distIncludeJunk = false,
            level = 1,
        },
        { -- E23
            note = "shelves @ empty",
            coords = {x=generatorStartCoords.x+33,y=generatorStartCoords.y+15,z=-4},
            dist = {"BookstoreMilitaryHistory"},
            distIncludeJunk = false,
            level = 1,
        },
        -- media storage
        { -- E24
            note = "metal_shelves @ empty",
            coords = {x=generatorStartCoords.x+26,y=generatorStartCoords.y+17,z=-4},
            sandboxEnable = 'Loot_EnableBooks',
            special = 'skillbooks1',
        },
        { -- E25
            note = "metal_shelves @ empty",
            coords = {x=generatorStartCoords.x+27,y=generatorStartCoords.y+17,z=-4},
            sandboxEnable = 'Loot_EnableBooks',
            special = 'skillbooks2',
        },
        { -- E26
            note = "metal_shelves @ empty",
            coords = {x=generatorStartCoords.x+28,y=generatorStartCoords.y+17,z=-4},
            sandboxEnable = 'Loot_EnableBooks',
            special = 'skillmags',
        },
        { -- E27
            note = "metal_shelves @ empty",
            coords = {x=generatorStartCoords.x+29,y=generatorStartCoords.y+17,z=-4},
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E28
            note = "metal_shelves @ empty",
            coords = {x=generatorStartCoords.x+30,y=generatorStartCoords.y+17,z=-4},
            dist = {"CrateVHSTapes"},
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E29
            note = "metal_shelves @ empty",
            coords = {x=generatorStartCoords.x+31,y=generatorStartCoords.y+17,z=-4},
            dist = {"MovieRentalShelves"},
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E30
            note = "metal_shelves @ empty",
            coords = {x=generatorStartCoords.x+28,y=generatorStartCoords.y+20,z=-4},
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E31
            note = "metal_shelves @ empty",
            coords = {x=generatorStartCoords.x+29,y=generatorStartCoords.y+20,z=-4},
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E32
            note = "metal_shelves @ empty",
            coords = {x=generatorStartCoords.x+30,y=generatorStartCoords.y+20,z=-4},
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E33
            note = "metal_shelves @ empty",
            coords = {x=generatorStartCoords.x+31,y=generatorStartCoords.y+20,z=-4},
            dist = {"MusicStoreCDs"},
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        -- cleaning
        { -- E34
            note = "metal_shelves @ empty",
            coords = {x=generatorStartCoords.x+22,y=generatorStartCoords.y+17,z=-4},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E35
            note = "metal_shelves @ empty",
            coords = {x=generatorStartCoords.x+23,y=generatorStartCoords.y+17,z=-4},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        -- seed/farm library
        { -- E36
            note = "metal_shelves @ oldarmy",
            coords = {x=generatorStartCoords.x+23,y=generatorStartCoords.y+15,z=-4},
            sandboxEnable = 'SeedLibrary',
            special = 'SeedLibrary',
        },
        { -- E37
            note = "metal_shelves @ oldarmy",
            coords = {x=generatorStartCoords.x+23,y=generatorStartCoords.y+16,z=-4},
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E38
            note = "metal_shelves @ oldarmy",
            coords = {x=generatorStartCoords.x+21,y=generatorStartCoords.y+15,z=-4},
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E39
            note = "metal_shelves @ oldarmy",
            coords = {x=generatorStartCoords.x+21,y=generatorStartCoords.y+16,z=-4},
            distIncludeJunk = false,
            tag = "DWAPFarm",
        },
        { -- E40
            note = "metal_shelves @ oldarmy",
            coords = {x=generatorStartCoords.x+19,y=generatorStartCoords.y+15,z=-4},
            sandboxEnable = 'SeedLibrary',
            items = {
                { name = 'Base.Fertilizer', chance = 1, count = {8,10} },
            },
            level = "Loot_FarmLevel",
        },
        { -- E41
            note = "metal_shelves @ oldarmy",
            coords = {x=generatorStartCoords.x+19,y=generatorStartCoords.y+16,z=-4},
            sandboxEnable = 'SeedLibrary',
            items = {
                { name = 'Base.AnimalFeedBag', chance = 1, count = {9,12} },
            },
            level = "Loot_FarmLevel",
        },
        -- fishing
        { -- E42
            note = "metal_shelves @ oldarmy",
            coords = {x=generatorStartCoords.x+23,y=generatorStartCoords.y+12,z=-4},
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E43 hunting
            note = "metal_shelves @ oldarmy",
            coords = {x=generatorStartCoords.x+22,y=generatorStartCoords.y+12,z=-4},
            distIncludeJunk = false,
            tag = "DWAPFish",
        },
        { -- E44
            note = "metal_shelves @ oldarmy",
            coords = {x=generatorStartCoords.x+21,y=generatorStartCoords.y+12,z=-4},
            dist = {"CrateInstruments"},
            distIncludeJunk = false,
            tag = "DWAPMedia",
        },
        { -- E45
            note = "metal_shelves @ oldarmy",
            coords = {x=generatorStartCoords.x+20,y=generatorStartCoords.y+12,z=-4},
            dist = {"CrateLiquor"},
            distIncludeJunk = false,
            tag = "DWAPBooze",
        },
        { -- E46
            note = "metal_shelves @ oldarmy",
            coords = {x=generatorStartCoords.x+19,y=generatorStartCoords.y+12,z=-4},
            distIncludeJunk = false,
            tag = "DWAPFood",
        },
        { -- E47
            note = "metal_shelves @ oldarmy",
            coords = {x=generatorStartCoords.x+18,y=generatorStartCoords.y+12,z=-4},
            dist = {"DishCabinetLiquor"},
            distIncludeJunk = true,
            tag = "DWAPBooze",
        },
        -- tailoring
        { -- E48
            note = "counter @ empty",
            coords = {x=generatorStartCoords.x+22,y=generatorStartCoords.y+21,z=-4},
            dist = {"SewingStoreTools"},
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E49
            note = "counter @ empty",
            coords = {x=generatorStartCoords.x+23,y=generatorStartCoords.y+21,z=-4},
            dist = {"SewingStoreFabric"},
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E50
            note = "counter @ empty",
            coords = {x=generatorStartCoords.x+23,y=generatorStartCoords.y+22,z=-4},
            dist = {"CrateLeather"},
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        { -- E51
            note = "metal_shelves @ empty",
            coords = {x=generatorStartCoords.x+19,y=generatorStartCoords.y+21,z=-4},
            dist = {"CrateToiletPaper"},
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E52
            note = "metal_shelves @ empty",
            coords = {x=generatorStartCoords.x+19,y=generatorStartCoords.y+22,z=-4},
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E53
            note = "bin @ empty",
            coords = {x=generatorStartCoords.x+23,y=generatorStartCoords.y+24,z=-4},
            dist = {"ArmyStorageOutfit"},
            distIncludeJunk = true,
            tag = "DWAPTailor",
        },
        -- laundry room
        { -- E54
            note = "metal_shelves @ empty",
            coords = {x=generatorStartCoords.x+12,y=generatorStartCoords.y+27,z=-4},
            slot = "upper",
            dist = {"LaundryLoad1", "LaundryLoad2", "LaundryLoad3", "LaundryLoad4", "LaundryLoad5", "LaundryLoad6", "LaundryLoad7", "LaundryLoad8"},
            distIncludeJunk = true,
            level = 1,
        },
        { -- E55
            note = "metal_shelves @ empty",
            coords = {x=generatorStartCoords.x+12,y=generatorStartCoords.y-9,z=-4},
            slot = "upper",
            dist = {"LaundryLoad1", "LaundryLoad2", "LaundryLoad3", "LaundryLoad4", "LaundryLoad5", "LaundryLoad6", "LaundryLoad7", "LaundryLoad8"},
            distIncludeJunk = true,
            level = 1,
        },
        -- lockers
        -- SafehouseArmor
        -- SafehouseLighting
        -- ArmyStorageOutfit
        -- LockerArmyBedroom, LockerArmyBedroomHome, ArmySurplusOutfit, ToolStoreOutfit
        -- womens
        { -- E56
            note = "locker @ oldarmy",
            coords = {x=generatorStartCoords.x-3,y=generatorStartCoords.y-7,z=-4},
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E57
            note = "locker @ oldarmy",
            coords = {x=generatorStartCoords.x-3,y=generatorStartCoords.y-6,z=-4},
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E58
            note = "locker @ oldarmy",
            coords = {x=generatorStartCoords.x-3,y=generatorStartCoords.y-5,z=-4},
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E59
            note = "locker @ oldarmy",
            coords = {x=generatorStartCoords.x-3,y=generatorStartCoords.y-4,z=-4},
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E60
            note = "locker @ oldarmy",
            coords = {x=generatorStartCoords.x-3,y=generatorStartCoords.y-3,z=-4},
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -- mens
        { -- E61
            note = "locker @ oldarmy",
            coords = {x=generatorStartCoords.x-3,y=generatorStartCoords.y+21,z=-4},
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E62
            note = "locker @ oldarmy",
            coords = {x=generatorStartCoords.x-3,y=generatorStartCoords.y+22,z=-4},
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E63
            note = "locker @ oldarmy",
            coords = {x=generatorStartCoords.x-3,y=generatorStartCoords.y+23,z=-4},
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E64
            note = "locker @ oldarmy",
            coords = {x=generatorStartCoords.x-3,y=generatorStartCoords.y+24,z=-4},
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        { -- E65
            note = "locker @ oldarmy",
            coords = {x=generatorStartCoords.x-3,y=generatorStartCoords.y+25,z=-4},
            distIncludeJunk = true,
            tag = "DWAPLockers",
        },
        -- entry storage 1
        { -- E66
            note = "metal_shelves @ oldarmy",
            coords = {x=generatorStartCoords.x+3,y=generatorStartCoords.y+11,z=-4},
            dist = {"CampingLockers"},
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E67
            note = "metal_shelves @ oldarmy",
            coords = {x=generatorStartCoords.x+3,y=generatorStartCoords.y+12,z=-4},
            dist = {"CampingStoreBackpacks"},
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E68
            note = "metal_shelves @ oldarmy",
            coords = {x=generatorStartCoords.x+3,y=generatorStartCoords.y+13,z=-4},
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E69
            note = "metal_shelves @ oldarmy",
            coords = {x=generatorStartCoords.x+3,y=generatorStartCoords.y+14,z=-4},
            dist = {"SafehouseTraps", },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E70
            note = "metal_shelves @ oldarmy",
            coords = {x=generatorStartCoords.x+3,y=generatorStartCoords.y+15,z=-4},
            dist = {"ArmyStorageAmmunition", },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        { -- E71
            note = "metal_shelves @ oldarmy",
            coords = {x=generatorStartCoords.x+3,y=generatorStartCoords.y+16,z=-4},
            dist = {"ArmyStorageAmmunition", },
            distIncludeJunk = true,
            tag = "DWAPGun",
        },
        -- tools
        { -- E72
            note = "metal_shelves @ oldarmy",
            coords = {x=generatorStartCoords.x+6,y=generatorStartCoords.y+14,z=-4},
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E73
            note = "metal_shelves @ oldarmy",
            coords = {x=generatorStartCoords.x+6,y=generatorStartCoords.y+15,z=-4},
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E74
            note = "metal_shelves @ oldarmy",
            coords = {x=generatorStartCoords.x+6,y=generatorStartCoords.y+16,z=-4},
            special = "essentials",
        },
        { -- E75
            note = "metal_shelves @ oldarmy",
            coords = {x=generatorStartCoords.x+6,y=generatorStartCoords.y+17,z=-4},
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E76
            note = "metal_shelves @ oldarmy",
            coords = {x=generatorStartCoords.x+6,y=generatorStartCoords.y+18,z=-4},
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        { -- E77
            note = "metal_shelves @ oldarmy",
            coords = {x=generatorStartCoords.x+6,y=generatorStartCoords.y+19,z=-4},
            dist = {"LoggingFactoryTools" },
            distIncludeJunk = true,
            tag = "DWAPTools",
        },
        -- random junk
        { -- E78
            note = "metal_shelves @ oldarmy",
            coords = {x= generatorStartCoords.x+9,y=generatorStartCoords.y+12,z=-4},
            dist = {"CrateRandomJunk", "RandomFiller", "ArmySurplusMisc" },
            distIncludeJunk = true,
            level = 3,
        },
        { -- E79
            note = "metal_shelves @ oldarmy",
            coords = {x= generatorStartCoords.x+9,y=generatorStartCoords.y+13,z=-4},
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E80
            note = "metal_shelves @ oldarmy",
            coords = {x= generatorStartCoords.x+9,y=generatorStartCoords.y+14,z=-4},
            dist = {"CrateRandomJunk", "RandomFiller" },
            distIncludeJunk = true,
            level = 3,
        },
        { -- E81
            note = "metal_shelves @ oldarmy",
            coords = {x= generatorStartCoords.x+9,y=generatorStartCoords.y+15,z=-4},
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        -- mats
        { -- E82
            note = "metal_shelves @ oldarmy",
            coords = {x= generatorStartCoords.x+9,y=generatorStartCoords.y+16,z=-4},
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E83
            note = "metal_shelves @ oldarmy",
            coords = {x= generatorStartCoords.x+9,y=generatorStartCoords.y+17,z=-4},
            dist = {"ToolFactoryHandles" },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E84
            note = "metal_shelves @ oldarmy",
            coords = {x= generatorStartCoords.x+9,y=generatorStartCoords.y+19,z=-4},
            dist = {"ToolFactoryIngots" },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        { -- E85
            note = "metal_shelves @ oldarmy",
            coords = {x= generatorStartCoords.x+9,y=generatorStartCoords.y+18,z=-4},
            dist = {"CrateSheetMetal" },
            distIncludeJunk = false,
            tag = "DWAPBuildMats",
        },
        -- entry storage 2
        { -- E86
            note = "metal_shelves @ oldmedical",
            coords = {x=generatorStartCoords.x-3,y=generatorStartCoords.y+13,z=-4},
            dist = {"ToolFactoryBarStock"},
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E87
            note = "metal_shelves @ oldmedical",
            coords = {x=generatorStartCoords.x-2,y=generatorStartCoords.y+13,z=-4},
            dist = {"CrateLumber"},
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E88
            note = "metal_shelves @ oldmedical",
            coords = {x=generatorStartCoords.x-1,y=generatorStartCoords.y+13,z=-4},
            dist = {"CrateLumber"},
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E89
            note = "metal_shelves @ oldmedical",
            coords = {x=generatorStartCoords.x,y=generatorStartCoords.y+13,z=-4},
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E90
            note = "metal_shelves @ oldmedical",
            coords = {x=generatorStartCoords.x+1,y=generatorStartCoords.y+13,z=-4},
            dist = {"WeldingWorkshopMetal"},
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E91
            note = "metal_shelves @ oldmedical",
            coords = {x=generatorStartCoords.x+2,y=generatorStartCoords.y+13,z=-4},
            dist = {"WeldingWorkshopMetal"},
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E92
            note = "metal_shelves @ oldmedical",
            coords = {x=generatorStartCoords.x,y=generatorStartCoords.y+16,z=-4},
            items = {
                { name = 'Base.NailsCarton', },
            },
            level = "Loot_BuildMatsLevel",
        },
        { -- E93
            note = "metal_shelves @ oldmedical",
            coords = {x=generatorStartCoords.x-1,y=generatorStartCoords.y+16,z=-4},
            items = {
                { name = 'Base.NailsBox', },
                { name = 'Base.ScrewsBox', },
            },
            level = "Loot_BuildMatsLevel",
        },
        { -- E94
            note = "metal_shelves @ oldmedical",
            coords = {x=generatorStartCoords.x-2,y=generatorStartCoords.y+16,z=-4},
            distIncludeJunk = true,
            tag = "DWAPBuildMats",
        },
        { -- E95
            note = "metal_shelves @ oldmedical",
            coords = {x=generatorStartCoords.x-3,y=generatorStartCoords.y+16,z=-4},
            dist = {"StoreCounterTobacco"},
            distIncludeJunk = true,
            level = 1,
        },
        { -- E96
            note = "metal_shelves @ oldmedical",
            coords = {x=generatorStartCoords.x+2,y=generatorStartCoords.y+19,z=-4},
            dist = {"GasStoreEmergency"},
            distIncludeJunk = true,
            level = 2,
        },
        { -- E97
            note = "metal_shelves @ oldmedical",
            coords = {x=generatorStartCoords.x+1,y=generatorStartCoords.y+19,z=-4},
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E98
            note = "metal_shelves @ oldmedical",
            coords = {x=generatorStartCoords.x,y=generatorStartCoords.y+19,z=-4},
            dist = {"CandyStoreSnacks"},
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E99
            note = "metal_shelves @ oldmedical",
            coords = {x=generatorStartCoords.x-1,y=generatorStartCoords.y+19,z=-4},
            dist = {"CrateTortillaChips"},
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E100
            note = "metal_shelves @ oldmedical",
            coords = {x=generatorStartCoords.x-2,y=generatorStartCoords.y+19,z=-4},
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
        { -- E101
            note = "metal_shelves @ oldmedical",
            coords = {x=generatorStartCoords.x-3,y=generatorStartCoords.y+19,z=-4},
            distIncludeJunk = true,
            tag = "DWAPFood",
        },
    },
}

if getActivatedMods():contains("\\Ladders") then
    table.insert(GrandOhioConfig.objectSpawns, { enabled = "EnableLadders", sprite = "walls_garage_01_46", x = 13610, y = 1269, z = -4, removeWall = "west" })
    table.insert(GrandOhioConfig.objectSpawns, { enabled = "EnableLadders", sprite = "fixtures_doors_01_64", x = 13610, y = 1269, z = -4, isDoor = true, doorN = false, })
    table.insert(GrandOhioConfig.objectSpawns, { enabled = "EnableLadders", sprite = "floors_exterior_street_01_16", x = 13609, y = 1269, z = -4, isFloor = true, })
    table.insert(GrandOhioConfig.objectSpawns, { enabled = "EnableLadders", sprite = "walls_garage_01_33", x = 13609, y = 1269, z = -4, })
    table.insert(GrandOhioConfig.objectSpawns, { enabled = "EnableLadders", sprite = "overlay_grime_wall_01_1", x = 13609, y = 1269, z = -4, })
    table.insert(GrandOhioConfig.objectSpawns, { enabled = "EnableLadders", sprite = "walls_garage_01_33", x = 13609, y = 1270, z = -4, })
    table.insert(GrandOhioConfig.objectSpawns, { enabled = "EnableLadders", sprite = "floors_exterior_street_01_16", x = 13546, y = 1278, z = -4, isFloor = true, })
    table.insert(GrandOhioConfig.objectSpawns, { enabled = "EnableLadders", sprite = "walls_garage_01_33", x = 13546, y = 1278, z = -4, })
    table.insert(GrandOhioConfig.objectSpawns, { enabled = "EnableLadders", sprite = "overlay_grime_wall_01_1", x = 13546, y = 1278, z = -4, })
    table.insert(GrandOhioConfig.objectSpawns, { enabled = "EnableLadders", sprite = "walls_garage_01_33", x = 13546, y = 1279, z = -4, })
    table.insert(GrandOhioConfig.objectSpawns, { enabled = "EnableLadders", x = 13482, y = 1300, z = 0, removeFloor = true, })
    -- this ladder was fighting with me and wouldn't let me go down it while working fine going up, so I changed it to north facing
    -- table.insert(GrandOhioConfig.objectSpawns, { x = 13545, y = 1278, z = -1, removeFloor = true, })
    -- table.insert(GrandOhioConfig.objectSpawns, { sprite = "walls_interior_house_04_16", x = 12940, y = 1933, z = 0, })
    -- table.insert(GrandOhioConfig.generators[1].chunks, { 1622, 241 })
    -- table.insert(GrandOhioConfig.generators[1].chunks, { 1621, 241 })
    -- table.insert(GrandOhioConfig.generators[1].chunks, { 1620, 241 })
    -- table.insert(GrandOhioConfig.generators[1].chunks, { 1619, 241 })
end
return GrandOhioConfig