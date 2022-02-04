
multiboard = {}

MULTIBOARD = function ()
    -- multiboard
    local mb = cj.CreateMultiboard()
    multiboard.mb = mb

    local titles = {"玩家","杀敌","战力"}
    local icons = {
        "ReplaceableTextures\\CommandButtonsDisabled\\DISicon_pas_Holy_HolyGuidance.blp",
        "ReplaceableTextures\\CommandButtonsDisabled\\DISicon_pas_Holy_WeaponMastery.blp",
        "ReplaceableTextures\\CommandButtonsDisabled\\DISicon_pas_Holy_AvengersShield.blp"
    }

    local playerIcons = {
        "ReplaceableTextures\\PassiveButtons\\PASBTNElunesBlessing.blp",
        "ReplaceableTextures\\CommandButtons\\BTNDaggerOfEscape.blp",
        "ReplaceableTextures\\CommandButtons\\BTNSpiritWalkerMasterTraining.blp"
    }

    cj.MultiboardSetTitleText(mb,"Chirsmas Village")
    cj.MultiboardSetColumnCount(mb,#titles)
    cj.MultiboardSetRowCount(mb,PlayerGroup.count+1)
    cj.MultiboardSetItemsStyle(mb,true,true) -- 显示文字，图标
    cj.MultiboardSetItemsValue(mb,"--")
    cj.MultiboardSetItemsWidth(mb,0.05) -- 占屏幕宽度 5%
    cj.MultiboardSetItemsValueColor(mb,0,255,255,1)
    cj.MultiboardDisplay(mb,true)

    for i = 0, PlayerGroup.count do
        -- 设置第一行图标文字，多面板是从{0,0}开始
        for j = 0, #titles - 1 do
            local item = cj.MultiboardGetItem(mb, i, j)
            if i == 0 then
                -- 设置第一行标题
                cj.MultiboardSetItemValue(item, titles[j+1])
                cj.MultiboardSetItemValueColor(item,255,255,0,1)
                cj.MultiboardSetItemIcon(item,icons[j+1])
            else
                -- 设置玩家图标
                cj.MultiboardSetItemIcon(item,playerIcons[j+1])
            end
        end
    end

    CREATE_MULTIBOARD_TIMER()
end

CREATE_MULTIBOARD_TIMER = function ()
    local t = cj.CreateTimer()
    cj.TimerStart(t, 1.0, true ,function ()
        REFRESH_MULTIBOARD()
    end)
end


REFRESH_MULTIBOARD = function ()
    local mb = multiboard.mb
    local pg = PlayerGroup:playerList()
    for i = 1, #pg do
        local p = pg[i]
        -- name
        local item = cj.MultiboardGetItem(mb, i,0)
        cj.MultiboardSetItemValue(item, p.hero.name)
        -- kill
        local item = cj.MultiboardGetItem(mb, i,1)
        cj.MultiboardSetItemValue(item, string.format('%d',p.kill))
    end
end

