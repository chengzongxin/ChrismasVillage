
local function create_select_unit()
    echo("|cffff0000请|r|cffdb2400选|r|cffb74800择|r|cff926d00你|r|cff6e9100的|r|cff49b600英|r|cff25da00雄|r|cff00ff00！|r",nil,30,0,0)
    for _, player in pairs(PlayerGroup) do
        -- 创建小精灵
        local id = str2id('e000.ewsp')
        local x = -300
        local y = 0
        local u = cj.CreateUnit(player,id, x, y, 0)
        -- 平移镜头
        cj.PanCameraToTimed(cj.GetUnitX(u), cj.GetUnitY(u), 0)
        select_unit(u,player)
        return u
    end
end


local function spell_skill_catch(whichUnit)
    cevent.spell_effect(whichUnit,function ()
        local abi_id = cj.GetSpellAbilityId()
        local u = cj.GetTriggerUnit()
        local p = cj.GetOwningPlayer(u)
        local x = cj.GetUnitX(u)
        local y = cj.GetUnitY(u)
        local hero = nil
        if abi_id == str2id('A005:ANcl') then
            echo("选择步兵")
            hero = cj.CreateUnit(p,str2id('H003:Hpal'),x,y,0)
        end
        if abi_id == str2id('A007:ANcl') then
            echo("选择弓箭手")
            hero = cj.CreateUnit(p,str2id('H004:Hpal'),x,y,0)
        end
        if abi_id == str2id('A006:ANcl') then
            echo("选择火枪手")
            hero = cj.CreateUnit(p,str2id('H002:Hpal'),x,y,0)
        end
        if abi_id == str2id('A003:ANcl') then
            echo("选择牛头人")
            hero = cj.CreateUnit(p,str2id('H000:Hpal'),x,y,0)
        end

        cj.RemoveUnit(u)
        select_unit(hero,p)
        -- 添加復活之焰特效
        local effect = cj.AddSpecialEffectTarget("Abilities\\Spells\\Demon\\ReviveDemon\\ReviveDemon.mdl",hero,"overhead")
        cj.DestroyEffect(effect)
    end)
end


SELECT_HERO = function()
    print "SELECT_HERO method invoke!"
    local u = create_select_unit()
    spell_skill_catch(u)
end