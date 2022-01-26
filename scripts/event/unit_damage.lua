local function unit_damage()
    -- 会来很多次，需要注意
    echo("damage111111111111111111")
    cevent.unit_damage(function()
        echo("damage2222222222222222222222222")
    end)
end

unit_damage()