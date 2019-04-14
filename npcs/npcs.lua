npcs.register_npc("npcs:tonho", {
	tiles = {"npc_1.png"},

	description = "Tonho",

	npc_type = "texts",
	npc_texts = {
		"Que tal um lanchinho?",
		"Vai um café?",
		"E um suco?"
	}
})

npcs.register_npc("npcs:ceag", {
	tiles = {"npc_1.png"},

	description = "CEAG",

	npc_type = "texts",
	npc_texts = {
		"Posso ajudar?",
		"Precisa imprimir o histórico?",
		"Precisa mudar a senha do SIAC? Sinto muito, não tem como..."
	}
})

-- npcs.register_npc("npcs:farmer_1", {
-- 	tiles = {"npc_1.png"},
-- 	npc_type = "shop",
-- 	npc_text = "Hi! Do you want to buy an item?",
-- 	npc_items = {
-- 		{
-- 			input = "money:silver_coin",
-- 			output = "farming:apple 9",
-- 			text = "1 Silver Coin -> 8 Apple",
-- 		}, {
-- 			input = "money:silver_coin 1",
-- 			output = "farming:slice_of_bread 9",
-- 			text = "4 Silver Coin -> 4 Slice of Bread",
-- 		}, {
-- 			input = "money:silver_coin 1",
-- 			output = "default:mushroom 2",
-- 			text = "1 Silver Coin -> 2 Mushroom",
-- 		}
-- 	},
-- })

-- npcs.register_npc("npcs:miner_1", {
-- 	tiles = {"npc_3.png"},
-- 	npc_type = "shop",
-- 	npc_text = "Hi! Do you want to buy an item?",
-- 	npc_items = {
-- 		{
-- 			input = "money:silver_coin 10",
-- 			output = "furnace:furnace",
-- 			text = "10 Silver Coin -> 1 Furnace",
-- 		}, {
-- 			input = "money:silver_coin 10",
-- 			output = "furnace:anvil",
-- 			text = "10 Silver Coin -> 1 Anvil",
-- 		}, {
-- 			input = "money:silver_coin",
-- 			output = "torch:torch 4",
-- 			text = "1 Silver Coin -> 4 Torch",
-- 		}, {
-- 			input = "money:coin",
-- 			output = "default:pick",
-- 			text = "1 Gold Coin -> 1 Iron Pick",
-- 		}, {
-- 			input = "default:stone_item 999",
-- 			output = "money:silver_coin 5",
-- 			text = "999 Stone -> 5 Silver Coin",
-- 		}
-- 	},
-- })

-- npcs.register_npc("npcs:hunter_1", {
-- 	tiles = {"npc_2.png"},
-- 	npc_type = "quest",
-- 	npc_get_quest = function(pos, player)
		
-- 		local quest = quests.new(nil, "Test", "Test")
-- 		quest.id = tostring(minetest.get_day_count()) .. " " .. minetest.pos_to_string(pos)
-- 		local goal_1 = quests.add_place_goal(quest, "Place dirt", {"default:dirt"}, 1, "Place some dirt blocks!")
-- 		local goal_2 = quests.add_talk_goal(quest, "Talk", pos, "Place some dirt blocks!")
		
-- 		goal_2.requires = goal_1
		
-- 		return quest
-- 	end,
-- })

-- npcs.register_npc("npcs:builder_1", {
-- 	tiles = {"npc_4.png"},
-- 	npc_type = "texts",
-- 	npc_texts = {
-- 		"Hello!",
-- 		"Hi!",
-- 		"Hey!",
		
-- 		"Hello.\nHow are you?",
-- 		"Hi.\nHow are you?",
-- 		"Hey.\nHow are you?",
-- 	},
-- })

--TEST
--npcs.register_npc("npcs:farmer", {
--	tiles = {"npc_1.png"},
--	visual_scale = 1.0,
--	npc_type = "quest",
--	npc_text = "Hi!",
--	npc_quest_title = "Test",
--	npc_get_quest = function(pos, player)
--		local quest = quests.new(nil, "Test", "Test")
--		quest.id = tostring(minetest.get_day_count()) .. " " .. minetest.pos_to_string(pos)
--		local goal_1 = quests.add_place_goal(quest, "Place dirt", {"default:dirt"}, 1, "Place some dirt blocks!")
--		local goal_2 = quests.add_talk_goal(quest, "Talk", pos, "Place some dirt blocks!")
--		
--		goal_2.requires = goal_1
--		
--		return quest
--	end,
--	npc_get_quests = function(pos, player)
--		local my_quests = {}
--	
--		do
--			local quest = quests.new(nil, "Test 1", "Test 1")
--			local goal_1 = quests.add_place_goal(quest, "Place dirt", {"default:dirt"}, 10, "Place some dirt blocks!")
--			table.insert(my_quests, quest)
--		end
--		
--		do
--			local quest = quests.new(nil, "Test 2", "Test 2")
--			local goal_1 = quests.add_place_goal(quest, "Place stone", {"default:stone"}, 10, "Place some stone blocks!")
--			table.insert(my_quests, quest)
--		end
--		
--		return my_quests
--	end,
--	npc_items = {
--		{
--			input = "default:stone_item",
--			output = "default:pick",
--			text = "Stone -> Pick",
--		}
--	},
--})
