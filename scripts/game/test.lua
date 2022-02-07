local t = {}
local a = 1
local b = "1"
local c = function ()
end

print(type(t) == "table")
print(type(a) == "number")
print(type(b) == "string")
print(type(c) == "function")


for key, value in pairs(JassJapi) do
    print("JassJapi : ",key,value)
end

-- for key, value in pairs(JassCommon) do
--     print("JassGlobals : ",key,value)
-- end