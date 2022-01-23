function Trig____________________003_______uActions takes nothing returns nothing
    call SetUnitState(GetTriggerUnit(), UNIT_STATE_LIFE, 999.00)
    call SetUnitState(GetTriggerUnit(), ConvertUnitState(0x12), 888.00)
endfunction

//===========================================================================
function InitTrig____________________003_______u takes nothing returns nothing
    set gg_trg____________________003_______u = CreateTrigger()
#ifdef DEBUG
    call YDWESaveTriggerName(gg_trg____________________003_______u, "未命名触发器 003 复制")
#endif
    call TriggerAddAction(gg_trg____________________003_______u, function Trig____________________003_______uActions)
endfunction

