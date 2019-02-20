terrain_tools = {}

-- Alias -------------------------------------------------------------

minetest.register_alias("plant_tree", modName .. ":plant_tree")

-- Methods -----------------------------------------------------------

terrain_tools.plant_tree = function (player, pos)
	
	if (not base_functions.canPlayerPlaceAt(player, pos)) then return end
	
	for i=1,5 do

		pos.y = pos.y + 1
		rollback.set_node(player, pos, {name="default:tree"})

	end

	pos.x = pos.x - 1
	pos.y = pos.y - 1
	pos.z = pos.z - 1

	initialX = pos.x
	initialZ = pos.z

	for i=1,3 do
		for j=1,3 do
			for k=1,3 do
				
				if (i == 3 or (j ~= 2 or k ~= 2)) then

					rollback.set_node(player, pos, {name="default:leaves"})

				end

				pos.z = pos.z + 1

			end

			pos.x = pos.x + 1
			pos.z = initialZ
		end

		pos.x = initialX
		pos.y = pos.y + 1	
	end

end

terrain_tools.remove_tree = function (player, pos)
	
	if (not base_functions.canPlayerPlaceAt(player, pos)) then return end
	
	local node = minetest.get_node(pos)

	if (node.name == "default:tree" or node.name == "default:leaves") then

		rollback.set_node(player, pos, {name="air"})

		terrain_tools.remove_tree(player, {x = pos.x + 1, y = pos.y, z = pos.z})
		terrain_tools.remove_tree(player, {x = pos.x - 1, y = pos.y, z = pos.z})
		terrain_tools.remove_tree(player, {x = pos.x, y = pos.y + 1, z = pos.z})
		terrain_tools.remove_tree(player, {x = pos.x, y = pos.y - 1, z = pos.z})
		terrain_tools.remove_tree(player, {x = pos.x, y = pos.y - 1, z = pos.z + 1})
		terrain_tools.remove_tree(player, {x = pos.x, y = pos.y - 1, z = pos.z - 1})

	end
end

-- Register Tools ----------------------------------------------------

minetest.register_tool(modName .. ":plant_tree", {
  description = "Plant Tree",
  inventory_image = modName .. "_plant_tree.png",
  on_use = function(itemstack, user, pointed_thing)
    
  	if pointed_thing.type ~= "node" then return end

    rollback.used_tool(user)
    terrain_tools.plant_tree(user, pointed_thing.under)

  end,
  on_place = function(itemstack, user, pointed_thing)
    
    if pointed_thing.type ~= "node" then return end

    rollback.used_tool(user)
    terrain_tools.remove_tree(user, pointed_thing.under)

  end
})