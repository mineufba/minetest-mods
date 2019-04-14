function quests.load()
	local input = io.open(quests.file, "r")
	if input then
		local str = input:read("*all")
		if str then
			if minetest.deserialize(str) then
				quests.player_quests = minetest.deserialize(str)
			end
		else
			print("[WARNING] quest file is empty")
		end
		io.close(input)
	else
		print("[ERROR] couldnt find quest file")
	end
end

function quests.save()
	
	if quests.player_quests then
	
		local output = io.open(quests.file, "w")
		local str = core.serialize(quests.player_quests)
		output:write(str)
		io.close(output)
	end
end
