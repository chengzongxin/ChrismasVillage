require 'game.lottery_draw'


local function unit_sell()
    cevent.unit_sell(function ()
        local us = cj.GetSoldUnit() -- 抽奖互动unit
        local ub = cj.GetBuyingUnit() -- 小兵、牛头... 买佣兵的unit 如果售卖的NPC单位不是中立被动，则获取不到
        local usl = cj.GetSellingUnit() -- 圣诞老人unit
        local ut = cj.GetTriggerUnit() -- 圣诞老人unit

        if cj.GetUnitTypeId(us) == str2id('e003.ewsp') then
            -- 买了抽奖互动
            print(uname(us).."GetUnitTypeId : "..cj.GetUnitTypeId(us))
            cj.RemoveItem(us)
            lotter_draw(ub)
        end
    end)
end

unit_sell()