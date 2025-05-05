DWAP = DWAP or {}

local DWAPUtils = require("DWAPUtils")

local customNameObjects = {
    ["Shower"] = true,
    ["Washing Machine"] = true,
    ["Combo Washer Dryer"] = true,
    ["Sink"] = true,
    ["Toilet"] = true,
    ["Bath"] = true,
    -- ["Rain Collector Barrel"] = true,
}
local plumbableDistance = 35

local waterTanks = {}

Events.OnLoad.Add(function()
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
    DWAPUtils.dprint("isWTPlumbable")
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
        DWAPUtils.dprint("isWTPlumbable: " .. tostring(object:getSpriteName()))
        local properties = thisSprite:getProperties()
        if properties and properties:Is("CustomName") then
            local name = tostring(properties:Val("CustomName"))
            DWAPUtils.dprint("isWTPlumbable: " .. name)
            DWAPUtils.dprint(tostring(customNameObjects[name]))
            return customNameObjects[name] == true
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

--- Context menu for water system so players can move sinks etc
---@param player number
---@param context ISContextMenu
---@param worldobjects table
---@param test boolean
DWAP.worldObjectContextMenuWater = function(player, context, worldobjects, test)
    DWAPUtils.dprint("worldObjectContextMenuWater")
    if test == true then return true end
    if not SandboxVars.DWAP.EnableWaterSystem then return end
    if not worldobjects or #worldobjects <= 0 then return end

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
