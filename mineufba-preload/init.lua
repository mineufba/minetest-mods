minetest.register_on_newplayer(function(player) 

		local pos = {x = 3010.0, y = -31,0, z = -2360.0}
		local name = player:get_player_name()

		local privs = minetest.get_player_privs(name)

		privs.teleport = false
		privs.noclip = false
		privs.bring = false
		privs.fast = false
		privs.fly = false

		minetest.set_player_privs(name, privs)	

		player:setpos(pos)

		return true

	end)

minetest.register_on_respawnplayer(function(player)

		local pos = {x = 2865.5, y = -39.5, z = -1319.6}

		player:setpos(pos)

		return true

	end)