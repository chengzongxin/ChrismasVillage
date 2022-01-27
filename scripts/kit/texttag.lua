function texttag(text,x,y,height,size)
    local t = cj.CreateTextTag()
    cj.SetTextTagPos(t,x,y,height)
        cj.SetTextTagColor(t,255,255,255,255)
        cj.SetTextTagText(t,text,size * 0.023 / 10)
        cj.SetTextTagVisibility(t, true)
        time_wait(3,function ()
            cj.DestroyTextTag(t)
        end)
end