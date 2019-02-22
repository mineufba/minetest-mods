painting_tools = {}

-- Alias -------------------------------------------------------------

minetest.register_alias("brush", modName .. ":brush")

-- Register ----------------------------------------------------------

minetest.register_tool(modName .. ":brush", {
  description = "Brush",
  inventory_image = modName .. "_brush.png",

  on_place = function(itemstack, user, pointed_thing)

    if pointed_thing.type == "node" then 

      local fromNode = user:get_inventory():get_stack("main", 1)
      local toNode = user:get_inventory():get_stack("main", 2)

      if fromNode:get_definition().type ~= "node" then return end
      if toNode:get_definition().type ~= "node" then return end

      fromNode = fromNode:get_name()
      toNode = toNode:get_name()

      local pos = pointed_thing.under
      local pointedNode = minetest.get_node(pos)

      if (fromNode and toNode and pointedNode) then

      	  rollback.used_tool(user)

	      painting_tools.brush(user, fromNode, toNode, pos, tools.intensity[user:get_player_name()])
	  end

    end
  end
})

-- Methods -----------------------------------------------------------

painting_tools.brush = function (player, fromNode, toNode, pos, loop)
	
	if (not base_functions.canPlayerPlaceAt(player, pos)) then return end

	local pointedNode = minetest.get_node(pos)

	if (pointedNode == nil or base_functions.is_pos_air(pos) or (pointedNode.name ~= fromNode)) then return end

	local faceDir = base_functions.getPlayerLookDir(player)

	local isVisible = base_functions.hasAirInDirs(pos, {x=faceDir.x, y=faceDir.y*-1, z=faceDir.z})

	if (not isVisible) then return end

	local newNode = {name=toNode, param2=pointedNode.param2}
	
	rollback.set_node(player, pos, newNode)
	
	if (loop > 1) then

	    painting_tools.brush(player, fromNode, toNode, {x = pos.x,	y = pos.y, z = pos.z - 1}, loop - 1)
	    painting_tools.brush(player, fromNode, toNode, {x = pos.x,	y = pos.y, z = pos.z + 1}, loop - 1)
	    painting_tools.brush(player, fromNode, toNode, {x = pos.x,	y = pos.y - 1, z = pos.z}, loop - 1)
	    painting_tools.brush(player, fromNode, toNode, {x = pos.x,	y = pos.y + 1, z = pos.z}, loop - 1)
	    painting_tools.brush(player, fromNode, toNode, {x = pos.x - 1,	y = pos.y, z = pos.z}, loop - 1)
	    painting_tools.brush(player, fromNode, toNode, {x = pos.x + 1,	y = pos.y, z = pos.z}, loop - 1)
	end

end