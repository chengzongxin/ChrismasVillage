require 'kit.common'
require 'kit.echo'
require 'kit.cevent'
require 'kit.multiboard'
require 'kit.texttag'
require 'kit.colordef'
require 'kit.dialog'
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
    return t
end

-- 等待时间，触发
function time_event_wait(duration,callFunc)
    local t = cj.CreateTrigger()
    cj.TriggerRegisterTimerEvent(t, duration, false)
    cj.TriggerAddAction(t, function()
        cj.DisableTrigger(t)
        cj.DestroyTrigger(t)
        t = nil
        if (type(callFunc) == "function") then
            callFunc()
        end
    end)
    return t
end

-- 等待时间,计时器
function time_wait(duration,callFunc)
    local timer = cj.CreateTimer()
    cj.TimerStart(timer, duration, false, function ()
        cj.DestroyTimer(timer)
        callFunc()
    end)
    return timer
end




-- 创建计时器窗口
---@param timer 计时器
---@param title 计时器标题
---@return timerdialog
function create_timer_Dialog(timer,title)
    local d = cj.CreateTimerDialog(timer)
    cj.TimerDialogSetTitle(d,title)
    cj.TimerDialogDisplay(d,true)
    return d
end

-- 创建计时器窗口
---@param timerdialog 计时器窗口
---@return any
function destroy_timer_Dialog(timerDialog)
    cj.DestroyTimerDialog(timerDialog)
end

function uname(unit)
    return cj.GetUnitName(unit)
end

function iname(item)
    return cj.GetItemName(item)
end

-- 创建计时器
---@param timeout 时间间隔
---@param times 运行次数
---@param handlerFunc 回调函数 
function Timer_times(timeout,times,handlerFunc)
    -- native TimerStart           takes timer whichTimer, real timeout, boolean periodic, code handlerFunc returns nothing
    local timer = cj.CreateTimer()
    local runTimes = 0
    cj.TimerStart(timer, timeout, true, function ()
        if runTimes == times then
            cj.DestroyTimer(timer)
            timer = nil
        end
        handlerFunc()
        runTimes = runTimes + 1
    end)
end