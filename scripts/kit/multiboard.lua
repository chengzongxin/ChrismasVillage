
multiboard = {}

MULTIBOARD = function ()
    echo("多面板")
    -- multiboard
    local mb = cj.CreateMultiboard()
    multiboard.mb = mb

    local titles = {"玩家","杀敌","战力","金币","等级"}

    cj.MultiboardSetTitleText(mb,"Chirsmas Village")
    cj.MultiboardSetColumnCount(mb,#titles)
    cj.MultiboardSetRowCount(mb,#PlayerGroup+1)
    cj.MultiboardSetItemsStyle(mb,true,false)
    cj.MultiboardSetItemsValue(mb,"--")
    cj.MultiboardSetItemWidth(mb,15/140)
    cj.MultiboardSetItemsValueColor(mb,0,255,255,1)
    cj.MultiboardDisplay(mb,true)

    for i=1,#titles do
        -- 数组遍历索引从1开始，多面板是从{0,0}开始，需要统一协调
        local item = cj.MultiboardGetItem(mb, 0, i-1)
        cj.MultiboardSetItemValue(item, titles[i])
        cj.MultiboardSetItemValueColor(item,255,255,255,1)
    end
    
    CREATE_MULTIBOARD_TIMER()
end

CREATE_MULTIBOARD_TIMER = function ()
    local t = cj.CreateTimer()
    cj.TimerStart(t, 1.0, true ,function ()
        REFRESH_MULTIBOARD()
    end)
end


REFRESH_MULTIBOARD = function ()
    local mb = multiboard.mb
    for i = 1, #PlayerGroup do
        local p = PlayerGroup[i]
        -- name
        local item = cj.MultiboardGetItem(mb, i,0)
        cj.MultiboardSetItemValue(item, PLAYERS[p].name)
        -- kill
        local item = cj.MultiboardGetItem(mb, i,1)
        cj.MultiboardSetItemValue(item, string.format('%d',PLAYERS[p].kill))
    end
end

