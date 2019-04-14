
-- exploring
minetest.register_node("quests:map", {
	description = "Map",
	tiles = {"quests_map_top.png", "quests_map_top.png", "quests_map.png", "quests_map.png", "quests_map.png", "quests_map.png"},
	groups = {quest = 1, cracky = 3},
	on_punch = function(pos, node, player, pointed_thing)
		minetest.remove_node(pos)
	end,
})

minetest.register_node("quests:ray", {
	description = "Ray",
	tiles = {"quests_glowing_ray.png"},
	groups = {cracky = 1, ray=1},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	light_source = 7,
	node_box = {
		type = "fixed",
		fixed = {
				{-0.2, -0.5, -0.2, 0.2, 0.5, 0.2},
			},
	},
	drop = "",
})