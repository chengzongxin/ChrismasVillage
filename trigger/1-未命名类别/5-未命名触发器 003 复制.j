function Trig____________________003_______uActions takes nothing returns nothing
    YDLocalInitialize()
    call SetUnitState(GetTriggerUnit(), UNIT_STATE_LIFE, 999.00)
    call SetUnitState(GetTriggerUnit(), ConvertUnitState(0x12), 888.00)
    call SetPlayerState(Player(4), PLAYER_STATE_GIVES_BOUNTY, 1)
    call YDLocal1Set(unit, "u", GetTriggerUnit())
    call YDLocal1Set(unit, "u", GetKillingUnitBJ())
    call YDLocal1Release()
endfunction

//===========================================================================
function InitTrig____________________003_______u takes nothing returns nothing
    set gg_trg____________________003_______u = CreateTrigger()
#ifdef DEBUG
    call YDWESaveTriggerName(gg_trg____________________003_______u, "未命名触发器 003 复制")
#endif
    call TriggerRegisterAnyUnitEventBJ(gg_trg____________________003_______u, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddAction(gg_trg____________________003_______u, function Trig____________________003_______uActions)
endfunction

