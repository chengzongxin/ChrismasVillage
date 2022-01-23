cj = require "jass.common"
cg = require "jass.globals"
-- bj = require "blizzard"
-- 物编转id
function str2id(a)
    local n1 = string.byte(a, 1) or 0
    local n2 = string.byte(a, 2) or 0
    local n3 = string.byte(a, 3) or 0
    local n4 = string.byte(a, 4) or 0
    local r = n1*256*256*256+n2*256*256+n3*256+n4
    return r
end


-- 命令玩家选中单位
function select_unit(whichUnit,whichPlayer)
    if cj.GetLocalPlayer() == whichPlayer then
        cj.ClearSelection()
        cj.SelectUnit(whichUnit, true)
    end
end

require 'kit.echo'