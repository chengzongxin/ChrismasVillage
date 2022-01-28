
local function test()
    cj.CreateItem(str2id('I006:engs'),-100,-100)
    cj.CreateItem(str2id('I008:engs'),-100,-100)
    cj.CreateItem(str2id('I00D:engs'),-100,-100)
    cj.CreateItem(str2id('I00E:engs'),-200,-200)
    
    cj.CreateItem(str2id('I002:asbl'),-200,-200)
    cj.CreateItem(str2id('I003:blba'),-200,-200)
    cj.CreateItem(str2id('I00A:lnrn'),-200,-200)
end

TEST = function()
    test()

    for i = 1, 20 do
        cj.CreateItem(str2id('I008:engs'),-300,-300)
    end
end