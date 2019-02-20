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
	
	if (not files.exists(packs_api.folderName .. packName)) then 
		minetest.chat_send_player(playerName, "Pack doesn't exist!")
		return false
	end

	if (os.remove(packs_api.folderName .. packName)) then

		minetest.chat_send_player(playerName, "Pack deleted!")
		return true
	else

		minetest.chat_send_player(playerName, "Couldn't delete pack!")
		return false
	end
end

packs_api.add_to_pack = function (playerName, packName, itemName)
	
	if (not files.exists(packs_api.folderName .. packName)) then 
		minetest.chat_send_player(playerName, "Pack doesn't exist!")
		return false
	end

	for line in io.lines(packs_api.folderName .. packName) do

		if (line == itemName) then
			minetest.chat_send_player(playerName, "Pack already contains item!")
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

	minetest.chat_send_player(playerName, "Item added!")
	return true

end

packs_api.delete_from_pack = function (playerName, packName, itemName)
	
	if (not files.exists(packs_api.folderName .. packName)) then 
		minetest.chat_send_player(playerName, "Pack doesn't exist!")
		return false
	end

	local contains = false

	for line in io.lines(packs_api.folderName .. packName) do

		if (line == itemName) then
			
			contains = true
			break
		end
	end

	if (contains) then

		local file = io.open(packs_api.folderName .. packName, "rw")

		local content = file:read("*all")

		content:gsub(itemName, "")

		file:write(content)

		file:close()

	else

		minetest.chat_send_player(playerName, "Pack doesn't contain item!")
	end
		
	return contains	

end

packs_api.use_pack = function ()
	
end

packs_api.list_packs = function ()
	
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