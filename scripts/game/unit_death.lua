local function unit_death()
    -- 会来很多次，需要注意
    cevent.unit_death(function ()
        local du = cj.GetTriggerUnit()
        local ku = cj.GetKillingUnit()
    
        if cj.IsUnitEnemy(du, HOST_PLAYER) then
            -- 计分
            print("killunit :"..ku.." killed :"..du)
            PlayerKill = PlayerKill + 1
            print(PlayerKill)
        elseif cj.IsUnitEnemy(du, HOST_PLAYER) then
            -- 复活英雄
        end

    end)
end

unit_death()