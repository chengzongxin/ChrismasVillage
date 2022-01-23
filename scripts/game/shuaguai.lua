
local boci = 1
shuaguai = {}

local function init_AIPool()
    local aip = cj.CreateUnitPool()
    cj.UnitPoolAddUnitType(aip, str2id('n000:nska'), 1)
    cj.UnitPoolAddUnitType(aip, str2id('u000:uske'), 1)
    cj.UnitPoolAddUnitType(aip, str2id('u001:uskm'), 1)
    shuaguai.AIPool = aip
end

-- 计时器事件
local function timerEvent()
    for i=1,#regions do
        local r = regions[i]
        local x = cj.GetRectCenterX(r)
        local y = cj.GetRectCenterY(r)
        local u = cj.PlaceRandomUnit(shuaguai.AIPool, cj.Player(5), x, y, 0)
        cj.IssuePointOrder(u, "attack", 0, 0)
    end
end 

-- 创建计时器窗口
local function showTimerDialog()
    local d = cj.CreateTimerDialog(shuaguai.timer)
    cj.TimerDialogSetTitle(d,"第几波")
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
    init_AIPool()
    createTimer()
    showTimerDialog()
end