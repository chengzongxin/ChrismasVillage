local fs = require 'bee.filesystem'
local registry = require 'bee.registry'
local ydwe = require 'tools.ydwe'
local subprocess = require 'bee.subprocess'
if not ydwe then
    return
end

local function get_debugger()
    local path = fs.path(os.getenv('USERPROFILE')) / '.vscode' / 'extensions'
    for extpath in path:list_directory() do
        if fs.is_directory(extpath) and extpath:filename():string():sub(1, 20) == 'actboy168.lua-debug-' then
            local dbgpath = extpath / 'windows' / 'x86' / 'debugger.dll'
            if fs.exists(dbgpath) then
                return dbgpath
            end
        end
    end
end

local root = fs.path(arg[1])
if not fs.exists(root / 'MoeHero.w3x') then
    print('地图不存在', root / 'MoeHero.w3x')
    return
end

-- 1.31 debug工具
print(ydwe / 'YDWEConfig.exe')
-- subprocess.spawn{
--     ydwe / 'YDWEConfig.exe',
--     '-launchwar3',
--     '-loadfile', root / 'MoeHero.w3x'
-- }

-- 1.32 console窗口
print(ydwe / 'ydwe.exe')
subprocess.spawn {
    ydwe / 'ydwe.exe',
    '-war3',
    '-loadfile', root / 'MoeHero.w3x',
}

