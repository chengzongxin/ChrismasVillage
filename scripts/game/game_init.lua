local function playerGroup()
    -- 循环遍历玩家数
    local players = {}
    for i = 0, MAX_PLAYER_QTY do
        local p = cj.Player(i)
        -- 玩家的控制者是用户，并且游戏状态是正在游戏
        if cj.GetPlayerController(p) == cj.MAP_CONTROL_USER and cj.GetPlayerSlotState(p) == cj.PLAYER_SLOT_STATE_PLAYING then
            print(cj.GetPlayerName(p).." Player Controller is : "..cj.GetPlayerController(p).."  slot state : "..cj.GetPlayerSlotState(p).."handle : "..p)
            table.insert(PlayerGroup, p)
            -- 全局初始化
            PLAYERS.player_create(p)
            print("PLAYERS["..p.."].name : "..PLAYERS[p].name)
            print("PLAYERS["..p.."].kill : "..PLAYERS[p].kill)
        end
    end
    -- 查询完成
    print("print all players,count = "..#PlayerGroup)
    for _, value in pairs(PlayerGroup) do
        local countStr = string.format( " |cffffff00%d|r ", #PlayerGroup)
        echo("本局游戏玩家数量为"..countStr.."人",value,30,0,0)
    end
end

playerGroup()