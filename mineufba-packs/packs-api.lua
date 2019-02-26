packs_api = {}

packs_api.folderName = minetest.get_modpath(modName) .. "/packs/"

packs_api.create_pack = function (playerName, packName)

	if (files.exists(packs_api.folderName .. packName)) then 
		minetest.chat_send_player(playerName, "Pack already exists!")
		return false
	end

	file = io.open(packs_api.folderName .. packName, "w")

	file:write("")

	file:close()

	minetest.chat_send_player(playerName, "Pack created!")

	return true
end

packs_api.destroy_pack = function (playerName, packName)
	
	if (not packs.exists(playerName, packName)) then return end

	if (os.remove(packs_api.folderName .. packName)) then

		minetest.chat_send_player(playerName, "Pack deleted!")
		return true
	else

		minetest.chat_send_player(playerName, "Couldn't delete pack!")
		return false
	end
end

packs_api.add_inventory_to_pack = function (player, packName) 
	
	if (not packs.exists(playerName, packName)) then return end

	local playerName = player:get_player_name()
	
	local inv = player:get_inventory()

	local size = inv:get_size("main")

	for i=1,size do

		local stack = inv:get_stack("main", i)

		packs_api.add_to_pack(playerName, packName, stack:get_name())

	end

end

packs_api.add_to_pack = function (playerName, packName, itemName)
	
	if (itemName == "") then return end

	if (not packs.exists(playerName, packName)) then return end

	for line in io.lines(packs_api.folderName .. packName) do

		if (line == itemName) then
			minetest.chat_send_player(playerName, "Pack " .. '"' .. packName .. '"' .. " already contains " .. '"' .. itemName .. '"' .. "!")
			return false
		end
	end

	local file = io.open(packs_api.folderName .. packName, "a")
	
	if (file == nil) then
		minetest.chat_send_player(playerName, "Internal error: Couldn't open file!")
		return false
	end

	file:write(itemName .. "\n")
	file:close()

	minetest.chat_send_player(playerName, '"' .. itemName .. '"' .. " added to " .. '"' .. packName .. '"' .. "!")
	return true

end

packs_api.delete_from_pack = function (playerName, packName, itemName)
	
	if (not packs.exists(playerName, packName)) then return end

	local contains = false

	for line in io.lines(packs_api.folderName .. packName) do

		if (line == itemName) then
			
			contains = true
			break
		end
	end

	if (contains) then

		os.execute("grep -vwE " .. '"' .. itemName .. '"' .. " " .. packs_api.folderName .. packName .. " > pack_save")
		os.execute("mv pack_save " .. packs_api.folderName .. packName)
	
		minetest.chat_send_player(playerName, "Item removed!")

	else

		minetest.chat_send_player(playerName, "Pack doesn't contain item!")
	
	end
		
	return contains	

end

packs_api.get_pack = function (player, packName)
	
	if (player == nil or packName == "") then return end

	local inv = player:get_inventory()

	for line in io.lines(packs_api.folderName .. packName) do

		local stk = {name=line, count=1}

		if (not inv:contains_item("main", stk)) then

			inv:add_item("main", stk)

		end

	end

end

packs_api.show_pack_content = function (playerName, packName)
	
	if (not packs.exists(playerName, packName)) then return end

	minetest.chat_send_player(playerName, "Pack " .. packName .. ":" )
	
	for line in io.lines(packs_api.folderName .. packName) do

		minetest.chat_send_player(playerName, line)

	end
end

packs_api.list_all_packs = function ()
	
end

packs.exists = function (playerName, packName)
	
	if (not files.exists(packs_api.folderName .. packName)) then 
		minetest.chat_send_player(playerName, "Pack doesn't exist!")
		return false
	end

	return true
end

-- Methods

files = {}

files.exists = function (path)
	
	local file = io.open(path, "r")

	if (file == nil) then

		return false

	else

		file:close()
		return true
	end

end