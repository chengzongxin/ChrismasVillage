-- 抽奖
lotter_draw = function (unit)
    local dialog = cj.DialogCreate()
    cj.DialogSetMessage(dialog,"搏一搏，单车变摩托！")
    local btn1 = cj.DialogAddButton(dialog,"抽奖一次（需10杀敌数）Q",81)
    local btn10 = cj.DialogAddButton(dialog,"抽奖十次（需90杀敌数）W",88)
    cj.DialogDisplay(cj.GetOwningPlayer(unit),dialog,true)
    
    local trg1 = cj.CreateTrigger()
    cj.TriggerRegisterDialogButtonEvent(trg1,btn1)

    local trg1 = cj.CreateTrigger()
    cj.TriggerRegisterDialogButtonEvent(trg1,btn10)
end