local function unit_damage()
    -- 会来很多次，需要注意
    cevent.unit_damage(function()
        local us = cj.GetEventDamageSource()
        local ut = cj.GetTriggerUnit()
        local dmg = cj.GetEventDamage()

        print(uname(us).." attck "..uname(ut).." damage = "..dmg)
        local x = cj.GetUnitX(ut)
        local y = cj.GetUnitY(ut)
        local t = cj.CreateTextTag()
        print("t : "..t.."xy:"..x..y)
        cj.SetTextTagPos(t,x,y,50)
        cj.SetTextTagColor(t,255,255,255,255)
        cj.SetTextTagText(t,dmg,15 * 0.023 / 10)
        cj.SetTextTagVisibility(t, true)
        time_wait(3,function ()
            cj.DestroyTextTag(t)
        end)
    end)
end

unit_damage()