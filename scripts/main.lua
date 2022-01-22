require 'kit.kit'

local std_print = print

function print(...)
	std_print(('[%.3f]'):format(os.clock()), ...)
end

local function main()
	print 'hello loli!'
	echo("|cff00ffffecho fun is runing!|r")
	cj.FogEnable(false)
	cj.FogMaskEnable(false)

end

main()
