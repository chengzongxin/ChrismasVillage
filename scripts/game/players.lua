-- 记录全局玩家变量
PLAYERS = {
    [0] = {
        kill = 0,
        name = '',
        hero = {
            hp = 0,
            mp = 0,
            name = '',
            critical = 30,
            criticalpower = 2
        }
    }
} 

---初始化player全局玩家table
---@param handle player
---@return any
PLAYERS.player_create = function (handle)
    -- init Player map
    PLAYERS[handle] = {
            index = cj.GetPlayerController(handle),
            name = cj.GetPlayerName(handle) or '',
            kill = 0,
            ring = 0,
        }
end

---选择英雄后，填充英雄属性
---@param handle unit
---@return any
PLAYERS.player_hero_create = function (handle)
    local player = cj.GetOwningPlayer(handle)
    PLAYERS[player].hero = {
        hp = 0,
        mp = 0,
        name = cj.GetUnitName(handle),
        critical = 30,
        criticalpower = 2,
        ring = 0,
    }
end

---根据英雄获取存储英雄属性
---@param unit 英雄
---@return any 属性
PLAYERS.HERO = function (unit)
    local player = cj.GetOwningPlayer(unit)
    return PLAYERS[player].hero
end