function create_select_unit()
    echo("|cffff0000请|r|cffdb2400选|r|cffb74800择|r|cff926d00你|r|cff6e9100的|r|cff49b600英|r|cff25da00雄|r|cff00ff00！|r",nil,30,0,0)
    for _, player in pairs(PlayerGroup) do
        -- 创建小精灵
        local id = str2id('e000.ewsp')
        local x = -300
        local y = 0
        local u = cj.CreateUnit(player,id, x, y, 0)
        -- cj.IssuePointOrder(u, "attack", 0, 0)
    end
end