

local boci = 1
shuaguai = {}


-- 创建计时器窗口
local function showTimerDialog()
    local d = cj.CreateTimerDialog(shuaguai.timer)
    cj.TimerDialogSetTitle(d,"第1波攻击即将到来")
    cj.TimerDialogDisplay(d,true)
    local show = cj.IsTimerDialogDisplayed(d)
    shuaguai.dialog = d
end

-- 单次刷兵事件
local function one_wave()
    for i=1,#regions do
        local r = regions[i]
        local x = cj.GetRectCenterX(r)
        local y = cj.GetRectCenterY(r)
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

local function shuaguai_One_Wave()
    -- 单次刷兵,刷20次
    Timer_times(0.5,20,one_wave)
end

-- 创建计时器
local function createGlobalTimer()
    local timer = cj.CreateTimer()
    shuaguai.timer = timer
    cj.TimerStart(timer, 60, true, function ()
        if boci == 25 then
            cj.DestroyTimer(timer)
            cj.DestroyTimerDialog(shuaguai.dialog)
            shuaguai.timer = nil
            shuaguai.dialog = nil
        end
        shuaguai_One_Wave()
        boci = boci + 1
        local tips = "第"..boci.."波攻击即将到来"
        cj.TimerDialogSetTitle(shuaguai.dialog,tips)
        echo(tips)
    end)
end

SHUAGUAI = function()
    createGlobalTimer()
    showTimerDialog()
end