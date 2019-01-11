pos = {x = 2290.0, y = -27.0, z = -3100.0}	

minetest.register_on_newplayer(function(player) 

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

		player:setpos(pos)

		return true

	end)