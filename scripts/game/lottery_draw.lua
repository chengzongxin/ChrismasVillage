-- 抽奖
lotter_draw = function (unit)
    Dialog.create(
        cj.GetOwningPlayer(unit),
        "|cff00ff00搏一搏，单车变摩托！|r",
        {"|cffff9900抽奖一次（|r|cff00ffffQ|r|cffff9900）（需10杀敌数）|r","Q"},
        {"|cffff9900抽奖十次（|r|cff00ffffW|r|cffff9900）（需90杀敌数）|r","W"},
        function (idx)
            if idx == 1 then
                lottery_action(unit,10)
                echo(hcolor.format("抽奖 %s 次", "00FF7F", {
                    { "ffff00", 1 },
                }))
            else
                lottery_action(unit,90)
                echo(hcolor.format("抽奖 %s 次", "00FF7F", {
                    { "ffff00", 10 },
                }))
            end
        end)
end

function lottery_action(unit, needKill)
    local player = PlayerGroup:Get(unit)
    local killcount = player.kill
    if killcount < needKill then
        echo("杀敌数不足！",player.id)
        return
    end

    local times = 1
    if needKill == 90 then
        times = 10
    end

    for i = 1, times do
        -- 开始抽奖
        lottery_one(unit)
    end

    -- 减去已消耗杀敌数
    player.kill = player.kill - needKill
end

function lottery_one(u)
    local item = cj.PlaceRandomItem(LotteryPool,cj.GetUnitX(u),cj.GetUnitY(u))
    if cj.GetItemTypeId(item) == JIEJIN_ID then
        -- 结晶自动捡取
        cj.UnitAddItem(u,item)
    end
end