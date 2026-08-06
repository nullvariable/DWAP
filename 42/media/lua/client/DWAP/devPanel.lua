-- Dev tooling: inert outside debug mode so shipping this file is safe.
-- getDebug() is the -debug launch flag - per-launch, never set for normal
-- players, no sandbox UI exposure
if not getDebug() then return end

-- devPanel.lua
-- Small debug-mode button panel for the DWAP dev tools.
-- Auto-opens in debug mode; DWAPDevPanel() toggles it from the console.

require "ISUI/ISCollapsableWindow"
require "ISUI/ISButton"

local DWAPUtils = require("DWAPUtils")

-- Nearest config by spawn distance to the player: the Show* toggles all
-- take a config index, and "the base I'm standing in" is the one you want
local function nearestConfigIndex(useCache)
    local player = getPlayer()
    if not player then return nil end
    local px, py = player:getX(), player:getY()
    local configs = DWAPUtils.loadConfigs(not useCache)
    if not configs then return nil end
    local best, bestDist
    for i = 1, #configs do
        local c = configs[i]
        local s = c and c.spawn
        if s and s.x then
            local dx, dy = s.x - px, s.y - py
            local d = dx * dx + dy * dy
            if not bestDist or d < bestDist then
                best, bestDist = i, d
            end
        end
    end
    return best
end

local function withNearest(fn, label)
    local index = nearestConfigIndex()
    if not index then
        DWAPUtils.dprint(label .. ": no config found near player")
        return
    end
    DWAPUtils.dprint(label .. ": using nearest config " .. index)
    fn(index)
end

-- Step from the nearest config to the previous/next valid one, wrapping at
-- both ends (config list can hold false placeholders - skip those)
local function gotoStep(delta)
    local configs = DWAPUtils.loadConfigs(true)
    if not configs or #configs == 0 then return end
    local n = #configs
    local index = nearestConfigIndex() or 1
    for _ = 1, n do
        index = index + delta
        if index > n then index = 1 elseif index < 1 then index = n end
        if configs[index] then
            DWAPGoto(index)
            return
        end
    end
end

DWAPDevPanelUI = ISCollapsableWindow:derive("DWAPDevPanelUI")

function DWAPDevPanelUI:createChildren()
    ISCollapsableWindow.createChildren(self)
    local pad = 6
    local rowH = 22
    local lineH = getTextManager():getFontHeight(UIFont.Small)
    if not lineH or lineH <= 0 then lineH = 14 end
    self.infoLineH = lineH
    self.infoTop = self:titleBarHeight() + pad
    -- nearest-config line + the three where lines, refreshed in render()
    self.infoLineCount = 4
    local y = self.infoTop + self.infoLineCount * lineH + pad
    for i = 1, #self.buttonDefs do
        local def = self.buttonDefs[i]
        if def.pairRow then
            local halfW = math.floor((self.width - pad * 3) / 2)
            for j = 1, 2 do
                local half = def.pairRow[j]
                local btn = ISButton:new(pad + (j - 1) * (halfW + pad), y, halfW, rowH, half.label, self, function()
                    half.fn()
                end)
                btn:initialise()
                self:addChild(btn)
            end
        else
            local btn = ISButton:new(pad, y, self.width - pad * 2, rowH, def.label, self, function()
                def.fn()
            end)
            btn:initialise()
            btn.anchorRight = true
            self:addChild(btn)
            if def.state then
                self.stateButtons = self.stateButtons or {}
                self.stateButtons[#self.stateButtons + 1] = { btn = btn, label = def.label, state = def.state }
            end
        end
        y = y + rowH + 4
    end
    self:setHeight(y + pad)
end

function DWAPDevPanelUI:render()
    ISCollapsableWindow.render(self)
    local now = getTimestampMs()
    if now - (self.lastInfoUpdate or 0) >= 1000 then
        self.lastInfoUpdate = now
        local lines = {}
        local index = nearestConfigIndex(true)
        if index then
            local configs = DWAPUtils.loadConfigs()
            local config = configs and configs[index]
            local name = config and config.doorKeys and config.doorKeys.name or ("Config " .. index)
            lines[1] = ("nearest: %02d %s"):format(index, name)
        else
            lines[1] = "nearest: ?"
        end
        local player = getPlayer()
        local square = player and player:getCurrentSquare()
        if square then
            local whereLines = DWAPWhereLines(square)
            for i = 1, #whereLines do
                lines[#lines + 1] = whereLines[i]
            end
        end
        self.infoLines = lines
        -- reflect live overlay state on the toggle buttons so an overlay
        -- enabled out of visual range can't leave the toggle out of phase
        if self.stateButtons then
            for i = 1, #self.stateButtons do
                local e = self.stateButtons[i]
                e.btn:setTitle(e.label .. (e.state() and " [ON]" or ""))
            end
        end
    end
    if self.infoLines then
        local pad = 6
        for i = 1, #self.infoLines do
            local ly = self.infoTop + (i - 1) * self.infoLineH
            -- same style as the person overlay: white with a dark shadow
            self:drawText(self.infoLines[i], pad + 1, ly + 1, 0, 0, 0, 0.8, UIFont.Small)
            self:drawText(self.infoLines[i], pad, ly, 1, 1, 1, 1, UIFont.Small)
        end
    end
end

local panelInstance = nil

function DWAPDevPanel()
    if panelInstance then
        panelInstance:removeFromUIManager()
        panelInstance = nil
        return
    end
    local defs = {
        { pairRow = {
            { label = "< Prev", fn = function() gotoStep(-1) end },
            { label = "Next >", fn = function() gotoStep(1) end },
        } },
        { label = "Auto Lights", fn = function() DoAutoLights() end,
            state = function() return DWAP_AutoLightsEnabled end },
        { label = "Where Am I", fn = function() DWAPWhere() end,
            state = function() return DWAP_DevToggles and DWAP_DevToggles.where end },
        { label = "Flashlight", fn = function()
            local player = getPlayer()
            if player then player:getInventory():AddItem("Base.HandTorch") end
        end },
        { label = "Containers (nearest)", fn = function() withNearest(ShowContainers, "ShowContainers") end,
            state = function() return DWAP_DevToggles and DWAP_DevToggles.containers end },
        { label = "Electricity (nearest)", fn = function() withNearest(ShowElec, "ShowElec") end,
            state = function() return DWAP_DevToggles and DWAP_DevToggles.elec end },
        { label = "Plumbing (nearest)", fn = function() withNearest(ShowPlumbing, "ShowPlumbing") end,
            state = function() return DWAP_DevToggles and DWAP_DevToggles.plumbing end },
        { label = "Barricades (nearest)", fn = function() withNearest(ShowBarricades, "ShowBarricades") end,
            state = function() return DWAP_DevToggles and DWAP_DevToggles.barricades end },
    }
    local panel = DWAPDevPanelUI:new(getCore():getScreenWidth() - 270, 100, 240, 40)
    panel.buttonDefs = defs
    panel:initialise()
    panel:setTitle("DWAP Dev")
    panel:setResizable(false)
    panel:addToUIManager()
    panelInstance = panel
end

Events.OnGameStart.Add(function()
    if getDebug() then
        DWAPDevPanel()
    end
end)
