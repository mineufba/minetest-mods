-- Quests

minetest.register_on_joinplayer (function (player)

	if not player then	return	end

	quests.player_quests[player:get_player_name()] = {}
	
	local name = player:get_player_name()

	local quest = quests.new(name, "Tutorial", "Preciso ir para a aula...\n" ..
								   "Mas não sei onde fica...\n" ..
								   "E ainda por cima estou com fome...")
	

	local q1 = quests.add_talk_goal(quest, "Falar com Tonho na cantina", "npcs:tonho", "Talvez depois de um lanchinho seja mais fácil encontrar a sala!", "Agora que matei a fome, posso continuar!")
	local q2 = quests.add_talk_goal(quest, "Ir para o CEAG", "npcs:ceag", "Se eu pegar o comprovante de matrícula poderei ver a sala!", "Pronto, agora posso ver onde é a sala!")
	local q3 = quests.add_reach_goal(quest, "Ir para o PAF I", "paf1", "A sala é no PAF 1!", "Cheguei, só falta ir até a sala!")
	local q4 = quests.add_reach_goal(quest, "Ir para sala 207", "paf1_207", "Agora que sei onde é a sala, posso ir até lá!", "Cheguei!")

	q2.requires = q1
	q3.requires = q2
	q4.requires = q3

	quests.add_quest(name, quest)
end)

-- minetest.register_on_joinplayer(function(player)
	
-- 	if not player then	return	end

-- 	quests.player_quests[player:get_player_name()] = {}
	
-- 	local name = player:get_player_name()
	
-- 	--tutorial
-- 	do
-- 		local quest = quests.new(name, "Tutorial", "Hey you!\nI didnt see you before. Are you new here?\nOh, Ok.\nI will help you to find the city \"NAME HERE\".\nYou will be save there.\n But first you need some basic equipment!")
-- 		local q1 = quests.add_dig_goal(quest, "Harvest Dirt/Grass", {"default:dirt", "default:grass", "default:wet_grass"}, 10, "You need to harvest some Dirt to get stones!")
-- 		local q2 = quests.add_dig_goal(quest, "Harvest Grass", {"default:plant_grass", "default:plant_grass_2", "default:plant_grass_3", "default:plant_grass_4", "default:plant_grass_5", "default:liana", "default:grass", "default:wet_grass"}, 12, "Now you need to get some Grass to craft strings.")
-- 		local q3 = quests.add_dig_goal(quest, "Harvest Leaves", {"default:leaves_1", "default:leaves_2", "default:leaves_3" ,"default:leaves_4"}, 6, "Harvest some leaves to craft twigs.")
	
-- 		local q4 = quests.add_place_goal(quest, "Place Workbench", {"default:workbench"}, 1, "You should craft a workbench and place it in front of you!", "If you want to know how to craft things,\n just open the crafting guide I gave you.\nYou can find all craftable items there!")
-- 		local q5 = quests.add_craft_goal(quest, "Craft Stone Axe", {"default:axe_stone"}, 1, "Now you can craft a Stone Axe.")
-- 		local q6 = quests.add_dig_goal(quest, "Harvest Logs", {"default:log","default:log_1","default:log_2","default:log_3", "default:jungle_tree"}, 20, "You can use the Stone Axe to harvest logs.")
-- 		local q7 = quests.add_dig_goal(quest, "Mine Stone", {"default:stone"}, 20, "You can also mine Stone with your Stone Axe.")
-- 		local q8 = quests.add_craft_goal(quest, "Craft a Flint Pick", {"default:flint_pick"}, 1, "Craft a Flint Pick!", "You can use the flint pick to dig harder blocks.")
-- 		local q9 = quests.add_dig_goal(quest, "Mine Iron", {"default:stone_with_iron"}, 2, "Your Flint Pick is strong enough to mine Iron.", "Great! It is time to upgrade your skills now!\nGoto the skills tab in your inventory\nand level up a skill!")
		

-- 		q3.reward = "default:wood_tutorial 3"
-- 		q4.reward = "crafting_guide:book"

-- 		q2.requires = q1
-- 		q3.requires = q2
-- 		q4.requires = q3
-- 		q5.requires = q4
-- 		q6.requires = q5
-- 		q7.requires = q6
-- 		q8.requires = q7
-- 		q9.requires = q8

-- 		quests.add_quest(name, quest)
-- 	end
-- end)