-- 单位类
Unit = {}
Unit.__index = Unit --  当访问table a中不存在的元素时，既不会查询a的__index，也不会查询a元表的其他元素，只会查询a元表的__index。

-- 英雄类，继承单位类
Hero = {}
Hero.super = Unit
setmetatable(Hero, {__index = Hero.super}) -- Hero中没有的方法会调用super方法，实现继承
Hero.__index = Hero -- 当Hero内产生的实例，会访问Hero中方法
-- Hero.__newindex = Unit
-- 创建单位
---@param handle 单位handle
---@return 单位table
Unit.new = function (handle)
    local t = {
        handle = handle,
        id = cj.GetUnitTypeId(handle), -- integer ..str2id('e003.ewsp')
        name = cj.GetUnitName(handle),
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
    setmetatable(t,Hero)
    t.critical = 30
    t.criticalpower = 2
    t.ring = 0
    t.sword = 0
    t.armor = 0
    t.fingerring = 0
    return t
end

-- 重载
---@return 最大攻击力
function Hero:attackMax()
    -- print("super",self.super:attackMax()) --调用父类
    -- print("self",cj.GetUnitState(self.handle,UNIT_STATE_LIFE)) --覆盖实现
    return cj.GetUnitState(self.handle,UNIT_STATE_LIFE)
end
