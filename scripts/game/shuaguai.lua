

local boci = 1
shuaguai = {}


-- 计时器事件
local function timerEvent()
    for i=1,#regions do
        local r = regions[i]
        local x = cj.GetRectCenterX(r)
        local y = cj.GetRectCenterY(r)
        for i = 1, 5 do
            local u = cj.PlaceRandomUnit(AIPool, ENMIMY_PLAYER, x, y, 0)
        -- 设置单位属性 注意要先设置最大生命值，否则设置当前生命值超出了还是无法改变生命值
            local life = 20 + boci * 3
            local damage = 7 + boci * 1
            japi.SetUnitState(u, cj.UNIT_STATE_MAX_LIFE, life)
            japi.SetUnitState(u, cj.UNIT_STATE_LIFE, life)
            japi.SetUnitState(u, cj.ConvertUnitState(0x12), damage)
            cj.IssuePointOrder(u, "attack", 0, 0)
        end
        
    end
end 

-- 创建计时器窗口
local function showTimerDialog()
    local d = cj.CreateTimerDialog(shuaguai.timer)
    cj.TimerDialogSetTitle(d,"准备进攻")
    cj.TimerDialogDisplay(d,true)
    local show = cj.IsTimerDialogDisplayed(d)
    shuaguai.dialog = d
end

-- 创建计时器
local function createTimer()
    local timer = cj.CreateTimer()
    shuaguai.timer = timer
    cj.TimerStart(timer, 5, true, function ()
        if boci >10 then
            cj.DestroyTimer(timer)
            cj.DestroyTimerDialog(shuaguai.dialog)
            shuaguai.timer = nil
            shuaguai.dialog = nil
        end
        local tips = "共10波，第"..boci.."波"
        cj.TimerDialogSetTitle(shuaguai.dialog,tips)
        echo(tips)
        timerEvent()
        boci = boci + 1
    end)
end

SHUAGUAI = function()
    createTimer()
    showTimerDialog()
end