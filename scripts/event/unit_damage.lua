local function unit_damage()
    -- 会来很多次，需要注意
    cevent.unit_damage(function()
        local us = cj.GetEventDamageSource()
        local ut = cj.GetTriggerUnit()
        local dmg = cj.GetEventDamage()

        print(uname(us).." attck "..uname(ut).." damage = "..dmg)
        local x = cj.GetUnitX(ut)
        local y = cj.GetUnitY(ut)
        local str = DrawGold(tostring(dmg))
        print(str)
        TextTag(str, x, y, 50, 15)
    end)
end

unit_damage()