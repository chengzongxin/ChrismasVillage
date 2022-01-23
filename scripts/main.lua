require 'kit.kit'
require 'global.global'
require 'game.select_hero'
require 'kit.cevent'
require 'game.shuaguai'

local std_print = print

function print(...)
	std_print(('[%.3f]'):format(os.clock()), ...)
end

-- The game starts here 游戏从main函数开始运行
function main()
	cj.FogEnable(false)
	cj.FogMaskEnable(false)
	-- 選擇英雄
	SELECT_HERO()
	-- 刷怪
	SHUAGUAI()
end