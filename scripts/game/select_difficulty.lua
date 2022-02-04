local function show_dialog_diffculty()
    Dialog.create(
        HOST_PLAYER,
        "|Cff00FF7F请选择难度|r",
        {"|Cff00FF7F初出茅庐（|r|Cffffcc001|r|Cff00ff7f）|r",'1'},
        {"|Cff00FF7F小试牛刀（|r|Cffffcc002|r|Cff00ff7f）|r",'2'},
        {"|Cff00FF7F炉火纯青（|r|Cffffcc003|r|Cff00ff7f）|r",'3'},
        {"|Cff00FF7F登峰造极（|r|Cffffcc004|r|Cff00ff7f）|r",'4'},
        function (idx)
            GameDifficulty = idx
            local txt = hcolor.format("当前选择难度 %s", "00FF7F", {
                { "ffff00", idx },
            })
            echo(txt)
        end)
end

SELECT_DIFFICULTY = function ()
    show_dialog_diffculty()
end