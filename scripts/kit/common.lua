-- 刷怪區域
GG_Region1 = JassGlobals.gg_rct_monster_rect1
GG_Region2 = JassGlobals.gg_rct_monster_rect2
GG_Region3 = JassGlobals.gg_rct_monster_rect3
GG_Region4 = JassGlobals.gg_rct_monster_rect4
GG_Regions = {GG_Region1,GG_Region2,GG_Region3,GG_Region4}

-- 主机玩家
HOST_PLAYER = cj.Player(0)
-- 敌人玩家
ENMIMY_PLAYER = cj.Player(4)
-- 最大玩家数
MAX_PLAYER_QTY = 16
-- 设置敌人奖励
cj.SetPlayerState(ENMIMY_PLAYER, PLAYER_STATE_GIVES_BOUNTY, 1)