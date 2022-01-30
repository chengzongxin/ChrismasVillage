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

--[[
    ATTRSTR({
        { "80ff00", "剑圣" },
        { "ff59ff", "武器屋" },
        { "ff0000", "[圣剑·火之高兴]" },
        { hcolor.gold, "100W" },
    })
]]
---@class hcolor
hcolor = {}

---@private
---@param str string
---@param color string hex
---@return string
hcolor.hex = function(str, color)
    if (str == nil or str == '' or color == nil) then
        return str
    end
    return "|cff" .. color .. str .. "|r"
end


--- 找出某个子串出现的所有位置
---@param str string
---@param pattern string
---@return table
string.findAllPos = function(str, pattern)
    if (str == nil or pattern == nil) then
        return
    end
    local s
    local e = 0
    local res = {}
    while (true) do
        s, e = string.find(str, pattern, e + 1)
        if (s == nil) then
            break
        end
        table.insert(res, { s, e })
        if (e == nil) then
            break
        end
    end
    return res
end

--- 把数组以分隔符拼接回字符串
---@param delimeter string
---@param table table
---@return string
string.implode = function(delimeter, table)
    local str
    for _, v in ipairs(table) do
        if (str == nil) then
            str = v
        else
            str = str .. delimeter .. v
        end
    end
    return str
end

--- 插入组合
--[[
    str: 一个字符串，数值%s,%s,%s
    containColor: 总体hex颜色，包住字符串两端 string|nil|function
    options: {
        {"00ccff", "100"}, -- 按顺序替换
        {"ee82ee", "200"},
        {hcolor.purple, "300"}, -- 可使用函数进行颜色设定，自定义函数也可以只要返回string类型即可
    }
]]
---@type fun(str:string,containColor:nil|string|function,options:table):string
hcolor.format = function(str, containColor, options)
    local poses = string.findAllPos(str, '%%s')
    local builder = {}
    if (#poses > 0) then
        local idx = 1
        local cursor = 1
        for _, p in ipairs(poses) do
            if (p[1] > 1) then
                if (type(containColor) == "string") then
                    table.insert(builder, hcolor.hex(string.sub(str, cursor, p[1] - 1), containColor))
                elseif (type(containColor) == "function") then
                    table.insert(builder, containColor(string.sub(str, cursor, p[1] - 1)))
                else
                    table.insert(builder, string.sub(str, cursor, p[1] - 1), containColor)
                end
            end
            if (options ~= nil and options[idx] ~= nil) then
                if (type(options[idx][1]) == "string") then
                    table.insert(builder, hcolor.hex(tostring(options[idx][2]), options[idx][1]))
                elseif (type(options[idx][1]) == "function") then
                    table.insert(builder, options[idx][1](tostring(options[idx][2])))
                end
            end
            cursor = p[2] + 1
            idx = idx + 1
        end
        if (type(containColor) == "string") then
            table.insert(builder, hcolor.hex(string.sub(str, cursor), containColor))
        elseif (type(containColor) == "function") then
            table.insert(builder, containColor(string.sub(str, cursor)))
        else
            table.insert(builder, string.sub(str, cursor))
        end
    end
    return string.implode('', builder)
end

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