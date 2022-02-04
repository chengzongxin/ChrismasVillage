local function unique_item_judge(unit,item)
    
    local item_id = cj.GetItemTypeId(item)
    local isins = isintable(item_id,SWORD_LIST_IDS)
    local isina = isintable(item_id,ARMOR_LIST_IDS)
    local isinr = isintable(item_id,RING_LIST_IDS)

    print("========================")
    print(item_id)
    local hero = PlayerGroup:GetPlayerHero(unit)
    if isins and hero.sword == 1 then
        
        ItemUserData:SetSystemDrop(item,1)
        cj.SetItemPosition(item,cj.GetUnitX(unit),cj.GetUnitY(unit))
        return true
    end

    if isina and hero.armor == 1 then
        
        ItemUserData:SetSystemDrop(item,1)
        cj.SetItemPosition(item,cj.GetUnitX(unit),cj.GetUnitY(unit))
        return true
    end

    if isinr and hero.fingerring == 1 then
        
        ItemUserData:SetSystemDrop(item,1)
        cj.SetItemPosition(item,cj.GetUnitX(unit),cj.GetUnitY(unit))
        return true
    end
    
    return false
end


local function unit_pickup()
    cevent.unit_pickup(function ()
        local unit = cj.GetTriggerUnit()
        local item = cj.GetManipulatedItem()

        print(DrawGold(uname(unit)).." pick up "..cj.GetItemName(item))
        -- 唯一性判断
        if unique_item_judge(unit,item) then
            -- 系统丢弃，设置标记，以免引起丢弃物品回调
            return
        end

        -- 物品叠加
        local item_id = cj.GetItemTypeId(item)
        
        if item_id == JIEJIN_ID then
            -- 获得结晶
            for i = 0, 5 do
                local it = cj.UnitItemInSlot(unit,i)
                local it_id = cj.GetItemTypeId(it)
                -- 获取的和背包的当前遍历的不是一个物品，并且是结晶，则叠加物品
                if  it ~= item and it_id == JIEJIN_ID then
                    cj.SetItemCharges(it,cj.GetItemCharges(it)+1)
                    cj.RemoveItem(item)
                    item = it
                end
            end
        end

        synthetic_item(unit,item)
    end)
end



unit_pickup()