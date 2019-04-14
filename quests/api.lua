function quests.show_text(text, player)
	local parts = text:split("\n")
	for i,txt in ipairs(parts) do
		minetest.after(2.9*(i-1), function (txt, player)
			if not(minetest.get_player_by_name(player)) then return end
			cmsg.push_message_player(minetest.get_player_by_name(player), txt)
		end, txt, player)
	end
end


function quests.new(player, title, text)
	local quest = {
		title = title,
		done = false,
		goals = {},
		xp = 0,
		text = text or "",
	}

	return quest
end

function quests.add_quest(player, quest)
	if not quests.player_quests[player] then
		quests.player_quests[player] = {}
	end
	print("[quests] add quest")
	table.insert(quests.player_quests[player], quest)
	quests.save()
	
	quests.update_hud(minetest.get_player_by_name(player),player)

	if #quest.goals > 0 then
		quests.show_text(quest.text .. "\n" .. quest.goals[1].description, player)
	else
		quests.show_text(quest.text, player)
	end

	return #quests.player_quests[player]
end

function quests.has_quest(name, title)
	if not(quests.player_quests[name]) then
		return false
	end

	for i,def in ipairs(quests.player_quests[name]) do
		if def.title .. (def.id or "") == title then
			return true
		end
	end
	
	return false
end

function quests.finish_quest(player, quest)
	if not(quest.done) then
		cmsg.push_message_player(minetest.get_player_by_name(player), "[quest] You completed " .. quest.title)
	end
	quest.done = true
	if quests.callback then
		quests.callback(minetest.get_player_by_name(player))
	end
end
