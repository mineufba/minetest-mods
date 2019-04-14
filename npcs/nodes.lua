minetest.register_node("npcs:spawner", {
	description = "NPC Spawner",
	drawtype = "airlike",
})

minetest.register_abm({
	nodenames = {"npcs:spawner"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node(pos, {name = npcs.all_npcs[math.random(#npcs.all_npcs)], param2 = math.random(0,3)})
	end,
})