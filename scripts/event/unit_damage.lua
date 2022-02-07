local function unit_damage()
    -- 会来很多次，需要注意
    cevent.unit_damage(function()
        local us = cj.GetEventDamageSource()
        local ut = cj.GetTriggerUnit()
        local dmg = cj.GetEventDamage()

        -- -- cj.DisplayTextToPlayer( cj.Player(0), 0, 0, "TRIGSTR_023" )
        -- cj.DisplayTextToPlayer( cj.Player(0), 0, 0, ( "|cff00FF00点（location）|r: "..cj.GetLocalizedHotkey("yd_leak_monitor::location")) ) 
        -- cj.DisplayTextToPlayer( cj.Player(0), 0, 0, ( "|cff00FF00特效（effect）|r: "..cj.GetLocalizedHotkey("yd_leak_monitor::effect")) ) 
        -- cj.DisplayTextToPlayer( cj.Player(0), 0, 0, ( "|cff00FF00单位组（group）|r: "..cj.GetLocalizedHotkey("yd_leak_monitor::group")) ) 
        -- cj.DisplayTextToPlayer( cj.Player(0), 0, 0, ( "|cff00FF00不规则区域（region）|r: "..cj.GetLocalizedHotkey("yd_leak_monitor::region")) ) 
        -- cj.DisplayTextToPlayer( cj.Player(0), 0, 0, ( "|cff00FF00矩形区域（rect）|r: "..cj.GetLocalizedHotkey("yd_leak_monitor::rect")) ) 
        -- cj.DisplayTextToPlayer( cj.Player(0), 0, 0, ( "|cff00FF00玩家组（force）|r: "..cj.GetLocalizedHotkey("yd_leak_monitor::force")) ) 
        -- -- cj.DisplayTextToPlayer( cj.Player(0), 0, 0, "TRIGSTR_024" )
        -- cj.GetLocalizedHotkey("yd_leak_monitor::create_report")
        -- print(uname(us).." attck "..uname(ut).." damage = "..dmg)
        local x = cj.GetUnitX(ut)
        local y = cj.GetUnitY(ut)
        local str = nil

        -- 判断是否暴击
        if cj.IsUnitAlly(us, HOST_PLAYER) then
            local crt = PlayerGroup:GetPlayerHero(us).critical
            local crtp = PlayerGroup:GetPlayerHero(us).criticalpower
            local binggo = math.random(10)/10.0 < crt/100.0
            if binggo then
                dmg = dmg*crtp
                -- YDWESetEventDamage 会报错，需要找JAPI，一般在YDWE/jass/japi文件里找EX前缀同名API
                JassJapi.EXSetEventDamage(dmg)
                local dmgStr = tostring(math.floor(dmg))
                str = DrawGold(string.format("暴击 %s!",dmgStr))
            else
                str = DrawPink(tostring(math.floor(dmg)))
            end
        else
            str = DrawPink(tostring(math.floor(dmg)))
        end

        local yadianna = Unit.new(ut)
        -- for key, value in pairs(yadianna) do
        --     print(key,value)
        -- end
        -- print(yadianna.name)
        
        if yadianna.name == "守护雅典娜" then
            local percent = string.format( "%.0f", yadianna:hp() / yadianna:maxhp() * 100)
            local warningStr = "|cffc0c0c0*** |r|cffff0000圣|r|cffff1c00诞|r|cffff3800树|r|cffff5500正|r|cffff7100在|r|cffff8d00遭|r|cffffaa00受|r|cffffc600攻|r|cffffe200击|r|cffffff00！|r|cffc0c0c0当前|r|cff00ff00生命值|r|cffc0c0c0为|r|cffffff00 "..percent.."|r|cffc0c0c0 % ***|r"
            echo(warningStr)
        end

        TextTag(str, x, y, 50, 15)
    end)
end

unit_damage()