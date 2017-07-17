	function init()
	fp = { -- 50%
		items = {[12907]=0.7, [12900]=0.7},
		itemsFG = {},
		creatures = {[48]=0.5, [65]=0.5, [244]=0.6, [232]=0.7, [233]=0.7, [929]=0.6, [930]=0.6, [925]=0.7, [809]=0.5, [820]=0.5, [810]=0.6},
		effects = {[5]=0.5, [7]=0.7, [19]=0.5, [22]=0.5, [47]=0.5, [37]=0.5, [38]=0.5, [39]=0.5, [116]=0.5, [136]=0.5, [258]=0.5, [11]=0.5, [51]=0.5},
		missEffects = {},
	}
	local str = "items\n  "
	for i,v in pairs(fp.items) do
	opacity = 0.5
	if v < 1 then
		opacity = v
	end
		str = str .. (opacity == v and i or v) .. "\n    opacity: "..(opacity).."\n    full-ground: false\n  "
	end
	for i,v in pairs(fp.itemsFG) do
	opacity = 0.5
	if v < 1 then
		opacity = v
	end
		str = str .. (opacity == v and i or v) .. "\n    opacity: "..(opacity).."\n    full-ground: true\n  "
	end
	str = str.. "\ncreatures\n  "
	for i,v in pairs(fp.creatures) do
	opacity = 0.5
	if v < 1 then
		opacity = v
	end
		str = str .. (opacity == v and i or v) .. "\n    opacity: "..(opacity).."\n  "
	end
	str = str.. "\neffects\n  "
	for i,v in pairs(fp.effects) do
	opacity = 0.5
	if v < 1 then
		opacity = v
	end
		str = str .. (opacity == v and i or v) .. "\n    opacity: "..(opacity).."\n  "
	end
	str = str.. "\nmissiles\n  "
	for i,v in pairs(fp.missEffects) do
	opacity = 0.5
	if v < 1 then
		opacity = v
	end
		str = str .. (opacity == v and i or v) .. "\n    opacity: "..(opacity).."\n  "
	end
	
	local f = io.open('./modules/things/things.otml', 'w')
	f:write(str)
	f:close()
		connect(g_game, {onClientVersionChange = onClientVersionChange})
	end

	function terminate()
	end
    g_game.enableFeature(GameSpritesAlphaChannel)	
	function onClientVersionChange(version)
		g_things.loadOtml('/things/things.otml')
	end