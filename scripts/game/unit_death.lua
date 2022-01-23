local function unit_death()
    -- 会来很多次，需要注意
    cevent.unit_death(function ()
         local deadUnit = cj.GetUnitName(cj.GetTriggerUnit())
         local killUnit = cj.GetUnitName(cj.GetKillingUnit())
         
         echo(killUnit.." killed "..deadUnit)
    end)
end

unit_death()