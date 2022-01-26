local function unit_damage()
    -- 会来很多次，需要注意
    cevent.unit_damage(function()
        local us = cj.GetEventDamageSource()
        local ut = cj.GetTriggerUnit()
        local dmg = cj.GetEventDamage()

        echo(uname(us).." attck "..uname(ut).." damage = "..dmg)
    end)
end

unit_damage()