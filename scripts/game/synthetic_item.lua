-- cj.CreateItem(str2id('I002:asbl'),-200,-200) -剑
-- cj.CreateItem(str2id('I003:blba'),-200,-200) -甲
-- cj.CreateItem(str2id('I00A:lnrn'),-200,-200) -戒
-- cj.CreateItem(str2id('I008:engs'),-300,-300) -结晶

-- SYNTHETIC_SWORD = {
--     ["剑2"]	= {
--         ["剑1"] = 1,
--         ["剑石"] = 1,
--         ["结晶"] = 5,
--         },
--     ["剑3"]	= {
--         ["剑1"] = 1,
--         ["剑石"] = 1,
--         ["结晶"] = 5,
--         },
--     ["剑4"]	= {
--         ["剑1"] = 1,
--         ["剑石"] = 1,
--         ["结晶"] = 5,
--         },
-- }



function synthetic_item(unit,item,iteral)
    local item_id = cj.GetItemTypeId(item)
    local isins, idxs = isintable(item_id,SWORD_LIST_IDS)
    local isina, idxa = isintable(item_id,ARMOR_LIST_IDS)
    local isinr, idxr = isintable(item_id,RING_LIST_IDS)
    local isjiejin = item_id == JIEJIN_ID
    -- print("isintable : "..isins or "0".." idx is ： "..idxs or "0")
    -- print("isintable : "..isina or "0".." idx is ： "..idxa or "0")
    -- print("isintable : "..isinr or "0".." idx is ： "..idxr or "0")
    print(isins)
    print(isina)
    print(isinr)
    -- 获得了装备
    local herov = PlayerGroup:GetPlayerHero(unit)
    if isins then
        herov.sword = 1
        synthetic_sword(item,idxs)
    elseif isina then
        herov.armor = 1
        synthetic_armor(item,idxa)
    elseif isinr then
        herov.fingerring = 1
        synthetic_ring(item,idxr)
    else
        -- 迭代器,拾取到结晶后,再回调开始合成方法
        if iteral == nil then
            for i = 0, 5 do
                local it = cj.UnitItemInSlot(unit,i)
                synthetic_item(unit,it,true)
            end
        end
    end
end

function synthetic_sword(item,idx)
    if idx == 4 then
        return
    end

    synthetic_item_need_items(idx*5,item,SWORD_LIST_IDS[idx+1])

end

function synthetic_armor(item,idx)
    if idx == 4 then
        return
    end

    synthetic_item_need_items(idx*5,item,ARMOR_LIST_IDS[idx+1])
end

function synthetic_ring(item,idx)
    if idx == 4 then
        return
    end

    synthetic_item_need_items(idx*5,item,RING_LIST_IDS[idx+1])
end


function synthetic_item_need_items(jiejinNeedcount,currentItem,nextItemID)
    local currentCount = 0
    -- 获取结晶数量
    local unit = cj.GetTriggerUnit()
    local jiejinItem = nil
    for i = 0, 5 do
        local it = cj.UnitItemInSlot(unit,i)
        local it_id = cj.GetItemTypeId(it)
        -- 获取的和背包的当前遍历的不是一个物品，并且是结晶，则叠加物品
        if it_id == JIEJIN_ID then
            jiejinItem = it
        end
    end

    if jiejinItem ~= nil then
        currentCount = cj.GetItemCharges(jiejinItem)
    end

    if currentCount < jiejinNeedcount then
        return
    end

    -- 可以合成
    cj.RemoveItem(currentItem)
    if currentCount == jiejinNeedcount then
        cj.RemoveItem(jiejinItem)
    else
        cj.SetItemCharges(jiejinItem,currentCount - jiejinNeedcount)
    end
    local nextItem = cj.CreateItem(nextItemID,0,0)
    cj.UnitAddItem(unit,nextItem)
    
    local str = DrawGold("恭喜")..DrawSkyBlue(uname(unit))..DrawGold("，合成成功！")
    echo(str)
end

function isintable(value,tb)
    for k,v in pairs(tb) do
        print(value.." compare "..v)
        if v == value then
            return true,k
        end
    end
    return false, 0    --重点：全部跑完以后，如果非true，则返回false
end