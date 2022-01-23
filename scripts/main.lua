require 'kit.kit'
require 'global.global'
require 'game.select_hero'
require 'kit.cevent'

local std_print = print

function print(...)
	std_print(('[%.3f]'):format(os.clock()), ...)
end

local function main()
	cj.FogEnable(false)
	cj.FogMaskEnable(false)

	
	create_select_unit()
end

main()
