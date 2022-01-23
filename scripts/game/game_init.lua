
-- 刷怪區域
region1 = cg.gg_rct_monster_rect1
region2 = cg.gg_rct_monster_rect2
region3 = cg.gg_rct_monster_rect3
region4 = cg.gg_rct_monster_rect4
regions = {region1,region2,region3,region4}

-- 敌人玩家
ENMIMY_PLAYER = cj.Player(4)
-- 最大玩家数
MAX_PLAYER_QTY = 12
-- 玩家組
PlayerGroup = {}
-- 设置敌人奖励
cj.SetPlayerState(ENMIMY_PLAYER, cj.PLAYER_STATE_GIVES_BOUNTY, 1)

local function playerGroup()
    -- 循环遍历玩家数
    local players = {}
    for i = 0, MAX_PLAYER_QTY do
        local p = cj.Player(i)
        -- 玩家的控制者是用户，并且游戏状态是正在游戏
        if cj.GetPlayerController(p) == cj.MAP_CONTROL_USER and cj.GetPlayerSlotState(p) == cj.PLAYER_SLOT_STATE_PLAYING then
            print(cj.GetPlayerName(p).." Player Controller is : "..cj.GetPlayerController(p).."  slot state : "..cj.GetPlayerSlotState(p).."handle : "..p)
            table.insert(PlayerGroup, p)
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