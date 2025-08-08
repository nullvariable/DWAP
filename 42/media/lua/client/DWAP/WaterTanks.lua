local IsoObjectUtils = require("Starlit/IsoObjectUtils")
local DWAPUtils = require("DWAPUtils")

--- @type number Amount of water to add to a tank every 10 minutes
local generatorWaterPerTenMinutes = 1

--- @type boolean Track if the world water was available last tick so we can detect when it's shut off
local hadWorldWaterLastTick = true

--- Get an object from a square by sprite name
--- @param square IsoGridSquare
--- @param sprite string
--- @return IsoObject|nil object, number size object and the number of objects on the square
local function getSpriteObject(square, sprite)
    if not square then
        DWAPUtils.dprint("getSpriteObject: Square not found")
        return nil, -1
    end
    local tankObjects = square:getObjects()
    local size = tankObjects:size() - 1
    for i = 0, size do
        local object = tankObjects:get(i)
        if object and object:getSpriteName() == sprite then
            return object, size
        end
    end
    return nil, -1
end


local function getTankObject(square)
    local objects = square:getObjects()
    local osize = objects:size() - 1
    for j = 0, osize do
        local tankObj = objects:get(j)
        if tankObj and tankObj:hasModData() then
            local md = tankObj:getModData()
            if md and md.waterSource then
                return tankObj
            end
        end
    end
    return nil
end

--- @class GameCoords
--- @field x number
--- @field y number
--- @field z number

-- { sprite = "industry_02_72", x = wtc.x, y = wtc.y, z = wtc.z, isProp = true, sourceType="generator", source = {x = 12049, y = 2578, z = 0} }
--- @class WaterTank
--- @field sprite string
--- @field x number
--- @field y number
--- @field z number
--- @field isProp boolean
--- @field sourceType? string
--- @field source? GameCoords
--- @field initialized boolean

-- { sprite = "fixtures_sinks_01_17", x = 12041, y = 2580, z = 0, sourceType="tank", source = {x = wtc.x, y = wtc.y, z = wtc.z} }
--- @class WaterFixture
--- @field sprite string
--- @field x number
--- @field y number
--- @field z number
--- @field sourceType string
--- @field source GameCoords


DWAP_WaterSystem = {
    --- @type WaterTank[]
    tanks = table.newarray(),
    fixtures = {}, -- table key'd by hashCoords of the tank a fixture belongs to
    --- @type boolean
    hadWorldWaterLastTick = true,
    hashCoords = DWAPUtils.hashCoords,
    firstRun = true
}

local initializeFixture
--- Initialize a fixture
--- Since the current game plumbing system requires that the fixture be below a 3x3 grid, the sort of stuff we want
--- doesn't work, so we cheat a bit by moving the fixture to a square below the source, then moving it back after the game saves
--- the link to the water source. The game doesn't seem to keep checking once the source is linked until the source is out of water.
--- So this works until it's out of water, or a fixture is moved.
--- @param fixture WaterFixture
function DWAP_WaterSystem:InitializeFixture(fixture)
    DWAPUtils.dprint(("DWAP_WaterSystem: initializeFixture: %s %s %s"):format(fixture.x, fixture.y, fixture.z))
    local sprite = fixture.sprite
    local fixtureSquare = getSquare(fixture.x, fixture.y, fixture.z)
    local fixtureObj = getSpriteObject(fixtureSquare, sprite)
    if not fixtureObj then
        DWAPUtils.dprint("DWAP_WaterSystem: initializeFixture: Fixture object not found")
        DWAPUtils.dprint(fixture)
        return
    end
    if fixtureObj:getUsesExternalWaterSource() and fixtureObj:hasExternalWaterSource() then
        DWAPUtils.dprint("DWAP_WaterSystem: initializeFixture: Fixture already uses external water source")
        return
    end
    if fixture.sourceType == "tank" then
        local tankSquare = getSquare(fixture.source.x, fixture.source.y, fixture.source.z)
        if not tankSquare then
            DWAPUtils.dprint("DWAP_WaterSystem: initializeFixture: Tank square not found, kicking to Square loaded event for tank")
            DWAPSquareLoaded:AddEvent(initializeFixture, fixture.source.x, fixture.source.y, fixture.source.z, true, fixture)
            return
        end

        local moveSquare = IsoObjectUtils.getOrCreateSquare(fixture.source.x, fixture.source.y, fixture.source.z - 1)

        fixtureObj:setSquare(moveSquare)
        DWAPUtils.dprint(("DWAP_WaterSystem: initializeFixture: Moved fixture to %s %s %s"):format(fixture.source.x, fixture.source.y, fixture.source.z - 1))
        fixtureObj:getModData().canBeWaterPiped = false
        fixtureObj:setUsesExternalWaterSource(true)
        fixtureObj:transmitModData()
        -- fixtureObj:sendObjectChange('usesExternalWaterSource', { value = true })

        -- DWAPUtils.Defer(function()
        fixtureObj:doFindExternalWaterSource()
        -- DWAPUtils.Defer(function()
            fixtureObj:setSquare(fixtureSquare)
            fixtureObj:setUsesExternalWaterSource(true)
            -- only works on single player, has to be called on server otherwise
            -- fixtureObj:sendObjectChange('usesExternalWaterSource', { value = true })
            -- buildUtil.setHaveConstruction(fixtureSquare, true)
            fixtureObj:transmitModData()
            fixtureSquare:transmitModdata()
            fixtureSquare:setSquareChanged()
            -- fixtureObj:sync()
            DWAPUtils.dprint(("DWAP_WaterSystem: initializeFixture: Moved fixture back to %s %s %s"):format(fixture.x, fixture.y, fixture.z))
        -- end)
        -- end)
    end
end
initializeFixture = function(params)
    DWAP_WaterSystem:InitializeFixture(params)
end

--[[
--- Initialize the fixtures for a given set of coords
--- @param coords table
function DWAP_WaterSystem:initializeFixtures(coords)
    DWAPUtils.dprint(("initializeFixtures: %s %s %s"):format(coords.x, coords.y, coords.z))
    local fixtures = self.fixtures[self.hashCoords(coords)]
    if not fixtures then
        DWAPUtils.dprint("initializeFixtures: No fixtures found")
        return
    end
    for i = 1, #fixtures do
        local fixture = fixtures[i]
        DWAPSquareLoaded:AddEvent(
            DWAP_WaterSystem.initializeFixture,
            fixture.x,
            fixture.y,
            fixture.z,
            true,
            fixture
        )
    end
end
]]--

-- @TODO if it becomes a thing, we could add a moddata for when the square is not found to store up water that would be added if the player was in range and then add it
-- the next time we see the tank...
function DWAP_WaterSystem:generatorRefill(maxAmount)
    for i = 1, #self.tanks do
        local tank = self.tanks[i]
        if tank.sourceType == "generator" then
            local generatorSquare = getSquare(tank.source.x, tank.source.y, tank.source.z)
            if generatorSquare and generatorSquare:haveElectricity() then
                local tankSquare = getSquare(tank.x, tank.y, tank.z)
                if tankSquare then
                    DWAPUtils.dprint("index "..i .. " x: "..tank.x.." y: "..tank.y.." sprite: "..tank.sprite)
                    -- DWAPUtils.dprint(tank)
                    local objects = tankSquare:getObjects()
                    local osize = objects:size() - 1
                    for j = 0, osize do
                        local tankObj = objects:get(j)
                        if tankObj and tankObj:hasModData() then
                            local md = tankObj:getModData()
                            if md and md.waterSource then
                                -- local fluidContainer = tankObj:getComponent(ComponentType.FluidContainer)
                                local fluidContainer = tankObj:getFluidContainer()
                                if fluidContainer then
                                    DWAPUtils.dprint("DWAP_WaterSystem: generatorRefill: Refilling tank")
                                    local free = fluidContainer:getFreeCapacity()
                                    if free > 0 then
                                        local fluid = Fluid.Get(FluidType.Water)
                                        local currentAmount = fluidContainer:getSpecificFluidAmount(fluid)
                                        local newAmount = currentAmount + maxAmount
                                        fluidContainer:adjustSpecificFluidAmount(fluid, newAmount)
                                        DWAPUtils.dprint(("DWAP_WaterSystem: generatorRefill: Refilled tank at %s %s %s with %d water"):format(tank.x,
                                            tank.y, tank.z, maxAmount))
                                    else
                                        DWAPUtils.dprint("DWAP_WaterSystem: generatorRefill: Tank is full "..tostring(free))
                                    end
                                else
                                    DWAPUtils.dprint("DWAP_WaterSystem: generatorRefill: Fluid container not found")
                                end
                            end
                        else
                            DWAPUtils.dprint("DWAP_WaterSystem: generatorRefill: Tank object not found")
                        end
                    end
                end
            end
        end
    end
end

--- Initialize a water tank
--- @param index number
--- @param tankObj IsoObject
--- @param square IsoGridSquare
function DWAP_WaterSystem:initializeTank(index, tankObj, square)
    local tank = self.tanks[index]
    local sprite = tank.sprite
    
    -- Double check to prevent duplicate initialization
    if tank.initialized or tankObj:getFluidContainer() then
        tank.initialized = true
        DWAPUtils.dprint("DWAP_WaterSystem: initializeTank: Tank already initialized or fluid container already exists")
        return
    end
    
    DWAPUtils.dprint("DWAP_WaterSystem: initializeTank: Creating new tank with fluid container")
    
    -- Remove the old object first
    square:transmitRemoveItemFromSquare(tankObj)
    square:RemoveTileObject(tankObj)
    
    -- Create new thumpable tank
    local thumpable = IsoThumpable.new(tankObj:getCell(), square, sprite, false)
    thumpable:getModData().waterSource = true

    --- @type FluidContainer annoyingly umbrella doesn't have this class yet
    local fluidContainer = ComponentType.FluidContainer:CreateComponent();
    fluidContainer:setCapacity(SandboxVars.DWAP.WaterTankCapacity or 4000)
    fluidContainer:addFluid(FluidType.Water, SandboxVars.DWAP.WaterLevel or 2000)
    GameEntityFactory.AddComponent(thumpable, true, fluidContainer);
    
    -- Add the new object
    square:AddTileObject(thumpable)
    square:AddSpecialObject(thumpable)
    square:transmitAddObjectToSquare(thumpable, thumpable:getObjectIndex())
    
    -- Mark as initialized
    self.tanks[index].initialized = true
    -- self:SaveModData()
    DWAPUtils.dprint(("DWAP_WaterSystem: initializeTank: Initialized tank at %s %s %s"):format(tank.x, tank.y, tank.z))
end

local tankSeen
function DWAP_WaterSystem:TankSeen(index)
    DWAPUtils.dprint(("DWAP_WaterSystem: TankSeen: %d"):format(index))
    local tank = self.tanks[index]
    
    -- Prevent duplicate initialization
    if tank.initialized then
        DWAPUtils.dprint("DWAP_WaterSystem: TankSeen: Tank already initialized")
        return
    end
    
    local square = getSquare(tank.x, tank.y, tank.z)
    if not square then return end
    
    -- Check if we already have a tank object with fluid container
    local tankObj = getTankObject(square)
    if tankObj and tankObj:getFluidContainer() then
        tank.initialized = true
        DWAPUtils.dprint("DWAP_WaterSystem: TankSeen: Tank object with fluid container already exists")
        return
    end

    if not tankObj then
        tankObj = getSpriteObject(square, tank.sprite)
    end

    if tankObj then
        self:initializeTank(index, tankObj, square)
    end
    local hash = self.hashCoords(tank.x, tank.y, tank.z)
    if not self.hadWorldWaterLastTick and self.fixtures[hash] then
        for i = 1, #self.fixtures[hash] do
            local fixture = self.fixtures[hash][i]
            DWAPSquareLoaded:AddEvent(
                initializeFixture,
                fixture.x,
                fixture.y,
                fixture.z,
                true,
                fixture
            )
        end
    elseif self.hadWorldWaterLastTick then
        DWAPSquareLoaded:AddHookEvent(
                "OnWaterShutoff",
                tankSeen,
                tank.x,
                tank.y,
                tank.z,
                true,
                { index = index }
            )
    end
end
tankSeen = function(params)
    DWAP_WaterSystem:TankSeen(params.index)
end


--- Our water shutoff event
function DWAP_WaterSystem:onWaterShutoff()
    local anyGeneratorSupplied = false
    for i = 1, #self.tanks do
        local tank = self.tanks[i]
        DWAPSquareLoaded:RunHook("OnWaterShutoff", tank.x, tank.y, tank.z)
        if tank.sourceType == "generator" then
            anyGeneratorSupplied = true
        end
    end
    if anyGeneratorSupplied then
        -- Events.EveryTenMinutes.Add(function()
        --     DWAP_WaterSystem:generatorRefill()
        -- end)
        Events.EveryHours.Add(function()
            DWAP_WaterSystem:generatorRefill(generatorWaterPerTenMinutes * 6)
        end)
    end
end

local waterIntervalTick
--- Watch for the world water to be shut off
function DWAP_WaterSystem:WaterIntervalTick()
    if DWAPUtils.WorldWaterStillAvailable() then
        self.hadWorldWaterLastTick = true
    elseif hadWorldWaterLastTick then
        DWAPUtils.dprint("DWAP_WaterSystem: Water shutoff detected")
        self.hadWorldWaterLastTick = false
        self:onWaterShutoff()
        Events.EveryTenMinutes.Remove(waterIntervalTick)
    end
end
waterIntervalTick = function()
    DWAP_WaterSystem:WaterIntervalTick()
end

function DWAP_WaterSystem:Startup()
    DWAPUtils.dprint("DWAP_WaterSystem: Startup")
    if not self.tanks then
        DWAPUtils.dprint("DWAP_WaterSystem: Startup: No tanks")
        return
    end
    for i = 1, #self.tanks do
        local tank = self.tanks[i]
        if tank.isProp and self.firstRun then
            DWAPSquareLoaded:AddHookEvent(
                "PropSpawned",
                tankSeen,
                tank.x,
                tank.y,
                tank.z,
                false,
                { index = i }
            )
        else
            DWAPSquareLoaded:AddEvent(
                tankSeen,
                tank.x,
                tank.y,
                tank.z,
                false,
                { index = i }
            )
        end
    end
    DWAPUtils.dprint("DWAP_WaterSystem: added "..tostring(#self.tanks).." tanks")
end

function DWAP_WaterSystem:SaveModData()
    -- ModData.add("DWAP_WaterData", {
    --     tanks = self.tanks,
    --     fixtures = self.fixtures,
    --     hadWorldWaterLastTick = self.hadWorldWaterLastTick,
    --     init = true
    -- })
end

--- Add a fixture to the list of fixtures
--- @param fixture WaterFixture
--- @param isManual boolean
function DWAP_WaterSystem:addFixture(fixture, isManual)
    local hash = self.hashCoords(fixture.source.x, fixture.source.y, fixture.source.z)
    if not self.fixtures[hash] then
        self.fixtures[hash] = table.newarray()
    end
    self.fixtures[hash][#self.fixtures[hash] + 1] = fixture
    if isManual then
        local md = ModData.getOrCreate("DWAP_WaterData")
        if not md.manualFixtures then
            md.manualFixtures = {}
        end
        md.manualFixtures[#md.manualFixtures+1] = fixture
    end
end

--- Initialize the water tanks, OnInitGlobalModData event
--- @param isNewGame boolean
function DWAP_WaterSystem:TanksInitData(isNewGame)
    if DWAPUtils.getSaveVersion() >= 17 then
        DWAPUtils.dprint("DWAP_WaterSystem: TanksInitData: Save version is 17 or higher, skipping initialization")
        return
    end

    DWAPUtils.dprint("DWAP_WaterSystem: InitWaterTanks (new game: " .. tostring(isNewGame) .. ")")

    if SandboxVars.DWAP.EnableWaterSystem then
        local md = ModData.getOrCreate("DWAP_WaterData")

        self.firstRun = not md.init
        md.init = true
        -- if not modData.init or isNewGame then
            DWAPUtils.dprint("DWAP_WaterSystem: InitWaterTanks: Initializing water tanks")
            -- self.hadWorldWaterLastTick = true

            local configs = DWAPUtils.loadConfigs()
            for i = 1, #configs do
                local config = configs[i]
                if config and config.waterTanks then
                    for j = 1, #config.waterTanks do
                        local tank = config.waterTanks[j]
                        tank.initialized = false
                        self.tanks[#self.tanks+1] = tank
                    end
                end
                if config and config.waterFixtures then
                    for j = 1, #config.waterFixtures do
                        local fixture = config.waterFixtures[j]
                        self:addFixture(fixture, false)
                    end
                end
            end
            table.wipe(configs)
            -- self:SaveModData()
            DWAPUtils.dprint("DWAP_WaterSystem: InitWaterTanks: Initialized water tanks")
        -- else
        --     self.hadWorldWaterLastTick = modData.hadWorldWaterLastTick
        --     self.tanks = modData.tanks
        --     self.fixtures = modData.fixtures
        -- end

        if md.manualFixtures then
            for i = 1, #md.manualFixtures do
                local fixture = md.manualFixtures[i]
                self:addFixture(fixture, false)
            end
        end
    end
    DWAP_WaterSystem:Startup()
end

Events.OnInitGlobalModData.Add(function(isNewGame)
    DWAP_WaterSystem:TanksInitData(isNewGame)
end)

Events.OnLoad.Add(function()
    if DWAPUtils.getSaveVersion() >= 17 then
        return
    end
    if SandboxVars.DWAP.EnableWaterSystem then
        hadWorldWaterLastTick = DWAPUtils.WorldWaterStillAvailable()
        DWAP_WaterSystem.hadWorldWaterLastTick = hadWorldWaterLastTick
        if hadWorldWaterLastTick then
            DWAPUtils.dprint("DWAP_WaterSystem: OnLoad: watching for water shutoff")
            Events.EveryTenMinutes.Add(waterIntervalTick)
        else
            DWAPUtils.dprint("DWAP_WaterSystem: OnLoad: No water detected")
            DWAP_WaterSystem:onWaterShutoff()
        end
    end
end)

-- Events.OnGridBurnt.Add(function(square)
--     if SandboxVars.DWAP.EnableWaterSystem then
--         for i = 1, #DWAP_WaterSystem.tanks do
--             local tank = DWAP_WaterSystem.tanks[i]
--             if tank.x == square:getX() and tank.y == square:getY() and tank.z == square:getZ() then
--                 DWAPUtils.dprint(("DWAP_WaterSystem: OnGridBurnt: Tank at %s %s %s burnt"):format(tank.x, tank.y, tank.z))
--                 DWAP_WaterSystem.tanks[i] = nil
--                 DWAP_WaterSystem:SaveModData()
--                 return
--             end
--         end
--     end
-- end)


-- isWaterInfinite