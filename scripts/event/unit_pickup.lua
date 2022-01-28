
local function unit_pickup()
    cevent.unit_pickup(function ()
        local unit = cj.GetTriggerUnit()
        local item = cj.GetManipulatedItem()
        echo(DrawGold(uname(unit)).." pick up "..cj.GetItemName(item))
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
        else
            -- body
        end
        
        synthetic_item(unit,item)
    end)
end

unit_pickup()