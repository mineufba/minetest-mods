function npcs.register_npc(name, def)
	npcs.npcs[name] = true
	table.insert(npcs.all_npcs, name)

	def.description = def.description or "NPC"
	def.groups = def.groups or ""
	
	def.drawtype = def.drawtype or "mesh"
	if def.drawtype == "mesh" then
		def.mesh = def.mesh or "npc.x"
		def.paramtype = def.paramtype or "light"
		def.paramtype2 = def.paramtype2 or "facedir"
		def.visual_scale = def.visual_scale or 1.0
	end
	
	def.tiles = def.tiles or {"character.png"}

	if def.npc_type == "quest" then
		def.on_rightclick = function(pos, node, player, itemstack, pt)
			local name = player:get_player_name()
			if quests.process_npc_goals(name, "talk", name) then
				return
			end
		
			local q = def.npc_get_quest(pos, player)
			
			if not(quests.has_quest(name, q.title .. (q.id or ""))) then
				local d = dialogue.new(q.text)
			
				d:add_option("Ok", function(n)
					quests.add_quest(n, q)
				end)
				
				d:add_option("Quit", function(n)
				end)
				
				d:show(name)
			end
		end
	elseif def.npc_type == "text" then
		def.on_rightclick = function(pos, node, player, itemstack, pt)
			if quests.process_npc_goals(player:get_player_name(), "talk", name) then
				return
			end
			
			local name = player:get_player_name()
			quests.show_text(def.npc_text, name)
		end
	elseif def.npc_type == "texts" then
		def.on_rightclick = function(pos, node, player, itemstack, pt)
			if quests.process_npc_goals(player:get_player_name(), "talk", name) then
				return
			end
			
			local name = player:get_player_name()
			quests.show_text(def.npc_texts[math.random(#def.npc_texts)], name)
		end
	elseif def.npc_type == "quests" then
		def.on_rightclick = function(pos, node, player, itemstack, pt)
			if quests.process_npc_goals(player:get_player_name(), "talk", name) then
				return
			end
		
			local d = dialogue.new(def.npc_text)
			local my_quests = def.npc_get_quests(pos, player)
			
			
			for i, q in ipairs(my_quests) do
				if not(quests.has_quest(player:get_player_name(), q.title .. (q.id or ""))) then
					d:add_option(q.title, function(name)
						quests.add_quest(name, q)
					end)
				end
			end
			
			d:show(player:get_player_name())
		end
	elseif def.npc_type == "shop" then
		def.on_rightclick = function(pos, node, player, itemstack, pt)
			if quests.process_npc_goals(player:get_player_name(), "talk", name) then
				return
			end
			
			local d = dialogue.new(def.npc_text)
			
			
			for i, item in ipairs(def.npc_items) do
				d:add_option(item.text, function(name)
					if player then
						local inv = player:get_inventory()
						
						if inv:contains_item("main", item.input) and inv:room_for_item("main", item.output) then
							inv:remove_item("main", item.input)
							inv:add_item("main", item.output)	
						end
					end
				end)
			end
			
			d:show(player:get_player_name())
		end
	end

	def.on_construct = function (pos)
			
		local meta = minetest.get_meta(pos)

		meta:set_string("infotext", string.format("%s (Botão direito para falar)", def.description))

	end
	minetest.register_node(name, def)	
end