-- 记录全局玩家变量
PLAYERS = {
    [0] = {
        kill = 0,
        name = '',
        hero = {
            hp = 0,
            mp = 0,
            name = ''
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
            hero = {
                hp = 0,
                mp = 0,
                name = ''
            }
        }
end

---初始化player全局玩家table
---@param handle unit
---@return any
PLAYERS.player_hero_create = function (handle)
    local player = cj.GetOwningPlayer(handle)
    PLAYERS[player].hero = {
        hp = 0,
        mp = 0,
        name = cj.GetUnitName(handle)
    }
end
