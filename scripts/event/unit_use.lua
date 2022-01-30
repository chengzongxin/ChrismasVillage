
local function unit_use()
        cevent.unit_use(function ()
            local u = cj.GetTriggerUnit()
            local i = cj.GetManipulatedItem()

            -- 判断使用了哪个技能物品
            local i_id = cj.GetItemTypeId(i)
            local skillid = SKILL_LIST_IDS_MAP[i_id]
            -- local isin, idx = isintable(i_id,SKILL_LIST_IDS_MAP) 
            print(skillid)
            if skillid then
                -- 学习技能
                Lerning_skill(u,skillid)
            end
            
    end)
end

unit_use()