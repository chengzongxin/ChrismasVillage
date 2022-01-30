function TextTag(text,x,y,height,size)
    local t = cj.CreateTextTag()
    cj.SetTextTagPos(t,x,y,height)
    cj.SetTextTagColor(t,255,255,255,255)
    cj.SetTextTagText(t,text,TextTagSize(size))
    cj.SetTextTagVisibility(t, true)
    local xv = math.random(5) / 10.0
    local yv = (1 - xv^2)^0.5
    cj.SetTextTagVelocity(t,xv*0.2,yv*0.2)
    local times = 0
    local timer = cj.CreateTimer()
    cj.TimerStart(timer, 0.03, true, function ()
        cj.SetTextTagText(t,text,TextTagSize(size+10-times))
        -- 1秒后销毁
        times = times + 1
        if times > 33 then
            cj.DestroyTimer(timer)
            cj.DestroyTextTag(t)
        end

    end)

    return t
end

function TextTagSize(size)
    return size * 0.023 / 10
end