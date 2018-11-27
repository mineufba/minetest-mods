minetest.register_on_joinplayer(function(player) 

		local name = player:get_player_name()
		local privs = minetest.get_player_privs(name)

		privs.fly = true
		privs.noclip = true
		privs.teleport = true
		privs.bring = true
		privs.fast = true

		minetest.set_player_privs(name, privs)
	end)