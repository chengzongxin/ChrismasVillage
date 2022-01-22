cj = require "jass.common"
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

-- function PanCameraToTimedLocForPlayer takes player whichPlayer, location loc, real duration returns nothing
--     if (GetLocalPlayer() == whichPlayer) then
--         // Use only local code (no net traffic) within this block to avoid desyncs.
--         call PanCameraToTimed(GetLocationX(loc), GetLocationY(loc), duration)
--     endif
-- endfunction

require 'kit.echo'