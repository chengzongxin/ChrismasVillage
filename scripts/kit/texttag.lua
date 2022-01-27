function TextTag(text,x,y,height,size)
    local t = cj.CreateTextTag()
    cj.SetTextTagPos(t,x,y,height)
    cj.SetTextTagColor(t,255,255,255,255)
    cj.SetTextTagText(t,text,size * 0.023 / 10)
    cj.SetTextTagVisibility(t, true)
    local xv = random(-0.6, 0.6)
    local yv = (1 - xv^2)^0.5
    cj.SetTextTagVelocity(t,xv,yv)
    time_wait(3,function ()
        cj.DestroyTextTag(t)
    end)
    return t
end