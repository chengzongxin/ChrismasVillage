require 'base.engine'
require 'base.blizzard'
require 'kit.kit'
require 'class.players'
require 'class.unit'
require 'event.unit_death'
require 'event.unit_damage'
require 'event.unit_pickup'
require 'event.unit_use'
require 'event.unit_drop'
require 'event.unit_sell'
require 'game.game_init'
require 'game.select_difficulty'
require 'game.select_hero'
require 'game.lerning_skill'
require 'game.shuaguai'
require 'game.synthetic_item'

-- require 'game.test'

local std_print = print

function print(...)
	std_print(('[%.3f]'):format(os.clock()), ...)
end

-- The game starts here 游戏从main函数开始运行
function main()
	-- 游戏初始化
	GAME_INIT()
	-- 选择难度
	SELECT_DIFFICULTY()
	-- 選擇英雄
	SELECT_HERO()
	-- 刷怪
	SHUAGUAI()
	-- 多面板
	MULTIBOARD()
end