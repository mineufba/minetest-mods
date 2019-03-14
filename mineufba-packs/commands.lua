minetest.register_chatcommand("packs_create", {
	params = "Pack name",
	description = "Creates a new pack.",
	privs = {mineufba_packs = true},
	func = function(playerName, param)

		if (param == "") then
			minetest.chat_send_player(playerName, "Params not specified")
			return
		end

		return packs_api.create_pack(playerName, param) 
	end,
})

minetest.register_chatcommand("packs_destroy", {
	params = "Pack name",
	description = "Deletes pack.",
	privs = {mineufba_packs = true},
	func = function(playerName, param)

		if (param == "") then
			minetest.chat_send_player(playerName, "Params not specified")
			return
		end

		return packs_api.destroy_pack(playerName, param) 
	end,
})

minetest.register_chatcommand("packs_list", {
	params = "",
	description = "List all available packs.",
	privs = {mineufba_packs = true},
	func = function(playerName, param)

		return packs_api.list_all_packs(playerName) 
	end,
})

minetest.register_chatcommand("packs_add_item", {
	params = "Pack name and item name",
	description = "Adds item to pack.",
	privs = {mineufba_packs = true},
	func = function(playerName, param)

		if (param == "") then
			minetest.chat_send_player(playerName, "Params not specified")
			return
		end

		words = {}
		for word in param:gmatch("%s*([^%s]+)%s*") do table.insert(words, word) end

		local packName = words[1]
		local itemName = words[2]

		if (packName == "" or packName == nil) then 
			minetest.chat_send_player(playerName, "Invalid pack name!")
			return
		end

		if (itemName == "" or itemName == nil) then 
			minetest.chat_send_player(playerName, "Invalid item name!")
			return
		end

		if (itemName:find("%w+:") == nil) then
			minetest.chat_send_player(playerName, "Please use item name with mod preffix!")
			return
		end			

		local stack = minetest.get_player_by_name(playerName):get_inventory():get_stack("main", 1)
		stack:set_name(itemName)

		if (not stack:is_known()) then
			minetest.chat_send_player(playerName, "Item " .. '"' .. itemName .. '"' .. " does not exist!")
			return
		end

		return packs_api.add_to_pack(playerName, packName, itemName) 
	end,
})

minetest.register_chatcommand("packs_add_inventory", {
	params = "Pack name",
	description = "Adds all items from player inventory to pack.",
	privs = {mineufba_packs = true},

	func = function(playerName, param)

		if (param == "") then
			minetest.chat_send_player(playerName, "Params not specified")
			return
		end	

		return packs_api.add_inventory_to_pack(minetest.get_player_by_name(playerName), param) 

	end
})

minetest.register_chatcommand("packs_remove_item", {
	params = "Pack name and item name",
	description = "Adds item to pack.",
	privs = {mineufba_packs = true},
	func = function(playerName, param)

		if (param == "") then
			minetest.chat_send_player(playerName, "Params not specified")
			return
		end

		words = {}
		for word in param:gmatch("%s*([^%s]+)%s*") do table.insert(words, word) end

		local packName = words[1]
		local itemName = words[2]

		if (packName == "" or packName == nil) then 
			minetest.chat_send_player(playerName, "Invalid pack name!")
			return
		end

		if (itemName == "" or itemName == nil) then 
			minetest.chat_send_player(playerName, "Invalid item name!")
			return
		end

		if (itemName:find("%w+:") == nil) then
			minetest.chat_send_player(playerName, "Please use item name with mod preffix!")
			return
		end			

		return packs_api.delete_from_pack(playerName, packName, itemName) 
	end,
})

minetest.register_chatcommand("packs_get", {
	params = "Pack name",
	description = "Adds items from pack to inventory.",
	privs = {mineufba_packs = true},

	func = function(playerName, param)

		if (param == "") then
			minetest.chat_send_player(playerName, "Params not specified")
			return
		end	

		return packs_api.get_pack(minetest.get_player_by_name(playerName), param) 
	end,
})

minetest.register_chatcommand("packs_give", {
	params = "Player name and pack name",
	description = "Adds items from pack to player's inventory.",
	privs = {mineufba_packs = true},

	func = function(playerName, param)

		if (param == "") then
			minetest.chat_send_player(playerName, "Params not specified")
			return
		end	

		words = {}
		for word in param:gmatch("%s*([^%s]+)%s*") do table.insert(words, word) end

		local playerToGive = words[1]
		local packToGive = words[2]

		if (playerToGive == nil or packToGive == nil) then

			minetest.chat_send_player(playerName, "Not enough parameters!")

			return

		end

		return packs_api.get_pack(minetest.get_player_by_name(playerToGive), packToGive) 
	end,
})


minetest.register_chatcommand("packs_give_all", {
	params = "Pack name",
	description = "Adds items from pack to all online players inventory.",
	privs = {mineufba_packs = true},

	func = function(playerName, param)

		if (param == "") then
			minetest.chat_send_player(playerName, "Params not specified")
			return
		end	

		for _,player in ipairs(minetest.get_connected_players()) do
			
			local name = player:get_player_name()

			packs_api.get_pack(minetest.get_player_by_name(name), param)

		end 
	end,
})

minetest.register_chatcommand("packs_show", {
	params = "Pack name",
	description = "List items in pack.",
	privs = {mineufba_packs = true},

	func = function(playerName, param)

		if (param == "") then
			minetest.chat_send_player(playerName, "Params not specified")
			return
		end	

		return packs_api.show_pack_content(playerName, param) 
	end,
})