-- 检测玩家数

PlayerGroup = {}

local function playerGroup()
    -- 循环遍历玩家数
    local players = {}
    for i = 0, 12 do
        local p = cj.Player(i)
        
        -- if ((GetPlayerController(Player(0)) == MAP_CONTROL_USER)) then
        -- if ((GetPlayerSlotState(Player(0)) == PLAYER_SLOT_STATE_PLAYING)) then
        -- 玩家的控制者是用户，并且游戏状态是正在游戏
        -- print(cj.GetPlayerName(p).." Player Controller is : "..cj.GetPlayerController(p).."  slot state : "..cj.GetPlayerSlotState(p))
        if cj.GetPlayerController(p) == cj.MAP_CONTROL_USER and cj.GetPlayerSlotState(p) == cj.PLAYER_SLOT_STATE_PLAYING then
            -- print(cj.GetPlayerName(p).."is user")
            table.insert(PlayerGroup, p)
        end
    end
    -- 查询完成
    print("print all players,count = "..#PlayerGroup)
    for key, value in pairs(PlayerGroup) do
        print(value)
    end
end

playerGroup()