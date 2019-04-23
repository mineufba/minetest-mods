-- Define Goals ---------------------------------------------------

function quests.add_dig_goal(quest, title, node, number, description, ending)
	local goal = {
		title = title,
		type = "dig",
		node = node,
		max = number,
		progress = 0,
		done = false,

		description = description or "",
		ending = ending or nil
	}
	table.insert(quest.goals, goal)
	return goal
end

function quests.add_place_goal(quest, title, node, number, description, ending)
	local goal = {
		title = title,
		type = "placenode",
		node = node,
		max = number,
		progress = 0,
		done = false,

		description = description or "",
		ending = ending or nil
	}
	table.insert(quest.goals, goal)
	return goal
end

function quests.add_craft_goal(quest, title, item, number, description, ending)
	local goal = {
		title = title,
		type = "craft",
		item = item,
		node = item,
		max = number,
		progress = 0,
		done = false,

		description = description or "",
		ending = ending or nil
	}
	table.insert(quest.goals, goal)
	return goal
end

function quests.add_talk_goal(quest, title, npc, description, ending)
	local goal = {
		title = title,
		type = "talk",
		npc = npc,
		progress = 0,
		max = 1,
		done = false,

		description = description or "",
		ending = ending or nil
	}
	table.insert(quest.goals, goal)
	return goal
end

function quests.add_give_goal(quest, title, npc, item, number, description, ending)
	local goal = {
		title = title,
		type = "give",
		npc = npc,
		item = item,
		node = item,
		max = number,
		progress = 0,
		done = false,

		description = description or "",
		ending = ending or nil
	}
	table.insert(quest.goals, goal)
	return goal
end

function quests.add_reach_goal(quest, title, area, description, ending)
	
	local goal = {

		title = title,
		type = "reach",
		area = area,
		progress = 0,
		max = 1,
		done = false,

		description = description or "",
		ending = ending or nil
	}
	table.insert(quest.goals, goal)
	return goal
end


-- Process Goals ---------------------------------------------------
function quests.finish_goal(player, quest, goal)
	if not(goal.done) then
		
		if goal.reward then
			minetest.get_player_by_name(player):get_inventory():add_item("main", goal.reward)

			if goal.ending then

				quests.show_text(goal.ending, player)
			else 

				cmsg.push_message_player(minetest.get_player_by_name(player), "[quest] You completed a goal and you got a reward!")
			end

		else
			if goal.ending then

				quests.show_text(goal.ending, player)
			else 

				cmsg.push_message_player(minetest.get_player_by_name(player), "[quest] You completed a goal!")
			end
		end

		for i = 1, #quest.goals do
			if quest.goals[i].requires and quest.goals[i].requires.title == goal.title then
				if quest.goals[i].description then
					quests.show_text(quest.goals[i].description, player)
				end
			end
		end
	end

	goal.done = true
	if not quest.done then
		local all_done = true
		for i = 1, #quest.goals do
			if not quest.goals[i].done then
				all_done = false
				break
			end
		end
		if all_done then
			quests.finish_quest(player, quest)
		end
	end
	quests.save()
end



function quests.process_node_count_goals(player, type, node, count)
	count = count or 1
	local player_quests = quests.player_quests[player]
	if not(player_quests) or #player_quests == 0 then return end
	table.foreach(player_quests, function(_, quest)
		if not(quest.goals) or #quest.goals == 0 then return end
		table.foreach(quest.goals, function(_, goal)
			if (not goal.requires or goal.requires.done) and
					goal.type == type then
				for i=1,#goal.node do
					if goal.node[i] == node then
						goal.progress = goal.progress + count
						if goal.progress >= goal.max then
							goal.progress = goal.max

							quests.finish_goal(player, quest, goal)
							goal.done = true
						end
						quests.update_hud(minetest.get_player_by_name(player),player)
						quests.save()
					end
				end
			end
		end)
	end)
end

function quests.process_npc_goals(player, type, npc, count)
	local found = false
	count = count or 1
	local player_quests = quests.player_quests[player]
	if not(player_quests) or #player_quests == 0 then return end
	table.foreach(player_quests, function(_, quest)
		if not(quest.goals) or #quest.goals == 0 then return end
		table.foreach(quest.goals, function(_, goal)
			if (not goal.done) and (not goal.requires or goal.requires.done) and
					goal.type == type then
				print("-> talk")
				if (npc == goal.npc) then
					if goal.type == "give" then
						for i=1,#goal.node do
							if goal.node[i] == node then
								goal.progress = goal.progress + count
								if goal.progress >= goal.max then
									goal.progress = goal.max

									quests.finish_goal(player, quest, goal)
									goal.done = true
								end
								quests.update_hud(minetest.get_player_by_name(player),player)
								quests.save()
								
								found = true
							end
						end
					elseif goal.type == "talk" then
						goal.progress = goal.progress + count
						if goal.progress >= goal.max then
							goal.progress = goal.max

							quests.finish_goal(player, quest, goal)
							goal.done = true
						end
						quests.update_hud(minetest.get_player_by_name(player),player)
						quests.save()
						
						found = true
					end
				end
			end
		end)
	end)
	
	return found
end

function quests.process_reach_goals(player, count)
	count = count or 1

	local name = player:get_player_name()

	local player_quests = quests.player_quests[name]
	
	if not(player_quests) or #player_quests == 0 then return end
	
	table.foreach(player_quests, function(_, quest)
	
		if not(quest.goals) or #quest.goals == 0 then return end
		
		table.foreach(quest.goals, function(_, goal)
		
			if (not goal.requires or goal.requires.done) and
					goal.type == "reach" then
				
				local pos = player:get_pos()

				for id, area in pairs(areas:getAreasAtPos(pos)) do

					if (area.name == goal.area) then

						goal.progress = goal.progress + count
						if goal.progress >= goal.max then
							goal.progress = goal.max

							quests.finish_goal(name, quest, goal)
							goal.done = true
						end
						quests.update_hud(minetest.get_player_by_name(name),name)
						quests.save()
					end
				end
			end
		end)
	end)
end

-- Minetest ---------------------------------------------------


minetest.register_on_dignode(function(pos, oldnode, digger)
	if not digger or not digger:is_player() or
			not quests.player_quests[digger:get_player_name()] then
		return
	end

	quests.process_node_count_goals(digger:get_player_name(), "dig", oldnode.name)
end)

minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack, pointed_thing)
	if not placer or not placer:is_player() or
			not quests.player_quests[placer:get_player_name()] then
		return
	end

	quests.process_node_count_goals(placer:get_player_name(), "placenode", newnode.name)
end)

minetest.register_on_craft(function(itemstack, player, old_craft_grid, craft_inv)
	if not player or not player:is_player() or
			not quests.player_quests[player:get_player_name()] then
		return
	end

	quests.process_node_count_goals(player:get_player_name(), "craft", itemstack:get_name(),itemstack:get_count())
end)


minetest.register_globalstep(function(dtime)

	for _,player in ipairs(minetest.get_connected_players()) do
	
		quests.process_reach_goals(player)
	end

	
end)