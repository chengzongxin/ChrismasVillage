Lerning_skill = function (unit,skillId)
    print("type of unit is : "..type(unit))
    local hero = PlayerGroup:GetPlayerHero(unit)
    local ringID = hero.ring
    if ringID then
        -- 存在需要先删除之前的光环
        cj.UnitRemoveAbility(unit,ringID)
    end

    local suc = cj.UnitAddAbility(unit,skillId)
    if suc then
        hero.ring = skillId -- 记录技能
        
        local skillName = JassSlk.ability[skillId].Name or ""
        
        local txt = hcolor.format("%s 学习了技能: %s", "ffffff", {
            { "80ff00", uname(unit) },
            { "ff59ff", skillName },
        })

        echo(txt)
    end
end