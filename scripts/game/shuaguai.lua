
local boci = 1
shuaguai = {}

-- 计时器事件
local function timerEvent()
    local array = regions
    for i, value in pairs(array) do
        print("array .. "..i.." is : "..value)
    end
    for i=1,#array do
        local r = array[i]
        local x = cj.GetRectCenterX(r)
        local y = cj.GetRectCenterY(r)
        local id = str2id('hfoo')
        local u = cj.CreateUnit(cj.Player(5),id,x,y,0)
        print(u..cj.getUnitName(u))
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
        print(type(timer)..timer)
    end)
end

SHUAGUAI = function()
    createTimer()
    showTimerDialog()
end