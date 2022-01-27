local function unit_damage()
    -- 会来很多次，需要注意
    cevent.unit_damage(function()
        local us = cj.GetEventDamageSource()
        local ut = cj.GetTriggerUnit()
        local dmg = cj.GetEventDamage()

        -- print(uname(us).." attck "..uname(ut).." damage = "..dmg)
        local x = cj.GetUnitX(ut)
        local y = cj.GetUnitY(ut)
        local str = nil

        -- 判断是否暴击
        if cj.IsUnitAlly(us, HOST_PLAYER) then
            local crt = PLAYERS.HERO(us).critical
            local crtp = PLAYERS.HERO(us).criticalpower
            local binggo = math.random(10)/10.0 < crt/100.0
            if binggo then
                dmg = dmg*crtp
                print(dmg)
                -- YDWESetEventDamage 会报错，需要找JAPI
                japi.YDWESetEventDamage(dmg)
                local dmgStr = tostring(math.floor(dmg))
                str = DrawGold(string.format("暴击 %s!",dmgStr))
                echo(str)
            else
                str = DrawPink(tostring(math.floor(dmg)))
            end
        end

        TextTag(str, x, y, 50, 15)
    end)
end

unit_damage()