Unit = {}
Unit.__index = Unit

-- 创建单位
---@param handle 单位handle
---@return 单位table
Unit.new = function (handle)
    local t = {
        handle = handle,
        id = cj.GetUnitTypeId(handle), -- integer ..str2id('e003.ewsp')
        name = cj.GetUnitName(handle),
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

