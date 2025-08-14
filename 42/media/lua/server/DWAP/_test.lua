
local DWAPUtils = require("DWAPUtils")

function TestServerConn()
    local conf = { sprite = "fixtures_sinks_01_9", x = 12835, y = 1610, z = 0, sourceType="tank", source = {x = 12835, y = 1614, z = 1} }
    local square = getCell():getGridSquare(conf.x, conf.y, conf.z)
    if not square then
        DWAPUtils.dprint("TestServerConn: No square found at " .. conf.x .. "," .. conf.y .. "," .. conf.z)
        return
    end
    local count = square:getObjects():size()
    local targetObj = nil
    for i = 1, count do
        local obj = square:getObjects():get(i - 1)
        if obj and obj:getSprite() and obj:getSprite():getName() == conf.sprite then
            targetObj = obj
            break
        end
    end

    if not targetObj then
        DWAPUtils.dprint("TestServerConn: No object found with sprite " .. conf.sprite)
        return
    end
    DWAPUtils.connectWaterTank(targetObj, {
        x = conf.source.x,
        y = conf.source.y,
        z = conf.source.z,
    })
end