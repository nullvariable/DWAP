local DWAPUtils = require("DWAPUtils")
local random = newrandom()

local lootConfig = {}
local lootByCoords = {}

--- Turn a set of coords into a hash
--- @return number
local hashCoords = DWAPUtils.hashCoords

--- populate the lootConfig table with a single config entry
--- @param config table
local function setLootConfigValue(config)
    if not config then return end
    if not config.coords then
        DWAPUtils.dprint("Loot config missing coords")
        DWAPUtils.dprint(config)
        return
    end
    local x = config.coords.x
    local y = config.coords.y
    local z = config.coords.z
    -- Normalize the vertical conventions: slot = "upper"/"freezer" are the
    -- explicit forms, legacy fractional z (+0.5) still means upper, stack
    -- ordinals address crate stacks. Bottom is the default
    local member = config.stack
    if not member then
        if z % 1 ~= 0 then
            member = "upper"
        else
            member = config.slot or "base"
        end
    end
    z = math.floor(z)
    local coordsKey = hashCoords(x, y, z)
    local index = #lootConfig + 1
    lootConfig[index] = config
    local slot = lootByCoords[coordsKey]
    if member == "base" and slot == nil then
        -- common case stays a plain number (matches legacy modData shape)
        lootByCoords[coordsKey] = index
    else
        if type(slot) ~= "table" then
            slot = { base = slot }
            lootByCoords[coordsKey] = slot
        end
        slot[member] = index
    end
end

--- get the loot config for a set of coords
--- @param x number
--- @param y number
--- @param z number
--- @return table|nil lootConfig, number|nil index, number|nil coordsKey loot config, lootByCoords index, hash of coords
-- member: nil/"base" for the bottom container, "upper" for wall-mounted,
-- or a stack ordinal number
local function getLootForCoords(x, y, z, member)
    member = member or "base"
    local coordsKey = hashCoords(x, y, z)
    local slot = lootByCoords[coordsKey]
    local index
    if type(slot) == "table" then
        index = slot[member]
    elseif member == "base" then
        index = slot
    end
    if index then
        return lootConfig[index], index, coordsKey
    end
    return nil, nil, nil
end

--- Remove a loot entry by index and coordsKey
--- @param index number
--- @param coordsKey number
local function removeLootEntry(index, coordsKey)
    if not index then return end
    local config = lootConfig[index]
    if not config then return end
    lootConfig[index] = nil
    local slot = lootByCoords[coordsKey]
    if type(slot) == "table" then
        -- clear only this entry's member; drop the slot once empty
        -- (PZ's Kahlua has no `next` global, so probe emptiness with pairs)
        local empty = true
        for k, v in pairs(slot) do
            if v == index then
                slot[k] = nil
            else
                empty = false
            end
        end
        if empty then lootByCoords[coordsKey] = nil end
    else
        lootByCoords[coordsKey] = nil
    end
end

--- check if there's room in a container, based on the desired level and the container's max capacity
--- @param container ItemContainer
--- @param desiredLevel number
--- @return boolean
local function checkHasRoom(container, desiredLevel)
    if not container then return false end
    if desiredLevel == 4 then return false end
    if desiredLevel == 1 or not desiredLevel then return container:hasRoomFor(getPlayer(), 1) end
    local weight = container:getContentsWeight()
    local maxWeight = container:getMaxWeight()
    -- 2 = 60%, 3 = 30%
    if desiredLevel == 2 then
        return weight < (maxWeight * 0.6)
    elseif desiredLevel == 3 then
        local getItems = container:getItems()

        return getItems:size() < random:random(3, 6) and weight < (maxWeight * 0.15)
    end
    return false
end

--- fixes empty items
--- @param item string
--- @return InventoryItem|nil item
local function handleEmptyItem(item)
    --- @type InventoryItem
    local ii = instanceItem(item)
    if not ii then return nil end
    local flContainer = ii:getFluidContainer()
    if not flContainer then return ii end
    flContainer:Empty()
    return ii
end

--- Spawned food gets its age from Food.setAutoAge, which never looks at local
--- power: it only credits a fridge when the sandbox ElecShutModifier is > -1,
--- and ours is -1, so the whole fridge/freezer branch is skipped and stock ages
--- as if it had sat on a counter since the apocalypse. A base with an auto-on
--- generator handed out spoiled food regardless.
---
--- The old `frozen` config flag treated the symptom and could not actually fix
--- it: isRotten() is `age >= offAgeMax` and takes no notice of freezing, so an
--- item already stamped past its limit stayed rotten - freezing only stops the
--- clock from that point on. Resetting the age is the real fix, and Food.updateAge
--- DOES respect haveElectricity(), so from then on the generator keeps it fresh
--- the way it should have all along.
---
--- Gated on the CONTAINER rather than the item, on two counts. Cost: only cold
--- containers are affected, so type-checking every spawned item would put a
--- Lua->Java instanceof across the entire loot table when nearly all of it is
--- tools, books and clothing - this is two calls per addItem instead. And
--- correctness: a standalone freezer unit satisfies a plain base entry under
--- resolveLootContainer, so it carries no slot = "freezer" and a config-driven
--- test would miss it. ItemContainer.isFreezer is what the game's own
--- isInFreezer calls, and a fridge/freezer combo is one object with two
--- containers of differing type, so the pair on a shared tile sorts itself out.
---
--- Operates on the ArrayList that ItemContainer.AddItems returns - AddItems is
--- itself a loop over AddItem that collects its results, so reusing that list
--- costs nothing over calling AddItem ourselves.
--- @param items ArrayList|nil
--- @param container ItemContainer
local function freshenAll(items, container)
    if not items then return end
    local freeze = container:isFreezer()
    -- isFridge() is explicitly false for freezers, so this covers both
    if not freeze and not container:isFridge() then return end
    for i = 0, items:size() - 1 do
        local food = items:get(i)
        if instanceof(food, "Food") then
            food:setAge(0)
            if freeze and not food:isSpice() and food:canBeFrozen() then
                food:setFreezingTime(100)
            end
        end
    end
end

--- add an item to a container, freshening any food it produces
--- @param container ItemContainer
--- @param item string
--- @param count? number
--- @return InventoryItem|nil item
local function addItem(container, item, count)
    -- DWAPUtils.dprint("addItem")
    -- DWAPUtils.dprint({item = item, count = count})
    local _count = count or 1
    if not item or not container then
        DWAPUtils.dprint("WARN addItem: item or container is nil")
        return
    end
    if item == "VHS_Retail" or item == "Base.VHS_Retail" then
        local ii = DWAP_LootSpawning.nameMediaItem(item, "MagazineCrossword")
        DWAPUtils.dprint("VHS item: " .. tostring(ii))
        container:AddItem(ii)
    elseif item == "Disc_Retail" or item == "Base.Disc_Retail" then
        local ii = DWAP_LootSpawning.nameMediaItem(item, "MagazineWordsearch")
        container:AddItem(ii)
    elseif type(item) == "string" and item:match("Empty") then
        local ii = handleEmptyItem(item)
        if not ii then return end
        freshenAll(container:AddItems(ii, _count), container)
    else
        if item == "Essential_Bag_ALICE_BeltSus_Camo" then
            DWAPUtils.dprint("Adding Alice Pack to container")
            local result = container:AddItem("Bag_ALICE_BeltSus_Camo")
            if not result then
                DWAPUtils.dprint("Failed to add Alice Pack to container")
                return
            end
            local innerContainer = result:getInventory()
            local _, alicePackItems = DWAP_LootSpawning.getEssentials()
            DWAPUtils.dprint("Alice Pack item count: " .. tostring(#alicePackItems))
            if innerContainer and alicePackItems and #alicePackItems > 0 then
                for i = 1, #alicePackItems do
                    local aliceItem = alicePackItems[i]
                    if aliceItem then
                        local ii = instanceItem(aliceItem)
                        if ii then
                            innerContainer:AddItems(ii, 1)
                        end
                    end
                end
            else
                if innerContainer then
                    DWAPUtils.dprint("Alice Pack container found, no items to add")
                else
                    DWAPUtils.dprint("Failed to get Alice Pack inner container")
                end
            end
        else
            freshenAll(container:AddItems(item, _count), container)
        end
    end
end

--- @param container ItemContainer
--- @param config table
--- @param index number
--- @param coordsKey number
--- Stamp the container's parent object when a loot entry is consumed so
--- audits can verify the DWAP fill actually ran regardless of the world's
--- base-loot setting (with loot on, "container has items" proves nothing).
--- Keyed per vertical member so fridge/freezer and stack pairs stamp
--- independently. state: "filled" or "disabled" (sandbox option off)
local function stampFill(container, config, state)
    local parent = container and container:getParent()
    if not parent then return end
    local md = parent:getModData()
    local stamps = md.DWAPLoot
    if not stamps then
        stamps = {}
        md.DWAPLoot = stamps
    end
    local member = config.stack
        or ((config.coords and config.coords.z % 1 ~= 0) and "upper")
        or config.slot or "base"
    stamps[tostring(member)] = state or "filled"
end

local function fillContainer(container, config, index, coordsKey)
    if not container or not config then return end
    local containerType = container:getType()
    if not config.stove and (containerType == "microwave" or container:isStove()) then
        return
    end
    container:emptyIt()
    -- local level = SandboxVars.DWAP[spawnConfig.level] or 4
    local level = 3
    if type(config.level) == "string" then
        level = SandboxVars.DWAP[config.level] or 4
    elseif type(config.level) == "number" then
        level = config.level
    elseif config.special == 'kitchentools' then
        level = SandboxVars.DWAP.Loot_FoodLevel or 3
    elseif config.special == 'gunlocker' then
        level = SandboxVars.DWAP.Loot_GunLevel or 3
    end
    if config.sandboxEnable ~= nil and not SandboxVars.DWAP[config.sandboxEnable] then
        stampFill(container, config, "disabled")
        removeLootEntry(index, coordsKey)
        return
    end
    if config.special then
        if config.special == "maps" then
            local allMaps = DWAP_LootSpawning.getAllMaps()
            for i = 1, #allMaps do
                local item = allMaps[i]
                if item then
                    addItem(container, item)
                    -- allMaps[i] = nil
                end
            end
        elseif config.special == "skillbooks1" then
            local skillBooks1 = DWAP_LootSpawning.getSkillBooks1()
            for i = 1, #skillBooks1 do
                local item = skillBooks1[i]
                if item then
                    addItem(container, item)
                    -- skillBooks1[i] = nil
                end
            end
        elseif config.special == "skillbooks2" then
            local skillBooks2 = DWAP_LootSpawning.getSkillBooks2()
            for i = 1, #skillBooks2 do
                local item = skillBooks2[i]
                if item then
                    addItem(container, item)
                    -- skillBooks2[i] = nil
                end
            end
        elseif config.special == "skillmags" then
            local allSkillMags = DWAP_LootSpawning.getAllSkillMags()
            for i = 1, #allSkillMags do
                local item = allSkillMags[i]
                if item then
                    addItem(container, item)
                    -- allSkillMags[i] = nil
                end
            end
        elseif config.special == "SeedLibrary" then
            local allSeeds = DWAP_LootSpawning.getAllSeeds()
            if allSeeds and #allSeeds > 0 then
                for i = 1, #allSeeds do
                    local item = allSeeds[i]
                    if item then
                        local count = random:random(2, 4)
                        addItem(container, item, count)
                    end
                end
                level = SandboxVars.DWAP.Loot_FarmLevel or 4
                local hasRoom = checkHasRoom(container, level)
                local tries = 0
                while hasRoom and tries < 100 do
                    local item = allSeeds[random:random(1, #allSeeds)]
                    addItem(container, item)
                    hasRoom = checkHasRoom(container, level)
                    tries = tries + 1
                end
            end
        elseif config.special == "essentials" then
            local essentials, alicePack = DWAP_LootSpawning.getEssentials()
            for i = 1, #essentials do
                local item = essentials[i]
                if item then
                    addItem(container, item)
                end
            end
        elseif config.special == "kitchentools" and level < 4 then
            local kitchenTools = DWAP_LootSpawning.getKitchenTools()
            local kitchenToolsWithSpices =  DWAP_LootSpawning.getKitchenToolsSpices()
            for i = 1, #kitchenTools do
                kitchenToolsWithSpices[#kitchenToolsWithSpices+1] = kitchenTools[i]
            end
            for i = 1, #kitchenTools do
                local item = kitchenTools[i]
                if item then
                    addItem(container, item)
                end
            end
            local hasRoom = checkHasRoom(container, level)
            local tries = 0
            while hasRoom and tries < 100 do
                local item =  kitchenToolsWithSpices[random:random(1, #kitchenToolsWithSpices)]
                addItem(container, item)
                hasRoom = checkHasRoom(container, level)
                tries = tries + 1
            end
        elseif config.special == "gunlocker" and level < 4 then -- specifically loads a single gun and clips/ammo for a locker
            local gunLockers = DWAP_LootSpawning.getGunLockers()
            local gunLocker = random:random(1, #gunLockers)
            for i = 1, #gunLockers[gunLocker] do
                local item = gunLockers[gunLocker][i]
                if item then
                    addItem(container, item)
                end
            end
            local hasRoom = checkHasRoom(container, level)
            local tries = 0
            while hasRoom and tries < 100 do
                local item = gunLockers[gunLocker][#gunLockers[gunLocker]]
                addItem(container, item)
                hasRoom = checkHasRoom(container, level)
                tries = tries + 1
            end
        end
    elseif config.randUntilFull then
        local items = {}
        if config.dist then
            items = DWAP_LootSpawning.getItemsWithDistLists(config.dist, config.distIncludeJunk)
        end
        if config.items then
            for i = 1, #config.items do
                if config.items[i].count then
                    local count = random:random(config.items[i].count[1], config.items[i].count[2])
                    for j = 1, count do
                        if config.items[i].chance then
                            if config.items[i].chance == 1 or config.items[i].chance >= (random:random(1, 100) / 100) then
                                items[#items + 1] = config.items[i].name
                                addItem(container, config.items[i].name, 1)
                            end
                        else
                            items[#items + 1] = config.items[i].name
                            addItem(container, config.items[i].name, 1)
                        end
                    end
                else
                    items[#items + 1] = config.items[i].name
                    addItem(container, config.items[i].name, 1)
                end
            end
        end

        local throttledSpawnPerContainer = {}
        if not items or #items < 1 then return end
        local item = items[random:random(1, #items)]
        local hasRoom = true -- first item always has room
        local tries = 0
        while hasRoom and tries < 100 do
            if not items or #items < 2 and throttledSpawnPerContainer and #throttledSpawnPerContainer > 0 then
                for i = 0, #throttledSpawnPerContainer do
                    items[#items + 1] = throttledSpawnPerContainer[i]
                end
                throttledSpawnPerContainer = {}
                -- DWAPUtils.dprint("Added containers to items: " .. #alreadySpawnedContainers)
            end
            local randindex = random:random(1, #items)
            item = items[randindex]
            hasRoom = checkHasRoom(container, level)
            if hasRoom and item then
                addItem(container, item, 1)
                if type(item) == "string" then
                    local ii = instanceItem(item)
                    if ii and ii:getCategory() == "Container" then
                        items[randindex] = nil
                        throttledSpawnPerContainer[#throttledSpawnPerContainer + 1] = item
                        -- DWAPUtils.dprint("Added container: " .. item)
                    elseif ii and DWAP_LootSpawning.isThrottleSpawnItem(item) then
                        -- DWAPUtils.dprint("Throttled spawn item: " .. item)
                        items[randindex] = nil
                        throttledSpawnPerContainer[#throttledSpawnPerContainer + 1] = item
                    end
                end
            end
            tries = tries + 1
        end
    else
        -- DWAPUtils.dprint("final loot else")
        local items = config.items or {}
        local dist = config.dist or { "RandomFiller" }
        if config.dist or #items < 1 then
            local _items = DWAP_LootSpawning.getItemsWithDistLists(dist, config.distIncludeJunk)
            if _items then
                for i = 1, #_items do
                    items[#items + 1] = { name = _items[i] }
                end
            end
        end
        if not items then return end
        for k = 1, #items do
            local item = items[k]
            if item then
                if item.chance then
                    if item.chance == 1 or item.chance >= (random:random(1, 100) / 100) then
                        local count = random:random(item.count[1], item.count[2])
                        addItem(container, item.name, count)
                    end
                else
                    addItem(container, item.name, 1)
                end
            end
        end
    end
    stampFill(container, config, "filled")
    removeLootEntry(index, coordsKey)
end

local function loadConfigs()
    local configs = DWAPUtils.loadConfigs()
    local safehouseIndex = DWAPUtils.getPrimaryConfigIndex()
    DWAPUtils.dprint("Loot Safehouse Index: " .. tostring(safehouseIndex))
    local nonPrimaryLootLevel = SandboxVars.DWAP.Loot
    for i = 1, #configs do
        local config = configs[i]
        local count = 0
        local specialCount = 0
        if config and config.loot then
            if (nonPrimaryLootLevel == 1 and i ~= safehouseIndex and not config.addonLootOverride) or nonPrimaryLootLevel == 4 then
                config.loot = {}
            else
                local rewriteLevel = nonPrimaryLootLevel == 3 and i ~= safehouseIndex
                if config.addonLootOverride then
                    rewriteLevel = false
                end
                for j = 1, #config.loot do
                    local lootEntry = config.loot[j]
                    if lootEntry then
                        -- in -debug every config gets its specials so audits
                        -- and base-hopping test sessions see the full loadout;
                        -- players still only get them at the selected base
                        local skipSpecial = lootEntry.special and lootEntry.special ~= "gunlocker"
                            and i ~= safehouseIndex and not config.essentialLootOverride
                            and not getDebug()
                        if skipSpecial then
                            -- just don't register it: nil-ing config.loot[j]
                            -- punched holes in the SHARED require-cached
                            -- table, truncating #loot for every consumer
                            -- (the audit was silently missing entries)
                            DWAPUtils.dprint("Config " .. i .. " skipping special loot: " .. tostring(lootEntry.special))
                        else
                            -- register a shallow copy: level defaulting and
                            -- the non-primary rewrite must not leak into the
                            -- shared config tables
                            local entry = {}
                            for k, v in pairs(lootEntry) do entry[k] = v end
                            if not entry.level then
                                entry.level = 3 -- default to low
                            end
                            if rewriteLevel and type(entry.level) == "string" then
                                -- overwrite to low
                                entry.level = 3
                            end
                            setLootConfigValue(entry)
                            -- try to precache the items
                            if entry.dist then
                                DWAP_LootSpawning.getItemsWithDistLists(entry.dist, entry.distIncludeJunk)
                            end
                            if entry.special then
                                specialCount = specialCount + 1
                            end
                            count = count + 1
                        end
                    end
                end
            end
        end
        DWAPUtils.dprint("Done. Loot config count: " .. count .. " special count: " .. specialCount .. " for config: " .. tostring(config.doorKeys and config.doorKeys.name or "unknown"))
    end
end

--- Fill a fridge/freezer combo's freezer compartment, which the game never
--- offers us.
---
--- Vanilla's loot pass is LoadGridsquarePerformanceWorkaround.ItemPicker
--- .checkObject, and it reads object:getContainer() - the PRIMARY container
--- only. Freezer compartments live in IsoObject.secondaryContainers and are
--- reachable solely through getContainerByIndex, so they are never passed to
--- ItemPickerJava.fillContainer and OnFillContainer never fires for them.
--- That is why every slot = "freezer" entry in the mod (17 of them, across 13
--- configs) failed the audit with "Not filled" - it was never settle timing.
---
--- The fridge half of the same object DOES fire, so ride that event and fill
--- the compartment directly. Standalone freezer units are unaffected: their
--- freezer container IS the primary, so they already fill as base entries.
--- @param square IsoGridSquare
--- @param container ItemContainer the container OnFillContainer just fired for
local function fillFreezerCompartment(square, x, y, z, container)
    local parent = container:getParent()
    -- only combos have a secondary; a lone container can't hide one
    if not parent or not parent.getContainerCount or parent:getContainerCount() < 2 then
        return
    end
    local fLoot, fIndex, fKey = getLootForCoords(x, y, z, "freezer")
    if not fLoot then return end
    local freezer = DWAPUtils.resolveLootContainer(square, { freezer = true })
    -- same-container guard: if OnFillContainer ever does fire for a secondary,
    -- the block above already handled it and the entry is gone
    if not freezer or freezer == container then return end
    DWAPUtils.DeferThrottled(function()
        fillContainer(freezer, fLoot, fIndex, fKey)
        ItemPickerJava.updateOverlaySprite(parent)
    end)
end

--- Handle Custom Loot Spawns
--- @param roomType string
--- @param containerType string
--- @param container ItemContainer
local function onFillContainer(roomType, containerType, container)
    -- Server-side only - no client check needed as OnFillContainer runs on server
    if not SandboxVars.DWAP.Loot or SandboxVars.DWAP.Loot > 3 then return end
    if not container or roomType == "Container" or roomType == "Zombie Bag" then return end
    if not instanceof(container, "ItemContainer") then
        DWAPUtils.dprint("onFillContainer: Not an ItemContainer")
        return
    end
    local square = container:getSourceGrid()
    if square then
        local x, y, z = square:getX(), square:getY(), square:getZ()
        -- Per-square resolution: each entry addresses exactly one container
        -- (stack ordinal > property-flagged upper > order fallbacks), so
        -- multiple containers on one tile can't race for the same entry.
        -- DWAPUtils.resolveLootContainer is the shared source of truth.
        local loot, index, coordsKey

        -- stack entry for this container's ordinal on the square?
        local list = DWAPUtils.getSquareContainers(square)
        local ordinal
        for i = 1, #list do
            if list[i].container == container then
                ordinal = i
                break
            end
        end
        if ordinal then
            loot, index, coordsKey = getLootForCoords(x, y, z, ordinal)
        end

        -- upper entry that resolves to this container? (legacy fallback:
        -- modData snapshots from older saves key uppers at z + 0.5)
        if not loot then
            local upLoot, upIndex, upKey = getLootForCoords(x, y, z, "upper")
            if not upLoot then
                upLoot, upIndex, upKey = getLootForCoords(x, y, z + 0.5)
            end
            if upLoot then
                local baseLoot = getLootForCoords(x, y, z)
                if DWAPUtils.resolveLootContainer(square, { upper = true, pairPresent = baseLoot ~= nil }) == container then
                    loot, index, coordsKey = upLoot, upIndex, upKey
                end
            end
        end

        -- freezer-slot entry that resolves to this container?
        if not loot then
            local fLoot, fIndex, fKey = getLootForCoords(x, y, z, "freezer")
            if fLoot and DWAPUtils.resolveLootContainer(square, { freezer = true }) == container then
                loot, index, coordsKey = fLoot, fIndex, fKey
            end
        end

        -- base entry that resolves to this container?
        if not loot then
            local baseLoot, baseIndex, baseKey = getLootForCoords(x, y, z)
            if baseLoot and not baseLoot.stack then
                if DWAPUtils.resolveLootContainer(square, {}) == container then
                    loot, index, coordsKey = baseLoot, baseIndex, baseKey
                end
            end
        end

        if loot and index and coordsKey then
            -- DWAPUtils.dprint(("onFillContainer: %s %s"):format(square:getX(), square:getY()))
            -- DWAPUtils.dprint({ index = index, roomType = roomType, containerType = containerType, coordsKey = coordsKey })
            DWAPUtils.DeferThrottled(function()
                fillContainer(container, loot, index, coordsKey)
                ItemPickerJava.updateOverlaySprite(container:getParent())
                -- Re-trigger OnFillContainer so other mods (like VFX) can process the container
                -- Our loot entry has been removed, so this won't cause infinite recursion
                if getActivatedMods():contains("\\VanillaFoodsExpanded") then
                    triggerEvent("OnFillContainer", roomType, containerType, container)
                end
            end)
        end

        fillFreezerCompartment(square, x, y, z, container)
    end
end

-- Events.OnInitGlobalModData.Add(function()
Events.OnPostMapLoad.Add(function()
    if not SandboxVars.DWAP.Loot or SandboxVars.DWAP.Loot == 4 then
        DWAPUtils.dprint("Loot spawning disabled")
        return
    end
    DWAP_LootSpawning.populateItems()
    local modData = ModData.getOrCreate("DWAP_Loot")
    if modData and modData.init then
        DWAPUtils.dprint("ModData for DWAP_Loot already initialized, loading existing loot config")
        lootConfig = modData.lootConfig
        lootByCoords = modData.lootByCoords
        Events.OnFillContainer.Add(onFillContainer)
    else
        DWAPUtils.dprint("Initializing DWAP_Loot mod data")
        loadConfigs()
        modData.lootConfig = lootConfig
        modData.lootByCoords = lootByCoords
        modData.init = true
        Events.OnFillContainer.Add(onFillContainer)
    end
end)

Events.OnSave.Add(function()
    if not SandboxVars.DWAP.Loot or SandboxVars.DWAP.Loot == 4 then
        DWAPUtils.dprint("Loot spawning disabled")
        return
    end
    local modData = ModData.getOrCreate("DWAP_Loot")
    if modData and modData.init then
        modData.lootConfig = lootConfig
        modData.lootByCoords = lootByCoords
    end
end)
print("Events.lua loaded")
