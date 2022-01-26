local function unit_damage()
    -- 会来很多次，需要注意
    cevent.unit_damage(function()
        local us = cj.GetEventDamageSource()
        local ut = cj.GetTriggerUnit()
        local dmg = cj.GetEventDamage()

        echo(uname(us).." attck "..uname(ut).." damage = "..dmg)
        local x = cj.GetUnitX(ut)
        local y = cj.GetUnitY(ut)
        local t = cj.CreateTextTag()
        cj.SetTextTagPos(t,x,y,0)
        cj.SetTextTagColor(t,255,255,0,255)
        cj.SetTextTagText(t,dmg,15)
        time_wait(3,function ()
            cj.DestroyTextTag(t)
        end)
    end)
end

unit_damage()