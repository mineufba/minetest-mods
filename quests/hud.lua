minetest.register_on_joinplayer(function(player)
	if not player then
		return
	end
	local name = player:get_player_name()

	quests.hud[name] = player:hud_add({
		hud_elem_type = "text",
		name = "quests",
		text = "",
		position = {x = 1, y = 0.2},
		alignment = {x = -1, y = 1},
		offset = {x=-10,y=10},
		number = "0xFFFFFF",
	})

	minetest.after(1, function(player,name)
		quests.update_hud(player,name)
	end, player, name)
end)

function quests.update_hud(player,name)
	if quests.hud[name] == nil then return end

	local player_quests = quests.player_quests[name]
	if not player_quests or #player_quests == 0 then
		player:hud_change(quests.hud[name], "text", "")
		return
	end

	local txt = ""
	for _, quest in pairs(player_quests) do
		if not(quest.done) and not(quest.hidden) then
			txt = txt .. " -> " .. (quest.title or "[NO TITLE]") .. "\n"
			for _, goal in pairs(quest.goals) do
				if (not goal.requires or goal.requires.done) and not(goal.done) then
					txt = txt .. "     [ ] " .. (goal.title or "[NO TITLE]") .. " (" .. tostring(goal.progress) ..
		   					"/" .. tostring(goal.max) .. ")\n"
				end
			end
		end
	end

	player:hud_change(quests.hud[name], "text", txt)
end

quests.show_quests_form = "size[8,7.5;]" .. "textlist[-0.1,-0.1;8,7.75;quests;%s]"

function quests.format_goal(player, quest, goal)
	-- TODO: support formatting for more than just digging and placing
	if goal.done then
		return "#999999     \\[x\\] " .. (goal.title or "\\[NO TITLE\\]") .. " (" .. tostring(goal.progress) ..
		   	"/" .. tostring(goal.max) .. ")"
	else
		return "     \\[ \\] " .. (goal.title or "\\[NO TITLE\\]") .. " (" .. tostring(goal.progress) ..
		   "/" .. tostring(goal.max) .. ")"
	end
end


function quests.get_formspec(name)
	local player_quests = quests.player_quests[name]
	if not player_quests or #player_quests == 0 then
		local s = quests.show_quests_form
		s = string.format(s, "You have not got any quests yet.")
		return s
	end

	local s = quests.show_quests_form
	local txt = ""
	for _, quest in pairs(player_quests) do
		if quest.done then
			txt = txt .. "#999999 -> " .. (quest.title or "\\[NO TITLE\\]") .. " (Completed),"
		else
			txt = txt .. " -> " .. (quest.title or "\\[NO TITLE\\]") .. ","
			for _, goal in pairs(quest.goals) do
				if not goal.requires or goal.requires.done then
					txt = txt .. quests.format_goal(name, quest, goal) .. ","
				end
			end
		end
	end
	s = string.format(s, txt)
	return s
end
