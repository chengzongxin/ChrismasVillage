//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig____________________002Actions takes nothing returns nothing
    YDLocalInitialize()
    if ((GetPlayerController(Player(0)) == MAP_CONTROL_USER)) then
        call DoNothing()
    else
        call DoNothing()
    endif
    if ((GetPlayerSlotState(Player(0)) == PLAYER_SLOT_STATE_PLAYING)) then
        call DoNothing()
    else
        call DoNothing()
    endif
    call PanCameraToTimedLocForPlayer(Player(0), YDLocal1Get(location, "p"), 0)
    call YDLocal1Set(abilcode, "skill", GetSpellAbilityId())
    call YDLocal1Set(abilcode, "skill", GetSpellAbilityId())
    YDTrigger Error: _______±偿_°p_±(`э:player)￡_μ_____μ____μ____±偿_°p_±(`э:location)_￡
    call YDLocal1Set(player, "p", GetOwningPlayer(GetTriggerUnit()))
    call RemoveUnit(GetTriggerUnit())
    call YDLocal1Release()
endfunction

//===========================================================================
function InitTrig____________________002 takes nothing returns nothing
    set gg_trg____________________002 = CreateTrigger()
#ifdef DEBUG
    call YDWESaveTriggerName(gg_trg____________________002, "未命名触发器 002")
#endif
    call TriggerRegisterAnyUnitEventBJ(gg_trg____________________002, EVENT_PLAYER_UNIT_SPELL_CAST)
    call TriggerAddAction(gg_trg____________________002, function Trig____________________002Actions)
endfunction

