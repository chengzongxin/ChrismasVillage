-- 单位类
Unit = {}
Unit.__index = Unit

-- 英雄类
Hero = {}
Hero.super = Unit
Hero.__index = Unit
-- Hero.__newindex = Unit --继承Unit方法

-- 创建单位
---@param handle 单位handle
---@return 单位table
Unit.new = function (handle)
    local t = {
        handle = handle,
        id = cj.GetUnitTypeId(handle), -- integer ..str2id('e003.ewsp')
        name = cj.GetUnitName(handle),
        hp = 0,
        mp = 0,
        -- art = string.format('%q', JassSlk.unit[cj.GetUnitTypeId(handle)].Art),  -- 不需要转义 反斜杠 '\'
        art = JassSlk.unit[cj.GetUnitTypeId(handle)].Art,
    }
    setmetatable(t,Unit)
    return t
end

function Unit:hp()
    return cj.GetUnitState(self.handle,UNIT_STATE_LIFE)
end

function Unit:maxhp()
    return cj.GetUnitState(self.handle,UNIT_STATE_MAX_LIFE)
end

function Unit:mp()
    return cj.GetUnitState(self.handle,UNIT_STATE_MANA)
end

function Unit:maxmp()
    return cj.GetUnitState(self.handle,UNIT_STATE_MAX_MANA)
end

function Unit:attackMax()
    return cj.GetUnitState(self.handle,UNIT_STATE_ATTACK_MAX)
end

function Unit:attackSpeed()
    return cj.GetUnitState(self.handle,UNIT_STATE_ATTACK_SPEED)
end


----------------------------- 英雄类 -----------------------------
-- 创建英雄
function Hero.new(handle)
    local t = Unit.new(handle)
    t.critical = 30
    t.criticalpower = 2
    t.ring = 0
    t.sword = 0
    t.armor = 0
    t.fingerring = 0
    return t
end


