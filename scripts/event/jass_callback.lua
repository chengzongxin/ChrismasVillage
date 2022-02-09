----------------------------------------------------------------
-- jass function to lua
----------------------------------------------------------------
local JassCallback = {}

local _event = {}

function JassCallback.AddEvent(tag, fn)  
    _event[tag] = fn 
end

function JassCallback.RemoveEvent(tag) 
    _event[tag] = nil
end

local _old_require = require
local _new_require = function(str)
    local c = string.sub(str, 1, 1)
    if c == "@" then
        local tag = string.sub(str, 2, -1)
        local fn = _event[tag]
        
        print(tag,fn)

        if fn then fn() end
        return nil
    end
    return _old_require(str)
end

--需要初始化一下
function JassCallback.Init() require = _new_require end

JassCallback.Init()
return JassCallback