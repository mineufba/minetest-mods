rollback = {}

rollback.logFolder = minetest.get_modpath(modName) .. "/rollback_log/"	

rollback.used_tool = function (player)
	
	rollback.clear_file(player)

end

rollback.set_node = function (player, pos, node)
	
	oldNode = minetest.get_node(pos)

	local logFile = io.open(rollback.logFolder .. player:get_player_name(), "a")

	logFile:write(pos.x .. ";" .. pos.y .. ";" .. pos.z .. ";" .. oldNode.name .. ";" .. oldNode.param2 .. "\n")

	logFile:close()

	minetest.set_node(pos, node)

end

rollback.clear_file = function (player)
	
	local logFile = io.open(rollback.logFolder .. player:get_player_name(), "w")

	logFile:write("")

	logFile:close()
end

minetest.register_on_joinplayer(function (player)
	
	rollback.clear_file(player);

end)

minetest.register_on_leaveplayer(function (player)
	
	os.remove(rollback.logFolder .. player:get_player_name());

end)

minetest.register_chatcommand("undo", {
	params = "",
	description = "Resets last modification made by a tool used by the player",
	func = function(name, param)
		
		local player = minetest.get_player_by_name(name)
		if not player then
			return false, "Player not found"
		end
		
		rollback.reset_changes(player)

	end
})

rollback.reset_changes = function (player)

	lines = {}

	for line in io.lines(rollback.logFolder .. player:get_player_name()) do
		lines[#lines + 1] = line
	end

	for i=1,#lines do

		local words = {}

		for w in lines[i]:gmatch("([^;]+)") do words[#words + 1] = w end

		local pos = {x = words[1], y = words[2], z = words[3]}

		local node = {name = words[4], param2 = words[5]}

		minetest.set_node(pos, node)
	end

	rollback.clear_file(player)
end