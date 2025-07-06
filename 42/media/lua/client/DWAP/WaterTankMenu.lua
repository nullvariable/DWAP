DWAP = DWAP or {}

local DWAPUtils = require("DWAPUtils")

local customNameObjects = {
    ["Shower"] = true,
    ["Washing Machine"] = true,
    ["Combo Washer Dryer"] = true,
    ["Sink"] = true,
    ["Toilet"] = true,
    ["Bath"] = true,
}
    -- ["Rain Collector Barrel"] = true,
local plumbableDistance = 35

local waterTanks = {}

Events.OnLoad.Add(function()
    if getActivatedMods():contains("\\FunctionalAppliances2") then
        customNameObjects["Tabletop Soda"] = true
        customNameObjects["Soda Machine"] = true
        -- customNameObjects["SlurpBurp"] = true
    end

    local configs = DWAPUtils.loadConfigs()
    for i = 1, #configs do
        local config = configs[i]
        if config and config.waterTanks then
            for j = 1, #config.waterTanks do
                local tank = config.waterTanks[j]
                waterTanks[#waterTanks+1] = tank
                DWAPUtils.dprint("Water tank loaded: " .. tank.x .. ", " .. tank.y .. ", " .. tank.z)
            end
        end
    end
    DWAPUtils.dprint("Water tanks loaded: " .. #waterTanks)
end)

--- Get a water tank if within range
--- @param coords table
--- @return table|nil
local function getWaterTank(coords)
    for i = 1, #waterTanks do
        local dist = IsoUtils.DistanceTo(coords.x, coords.y, waterTanks[i].x, waterTanks[i].y)
        DWAPUtils.dprint("Distance to water tank: " .. dist)
        if dist < plumbableDistance then
            return waterTanks[i]
        end
    end
    return nil
end

local function predicateNotBroken(item)
    return not item:isBroken()
end

local function doPlumbing(_, player, itemToPipe)
    local playerObj = getSpecificPlayer(player)
    if not playerObj then return end
    local wrench = playerObj:getInventory():getFirstTypeEvalRecurse("PipeWrench", predicateNotBroken) or
    playerObj:getInventory():getFirstTagEvalRecurse("PipeWrench", predicateNotBroken);
    if not wrench then
        DWAPUtils.dprint("No wrench found")
        return
    end

    local waterTank = getWaterTank({x = itemToPipe:getX(), y = itemToPipe:getY(), z = itemToPipe:getZ()})
    if not waterTank then
        DWAPUtils.dprint("No water tank found")
        return
    end

    ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), wrench, true)
    ISTimedActionQueue.add(DWAPPlumbToWaterTank:new(playerObj, itemToPipe, wrench, waterTank));
end

--- @param object IsoObject
--- @return boolean
local function isWTPlumbable(object)
    -- DWAPUtils.dprint("isWTPlumbable")
    local sprite = object:getSprite()
    -- local attachedsprite = object:getAttachedAnimSprite()
    -- if attachedsprite then
    --     DWAPUtils.dprint("isWTPlumbable: " .. tostring(object:getName()))
    --     for n=1,attachedsprite:size() do
    --         sprite = attachedsprite:get(n-1)
    --         if sprite then
    --             DWAPUtils.dprint("isWTPlumbables: " .. tostring(sprite:getName()))
    --         else
    --             DWAPUtils.dprint("isWTPlumbablen: " .. tostring(object:getName()) .. " sprite is nil")
    --         end
    --     end
    -- end
    -- local thisSprite object:getSprite()
    -- if thisSprite then
    local thisSprite = sprite
    if thisSprite then
        -- DWAPUtils.dprint("isWTPlumbable: " .. tostring(object:getSpriteName()))
        local properties = thisSprite:getProperties()
        if properties and properties:Is("CustomName") then
            local name = tostring(properties:Val("CustomName"))
            local groupName = properties:Is("GroupName") and tostring(properties:Val("GroupName")) or ""
            -- DWAPUtils.dprint("isWTPlumbable: " .. name)
            -- DWAPUtils.dprint(tostring(customNameObjects[name]))
            return customNameObjects[name] == true or customNameObjects[groupName] == true
        elseif properties and properties:Is("GroupName") then
            local groupName = tostring(properties:Val("GroupName"))
            DWAPUtils.dprint("isWTPlumbable: " .. groupName)
            if customNameObjects[groupName] then
                return true
            end
        end
    end
    return false
end

--- @see ISWorldObjectContextMenu.lua :139
local function getMoveableDisplayName(obj)
    if not obj then return nil end
    if not obj:getSprite() then return nil end
    local props = obj:getSprite():getProperties()
    if props:Is("CustomName") then
        local name = props:Val("CustomName")
        if props:Is("GroupName") then
            name = props:Val("GroupName") .. " " .. name
        end
        return Translator.getMoveableDisplayName(name)
    end
    return nil
end

--- Refresh water fixtures that have lost their connection to tanks
--- @param clickCoords table coordinates where the user clicked
local function refreshLostFixtures(clickCoords)
    local tank = getWaterTank(clickCoords)
    if not tank then return end
    
    local tankHash = DWAP_WaterSystem.hashCoords(tank.x, tank.y, tank.z)
    local fixtures = DWAP_WaterSystem.fixtures[tankHash]
    if not fixtures then return end
    
    DWAPUtils.dprint("Checking " .. #fixtures .. " fixtures for lost connections near tank at " .. tank.x .. ", " .. tank.y .. ", " .. tank.z)
    
    for i = 1, #fixtures do
        local fixture = fixtures[i]
        local fixtureSquare = getSquare(fixture.x, fixture.y, fixture.z)
        if fixtureSquare then
            local objects = fixtureSquare:getObjects()
            local osize = objects:size() - 1
            for j = 0, osize do
                local obj = objects:get(j)
                if obj and obj:getSpriteName() == fixture.sprite then
                    -- Check if this fixture has lost its connection
                    if not obj:getUsesExternalWaterSource() or not obj:hasExternalWaterSource() then
                        DWAPUtils.dprint("Refreshing lost fixture connection: " .. fixture.sprite .. " at " .. fixture.x .. ", " .. fixture.y .. ", " .. fixture.z)
                        DWAP_WaterSystem:InitializeFixture(fixture)
                    end
                    break
                end
            end
        end
    end
end

--- Context menu for water system so players can move sinks etc
---@param player number
---@param context ISContextMenu
---@param worldobjects table
---@param test boolean
DWAP.worldObjectContextMenuWater = function(player, context, worldobjects, test)
    DWAPUtils.dprint("worldObjectContextMenuWater")
    -- if test == true then return true end
    if not SandboxVars.DWAP.EnableWaterSystem then return end
    if not worldobjects or #worldobjects <= 0 then return end
    
    -- Check if we're near a water tank and refresh any lost fixture connections
    -- Use the first object's coordinates as the click location
    if worldobjects[1] then
        local clickCoords = {x = worldobjects[1]:getX(), y = worldobjects[1]:getY(), z = worldobjects[1]:getZ()}
        refreshLostFixtures(clickCoords)
    end

    local object
    for i = 1, #worldobjects do
        local obj = worldobjects[i]
        if obj and isWTPlumbable(obj) then
            local coords = {x = obj:getX(), y = obj:getY(), z = obj:getZ()}
            local tank = getWaterTank(coords)
            if not tank then
                DWAPUtils.dprint("No water tank found")
                return
            end
            DWAPUtils.dprint("canBeWaterPiped: " .. tostring(obj:getModData().canBeWaterPiped))
            if obj:getModData().canBeWaterPiped and tank then
                object = obj
                break
            end
        end
    end
    if not object then return end
    DWAPUtils.dprint("Found plumbable object: " .. tostring(object:getSpriteName()))
    local name = getMoveableDisplayName(object) or "";
    local option = context:addGetUpOption(getText("ContextMenu_PlumbItem", name), worldobjects, doPlumbing, player, object);
    local playerObj = getSpecificPlayer(player)
    local playerInv = playerObj:getInventory()
    if not playerInv:containsTypeEvalRecurse("PipeWrench", predicateNotBroken) and not playerInv:containsTagEvalRecurse("PipeWrench", predicateNotBroken) then
        option.notAvailable = true;
        local tooltip = ISWorldObjectContextMenu.addToolTip()
        tooltip:setName(getText("ContextMenu_PlumbItem", name));
        tooltip.description = getText("Tooltip_NeedWrench", getItemName("Base.PipeWrench"));
        option.toolTip = tooltip;
    end
end
Events.OnFillWorldObjectContextMenu.Add(DWAP.worldObjectContextMenuWater)
