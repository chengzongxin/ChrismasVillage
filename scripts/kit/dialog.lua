-- 对话框选择   

--[[
    固定格式 eg:
    Dialog(whichPlayer,"|cff00ff00搏一搏，单车变摩托！|r",{btn1,88},"btn2","btn3","btn4",func)
]]

---@param ... 若干个参数
function Dialog(...)
    local arg = {...}    --> arg 为一个表，局部变量,下标从1开始
    for i,v in ipairs(arg) do
        print(i,v)
    end
    print("总共传入 " .. #arg .. " 个数") --> #arg = 6

    -- 参数采集
    local player = arg[1]
    local title = arg[2]
    local callFunc = arg[#arg]

    -- 创建对话框
    local dialog = cj.DialogCreate()
    -- 设置标题
    cj.DialogSetMessage(dialog,title)
    for i = 3, #arg - 1 do
        local para = arg[i]
        local btn = nil
        if type(para) == "table" then
            local k,v = para[1],para[2]
            btn = cj.DialogAddButton(dialog,k,v)
        elseif type(para) == "string" then
            btn = cj.DialogAddButton(dialog,para,0)
        end
        local trg = cj.CreateTrigger()
        cj.TriggerRegisterDialogButtonEvent(trg,btn)
        cj.TriggerAddAction(trg,function ()
             callFunc(i - 2)
        end)
    end
    cj.DialogDisplay(player,dialog,true)
end
