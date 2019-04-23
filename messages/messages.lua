function messages.send_messages (name, text)

	if (not messages.players[name]) then

		messages.players[name] = {}
		messages.players[name].busy = false
		messages.players[name].messages = Queue:Create()
	
	end

	messages.players[name].messages:push(text)
end

-- minetest.register_on_joinplayer(function (name)
	
-- 	messages.send_messages(name:get_player_name(), "Aaaa");
-- 	messages.send_messages(name:get_player_name(), "Bbbb");

-- end)

minetest.register_globalstep(function(dtime) 

	for _,player in ipairs(minetest.get_connected_players()) do
		
		local name = player:get_player_name()

		if (messages.players[name] and not messages.players[name].busy) then

			local text = messages.players[name].messages:pop()

			if (text ~= nil) then
				
				formspec.show_message(name, text)
				
				messages.players[name].busy = true

			end
		end
	end
end)

