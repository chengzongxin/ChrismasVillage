cj = require "jass.common"
cg = require "jass.globals"
require 'kit.echo'

-- bj = require "blizzard"
-- 物编转id
function str2id(a)
    local n1 = string.byte(a, 1) or 0
    local n2 = string.byte(a, 2) or 0
    local n3 = string.byte(a, 3) or 0
    local n4 = string.byte(a, 4) or 0
    local r = n1*256*256*256+n2*256*256+n3*256+n4
    return r
end


-- 命令玩家选中单位
function select_unit(whichUnit,whichPlayer)
    if cj.GetLocalPlayer() == whichPlayer then
        cj.ClearSelection()
        cj.SelectUnit(whichUnit, true)
    end
end

-- 等待时间
function polled_wait(duration)
    local timer t = nil
    local real  timeRemaining = nil

    if duration > 0 then
        local t = cj.CreateTimer()
        cj.TimerStart(t, duration, false, nil)

        timeRemaining = cj.TimerGetRemaining(t)
        while timeRemaining <= 0 do
            if timeRemaining > duration then
                cj.TriggerSleepAction(0.1 * timeRemaining)
            else
                cj.TriggerSleepAction(0.1)
            end
        end
        cj.DestroyTimer(t)
    end
end
