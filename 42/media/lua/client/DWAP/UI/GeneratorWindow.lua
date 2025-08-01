require "ISUI/ISCollapsableWindow"
require "ISUI/ISScrollingListBox"
local DWAPUtils = require("DWAPUtils")

local GeneratorWindow = ISCollapsableWindow:derive("GeneratorWindow")

-- Load all translation strings once for performance
local function loadTranslations()
    return {
        title = getText("IGUI_DWAP_GeneratorWindow_Title"),
        statusUnknown = getText("IGUI_DWAP_GeneratorWindow_StatusUnknown"),
        statusRunning = getText("IGUI_DWAP_GeneratorWindow_StatusRunning"),
        statusUsingBattery = getText("IGUI_DWAP_GeneratorWindow_StatusUsingBattery"),
        statusOff = getText("IGUI_DWAP_GeneratorWindow_StatusOff"),
        fuelDefault = getText("IGUI_DWAP_GeneratorWindow_FuelDefault"),
        conditionDefault = getText("IGUI_DWAP_GeneratorWindow_ConditionDefault"),
        powerUsageDefault = getText("IGUI_DWAP_GeneratorWindow_PowerUsageDefault"),
        runtimeUnknown = getText("IGUI_DWAP_GeneratorWindow_RuntimeUnknown"),
        runtimeInfinite = getText("IGUI_DWAP_GeneratorWindow_RuntimeInfinite"),
        runtimeUnknownCalc = getText("IGUI_DWAP_GeneratorWindow_RuntimeUnknownCalc"),
        isaNotAvailable = getText("IGUI_DWAP_GeneratorWindow_ISANotAvailable"),
        isaDisabled = getText("IGUI_DWAP_GeneratorWindow_ISADisabled"),
        noAlternatePower = getText("IGUI_DWAP_GeneratorWindow_NoAlternatePower"),
        noItemsPowered = getText("IGUI_DWAP_GeneratorWindow_NoItemsPowered"),
        buttonTurnOff = getText("IGUI_DWAP_GeneratorWindow_ButtonTurnOff"),
        buttonTurnOn = getText("IGUI_DWAP_GeneratorWindow_ButtonTurnOn"),
        buttonToggle = getText("IGUI_DWAP_GeneratorWindow_ButtonToggle"),
        buttonRefresh = getText("IGUI_DWAP_GeneratorWindow_ButtonRefresh")
    }
end

local strings = loadTranslations()

function GeneratorWindow:new(x, y, width, height)
    local o = ISCollapsableWindow.new(self, x, y, width, height)
    o.title = strings.title
    o:setResizable(false)
    o.generatorIndex = nil
    o.refreshTimer = 0
    o.refreshInterval = 60 -- Refresh every 60 ticks (1 second)

    GeneratorWindow.instance = o
    return o
end

function GeneratorWindow:createChildren()
    ISCollapsableWindow.createChildren(self)
    local th = self:titleBarHeight()

    -- Main panel
    self.panel = ISPanel:new(5, th + 5, self.width - 10, self.height - th - 10)
    self.panel:initialise()
    self.panel.backgroundColor = { r = 0, g = 0, b = 0, a = 0.3 }
    self:addChild(self.panel)

    -- Status labels
    local yOffset = 10
    local labelHeight = 20
    local spacing = 5

    -- Generator status (On/Off)
    self.statusLabel = ISLabel:new(10, yOffset, labelHeight, strings.statusUnknown, 1, 1, 1, 1, UIFont.Small, true)
    self.statusLabel:initialise()
    self.panel:addChild(self.statusLabel)
    yOffset = yOffset + labelHeight + spacing

    -- Fuel level (now shows L instead of %)
    self.fuelLabel = ISLabel:new(10, yOffset, labelHeight, strings.fuelDefault, 1, 1, 1, 1, UIFont.Small, true)
    self.fuelLabel:initialise()
    self.panel:addChild(self.fuelLabel)
    yOffset = yOffset + labelHeight + spacing

    -- Condition
    self.conditionLabel = ISLabel:new(10, yOffset, labelHeight, strings.conditionDefault, 1, 1, 1, 1, UIFont.Small, true)
    self.conditionLabel:initialise()
    self.panel:addChild(self.conditionLabel)
    yOffset = yOffset + labelHeight + spacing

    -- Power usage
    self.powerLabel = ISLabel:new(10, yOffset, labelHeight, strings.powerUsageDefault, 1, 1, 1, 1, UIFont.Small, true)
    self.powerLabel:initialise()
    self.panel:addChild(self.powerLabel)
    yOffset = yOffset + labelHeight + spacing

    -- Runtime remaining label
    self.runtimeLabel = ISLabel:new(10, yOffset, labelHeight, strings.runtimeUnknown, 1, 1, 1, 1, UIFont.NewSmall,
        true)
    self.runtimeLabel:initialise()
    self.panel:addChild(self.runtimeLabel)
    yOffset = yOffset + labelHeight + spacing

    -- ISA Integration Status (only shown if solar is enabled)
    self.isaStatusLabel = ISLabel:new(10, yOffset, labelHeight, "", 1, 1, 1, 1, UIFont.Small, true)
    self.isaStatusLabel:initialise()
    self.panel:addChild(self.isaStatusLabel)
    yOffset = yOffset + labelHeight + spacing

    -- Solar/Battery contribution (only shown if ISA integration active)
    self.solarLabel = ISLabel:new(10, yOffset, labelHeight, "", 1, 1, 1, 1, UIFont.Small, true)
    self.solarLabel:initialise()
    self.panel:addChild(self.solarLabel)
    yOffset = yOffset + labelHeight + spacing

    -- Net power needed (only shown if ISA integration active)
    self.netPowerLabel = ISLabel:new(10, yOffset, labelHeight, "", 1, 1, 1, 1, UIFont.Small, true)
    self.netPowerLabel:initialise()
    self.panel:addChild(self.netPowerLabel)
    yOffset = yOffset + labelHeight + spacing * 2

    -- Scrollable items list
    local itemsListHeight = 100 -- Fixed height for scrollable area
    self.itemsList = ISScrollingListBox:new(15, yOffset, self.width - 35, itemsListHeight)
    self.itemsList:initialise()
    self.itemsList:instantiate()
    self.itemsList.itemheight = 16
    self.itemsList.selected = 0
    self.itemsList.font = UIFont.Small
    self.itemsList.doDrawItem = self.drawItem
    self.itemsList.drawBorder = true
    self.itemsList.showScrollButtons = true
    -- Completely disable the header
    self.itemsList.drawHeader = false
    self.itemsList.headerHeight = 0
    -- Remove header by not adding any columns
    self.panel:addChild(self.itemsList)
    yOffset = yOffset + itemsListHeight + spacing

    -- Control buttons
    self.toggleButton = ISButton:new(10, yOffset, 100, 25, strings.buttonToggle, self, GeneratorWindow.onToggleGenerator)
    self.toggleButton:initialise()
    self.panel:addChild(self.toggleButton)

    self.refreshButton = ISButton:new(120, yOffset, 100, 25, strings.buttonRefresh, self, GeneratorWindow.onRefreshData)
    self.refreshButton:initialise()
    self.panel:addChild(self.refreshButton)
end

function GeneratorWindow:calculateRemainingRuntime(fuelRemaining, powerDrain, netPowerNeeded)
    if not fuelRemaining or not powerDrain or powerDrain <= 0 then
        return strings.runtimeUnknownCalc
    end

    -- Get the hourly fuel consumption rate from sandbox settings
    local fuelPerHour = SandboxVars.DWAP.GeneratorPerHour or 0.5

    -- Use net power needed if available (accounts for ISA solar/battery contribution)
    local effectivePowerDrain = netPowerNeeded or powerDrain

    -- Calculate total fuel drain per hour (base consumption + effective power drain)
    local totalFuelPerHour = fuelPerHour + effectivePowerDrain

    if totalFuelPerHour <= 0 then
        return strings.runtimeInfinite
    end

    -- Calculate hours remaining
    local hoursRemaining = fuelRemaining / totalFuelPerHour

    if hoursRemaining < 1 then
        local minutes = math.floor(hoursRemaining * 60)
        return getText("IGUI_DWAP_GeneratorWindow_RuntimeMinutes", minutes)
    elseif hoursRemaining < 24 then
        local hours = math.floor(hoursRemaining)
        local minutes = math.floor((hoursRemaining - hours) * 60)
        if minutes > 0 then
            return getText("IGUI_DWAP_GeneratorWindow_RuntimeHoursMinutes", hours, minutes)
        else
            return getText("IGUI_DWAP_GeneratorWindow_RuntimeHours", hours)
        end
    else
        local days = math.floor(hoursRemaining / 24)
        local hours = math.floor(hoursRemaining % 24)
        if hours > 0 then
            return getText("IGUI_DWAP_GeneratorWindow_RuntimeDaysHours", days, hours)
        else
            return getText("IGUI_DWAP_GeneratorWindow_RuntimeDays", days)
        end
    end
end

function GeneratorWindow:drawItem(y, item, alt)
    local a = 0.9

    -- Removed selection highlighting
    -- Removed alternating row highlighting
    -- Removed item borders

    -- Draw item text with left padding to prevent cutoff
    self:drawText(item.text, 5, y + 2, 1, 1, 1, a, self.font)

    return y + self.itemheight
end

function GeneratorWindow:update()
    ISCollapsableWindow.update(self)

    -- Check distance to generator and close if too far
    if self:isPlayerTooFar() then
        self:close()
        return
    end

    self.refreshTimer = self.refreshTimer + 1
    if self.refreshTimer >= self.refreshInterval then
        self.refreshTimer = 0
        self:updateGeneratorData()
    end
end

function GeneratorWindow:isPlayerTooFar()
    if not self.generatorIndex or not self.playerObj or not DWAP_Gen2 then
        return false
    end

    local generator = DWAP_Gen2:GetGenerator(self.generatorIndex)
    if not generator then
        return true -- Close if generator no longer exists
    end
-- IsoUtils.DistanceToSquared(player:getX(),player:getY(),obj:getX()+0.5,obj:getY()+0.5) <=
    local distance = IsoUtils.DistanceToSquared(self.playerObj:getX(), self.playerObj:getY(),
        generator.controls.x + 0.5, generator.controls.y + 0.5)
    return distance > 5
end

function GeneratorWindow:updateGeneratorData()
    if not self.generatorIndex or not DWAP_Gen2 then
        return
    end

    local data = DWAP_Gen2:GetCombinedGeneratorData(self.generatorIndex)
    if not data then
        DWAPUtils.dprint("GeneratorWindow: No data for generator " .. self.generatorIndex)
        return
    end

    -- Update status
    if data.running then
        local statusText = strings.statusRunning

        -- Check if running on solar/battery power only
        if data.solarEnabled and data.canDisableGenerator and data.netPowerNeeded and data.netPowerNeeded <= 0 then
            statusText = strings.statusUsingBattery
        end
        self.statusLabel:setColor(0, 1, 0)

        self.statusLabel:setName(statusText)
        self.toggleButton:setTitle(strings.buttonTurnOff)
    else
        self.statusLabel:setName(strings.statusOff)
        self.statusLabel:setColor(1, 0, 0) -- Red
        self.toggleButton:setTitle(strings.buttonTurnOn)
    end

    -- Update fuel - now shows actual liters and capacity
    local fuelLiters = math.floor(data.fuel)
    local capacityLiters = math.floor(data.capacity)
    self.fuelLabel:setName(getText("IGUI_DWAP_GeneratorWindow_FuelLabel", fuelLiters, capacityLiters))

    -- Color based on fuel percentage
    local fuelPercent = (data.fuel / data.capacity) * 100
    if fuelPercent < 20 then
        self.fuelLabel:setColor(1, 0, 0) -- Red for low fuel
    elseif fuelPercent < 50 then
        self.fuelLabel:setColor(1, 1, 0) -- Yellow for medium fuel
    else
        self.fuelLabel:setColor(0, 1, 0) -- Green for good fuel
    end

    -- Update condition
    local conditionPercent = math.floor(data.condition)
    self.conditionLabel:setName(getText("IGUI_DWAP_GeneratorWindow_ConditionLabel", conditionPercent))
    if conditionPercent < 20 then
        self.conditionLabel:setColor(1, 0, 0) -- Red for poor condition
    elseif conditionPercent < 50 then
        self.conditionLabel:setColor(1, 1, 0) -- Yellow for fair condition
    else
        self.conditionLabel:setColor(0, 1, 0) -- Green for good condition
    end

    -- Update power usage
    self.powerLabel:setName(getText("IGUI_DWAP_GeneratorWindow_PowerUsage", data.totalPowerUsing))

    -- Update runtime remaining
    local runtimeText = self:calculateRemainingRuntime(data.fuel, data.totalPowerUsing, data.netPowerNeeded)
    self.runtimeLabel:setName(getText("IGUI_DWAP_GeneratorWindow_RuntimeLabel", runtimeText))
    if runtimeText == strings.runtimeUnknownCalc then
        self.runtimeLabel:setColor(1, 1, 1) -- White for unknown
    elseif runtimeText:find("minutes") and not runtimeText:find("hours") then
        self.runtimeLabel:setColor(1, 0, 0) -- Red for less than 1 hour
    elseif runtimeText:find("hours") and not runtimeText:find("days") then
        self.runtimeLabel:setColor(1, 1, 0) -- Yellow for hours but less than a day
    else
        self.runtimeLabel:setColor(0, 1, 0) -- Green for days
    end

    -- Update ISA Integration Status
    if data.solarEnabled then
        local isaStatus = getText("IGUI_DWAP_GeneratorWindow_ISAActive")
        if data.connectedPanels and data.connectedPanels > 0 then
            isaStatus = getText("IGUI_DWAP_GeneratorWindow_ISAPanels", data.connectedPanels)
        end
        if data.batteryCharge and data.batteryMaxCapacity and data.batteryMaxCapacity > 0 then
            isaStatus = isaStatus .. getText("IGUI_DWAP_GeneratorWindow_ISABattery", data.batteryPercent)
        end
        self.isaStatusLabel:setName(isaStatus)
        self.isaStatusLabel:setColor(0, 1, 0) -- Green for active integration

        -- Show solar/battery contributions
        local contributions = ""
        if data.solarContribution and data.solarContribution > 0 then
            contributions = getText("IGUI_DWAP_GeneratorWindow_SolarContrib",
                string.format("%.2f", data.solarContribution))
        end
        if data.batteryContribution and data.batteryContribution > 0 then
            local batteryContrib = getText("IGUI_DWAP_GeneratorWindow_BatteryContrib",
                string.format("%.2f", data.batteryContribution))
            if contributions ~= "" then
                contributions = getText("IGUI_DWAP_GeneratorWindow_SolarBatteryContrib", contributions, batteryContrib)
            else
                contributions = batteryContrib
            end
        end
        if contributions == "" then
            contributions = strings.noAlternatePower
        end
        self.solarLabel:setName(contributions)

        -- Show net power needed
        if data.netPowerNeeded and data.netPowerNeeded >= 0 then
            local netText = getText("IGUI_DWAP_GeneratorWindow_NetPowerFromFuel",
                string.format("%.2f", data.netPowerNeeded))
            if data.canDisableGenerator then
                self.netPowerLabel:setColor(0, 1, 0) -- Green if can disable
            else
                self.netPowerLabel:setColor(1, 1, 1) -- White if still needed
            end
            self.netPowerLabel:setName(netText)
        else
            self.netPowerLabel:setName("")
        end
    else
        -- ISA integration not available
        if DWAP_Gen2 and DWAP_Gen2.canUseSolar then
            self.isaStatusLabel:setName(strings.isaNotAvailable)
            self.isaStatusLabel:setColor(1, 1, 0) -- Yellow for not available
        else
            self.isaStatusLabel:setName(strings.isaDisabled)
            self.isaStatusLabel:setColor(0.7, 0.7, 0.7) -- Gray for disabled
        end
        self.solarLabel:setName("")
        self.netPowerLabel:setName("")
    end

    -- Update items powered - populate the scrollable list from table
    self.itemsList:clear()

    local items = data.itemsPowered or {}
    if #items == 0 then
        self.itemsList:addItem(strings.noItemsPowered, "")
    else
        -- Sort items alphabetically for better organization
        table.sort(items)

        -- Add items to the list
        for i, item in ipairs(items) do
            self.itemsList:addItem(item, item)
        end
    end
end

function GeneratorWindow:onToggleGenerator()
    if not self.generatorIndex or not DWAP_Gen2 then
        return
    end

    local generator = DWAP_Gen2:GetGenerator(self.generatorIndex)
    if not generator then
        return
    end

    if generator.running then
        DWAP_Gen2:TurnOffGen(self.generatorIndex)
    else
        DWAP_Gen2:TurnOnGen(self.generatorIndex)
    end

    -- Immediate refresh after toggle
    self:updateGeneratorData()
end

function GeneratorWindow:onRefreshData()
    self:updateGeneratorData()
end

function GeneratorWindow.OnOpenPanel(player, generatorIndex)
    local instance = GeneratorWindow.instance
    if not instance then
        instance = GeneratorWindow:new(100, 100, 400, 420) -- Increased height for ISA integration display
        -- Note: ISLayoutManager might not be available in all Project Zomboid versions
        -- If it causes issues, you can remove this line
        if ISLayoutManager then
            ISLayoutManager.RegisterWindow('generatorwindow', GeneratorWindow, instance)
        end
    end

    instance.player = player
    instance.playerObj = getSpecificPlayer(player)
    instance.generatorIndex = generatorIndex

    instance:addToUIManager()
    instance:updateGeneratorData()
end

function GeneratorWindow:close()
    self:removeFromUIManager()
    if JoypadState.players[self.player + 1] then
        setPrevFocusForPlayer(self.player)
    end
end

return GeneratorWindow
