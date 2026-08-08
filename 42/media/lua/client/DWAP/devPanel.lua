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
-- take a config index, and "the base I'm standing in" is the one you want.
-- DWAPNearestConfig (devTools) is the single implementation, so the panel
-- readout and the export headers can never name different configs.
local function nearestConfigIndex(useCache)
    return DWAPNearestConfig(useCache)
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

-- Each Show* overlay bakes in the config it was enabled for, so travelling
-- otherwise leaves a lit overlay still drawing the base we just left. They
-- read their index only on the way ON, so re-pointing one means calling it
-- twice: once to drop the old config, once to bind the new. Safe to do
-- immediately after the teleport - the lookups are built from config data,
-- and only the per-tick renderers touch the world.
local nearestOverlays = {
    { key = "containers", show = function(i) ShowContainers(i) end },
    { key = "elec",       show = function(i) ShowElec(i) end },
    { key = "plumbing",   show = function(i) ShowPlumbing(i) end },
    { key = "barricades", show = function(i) ShowBarricades(i) end },
}

-- An overlay whose new config has nothing to show (no generators, no water
-- system, no barricade objectSpawns) refuses to re-enable and says why - it
-- just stays dark, and its button goes back to black.
local function retargetOverlays(index)
    if not DWAP_DevToggles then return end
    for i = 1, #nearestOverlays do
        local overlay = nearestOverlays[i]
        if DWAP_DevToggles[overlay.key] then
            overlay.show(index)
            overlay.show(index)
        end
    end
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
            retargetOverlays(index)
            return
        end
    end
end

-- Toggle buttons carry their state in the background colour instead of a
-- label suffix: green while the overlay is live, dark enough that the white
-- label still reads. Off values are ISButton's own defaults.
local BTN_ON       = { r = 0.13, g = 0.42, b = 0.15 }
local BTN_ON_OVER  = { r = 0.20, g = 0.60, b = 0.22 }
local BTN_OFF      = { r = 0.00, g = 0.00, b = 0.00 }
local BTN_OFF_OVER = { r = 0.30, g = 0.30, b = 0.30 }

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
                self.stateButtons[#self.stateButtons + 1] = { btn = btn, state = def.state }
            end
        end
        y = y + rowH + 4
    end
    self:setHeight(y + pad)
end

-- Reflect live overlay state on the toggle buttons, so an overlay enabled
-- out of visual range (or dropped by a Prev/Next re-point) can't leave a
-- button out of phase. Unthrottled - it is a handful of writes and only on
-- an actual state change - so clicks light up immediately.
function DWAPDevPanelUI:refreshToggleColors()
    if not self.stateButtons then return end
    for i = 1, #self.stateButtons do
        local entry = self.stateButtons[i]
        local lit = entry.state() and true or false
        if lit ~= entry.lit then
            entry.lit = lit
            local bg = lit and BTN_ON or BTN_OFF
            local over = lit and BTN_ON_OVER or BTN_OFF_OVER
            entry.btn:setBackgroundRGBA(bg.r, bg.g, bg.b, 1)
            entry.btn:setBackgroundColorMouseOverRGBA(over.r, over.g, over.b, 1)
        end
    end
end

function DWAPDevPanelUI:render()
    ISCollapsableWindow.render(self)
    self:refreshToggleColors()
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
        { label = "Containers", fn = function() withNearest(ShowContainers, "ShowContainers") end,
            state = function() return DWAP_DevToggles and DWAP_DevToggles.containers end },
        { label = "Electricity", fn = function() withNearest(ShowElec, "ShowElec") end,
            state = function() return DWAP_DevToggles and DWAP_DevToggles.elec end },
        { label = "Plumbing", fn = function() withNearest(ShowPlumbing, "ShowPlumbing") end,
            state = function() return DWAP_DevToggles and DWAP_DevToggles.plumbing end },
        -- One-shot scan of wherever the player is standing (building footprint
        -- inside, 10-tile grab outside), so no config index and no toggle
        -- state - output goes to the console as config-ready waterFixtures
        { label = "Find Unconn. Plumbing", fn = function() FindUnconnectedPlumbing() end },
        -- Hand-picked alternative for buildings too big to scan wholesale
        { label = "Plumb Pick", fn = function() DWAPPlumbPick() end,
            state = function() return DWAP_DevToggles and DWAP_DevToggles.plumbPick end },
        { pairRow = {
            { label = "Export Picked", fn = function() DWAPPlumbExport() end },
            { label = "Clear Picked", fn = function() DWAPPlumbClear() end },
        } },
        -- Room-level selection for buildings shared between businesses, where
        -- a whole-footprint pass would grab rooms that are not ours
        { label = "Room Pick", fn = function() DWAPRoomPick() end,
            state = function() return DWAP_DevToggles and DWAP_DevToggles.roomPick end },
        -- Green = the export also lists containers the config already has,
        -- for reworking a whole room rather than filling around it
        { label = "Incl. Configured", fn = function() DWAPRoomExportAll() end,
            state = function() return DWAP_DevToggles and DWAP_DevToggles.roomExportAll end },
        { pairRow = {
            { label = "Export Rooms", fn = function() withNearest(DWAPRoomExport, "DWAPRoomExport") end },
            { label = "Clear Rooms", fn = function() DWAPRoomClear() end },
        } },
        -- Sprites resolve on export, not on click, because clicking a door
        -- opens it - pick, shut them, then export
        { label = "Door Pick", fn = function() DWAPDoorPick() end,
            state = function() return DWAP_DevToggles and DWAP_DevToggles.doorPick end },
        { pairRow = {
            { label = "Export Doors", fn = function() DWAPDoorExport() end },
            { label = "Clear Doors", fn = function() DWAPDoorClear() end },
        } },
        { label = "Barricades", fn = function() withNearest(ShowBarricades, "ShowBarricades") end,
            state = function() return DWAP_DevToggles and DWAP_DevToggles.barricades end },
        -- Same one-shot, player-position shape as the plumbing scan
        { label = "Find Unbarricaded", fn = function() FindUnbarricaded() end },
        -- Green here means the power system's per-object trace is printing;
        -- off by default because it drowns out everything else in -debug
        { label = "Power Log", fn = function() DWAPPowerLog() end,
            state = function() return DWAPUtils.verbosePower end },
        -- Full run from config 1, loot only. DWAPAudit doubles as its own
        -- abort, so the button stops a run in progress; green while running.
        -- For a resume or the systems pass use the console: DWAPAudit(31) /
        -- DWAPAudit(1, nil, true)
        { label = "Run Audit", fn = function() DWAPAudit(1) end,
            state = function() return DWAPAuditRunning and DWAPAuditRunning() end },
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
