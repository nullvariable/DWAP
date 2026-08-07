-- @TODO (2026-08-07 audit) unresolved - delete lines as they are fixed
--   * 62 skeleton entries carry coords but no loot yet - entries 1-62
--   * systems: 1 component at 8177,11259 z=-1 reports "square not loaded" -
--     those chunks never stream when travelling to this base, which is what a
--     pre-move or otherwise wrong coordinate looks like
--   * stash buildingX/buildingY still 8181,11259 (pre-move site) - anchor is
--     8087,11558
--   * 478 unclaimed containers: shared apartment block, confirm baseBuildings
--     only anchors the units we own before reading coverage as a gap
local wtc = {x = 8084, y = 11550, z = -1}
local pb1 = { x = 8079, y = 11551, z = -1 }
local RosewoodZippee = {
    group = "Rosewood",
    baseBuildings = {
        { x = 8087, y = 11558, z = 2 }, -- apartments
    },
    spawn = { x = 8087, y = 11558, z = 2 },
    generators = {
        {
            controls = { sprite = "dwap_tiles_01_22", x = 8082, y = 11550, z = pb1.z },
            fuelTank = { sprite = "dwap_tiles_01_24", x= 8080, y= 11550, z= -1, },
            fakeGenerators = {
                { x = 8082, y = 11548, z = -1, createTile = false },
            },
        },
    },
    waterTanks = {
        { sprite = "dwap_tiles_01_9", x = wtc.x, y = wtc.y, z = wtc.z, sourceType="generator", source = {x = 8172, y = 11255, z = -1} },
        { sprite = "industry_02_73", x = 8177, y = 11259, z = -1, },
    },
    waterFixtures = {
        -- 3rd floor apts
        { sprite = "fixtures_sinks_01_1", x = 8085, y = 11552, z = 2, sourceType="tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_bathroom_01_1", x = 8085, y = 11553, z = 2, sourceType="tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_bathroom_01_25", x = 8087, y = 11552, z = 2, sourceType="tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_bathroom_01_24", x = 8087, y = 11553, z = 2, sourceType="tank", source = wtc, }, -- bathroom, bld 31,45#6
        -- 2nd floor apts
        { sprite = "fixtures_sinks_01_5", x = 8074, y = 11552, z = 1, sourceType="tank", source = wtc, }, -- kitchen, bld 31,45#6
        { sprite = "fixtures_bathroom_01_26", x = 8077, y = 11560, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_sinks_01_11", x = 8078, y = 11551, z = 1, sourceType="tank", source = wtc, }, -- kitchen, bld 31,45#6
        { sprite = "fixtures_bathroom_01_2", x = 8078, y = 11558, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_sinks_01_29", x = 8078, y = 11559, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_bathroom_01_27", x = 8078, y = 11560, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_bathroom_01_25", x = 8087, y = 11552, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_sinks_01_4", x = 8085, y = 11552, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_bathroom_01_1", x = 8085, y = 11553, z = 1, sourceType="tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_sinks_01_5", x = 8092, y = 11552, z = 1, sourceType="tank", source = wtc, }, -- kitchen, bld 31,45#6
        -- 1st floor businesses
        { sprite = "fixtures_sinks_01_8", x = 8076, y = 11557, z = 0, sourceType="tank", source = wtc, }, -- breakroom, bld 31,45#6
        { sprite = "fixtures_sinks_01_12", x = 8078, y = 11552, z = 0, sourceType="tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "fixtures_bathroom_01_0", x = 8079, y = 11552, z = 0, sourceType="tank", source = wtc, }, -- bathroom, bld 31,45#6
        { sprite = "location_shop_zippee_01_60", x = 8093, y = 11560, z = 0, sourceType="tank", source = wtc, }, -- zippeestore, bld 31,45#6
    },
    doorKeys = {
        name = "Rosewood Zippee Apts Key",
        doors = {
            { sprite = "fixtures_doors_02_4", x = 8175, y = 11268, z = 0, },
            { sprite = "fixtures_doors_01_56", x = 8174, y = 11260, z = -1, },
        },
    },
    map = {name = "DWAPStashMap7",},
    objectSpawns = {
        { sprite = "industry_02_175", x = pb1.x, y = pb1.y, z = pb1.z, disabled = "EnableGenSystemSolar", clearExisting = true, },
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_windows_metal_16", x = 8096, y = 11555, z = 2, }, -- window W | livingroom, bld 31,45#6
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_windows_metal_16", x = 8096, y = 11557, z = 2, }, -- window W | livingroom, bld 31,45#6
        { barricade = "woodhalf", enabled = "Barricade", target="fixtures_windows_metal_16", x = 8096, y = 11559, z = 2, }, -- window W | livingroom, bld 31,45#6
    },
    loot = {
        -- E1
        { type = 'container', coords = {x=8089,y=11560,z=2}, }, -- dresser @ bedroom
        -- E2
        { type = 'container', coords = {x=8088,y=11556,z=2}, }, -- sidetable @ bedroom
        -- E3
        { type = 'container', coords = {x=8086,y=11556,z=2}, }, -- wardrobe @ bedroom
        -- E4
        { type = 'container', coords = {x=8086,y=11557,z=2}, }, -- wardrobe @ bedroom
        -- E5
        { type = 'container', coords = {x=8086,y=11559,z=2}, }, -- shelves @ bedroom
        -- E6
        { type = 'container', coords = {x=8082,y=11556,z=2}, }, -- wardrobe @ bedroom
        -- E7
        { type = 'container', coords = {x=8082,y=11557,z=2}, }, -- wardrobe @ bedroom
        -- E8
        { type = 'container', coords = {x=8089,y=11554,z=2}, }, -- shelves @ livingroom
        -- E9
        { type = 'container', coords = {x=8083,y=11552,z=2}, }, -- wardrobe @ livingroom
        -- E10
        { type = 'container', coords = {x=8084,y=11552,z=2}, }, -- wardrobe @ livingroom
        -- E11
        { type = 'container', coords = {x=8082,y=11555,z=2}, }, -- dresser @ livingroom
        -- E12
        { type = 'container', coords = {x=8085,y=11552,z=2}, }, -- counter @ bathroom
        -- E13
        { type = 'container', coords = {x=8085,y=11552,z=2}, slot = "upper", }, -- medicine @ bathroom
        -- E14
        { type = 'container', coords = {x=8088,y=11552,z=2}, }, -- cardboardbox @ closet
        -- E15
        { type = 'container', coords = {x=8088,y=11552,z=2}, slot = "upper", }, -- cardboardbox @ closet
        -- E16
        { type = 'container', coords = {x=8089,y=11552,z=2}, slot = "upper", }, -- metal_shelves @ closet
        -- E17
        { type = 'container', coords = {x=8090,y=11552,z=2}, }, -- counter @ kitchen
        -- E18
        { type = 'container', coords = {x=8091,y=11552,z=2}, slot = "upper", }, -- shelves @ kitchen
        -- E19
        { type = 'container', coords = {x=8091,y=11552,z=2}, }, -- counter @ kitchen
        -- E20
        { type = 'container', coords = {x=8092,y=11552,z=2}, }, -- counter @ kitchen
        -- E21
        { type = 'container', coords = {x=8094,y=11552,z=2}, }, -- counter @ kitchen
        -- E22
        { type = 'container', coords = {x=8090,y=11553,z=2}, }, -- fridge @ kitchen
        -- E23
        { type = 'container', coords = {x=8090,y=11553,z=2}, slot = "freezer", }, -- freezer @ kitchen
        -- E24
        { type = 'container', coords = {x=8090,y=11560,z=2}, }, -- sidetable @ livingroom
        -- E25
        { type = 'container', coords = {x=8090,y=11554,z=2}, }, -- shelves @ livingroom
        -- E26
        { type = 'container', coords = {x=8093,y=11559,z=2}, }, -- sidetable @ livingroom
        -- E27
        { type = 'container', coords = {x=8080,y=11552,z=1}, }, -- cardboardbox @ livingroom
        -- E28
        { type = 'container', coords = {x=8081,y=11552,z=1}, }, -- cardboardbox @ livingroom
        -- E29
        { type = 'container', coords = {x=8081,y=11552,z=1}, slot = "upper", }, -- cardboardbox @ livingroom
        -- E30
        { type = 'container', coords = {x=8081,y=11553,z=1}, }, -- smallbox @ livingroom
        -- E31
        { type = 'container', coords = {x=8078,y=11557,z=-1}, }, -- shelves @ hall
        -- E32
        { type = 'container', coords = {x=8079,y=11558,z=-1}, }, -- smallbox @ hall
        -- E33
        { type = 'container', coords = {x=8081,y=11552,z=-1}, slot = "upper", }, -- metal_shelves @ storage
        -- E34
        { type = 'container', coords = {x=8090,y=11552,z=-1}, }, -- smallbox @ storageunit
        -- E35
        { type = 'container', coords = {x=8089,y=11549,z=-1}, }, -- desk @ storageunit
        -- E36
        { type = 'container', coords = {x=8092,y=11549,z=-1}, }, -- shelves @ storageunit
        -- E37
        { type = 'container', coords = {x=8092,y=11551,z=-1}, }, -- cardboardbox @ storageunit
        -- E38
        { type = 'container', coords = {x=8087,y=11549,z=-1}, }, -- metal_shelves @ storageunit
        -- E39
        { type = 'container', coords = {x=8087,y=11550,z=-1}, }, -- cardboardbox @ storageunit
        -- E40
        { type = 'container', coords = {x=8087,y=11550,z=-1}, slot = "upper", }, -- cardboardbox @ storageunit
        -- E41
        { type = 'container', coords = {x=8087,y=11551,z=-1}, }, -- cardboardbox @ storageunit
        -- E42
        { type = 'container', coords = {x=8090,y=11560,z=-1}, }, -- locker @ storageunit
        -- E43
        { type = 'container', coords = {x=8093,y=11560,z=-1}, }, -- smallbox @ storageunit
        -- E44
        { type = 'container', coords = {x=8090,y=11557,z=-1}, }, -- cardboardbox @ storageunit
        -- E45
        { type = 'container', coords = {x=8086,y=11560,z=-1}, }, -- metal_shelves @ storageunit
        -- E46
        { type = 'container', coords = {x=8087,y=11560,z=-1}, }, -- metal_shelves @ storageunit
        -- E47
        { type = 'container', coords = {x=8086,y=11557,z=-1}, }, -- toolcabinet @ storageunit
        -- E48
        { type = 'container', coords = {x=8073,y=11556,z=0}, }, -- filingcabinet @ office
        -- E49
        { type = 'container', coords = {x=8075,y=11557,z=0}, }, -- desk @ office
        -- E50
        { type = 'container', coords = {x=8073,y=11558,z=0}, }, -- shelves @ office
        -- E51
        { type = 'container', coords = {x=8076,y=11556,z=0}, }, -- counter @ breakroom
        -- E52
        { type = 'container', coords = {x=8076,y=11557,z=0}, }, -- counter @ breakroom
        -- E53
        { type = 'container', coords = {x=8076,y=11558,z=0}, }, -- counter @ breakroom
        -- E54
        { type = 'container', coords = {x=8073,y=11552,z=0}, }, -- cardboardbox @ zippeestorage
        -- E55
        { type = 'container', coords = {x=8073,y=11552,z=0}, slot = "upper", }, -- cardboardbox @ zippeestorage
        -- E56
        { type = 'container', coords = {x=8074,y=11552,z=0}, }, -- metal_shelves @ zippeestorage
        -- E57
        { type = 'container', coords = {x=8075,y=11552,z=0}, }, -- metal_shelves @ zippeestorage
        -- E58
        { type = 'container', coords = {x=8076,y=11552,z=0}, }, -- metal_shelves @ zippeestorage
        -- E59
        { type = 'container', coords = {x=8077,y=11552,z=0}, }, -- metal_shelves @ zippeestorage
        -- E60
        { type = 'container', coords = {x=8073,y=11553,z=0}, }, -- cardboardbox @ zippeestorage
        -- E61
        { type = 'container', coords = {x=8077,y=11553,z=0}, }, -- smallbox @ zippeestorage
        -- E62
        { type = 'container', coords = {x=8079,y=11552,z=0}, slot = "upper", }, -- medicine @ bathroom
    },
}

if getActivatedMods():contains("\\Ladders") then
    -- @TODO this needs to be remapped and updated for the new location
    -- table.insert(RosewoodZippee.objectSpawns, { enabled = "EnableLadders", x = 8174, y = 11255, z = -1, removeWall = "north" })
    -- table.insert(RosewoodZippee.objectSpawns, { enabled = "EnableLadders", x = 8174, y = 11215, z = 0, removeFloor = true, })
    -- table.insert(RosewoodZippee.objectSpawns, { enabled = "EnableLadders", sprite = "fencing_01_59", x = 8175, y = 11215, z = 0 })
    -- table.insert(RosewoodZippee.doorKeys.doors, { sprite = "fixtures_doors_fences_01_25", x = 8175, y = 11213, z = 0, })
    -- table.insert(RosewoodZippee.doorKeys.doors, { sprite = "fixtures_doors_01_57", x = 8175, y = 11214, z = 0, })

    -- table.insert(RosewoodZippee.generators[1].fakeGenerators, { x = 8173, y = 11234, z = -1, createTile = false })
end

return RosewoodZippee
