cj = require "jass.common"
cg = require "jass.globals"
slk = require 'jass.slk'
japi = require "jass.japi"
require 'kit.kit'
require 'event.unit_death'
require 'event.unit_damage'
require 'event.unit_pickup'
require 'event.unit_use'
require 'game.players'
require 'game.game_init'
require 'game.select_hero'
require 'game.lerning_skill'
require 'game.shuaguai'
require 'game.test'
require 'game.synthetic_item'

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
	-- 多面板
	MULTIBOARD()

	TEST()
end