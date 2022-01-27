-- 在“|C”的后面从左向右：
-- 1～2位为亮度，00为最暗，FF为最亮
-- 3～4位为红色，00红色为无，FF为最红
-- 5～6位为绿色，00绿色为无，FF为最绿
-- 7～8位为蓝色，00蓝色为无，FF为最蓝
-- 下面是一些代码：
-- |CFFFF0000XXX|R——红色
-- |Cff00ff00XXX|R——绿色
-- |Cffffff00XXX|R——金黄色
-- |Cff0000ffXXX|R——蓝色
-- |Cffff00ffXXX|R——粉色
-- |CFF00FFFFXXX|R——天蓝色
-- |CFF8080FFXXX|R——蓝紫色
-- |CFFFF8000XXX|R——橙色
-- |Cff808000XXX|R——草色
-- |Cff808080XXX|R——灰色
-- |C00000000XXX|R——黑色
-- 注：在XXX处输入名字即可

-- echo("|cffff0000请|r|cffdb2400选|r|cffb74800择|r|cff926d00你|r|cff6e9100的|r|cff49b600英|r|cff25da00雄|r|cff00ff00！|r",nil,30,0,0)

-- color = {
--     |CFFFF0000|R
-- }

DrawRed = function(text)
    return string.format( "|CFFFF0000%s|R", text)
end
DrawGreen = function(text)
    return string.format( "|Cff00ff00%s|R", text)
end
DrawGold = function(text)
    return string.format( "|Cffffff00%s|R", text)
end
DrawBlue = function(text)
    return string.format( "|Cff00ff00%s|R", text)
end
DrawPink = function(text)
    return string.format( "|Cffff00ff%s|R", text)
end
DrawSkyBlue = function(text)
    return string.format( "|CFF00FFFF%s|R", text)
end
DrawBluePurple = function(text)
    return string.format( "|CFF8080FF%s|R", text)
end
DrawOrange = function(text)
    return string.format( "|CFFFF8000%s|R", text)
end
DrawGrass = function(text)
    return string.format( "|Cff808000%s|R", text)
end
DrawGray = function(text)
    return string.format( "|Cff808080%s|R", text)
end
DrawBlack = function(text)
    return string.format( "|C00000000%s|R", text)
end
DrawWhite = function(text)
    return string.format( "|CFFFFFFFF%s|R", text)
end