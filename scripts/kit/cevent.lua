cevent = {}


yd_DamageEventTrigger = nil
DamageEventQueue = {}
DamageEventFuncQueue = {}
DamageEventNumber = 0

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
    local trg = cj.CreateTrigger()
    for i = 0, MAX_PLAYER_QTY - 1 do
        cj.TriggerRegisterPlayerUnitEvent(trg, cj.Player(i), cj.EVENT_PLAYER_UNIT_DEATH, nil)
    end
    cj.TriggerAddAction(trg,callFun)
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
    local g = cj.CreateGroup()
    print("damage8")
    cj.RegionAddRect(r, cj.GetWorldBounds())
    print(cj.GetRectMaxY(cj.GetWorldBounds()))
    cj.TriggerRegisterEnterRegion(t, r, YDWEAnyUnitDamagedFilter())
    cj.TriggerAddAction(t,YDWEAnyUnitDamagedFilter)
    cj.GroupEnumUnitsInRect(g, cj.GetWorldBounds(), YDWEAnyUnitDamagedFilter())
    cj.DestroyGroup(g)
end

function YDWEAnyUnitDamagedFilter()
    local u = cj.GetTriggerUnit()
    print(cj.GetUnitName(u) or "nil unit ...".."enter map will register damage event???")
    if u ~= nil and cj.GetUnitAbilityLevel(u, 'Aloc') <= 0 then
        print(cj.GetUnitName(u) or "nil unit ...".."enter map did register damage event!!!!")
        cj.TriggerRegisterUnitEvent(yd_DamageEventTrigger, u, cj.EVENT_UNIT_DAMAGED)
    end
    return false
end


function YDWEAnyUnitDamagedTriggerAction()
    print(DamageEventNumber.."damage event did trigger!!!")
    local i = 0
    while i >= DamageEventNumber do
        --if DamageEventQueue[i] ~= nil and cj.IsTriggerEnabled(DamageEventQueue[i]) and cj.TriggerEvaluate(DamageEventQueue[i]) then
            print(DamageEventFuncQueue[i])
        if DamageEventFuncQueue[i] ~= nil then
            -- cj.TriggerExecute(DamageEventQueue[i])
            DamageEventFuncQueue[i]()
        end
        i = i + 1
    end
end