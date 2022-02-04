-- 全局玩家组
PlayerGroup = {}
-- 玩家组类
Players = {}
Players["__index"] = Players  -- setmetatable(t,Players) && Players["__index"] = Players 两句实现面向对象，否则不会查找到对应的table
-- 玩家
Player = {}
Player["__index"] = Player
-- 英雄
Hero = {}
Hero["__index"] = Hero
-- 全局玩家元表
Playersmt = {
    -- 装入
    put = function (t,item)
        table.insert(t.items,item)
    end,
    -- 取出
    take = function (t)
        return table.remove(t.items)
    end,
    -- 遍历
    list = function (t)
        return table.concat(t.items, ",")
    end,
    -- 清空
    clear = function (t)
        t.items = {}
    end
}
-- 会覆盖__index
Playersmt["__index"] = Playersmt

----------------------------- 玩家组类 -----------------------------
-- 创建玩家组
---@return Player
function Players.new()
    local t = {
        items = {},
        count = 0,
        playerIndexs = {},
    }
    setmetatable(t,Players)
    return t
end

-- 添加玩家
---@param player 玩家player
function Players:put(player)
    print("put py",player.name)
    self[player.index] = player
    table.insert( self.playerIndexs, player.index)
    self.count = self.count + 1
    
    for key, value in pairs(self) do
        print("players:put",key,value,self)
    end
end

-- 获取玩家
---@param handle 单位
---@return player
function Players:Get(handle)
    local player = cj.GetOwningPlayer(handle)
    local index  = cj.GetPlayerController(player)
    return self[index]
end

-- 获得玩家索引列表，0,1,2...
---@return 玩家索引表
function Players:list()
    return self.playerIndexs
end

-- 获取玩家
---@param index 索引 eg：0，1, 2
---@return player
function Players:GetWithIndex(index)
    return self[index]
end

-- 获取玩家模型数组
---@return playertable
function Players:playerList()
    local l = {}
    for key, value in pairs(self.playerIndexs) do
        table.insert( l,self[value] )
    end
    return l
end

-- 获取玩家的英雄
---@param handle 单位
---@return hero
function Players:GetPlayerHero(handle)
    return self:Get(handle).hero
end

----------------------------- 玩家类 -----------------------------
-- 创建玩家
function Player.new(handle)
    local t = {
        handle = handle,
        index = cj.GetPlayerController(handle),
        name = cj.GetPlayerName(handle) or '',
        kill = 0,
        ring = 0,
        hero = {},
    }
    setmetatable(t,Player)
    for key, value in pairs(t) do
        print("player.new",key,value,t)
    end
    return t
end

-- 玩家添加英雄
function Player:addHero(hero)
    self.hero = hero
    for key, value in pairs(self) do
        print("player:addHero",key,value,self)
    end
end

-- 玩家添加金币
function Player:addGold(gold)
    cj.SetPlayerState(self.handle, cj.PLAYER_STATE_RESOURCE_GOLD, cj.GetPlayerState(p, cj.PLAYER_STATE_RESOURCE_GOLD) + gold)
end

function Player:selectUnit(whichUnit)
    if cj.GetLocalPlayer() == self.handle then
        cj.ClearSelection()
        cj.SelectUnit(whichUnit, true)
    end
end

----------------------------- 英雄类 -----------------------------
-- 创建英雄
function Hero.new(handle)
    local t = {
        handle = handle,
        hp = 0,
        mp = 0,
        name = cj.GetUnitName(handle),
        critical = 30,
        criticalpower = 2,
        ring = 0,
        sword = 0,
        armor = 0,
        fingerring = 0,
    }
    setmetatable(t,Hero)
    return t
end




----------------------------- old clas -----------------------------

-- function Player:addHero(hero)
--     local player = cj.GetOwningPlayer(hero.handle)
--     self[player].hero = hero
-- end




PLAYERS = {
    [0] = {
        id = 0,
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

setmetatable(PLAYERS,{
    __index = function (t,k)
        print(t,k)
        return k
    end
})

---初始化player全局玩家table
---@param handle player
---@return any
PLAYERS.player_create = function (handle)
    -- init Player map
    PLAYERS[handle] = {
            id = handle,
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
        id = handle,
        hp = 0,
        mp = 0,
        name = cj.GetUnitName(handle),
        critical = 30,
        criticalpower = 2,
        ring = 0,
        sword = 0,
        armor = 0,
        fingerring = 0,
    }
end

---根据英雄获取存储英雄属性
---@param unit 英雄
---@return any 属性
PLAYERS.HERO = function (unit)
    local player = cj.GetOwningPlayer(unit)
    return PLAYERS[player].hero
end

---根据单位获取存储玩家
function PLAYERS:GetPlayer(u)
	local player = cj.GetOwningPlayer(u)
    return self[player]
end