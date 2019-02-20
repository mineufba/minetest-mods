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