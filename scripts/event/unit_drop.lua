local function drop_item_judge(unit,item)
    
    local item_id = cj.GetItemTypeId(item)
    local isins = isintable(item_id,SWORD_LIST_IDS)
    local isina = isintable(item_id,ARMOR_LIST_IDS)
    local isinr = isintable(item_id,RING_LIST_IDS)

    print("准备丢弃")
    if isins and PLAYERS.HERO(unit).sword == 1 then
        PLAYERS.HERO(unit).sword = 0
        ItemUserData:SetSystemDrop(item,0)
        print("丢弃了武器")
        return true
    end

    if isina and PLAYERS.HERO(unit).armor == 1 then
        PLAYERS.HERO(unit).armor = 0
        ItemUserData:SetSystemDrop(item,0)
        print("丢弃了盔甲")
        return true
    end

    if isinr and PLAYERS.HERO(unit).fingerring == 1 then
        PLAYERS.HERO(unit).fingerring = 0
        ItemUserData:SetSystemDrop(item,0)
        print("丢弃了戒指")
        return true
    end
    
    return false
end


ItemUserData = {
    [0] = {
        systemDrop = 0,
    }
}

function ItemUserData:isSystemDrop(item)
    if self[item].systemDrop == 1 then
        return true
    end
    return false
end

function ItemUserData:SetSystemDrop(item,flag)
    local tb = {systemDrop = flag}
    self[item] = tb
end

function ItemUserData:GetSystemDrop(item)
    local tb = self[item]
    if tb ~= nil then
        return tb.systemDrop
    end
    return 0
end

local function unit_drop()
    cevent.unit_drop(function ()
        local u = cj.GetTriggerUnit()
        local i = cj.GetManipulatedItem()

        -- 唯一性判断时，调用系统方法丢弃-----wrainng  有问题，。。。。后面修复
        if ItemUserData:GetSystemDrop(i) == 1 then
            print("system drop 不清理标记，直接返回")
            return
        end
        -- ItemUserData:SetSystemDrop(i,0)
        

        print(DrawGold(uname(u)).." drop "..cj.GetItemName(i))
        -- 物品被销毁需要清空 0，这里暂时不处理
        -- ItemUserData[i].systemDrop = 1
        -- 手动丢弃物品，重置装备标记，以免无法拾取
        drop_item_judge(u,i)
    end)
end

unit_drop()

-- function drop_item_reset(unit,item)
--     ItemUserData:SetSystemDrop(item)
-- end

function removeItem(item)
    cj.RemoveItem(item)
    ItemUserData[item].systemDrop = 0
    ItemUserData[item] = nil
end

