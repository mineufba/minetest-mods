rollback = {}

rollback.limit = 30

rollback.logFolder = minetest.get_modpath(modName) .. "/rollback_log/"	

rollback.used_tool = function (player)
	
	local name = player:get_player_name()

	rollback[player:get_player_name()].count = rollback[player:get_player_name()].count + 1

	os.execute("touch " .. rollback.logFolder .. name .. "/" .. rollback[player:get_player_name()].count)

	if (rollback[player:get_player_name()].count - rollback[player:get_player_name()].min >= rollback.limit) then

		os.execute("rm " .. rollback.logFolder .. name .. "/" .. rollback[player:get_player_name()].min)

		rollback[player:get_player_name()].min = rollback[player:get_player_name()].min + 1		

	end

end

rollback.set_node = function (player, pos, node)

	local oldNode = minetest.get_node(pos)

	local name = player:get_player_name()

	local logFile = io.open(rollback.logFolder .. name .. "/" .. rollback[player:get_player_name()].count, "a")

	if (logFile == nil) then print("rollback.set_node - Couldn't open file: " .. rollback.logFolder .. name .. "/" .. rollback[player:get_player_name()].count) return end

	logFile:write(pos.x .. ";" .. pos.y .. ";" .. pos.z .. ";" .. oldNode.name .. ";" .. oldNode.param2 .. "\n")

	logFile:close()

	minetest.set_node(pos, node)

end

rollback.clear_file = function (player)
	
	local name = player:get_player_name()

	os.execute("rm " .. rollback.logFolder .. name .. "/" .. rollback[name].count)

	rollback[name].count = rollback[name].count - 1

	if (rollback[name].count < rollback[name].min) then

		rollback[name].count = 0
		rollback[name].min = 1

	end
end

minetest.register_on_joinplayer(function (player)
	
	os.execute("mkdir " .. rollback.logFolder .. player:get_player_name())

	rollback[player:get_player_name()] = {}

	rollback[player:get_player_name()].count = 0 -- Current file number (0 is no file)
	rollback[player:get_player_name()].min = 1   -- Oldest possible file number

end)

minetest.register_on_leaveplayer(function (player)
	
	os.execute("rm -rf " .. rollback.logFolder .. player:get_player_name());

end)

minetest.register_chatcommand("undo", {
	params = "Times to undo",
	description = "Resets last n modifications made by a tool used by the player",
	func = function(name, param)
		
		local player = minetest.get_player_by_name(name)
		if not player then
			return false, "Player not found"
		end
		
		local times = tonumber(param)

		if (times == nil) then times = 1 end

		if (times > rollback.limit) then times = rollback.limit end

		for i=1,times do

			rollback.reset_changes(player)
		end


	end
})

rollback.reset_changes = function (player)
	
	local name = player:get_player_name()

	if (rollback[player:get_player_name()].count < rollback[player:get_player_name()].min) then 
	
		minetest.chat_send_player(name, "Nothing to undo")
		return 
		
	end

	local lines = {}


	for line in io.lines(rollback.logFolder .. name .. "/" .. rollback[player:get_player_name()].count) do
		lines[#lines + 1] = line
	end

	for i=1,#lines do

		local words = {}

		for w in lines[i]:gmatch("([^;]+)") do words[#words + 1] = w end

		local pos = {x = words[1], y = words[2], z = words[3]}

		local node = {name = words[4], param2 = words[5]}

		minetest.set_node(pos, node)
	end

	minetest.chat_send_player(name, "Blocks modified: " .. tostring(#lines))

	rollback.clear_file(player)
end