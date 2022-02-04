cevent = {}


yd_DamageEventTrigger = nil
DamageEventQueue = {}
DamageEventFuncQueue = {}
DamageEventNumber = 0

local function registerAllPlayerUnitEvent(event,callFun)
    local trg = cj.CreateTrigger()
    for i = 0, MAX_PLAYER_QTY - 1 do
        cj.TriggerRegisterPlayerUnitEvent(trg, cj.Player(i), event, nil)
    end
    cj.TriggerAddAction(trg,callFun)
end

--- 开始释放技能 （施法） cevent.spell_effect(whichUnit,function () --body ... end)
---@alias onSpellCast
---@param whichUnit userdata
---@param callFunc onSpellCast
---@return any
cevent.spell_cast = function(whichUnit,callFun)
    local trg = cj.CreateTrigger()
    local p = cj.GetOwningPlayer(whichUnit)
    cj.TriggerRegisterUnitEvent(trg, whichUnit, cj.EVENT_UNIT_SPELL_CAST)
    cj.TriggerAddAction(trg,callFun)
end


--- 开始释放技能 （施法） cevent.spell_effect(whichUnit,function () --body ... end)
---@alias onSpellEffect
---@param whichUnit userdata
---@param callFunc onSpellEffect
---@return any
cevent.spell_effect = function(whichUnit,callFun)
    local trg = cj.CreateTrigger()
    local p = cj.GetOwningPlayer(whichUnit)
    cj.TriggerRegisterUnitEvent(trg, whichUnit, cj.EVENT_UNIT_SPELL_EFFECT)
    cj.TriggerAddAction(trg,callFun)
end

--- 单位死亡
---@alias onUnitdDeath
---@param callFunc onUnitdDeath
---@return any
cevent.unit_death = function(callFun)
    registerAllPlayerUnitEvent(cj.EVENT_PLAYER_UNIT_DEATH,callFun)
end

--- 单位获得物品
---@alias onUnitdPickup
---@param callFunc onUnitdPickup
---@return any
cevent.unit_pickup = function(callFun)
    registerAllPlayerUnitEvent(cj.EVENT_PLAYER_UNIT_PICKUP_ITEM,callFun)
end

--- 单位使用物品
---@alias onUnitUse
---@param callFunc onUnitUse
---@return any
cevent.unit_use = function(callFun)
    registerAllPlayerUnitEvent(cj.EVENT_PLAYER_UNIT_USE_ITEM,callFun)
end

--- 单位卖出物品 注意贩卖单位需要设为中立被动，如果在同一阵营，会导致GetBuyingUnit获取不到unit
---@alias onUnitSell
---@param callFunc onUnitSell
---@return any
cevent.unit_sell = function(callFun)
    registerAllPlayerUnitEvent(cj.EVENT_PLAYER_UNIT_SELL,callFun)
end
--- 单位丢弃物品
---@alias onUnitDrop
---@param callFunc onUnitDrop
---@return any
cevent.unit_drop = function(callFun)
    registerAllPlayerUnitEvent(cj.EVENT_PLAYER_UNIT_DROP_ITEM,callFun)
end
--- 单位伤害
---@alias onUnitdDamage
---@param callFunc onUnitdDamage
---@return any
cevent.unit_damage = function(callFun)
    print("damage3")
    if DamageEventNumber == 0 then
        yd_DamageEventTrigger = cj.CreateTrigger()
        cj.TriggerAddAction(yd_DamageEventTrigger, YDWEAnyUnitDamagedTriggerAction) 
        YDWEAnyUnitDamagedEnumUnit()
        print("damage4")
    end
    DamageEventQueue[DamageEventNumber] = callFun
    DamageEventFuncQueue[DamageEventNumber] = callFun
    DamageEventNumber = DamageEventNumber + 1
end


function YDWEAnyUnitDamagedEnumUnit()
    local t = cj.CreateTrigger()
    local r = cj.CreateRegion()
    -- local g = cj.CreateGroup()
    print("damage8")
    InitMapUnit_damageEvent() -- 添加初始单位伤害事件
    -- 添加进入区域事件
    cj.RegionAddRect(r, cj.GetWorldBounds())
    print(cj.GetRectMaxY(cj.GetWorldBounds()))
    cj.TriggerRegisterEnterRegion(t, r, YDWEAnyUnitDamagedFilter())
    cj.TriggerAddAction(t,YDWEAnyUnitDamagedFilter)
    -- cj.GroupEnumUnitsInRect(g, cj.GetWorldBounds(), YDWEAnyUnitDamagedFilter())
    -- cj.DestroyGroup(g)
end

-- 添加初始伤害事件
function InitMapUnit_damageEvent()
    local pg = GetUnitsInRectAll(cj.GetWorldBounds())
    cj.ForGroup(pg,function ()
        local u = cj.GetEnumUnit()
        if u ~= nil and cj.GetUnitAbilityLevel(u, 'Aloc') <= 0 then
            cj.TriggerRegisterUnitEvent(yd_DamageEventTrigger, u, cj.EVENT_UNIT_DAMAGED)
        end
    end)
end

function GetUnitsInRectAll(r)
    return GetUnitsInRectMatching(r, nil)
end

function GetUnitsInRectMatching(r,filter)
    local g = cj.CreateGroup()
    cj.GroupEnumUnitsInRect(g, r, filter)
    cj.DestroyBoolExpr(filter)
    -- cj.DestroyGroup(g)
    return g
end

function YDWEAnyUnitDamagedFilter()
    local u = cj.GetTriggerUnit()
    -- local uf = cj.GetFilterUnit()
    -- local ue = cj.GetEnumUnit()
    -- print(u,uname(u),"GetTriggerUnit enter map will register damage event???")
    -- print(uf,uname(uf),"GetFilterUnit enter map will register damage event???")
    -- print(ue,uname(ue),"GetEnumUnit enter map will register damage event???")
    if u ~= nil and cj.GetUnitAbilityLevel(u, 'Aloc') <= 0 then
        cj.TriggerRegisterUnitEvent(yd_DamageEventTrigger, u, cj.EVENT_UNIT_DAMAGED)
    end
    return false
end


function YDWEAnyUnitDamagedTriggerAction()
    for i = 0, DamageEventNumber-1 do
        DamageEventFuncQueue[i]()
    end
end