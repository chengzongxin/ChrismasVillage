cevent = {}

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
