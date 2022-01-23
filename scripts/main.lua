require 'kit.kit'
require 'kit.cevent'
require 'game.game_init'
require 'game.select_hero'
require 'game.shuaguai'
require 'game.unit_death'

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