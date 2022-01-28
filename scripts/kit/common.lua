-- 刷怪區域
region1 = cg.gg_rct_monster_rect1
region2 = cg.gg_rct_monster_rect2
region3 = cg.gg_rct_monster_rect3
region4 = cg.gg_rct_monster_rect4
regions = {region1,region2,region3,region4}

-- 主机玩家
HOST_PLAYER = cj.Player(0)
-- 敌人玩家
ENMIMY_PLAYER = cj.Player(4)
-- 最大玩家数
MAX_PLAYER_QTY = 12
-- 玩家組
PlayerGroup = {}
-- 设置敌人奖励
cj.SetPlayerState(ENMIMY_PLAYER, cj.PLAYER_STATE_GIVES_BOUNTY, 1)