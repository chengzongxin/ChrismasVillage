local function unit_death()
    cevent.unit_death(function ()
        local du = cj.GetTriggerUnit()
        local ku = cj.GetKillingUnit()
        local p = cj.GetOwningPlayer(ku)

        if cj.IsUnitEnemy(du, HOST_PLAYER) then
            -- 计分
            PLAYERS[p].kill = PLAYERS[p].kill + 1
            -- 引用掉落池,50%几率
            if math.random(100) > 50 then
                local item = cj.PlaceRandomItem(ItemPool,cj.GetUnitX(du),cj.GetUnitY(du))
                if cj.GetItemTypeId(item) == JIEJIN_ID then
                    -- 结晶自动捡取
                    cj.UnitAddItem(ku,item)
                end
            end
        elseif cj.IsUnitAlly(du, HOST_PLAYER) then
            -- 复活英雄
            local td = nil
            local t = time_wait(5, function ()
                cj.ReviveHero(du, 0, 0, true)
                destroy_timer_Dialog(td)
            end)
            td = create_timer_Dialog(t,cj.GetUnitName(du).."复活中...")
        elseif cj.IsUnitEnemy(du, HOST_PLAYER) then
            -- 基地被摧毁，任务失败
            -- CustomDefeatBJ bj 函数
            cj.RemovePlayer(p , cj.PLAYER_GAME_RESULT_DEFEAT)
        end
        
    end)
end

unit_death()