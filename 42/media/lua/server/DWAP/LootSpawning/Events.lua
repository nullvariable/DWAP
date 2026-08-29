local DWAPUtils = require("DWAPUtils")
local Affinity = require("DWAP/LootSpawning/Affinity")
local TagPools = require("DWAP/LootSpawning/TagPools")
local random = newrandom()

local lootConfig = {}
local lootByCoords = {}
-- v2: per-base fillable-container count N (registered non-special declarative
-- entries). S(N) scales per-container fill so base size stops driving volume.
-- Persisted in modData alongside lootConfig/lootByCoords; loadConfigs populates
-- it, OnSave writes it back.
local baseContainerCount = {}

-- v2 tunable knobs (loot v2 tag model + baseline scaling).
local BASELINE = 50    -- reference fillable containers per base
local S_MIN = 0.2      -- floor of the base-scale factor (250+-container base)
local S_MAX = 2.0      -- cap of the base-scale factor (<=25-container base)
local FLOOR_ITEMS = 3  -- never-empty guarantee: min items regardless of targetW
local HARD_CAP = 100   -- absolute per-container insert ceiling (runaway guard)

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
--- @param state? string "filled" | "added" | "disabled" (default "filled")
--- Stamp the container's parent object when a loot entry is consumed so
--- audits can verify the DWAP fill actually ran regardless of the world's
--- base-loot setting (with loot on, "container has items" proves nothing).
--- Keyed per vertical member so fridge/freezer and stack pairs stamp
--- independently. state: "filled" (emptied then filled), "added" (additive-Low:
--- added on top of vanilla's roll), or "disabled" (sandbox option off)
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

-- Weighted draw over the LIVE (non-nil) entries of a { name, weight } array.
-- Sums the current weights, draws a target, and walks the cumulative total to
-- select an index. Skips nil holes left by the container/throttle nil-outs and
-- preserves fractional vanilla weights by drawing over the float total with
-- random:random() (Kahlua nextDouble, [0,1)). Returns nil if nothing is left.
local function weightedPickIndex(items)
    local total = 0
    for i = 1, #items do
        local entry = items[i]
        if entry then
            total = total + (entry.weight or 1)
        end
    end
    if total <= 0 then return nil end
    local target = random:random() * total
    local cumulative = 0
    for i = 1, #items do
        local entry = items[i]
        if entry then
            cumulative = cumulative + (entry.weight or 1)
            if cumulative >= target then
                return i
            end
        end
    end
    return nil
end

-- Per-tier fraction of a container's max weight the DWAP fill aims to ADD
-- (Normal/Low are additive on top of vanilla; High replaces, None spills).
-- v2 tunable knob.
local function tierFraction(numLevel)
    if numLevel == 1 then return 1.00      -- High: replace, fill to full
    elseif numLevel == 2 then return 0.50  -- Normal: +50% capacity
    elseif numLevel == 3 then return 0.15  -- Low: +15% capacity
    end
    return 0                               -- None (4+): own tag adds nothing
end

-- Categories whose ADDITIVE fill (Normal/Low) first strips over-represented
-- vanilla items that would otherwise leave no room for DWAP's own stock. The
-- base game's own container distribution can cram a materials shelf full of
-- paint -- DWAP's BuildMats pool has none -- and on Normal/Low we add on top
-- without emptying, so hasRoomFor fails and nothing of ours lands. Purge those
-- items first, then fill the freed weight. High already emptyIt()s, so this
-- only matters on the additive tiers. Values are Lua patterns matched against
-- the bare item type; "^Paint%u" catches the 15 coloured buckets (PaintBlack..)
-- while leaving Paintbrush (lowercase b) as a legitimate tool.
local PURGE_BEFORE_ADD = {
    BuildMats = { "^Paint%u", "^PaintbucketEmpty$" },
}

--- Remove every item in `container` whose bare type matches one of `patterns`.
--- Collects first, then removes, so the live list is never mutated mid-walk.
--- @param container ItemContainer
--- @param patterns table array of Lua patterns matched against item:getType()
--- @return number count of items removed
local function purgeItems(container, patterns)
    local list = container:getItems()
    local toRemove = {}
    for i = 0, list:size() - 1 do
        local it = list:get(i)
        if it then
            local t = it:getType()
            for p = 1, #patterns do
                if string.find(t, patterns[p]) then
                    toRemove[#toRemove + 1] = it
                    break
                end
            end
        end
    end
    for i = 1, #toRemove do
        container:Remove(toRemove[i])
    end
    return #toRemove
end

--- Unify legacy and tagged entries onto one (slider, pool, items) resolution.
--- Works on un-migrated configs (legacy level/dist) and on tag entries alike;
--- no config is required to carry `tag`. Override precedence, highest first:
--- explicit `items` (always wins, tag or no tag) > `tag` (+ optional same-entry
--- `dist` overriding just the pool, slider still comes from the tag) > legacy
--- `dist`/level > bare category fallback.
--- @param config table a registered loot entry (shallow copy)
--- @return string|nil sliderKey  Loot_<Cat>Level controlling fullness
--- @return table|nil poolDists   ProceduralDistributions names to draw from
--- @return table|nil itemsOverride  explicit items to place directly
local function resolveTagFill(config)
    if config.items then
        return nil, nil, config.items
    end
    if config.tag then
        if TagPools.SLIDER[config.tag] then
            local slider = TagPools.SLIDER[config.tag]
            if config.dist then
                return slider, config.dist, nil
            end
            return slider, TagPools.POOLS[config.tag], nil
        end
        -- Bad tag (hand-authoring typo): warn loudly so it surfaces in the audit
        -- / console instead of silently reading as the wrong category forever,
        -- then fall through to legacy dist/items/level resolution.
        DWAPUtils.dprint("WARN resolveTagFill: unknown tag '" .. tostring(config.tag)
            .. "' at " .. tostring(config.coords and config.coords.x)
            .. "," .. tostring(config.coords and config.coords.y)
            .. "," .. tostring(config.coords and config.coords.z))
    end
    if config.dist then
        -- Derive the category robustly (don't trust _cat: a pre-v2 save restores
        -- entries with nil _cat). resolveCategory reads config.level string AND
        -- config.note, and never returns nil for a non-special entry.
        local cat = config._cat or Affinity.resolveCategory(config) or "Food"
        local sliderKey = (type(config.level) == "string" and config.level)
            or ("Loot_" .. cat .. "Level")
        return sliderKey, config.dist, nil
    end
    local cat = config._cat or Affinity.resolveCategory(config) or "Food"
    return "Loot_" .. cat .. "Level", TagPools.POOLS["DWAP" .. cat], nil
end

--- Perishable (Freezer/Fridge) dist names may only land in a fridge or
--- freezer container: on every other container type, strip them from the
--- pool before drawing so replace/additive/spill can't put frozen or
--- fridge-cold food on a bathroom counter or bookshelf. FridgeMedical is
--- coldpacks/water, not food, so it is exempt and stays available to
--- non-refrigerated Med containers. Never mutates poolDists (require-cached
--- TagPools.POOLS table) - always returns either the same reference
--- (refrigerated container, nothing to filter) or a freshly built array.
--- Guards only the dist-POOL draws (replace/additive/spill); the explicit
--- config.items path is author-curated and intentionally not filtered here.
--- @param poolDists table|nil array of ProceduralDistributions names
--- @param container ItemContainer
--- @return table  the same pool (refrigerated) or a filtered/empty array
local function refrigeratedGate(poolDists, container)
    if not poolDists then return {} end
    if container:isFreezer() or container:isFridge() then
        return poolDists
    end
    local filtered = {}
    local n = 0
    for i = 1, #poolDists do
        local name = poolDists[i]
        local perishable = name ~= "FridgeMedical"
            and (string.find(name, "Freezer", 1, true) or string.find(name, "Fridge", 1, true))
        if not perishable then
            n = n + 1
            filtered[n] = name
        end
    end
    return filtered
end

--- Draw the gated pool for an entry, guaranteeing a non-empty result when one
--- is possible. A narrow `dist` override (or, rarely, a whole pool) can be
--- ENTIRELY perishable — e.g. a `counter @ storage` authored with only
--- `BakeryKitchenFreezer`. On a dry container refrigeratedGate strips every
--- name, the draw returns nothing, and the container reads empty (no stamp),
--- violating the no-empty-container principle. When that happens, fall back to
--- the entry's own category pool (DWAP<Cat>), gated the same way — it always
--- carries non-perishable members, so a dry counter still fills. Idempotent
--- when poolDists already IS the category pool (fallback re-gates the same set).
local function drawGatedPool(config, poolDists, container)
    local gated = refrigeratedGate(poolDists, container)
    if #gated >= 1 then return gated end
    local fallback
    if config.tag and TagPools.POOLS[config.tag] then
        fallback = TagPools.POOLS[config.tag]
    else
        local cat = config._cat or Affinity.resolveCategory(config) or "Food"
        fallback = TagPools.POOLS["DWAP" .. cat]
    end
    if fallback then
        gated = refrigeratedGate(fallback, container)
    end
    return gated
end

local function fillContainer(container, config, index, coordsKey)
    if not container or not config then return end
    local containerType = container:getType()
    if not config.stove and (containerType == "microwave" or container:isStove()) then
        return
    end
    if config.sandboxEnable ~= nil and not SandboxVars.DWAP[config.sandboxEnable] then
        stampFill(container, config, "disabled")
        removeLootEntry(index, coordsKey)
        return
    end

    -- Specials are immune to tier scaling and to v2 entirely: resolve the
    -- effective level, emptyIt, then place the fixed loadout exactly as before.
    -- Kept byte-identical to the step-8 special path.
    if config.special then
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
        container:emptyIt()
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
            -- getKitchenToolsSpices() returns the module-local spice table BY
            -- REFERENCE; build the merged pool in a fresh local so repeated
            -- fills never append the ~37 tools into the canonical spice list.
            local spices = DWAP_LootSpawning.getKitchenToolsSpices()
            local kitchenToolsWithSpices = {}
            for i = 1, #spices do
                kitchenToolsWithSpices[i] = spices[i]
            end
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
        stampFill(container, config, "filled")
        removeLootEntry(index, coordsKey)
        return
    end

    -- NON-special v2 fill: tag/legacy -> slider + pool, sized by the base-wide
    -- scale factor S(N). resolveTagFill works on both migrated (tag) and legacy
    -- (level/dist) entries, so this runs against the current un-migrated configs.
    local sliderKey, poolDists, itemsOverride = resolveTagFill(config)
    -- A numeric config.level still overrides the slider. sliderKey is nil only
    -- for the items-override path, where numLevel just picks emptyIt vs additive.
    local numLevel = (type(config.level) == "number" and config.level)
        or (sliderKey and SandboxVars.DWAP[sliderKey])
        or 4

    -- Explicit items override: place the configured items directly (chance/count
    -- honoured, as the old else-branch did), emptying first only at High. No pool
    -- draw and no spill; the emptyIt rule below is the only tier gating.
    if itemsOverride then
        if numLevel == 1 then
            container:emptyIt()
        end
        for i = 1, #itemsOverride do
            local it = itemsOverride[i]
            if it and it.name then
                if it.chance then
                    if it.chance == 1 or it.chance >= (random:random(1, 100) / 100) then
                        local count = random:random(it.count[1], it.count[2])
                        addItem(container, it.name, count)
                    end
                else
                    addItem(container, it.name, 1)
                end
            end
        end
        stampFill(container, config, numLevel == 1 and "filled" or "added")
        removeLootEntry(index, coordsKey)
        return
    end

    -- Base-wide scale factor S(N): small bases fill fuller per container, large
    -- bases spread thinner, both clamped. Guard N > 0 (div-by-zero / negative).
    local N = baseContainerCount[config._base] or BASELINE
    if N <= 0 then N = BASELINE end
    local S = math.min(math.max(BASELINE / N, S_MIN), S_MAX)

    local maxW = container:getMaxWeight()
    local items, targetW, state

    if numLevel == 1 then
        -- High / replace: emptyIt then fill to full from the pool. S does not
        -- apply at High. Only empty AFTER we know the pool has something to add.
        items = DWAP_LootSpawning.getItemsWithDistLists(drawGatedPool(config, poolDists, container), config.distIncludeJunk)
        if not items or #items < 1 then
            removeLootEntry(index, coordsKey)
            return
        end
        container:emptyIt()
        targetW = maxW
        state = "filled"
    elseif numLevel == 2 or numLevel == 3 then
        -- Normal / Low: additive on top of vanilla, sized by tier * capacity * S.
        items = DWAP_LootSpawning.getItemsWithDistLists(drawGatedPool(config, poolDists, container), config.distIncludeJunk)
        if not items or #items < 1 then
            removeLootEntry(index, coordsKey)
            return
        end
        -- Surgical strip of over-represented vanilla items (e.g. a paint-crammed
        -- materials shelf) BEFORE the additive fill, so the freed weight is
        -- usable. Keyed to the category whose POOL we're actually drawing, taken
        -- from the resolved sliderKey (Loot_<Cat>Level) -- NOT the note-derived
        -- _cat: a DWAPBuildMats tag on a "crate"/"metal_shelves" note resolves
        -- _cat to Food and would wrongly skip the purge on a real buildmats fill.
        -- startW below is captured after this, so the additive target math sees
        -- the post-purge contents.
        local fillCat = sliderKey and sliderKey:match("^Loot_(.+)Level$")
        local purge = fillCat and PURGE_BEFORE_ADD[fillCat]
        if purge then purgeItems(container, purge) end
        targetW = tierFraction(numLevel) * maxW * S
        state = "added"
    elseif numLevel == 4 then
        -- None -> SPILL. The own tag adds nothing, but the container must not read
        -- empty: draw a floor from the highest-set ENABLED category's pool, chosen
        -- by the container's furniture/room affinity.
        local furn, room = Affinity.parseNote(config.note)
        local CATS = Affinity.CATEGORIES
        local pickedCat, bestAff, bestLevel
        for c = 1, #CATS do
            local cat = CATS[c]
            local lvl = SandboxVars.DWAP["Loot_" .. cat .. "Level"] or 4
            if lvl < 4 then
                local aff = Affinity.getAffinity(furn, room, nil, cat)
                local better
                if not pickedCat then
                    better = true
                elseif aff ~= bestAff then
                    better = aff > bestAff
                elseif lvl ~= bestLevel then
                    better = lvl < bestLevel  -- lower numeric slider = more loot
                else
                    better = false            -- CATEGORIES order breaks the tie
                end
                if better then
                    pickedCat, bestAff, bestLevel = cat, aff, lvl
                end
            end
        end
        if not pickedCat then
            -- Every category disabled: truly leave to vanilla (no stamp).
            removeLootEntry(index, coordsKey)
            return
        end
        items = DWAP_LootSpawning.getItemsWithDistLists(
            refrigeratedGate(TagPools.POOLS["DWAP" .. pickedCat], container), config.distIncludeJunk)
        if not items or #items < 1 then
            removeLootEntry(index, coordsKey)
            return
        end
        targetW = tierFraction(3) * maxW * S  -- spill floor tracks Low's fraction
        state = "added"
    else
        -- numLevel >= 5 or no resolvable pool: leave to vanilla, no stamp/emptyIt.
        removeLootEntry(index, coordsKey)
        return
    end

    -- Shared fill loop (replace + additive + spill). FLOOR_ITEMS guarantees no
    -- container reads empty even when targetW is tiny; targetW is the weight goal
    -- for the DWAP-added amount; hasRoomFor stops physical overflow; HARD_CAP is
    -- the runaway guard. Container/throttle items are swapped out of the live
    -- pool (dense swap-removal, so #items stays a real length) and replenished
    -- once the pool runs thin, matching the step-8 discipline.
    local pl = getPlayer()
    local startW = container:getContentsWeight()
    local added = 0
    local tries = 0  -- real termination bound: added never increments on a
    -- name that fails to resolve (addItem inserts 0), so gate on tries instead.
    local throttled = {}
    while tries < HARD_CAP and container:hasRoomFor(pl, 1) do
        tries = tries + 1
        local curWeight = container:getContentsWeight()
        -- Physical stop: never let the forced FLOOR push a small container past
        -- capacity (additive/replace targets are already <= maxW).
        if curWeight >= maxW then break end
        -- Weight goal reached once the never-empty FLOOR is satisfied.
        if added >= FLOOR_ITEMS and (curWeight - startW) >= targetW then break end
        if #items < 2 and #throttled > 0 then
            for i = 1, #throttled do
                items[#items + 1] = throttled[i]
            end
            throttled = {}
        end
        local pickIdx = weightedPickIndex(items)
        if not pickIdx then break end
        local item = items[pickIdx]
        if not item or not item.name then break end
        local before = container:getItems():size()
        addItem(container, item.name, 1)
        -- Count ACTUAL items inserted via a size delta: addItem inserts exactly 1
        -- for VHS/Disc/Alice regardless of the count arg.
        added = added + (container:getItems():size() - before)
        local ii = instanceItem(item.name)
        if ii and ii:getCategory() == "Container" then
            items[pickIdx] = items[#items]
            items[#items] = nil
            throttled[#throttled + 1] = item
        elseif ii and DWAP_LootSpawning.isThrottleSpawnItem(item.name) then
            items[pickIdx] = items[#items]
            items[#items] = nil
            throttled[#throttled + 1] = item
        end
    end

    stampFill(container, config, state)
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
        -- v2: N = registered non-special declarative entries for this base, the
        -- fillable containers subject to tier scaling. Drives S(N) at fill time.
        local baseCount = 0
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
                            -- Resolve the tier category from the AUTHORED level/note
                            -- NOW, before the default and the non-primary
                            -- rewriteLevel below turn a string level into numeric 3
                            -- (which would lose the authored category). resolveCategory
                            -- only READS lootEntry (the require-cached original); the
                            -- result is stamped on the copy. nil for specials; a
                            -- category for pins too (harmless). _base is the schema
                            -- key the audit reads; _cat feeds resolveTagFill for
                            -- level-less / tagless legacy entries.
                            entry._base = i
                            entry._cat = Affinity.resolveCategory(lootEntry)
                            if not entry.level then
                                entry.level = 3 -- default to low
                            end
                            if rewriteLevel and type(entry.level) == "string" then
                                -- overwrite to low
                                entry.level = 3
                            end
                            setLootConfigValue(entry)
                            -- v2: count REGISTERED non-special entries as this
                            -- base's fillable-container N. setLootConfigValue
                            -- no-ops without coords, so gate the count on coords.
                            if entry.coords and not entry.special then
                                baseCount = baseCount + 1
                            end
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
        baseContainerCount[i] = baseCount
        DWAPUtils.dprint("Done. Loot config count: " .. count .. " special count: " .. specialCount .. " fillable N: " .. baseCount .. " for config: " .. tostring(config.doorKeys and config.doorKeys.name or "unknown"))
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
        -- v2: restore the per-base fillable-container counts. Saves predating v2
        -- have none; fall back to empty so S(N) uses BASELINE (guarded N > 0).
        baseContainerCount = modData.baseContainerCount or {}
        -- v2 retro-conversion (the "convert on load" pattern): loadConfigs only
        -- runs on the FIRST-ever load, so a world created by a pre-v2 build
        -- restores loot copies with nil _cat (and no baseContainerCount).
        -- Backfill _cat so resolveTagFill categorizes correctly, and recompute N
        -- per base if it is missing. One cheap pass, once per load.
        local needCounts = modData.baseContainerCount == nil
        local recount = {}
        for _k, entry in pairs(lootConfig) do
            if entry and not entry.special then
                if not entry._cat then
                    entry._cat = Affinity.resolveCategory(entry)
                end
                if needCounts and entry._base then
                    recount[entry._base] = (recount[entry._base] or 0) + 1
                end
            end
        end
        if needCounts then
            baseContainerCount = recount
            modData.baseContainerCount = baseContainerCount
        end
        Events.OnFillContainer.Add(onFillContainer)
    else
        DWAPUtils.dprint("Initializing DWAP_Loot mod data")
        loadConfigs()
        modData.lootConfig = lootConfig
        modData.lootByCoords = lootByCoords
        modData.baseContainerCount = baseContainerCount
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
        modData.baseContainerCount = baseContainerCount
    end
end)
print("Events.lua loaded")
