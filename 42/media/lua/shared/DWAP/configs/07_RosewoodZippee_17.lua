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
            solar = {
                powerbank = { sprite = "dwap_tiles_01_0", x = pb1.x, y = pb1.y, z = pb1.z },
                panels = {
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_10",
                        x = 8176,
                        y = 11272,
                        z = 2,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_10",
                        x = 8177,
                        y = 11272,
                        z = 2,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_10",
                        x = 8178,
                        y = 11272,
                        z = 2,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_10",
                        x = 8179,
                        y = 11272,
                        z = 2,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_10",
                        x = 8180,
                        y = 11272,
                        z = 2,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_10",
                        x = 8181,
                        y = 11272,
                        z = 2,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_10",
                        x = 8182,
                        y = 11272,
                        z = 2,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_10",
                        x = 8183,
                        y = 11272,
                        z = 2,
                        pb = 1,
                        spawn = false,
                    },
                    {
                        type = "panel",
                        isSpecial = true,
                        sprite = "solarmod_tileset_01_10",
                        x = 8184,
                        y = 11272,
                        z = 2,
                        pb = 1,
                        spawn = false,
                    },
                },
            },
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
        { type = 'container', coords = {x=8089,y=11560,z=2}, }, -- dresser @ bedroom
        { type = 'container', coords = {x=8088,y=11556,z=2}, }, -- sidetable @ bedroom
        { type = 'container', coords = {x=8086,y=11556,z=2}, }, -- wardrobe @ bedroom
        { type = 'container', coords = {x=8086,y=11557,z=2}, }, -- wardrobe @ bedroom
        { type = 'container', coords = {x=8086,y=11559,z=2}, }, -- shelves @ bedroom
        { type = 'container', coords = {x=8082,y=11556,z=2}, }, -- wardrobe @ bedroom
        { type = 'container', coords = {x=8082,y=11557,z=2}, }, -- wardrobe @ bedroom
        { type = 'container', coords = {x=8089,y=11554,z=2}, }, -- shelves @ livingroom
        { type = 'container', coords = {x=8083,y=11552,z=2}, }, -- wardrobe @ livingroom
        { type = 'container', coords = {x=8084,y=11552,z=2}, }, -- wardrobe @ livingroom
        { type = 'container', coords = {x=8082,y=11555,z=2}, }, -- dresser @ livingroom
        { type = 'container', coords = {x=8085,y=11552,z=2}, }, -- counter @ bathroom
        { type = 'container', coords = {x=8085,y=11552,z=2}, slot = "upper", }, -- medicine @ bathroom
        { type = 'container', coords = {x=8088,y=11552,z=2}, }, -- cardboardbox @ closet
        { type = 'container', coords = {x=8088,y=11552,z=2}, slot = "upper", }, -- cardboardbox @ closet
        { type = 'container', coords = {x=8089,y=11552,z=2}, slot = "upper", }, -- metal_shelves @ closet
        { type = 'container', coords = {x=8090,y=11552,z=2}, }, -- counter @ kitchen
        { type = 'container', coords = {x=8091,y=11552,z=2}, slot = "upper", }, -- shelves @ kitchen
        { type = 'container', coords = {x=8091,y=11552,z=2}, }, -- counter @ kitchen
        { type = 'container', coords = {x=8092,y=11552,z=2}, }, -- counter @ kitchen
        { type = 'container', coords = {x=8094,y=11552,z=2}, }, -- counter @ kitchen
        { type = 'container', coords = {x=8090,y=11553,z=2}, }, -- fridge @ kitchen
        { type = 'container', coords = {x=8090,y=11553,z=2}, slot = "freezer", }, -- freezer @ kitchen
        { type = 'container', coords = {x=8090,y=11560,z=2}, }, -- sidetable @ livingroom
        { type = 'container', coords = {x=8090,y=11554,z=2}, }, -- shelves @ livingroom
        { type = 'container', coords = {x=8093,y=11559,z=2}, }, -- sidetable @ livingroom
        { type = 'container', coords = {x=8080,y=11552,z=1}, }, -- cardboardbox @ livingroom
        { type = 'container', coords = {x=8081,y=11552,z=1}, }, -- cardboardbox @ livingroom
        { type = 'container', coords = {x=8081,y=11552,z=1}, slot = "upper", }, -- cardboardbox @ livingroom
        { type = 'container', coords = {x=8081,y=11553,z=1}, }, -- smallbox @ livingroom
        { type = 'container', coords = {x=8078,y=11557,z=-1}, }, -- shelves @ hall
        { type = 'container', coords = {x=8079,y=11558,z=-1}, }, -- smallbox @ hall
        { type = 'container', coords = {x=8081,y=11552,z=-1}, slot = "upper", }, -- metal_shelves @ storage
        { type = 'container', coords = {x=8090,y=11552,z=-1}, }, -- smallbox @ storageunit
        { type = 'container', coords = {x=8089,y=11549,z=-1}, }, -- desk @ storageunit
        { type = 'container', coords = {x=8092,y=11549,z=-1}, }, -- shelves @ storageunit
        { type = 'container', coords = {x=8092,y=11551,z=-1}, }, -- cardboardbox @ storageunit
        { type = 'container', coords = {x=8087,y=11549,z=-1}, }, -- metal_shelves @ storageunit
        { type = 'container', coords = {x=8087,y=11550,z=-1}, }, -- cardboardbox @ storageunit
        { type = 'container', coords = {x=8087,y=11550,z=-1}, slot = "upper", }, -- cardboardbox @ storageunit
        { type = 'container', coords = {x=8087,y=11551,z=-1}, }, -- cardboardbox @ storageunit
        { type = 'container', coords = {x=8090,y=11560,z=-1}, }, -- locker @ storageunit
        { type = 'container', coords = {x=8093,y=11560,z=-1}, }, -- smallbox @ storageunit
        { type = 'container', coords = {x=8090,y=11557,z=-1}, }, -- cardboardbox @ storageunit
        { type = 'container', coords = {x=8086,y=11560,z=-1}, }, -- metal_shelves @ storageunit
        { type = 'container', coords = {x=8087,y=11560,z=-1}, }, -- metal_shelves @ storageunit
        { type = 'container', coords = {x=8086,y=11557,z=-1}, }, -- toolcabinet @ storageunit
        { type = 'container', coords = {x=8073,y=11556,z=0}, }, -- filingcabinet @ office
        { type = 'container', coords = {x=8075,y=11557,z=0}, }, -- desk @ office
        { type = 'container', coords = {x=8073,y=11558,z=0}, }, -- shelves @ office
        { type = 'container', coords = {x=8076,y=11556,z=0}, }, -- counter @ breakroom
        { type = 'container', coords = {x=8076,y=11557,z=0}, }, -- counter @ breakroom
        { type = 'container', coords = {x=8076,y=11558,z=0}, }, -- counter @ breakroom
        { type = 'container', coords = {x=8073,y=11552,z=0}, }, -- cardboardbox @ zippeestorage
        { type = 'container', coords = {x=8073,y=11552,z=0}, slot = "upper", }, -- cardboardbox @ zippeestorage
        { type = 'container', coords = {x=8074,y=11552,z=0}, }, -- metal_shelves @ zippeestorage
        { type = 'container', coords = {x=8075,y=11552,z=0}, }, -- metal_shelves @ zippeestorage
        { type = 'container', coords = {x=8076,y=11552,z=0}, }, -- metal_shelves @ zippeestorage
        { type = 'container', coords = {x=8077,y=11552,z=0}, }, -- metal_shelves @ zippeestorage
        { type = 'container', coords = {x=8073,y=11553,z=0}, }, -- cardboardbox @ zippeestorage
        { type = 'container', coords = {x=8077,y=11553,z=0}, }, -- smallbox @ zippeestorage
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
