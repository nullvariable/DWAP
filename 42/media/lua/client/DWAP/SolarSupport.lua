local DWAPUtils = require("DWAPUtils")
local ISA = require "ImmersiveSolarArrays/Utilities"
DWAP_ISA = {
    configCache = {},
}
--[[
    generators = {
        {
            controls = { ... },
            solar = {
                powerbank = { sprite = "industry_02_175", x = pb1.x, y = pb1.y, z = pb1.z },
                panels = {
                    {
                        type = "panel",
                        sprite = "solarmod_tileset_01_9",
                        x = 5577,
                        y = 9374,
                        z = 1,
                        pb = 1,
                        spawn = true,
                    },
                    {
                        type = "panel",
                        sprite = "solarmod_tileset_01_9",
                        x = 5577,
                        y = 9373,
                        z = 1,
                        pb = 1,
                        spawn = true,
                    },
                    -- ... more panels
                }
            },
            fakeGenerators = { ... }
        }
    }
]]
function DWAP_ISA:addModDataToSolarComponent(params)
    local config = DWAP_ISA.configCache[params.index]
    if not config or not config.generators or not config.generators[params.generatorIndex] then
        DWAPUtils.dprint("DWAP_ISA: Invalid generator configuration for index: " .. params.index .. ", generatorIndex: " .. params.generatorIndex)
        return
    end
    
    local generator = config.generators[params.generatorIndex]
    if not generator.solar then
        DWAPUtils.dprint("DWAP_ISA: No solar configuration found for generator at index: " .. params.generatorIndex)
        return
    end
    
    local solarComponent
    if params.componentType == "powerbank" then
        solarComponent = generator.solar.powerbank
    elseif params.componentType == "panel" then
        solarComponent = generator.solar.panels[params.componentIndex]
    end
    
    if not solarComponent then
        DWAPUtils.dprint("DWAP_ISA: Invalid solar component configuration for componentType: " .. params.componentType .. ", componentIndex: " .. (params.componentIndex or "N/A"))
        return
    end
    local object
    local square = getSquare(solarComponent.x, solarComponent.y, solarComponent.z)
    if not square then
        DWAPUtils.dprint("DWAP_ISA: Square not found for solar component at coordinates: " .. solarComponent.x .. ", " .. solarComponent.y .. ", " .. solarComponent.z)
        return
    end
    local objects = square:getObjects()
    local size = objects:size()
    for i = 0, size - 1 do
        local obj = objects:get(i)
        if obj and obj:getSpriteName() == solarComponent.sprite then
            object = obj
            break
        end
    end
    if not object then
        DWAPUtils.dprint("DWAP_ISA: Object not found for solar component at coordinates: " .. solarComponent.x .. ", " .. solarComponent.y .. ", " .. solarComponent.z)
        return
    end
    local modData = object:getModData()
    if params.componentType == "panel" then
        DWAPUtils.dprint("DWAP_ISA: Adding mod data to solar panel at coordinates: " .. solarComponent.x .. ", " .. solarComponent.y .. ", " .. solarComponent.z)
        local pb = generator.solar.powerbank
        modData.pbLinked = { x = pb.x, y = pb.y, z = pb.z }
        modData.connectDelta = 100
    elseif params.componentType == "powerbank" then
        DWAPUtils.dprint("DWAP_ISA: Adding mod data to solar powerbank at coordinates: " .. solarComponent.x .. ", " .. solarComponent.y .. ", " .. solarComponent.z)
        if not object then
            DWAPUtils.dprint("DWAP_ISA: Object not found for solar powerbank at coordinates: " .. solarComponent.x .. ", " .. solarComponent.y .. ", " .. solarComponent.z)
        else
            if not object:getContainer() then
                DWAPUtils.dprint("DWAP_ISA: Creating container for solar powerbank at coordinates: " .. solarComponent.x .. ", " .. solarComponent.y .. ", " .. solarComponent.z)
                local obj = ISWoodenContainer:new(solarComponent.sprite, nil)
                -- prop = IsoThumpable.new(getCell(), square, solarComponent.sprite, false, obj)
                buildUtil.setInfo(object, obj)
                object:setIsContainer(true)
                object:getContainer():setType("BatteryBank")
                object:getContainer():setCapacity(100)
            end
        end

        -- DWAPUtils.dprint("DWAP_ISA: Adding mod data to solar powerbank at coordinates: " .. solarComponent.x .. ", " .. solarComponent.y .. ", " .. solarComponent.z)
        -- Create panels array with actual coordinates for mod data compatibility
        local panelCount = 0
        local panels = {}
        for i = 1, #generator.solar.panels do
            local component = generator.solar.panels[i]
            if component.type == "panel" and component.pb == solarComponent.index then
                panelCount = panelCount + 1
                panels[#panels + 1] = {
                    x = component.x,
                    y = component.y,
                    z = component.z
                }
            end
        end
        modData = {
            on = false,
            batteries = 2,
            charge = 800,
            maxcapacity = 800,
            panels = panels,
            npanels = panelCount,
        }
        -- local container = object:getContainer()
        -- if container then
        --     local battery = instanceItem("ISA.SuperBattery")
        --     if battery then
        --         container:AddItems("ISA.SuperBattery",2)
        --     end
        -- end
    end
end
local function addModDataToSolarComponent(params)
    DWAP_ISA:addModDataToSolarComponent(params)
end

function DWAP_ISA:initModData(isNewGame)
    -- Exit early if save version is less than 17
    if DWAPUtils.getSaveVersion() < 17 then
        DWAPUtils.dprint("Save version is less than 17, skipping generator initialization for newer version")
        return
    end

    if SandboxVars.DWAP.EnableGenSystem then
        local configs = DWAPUtils.loadConfigs()
        if not configs or #configs == 0 then
            DWAPUtils.dprint("DWAP_ISA: No solar configs found, skipping initialization")
            return
        end
        -- DWAP_ISA.configCache = configs
        DWAPUtils.dprint("DWAP_ISA: Loaded " .. #configs .. " solar configs")
        DWAPUtils.dprint("DWAP_ISA: Initializing solar components for " .. #configs .. " configs")
        for i = 1, #configs do
            local config = configs[i]
            table.insert(DWAP_ISA.configCache, config)
            if config and config.generators then
                for genIndex = 1, #config.generators do
                    local generator = config.generators[genIndex]
                    if generator.solar then
                        -- Handle powerbank
                        if generator.solar.powerbank then
                            local powerbank = generator.solar.powerbank
                            DWAPSquareLoaded:AddEvent(
                                addModDataToSolarComponent,
                                powerbank.x,
                                powerbank.y,
                                powerbank.z,
                                false,
                                { index = i, generatorIndex = genIndex, componentType = "powerbank" }
                            )
                        end

                        -- Handle panels
                        if generator.solar.panels then
                            for panelIndex = 1, #generator.solar.panels do
                                local panel = generator.solar.panels[panelIndex]
                                if panel.spawn then
                                    DWAPSquareLoaded:AddHookEvent(
                                        "PropSpawned",
                                        addModDataToSolarComponent,
                                        panel.x,
                                        panel.y,
                                        panel.z,
                                        false,
                                        { index = i, generatorIndex = genIndex, componentType = "panel", componentIndex = panelIndex }
                                    )
                                    DWAPSquareLoaded:AddEvent(
                                        DWAP_Props.maybeSpawnObject,
                                        panel.x,
                                        panel.y,
                                        panel.z,
                                        true,
                                        panel
                                    )
                                else
                                    DWAPSquareLoaded:AddEvent(
                                        addModDataToSolarComponent,
                                        panel.x,
                                        panel.y,
                                        panel.z,
                                        false,
                                        { index = i, generatorIndex = genIndex, componentType = "panel", componentIndex = panelIndex }
                                    )
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

Events.OnInitGlobalModData.Add(function(isNewGame)
    DWAP_ISA:initModData(isNewGame)
end)


--- Handle Custom Loot Spawns
--- @param roomType string
--- @param containerType string
--- @param container ItemContainer
local function onFillContainer(roomType, containerType, container)
    if containerType == "BatteryBank" then
        -- is this powerbank in our configs?
        local square = container:getSourceGrid()
        local x, y, z = square:getX(), square:getY(), square:getZ()
        for i = 1, #DWAP_ISA.configCache do
            local config = DWAP_ISA.configCache[i]
            if config and config.generators then
                for genIndex = 1, #config.generators do
                    local generator = config.generators[genIndex]
                    if generator.solar and generator.solar.powerbank then
                        local powerbank = generator.solar.powerbank
                        if powerbank.x == x and powerbank.y == y and powerbank.z == z then
                            container:AddItems("ISA.SuperBattery", 2)
                            DWAPUtils.dprint("DWAP_ISA: Added SuperBattery to powerbank at " .. x .. ", " .. y .. ", " .. z)
                            return
                        end
                    end
                end
            end
        end
    end
end
Events.OnFillContainer.Add(onFillContainer)

local everyTen = SandboxVars.ISA.ChargeFreq == 1 and true
local function updatePowerbank()
    local generatorsInScanRange = DWAP_Gen2.generatorsInScanRange
    if generatorsInScanRange then
        for parent, _ in pairs(generatorsInScanRange) do
            local generator = DWAP_Gen2.generators[parent]
            if generator and generator.solar then
                local data = DWAP_Gen2:GetCombinedGeneratorData(parent)
                if data and data.solarEnabled then
                    -- DWAPUtils.dprint("DWAP_ISA: Updating powerbank for generator " .. parent)
                    -- DWAPUtils.dprint("  Active panels: " .. data.activePanels .. "/" .. data.totalPanels)
                    -- DWAPUtils.dprint("  Solar output: " .. data.solarOutput)
                    -- DWAPUtils.dprint("  Battery: " .. (data.batteryPercent or 0) .. "% (" .. (data.batteryState or "unknown") .. ")")
                    -- DWAPUtils.dprint("  Power needed: " .. data.totalPowerUsing .. ", net after solar/battery: " .. data.netPowerNeeded)
                end
            end
        end
    else
        DWAPUtils.dprint("DWAP_ISA: No generators in scan range, skipping powerbank update")
    end
end

-- local function onLoad()
--     if DWAP_Gen2.canUseSolar then
--         -- get the update frequency from the ISA sandbox settings
--         if everyTen then
--             Events.EveryTenMinutes.Add(updatePowerbank)
--         else
--             Events.EveryHours.Add(updatePowerbank)
--         end
--     end
-- end
-- Events.OnLoad.Add(onLoad)
