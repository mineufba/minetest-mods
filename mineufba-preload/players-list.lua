local filePath = minetest.get_modpath(modName) .. "/online-players"

minetest.register_on_mapgen_init(function (mapgen_params)

	local file = io.open(filePath, 'w')

	file:write("")

	file:close();

end)

minetest.register_on_joinplayer (function (player)
	
	local file = io.open(filePath, 'a')

	file:write(player:get_player_name() .. "\n")

	file:close();

end)

minetest.register_on_leaveplayer(function (player)
	
	os.execute('grep -vwE "' .. player:get_player_name() .. '" ' .. filePath .. " > /tmp/online-players")
	os.execute('mv /tmp/online-players ' .. filePath)

end)