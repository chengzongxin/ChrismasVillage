
-- MouseClick = function ()
--     echo("MouseClick!!!")
-- end

JassCallback = require 'event.jass_callback'

JassCallback.AddEvent("MouseClick",function ()
    echo("MouseClick!!!")

    print(HOST_PLAYER,JassJapi.DzGetTriggerUIEventPlayer(),JassJapi.DzGetTriggerUIEventFrame())
end)

JassCallback.AddEvent("MouseEnter",function ()
    echo("MouseEnter!!!")

    print(HOST_PLAYER,JassJapi.DzGetTriggerUIEventPlayer(),JassJapi.DzGetTriggerUIEventFrame())
end)

JassCallback.AddEvent("MouseLeave",function ()
    echo("MouseLeave!!!")

    print(HOST_PLAYER,JassJapi.DzGetTriggerUIEventPlayer(),JassJapi.DzGetTriggerUIEventFrame())
end)

JassCallback.AddEvent("MouseUp",function ()
    echo("MouseUp!!!")

    print(HOST_PLAYER,JassJapi.DzGetTriggerUIEventPlayer(),JassJapi.DzGetTriggerUIEventFrame())
end)

JassCallback.AddEvent("MouseWheel",function ()
    echo("MouseWheel!!!")

    print(HOST_PLAYER,JassJapi.DzGetTriggerUIEventPlayer(),JassJapi.DzGetTriggerUIEventFrame())
end)

JassCallback.AddEvent("MouseDBClick",function ()
    echo("MouseDBClick!!!")

    print(HOST_PLAYER,JassJapi.DzGetTriggerUIEventPlayer(),JassJapi.DzGetTriggerUIEventFrame())
end)