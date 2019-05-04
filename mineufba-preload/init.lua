modName = "mineufba_preload"

dofile(minetest.get_modpath(modName) .. "/players-list.lua")


pos = {x = 2290.0, y = -27.0, z = -3100.0}	

minetest.register_on_newplayer(function(player) 

		local name = player:get_player_name()

		local privs = minetest.get_player_privs(name)

		privs.teleport = false
		privs.noclip = false
		privs.bring = false
		privs.fast = false
		privs.fly = false
		privs.interact = false;

		minetest.set_player_privs(name, privs)	

		player:setpos(pos)

		return true

	end)

minetest.register_on_respawnplayer(function(player)

		player:setpos(pos)

		return true

	end)

-- minetest.register_on_dignode(function(pos, oldnode, digger)

-- 		local inv = digger:get_inventory()
-- 		local listName = digger:get_wield_list()

-- 		local searchStack = {name = oldnode.name, count = 2}

-- 		if (inv:contains_item(listName, searchStack)) then 

-- 			inv:remove_item(listName, {name = oldnode.name, count = 1})

-- 		end

-- 	end)

-- minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack, pointed_thing)

-- 		if (itemstack ~= nil) then
			
-- 			itemstack:set_count(1)

-- 		end

-- 		return true

-- 	end)