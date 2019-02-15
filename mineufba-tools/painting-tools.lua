painting_tools = {}

-- Alias -------------------------------------------------------------

minetest.register_alias("brush", modName .. ":brush")

-- Register ----------------------------------------------------------

minetest.register_tool(modName .. ":brush", {
  description = "Brush",
  inventory_image = modName .. "_brush.png",

  on_place = function(itemstack, user, pointed_thing)


    if pointed_thing.type == "node" then 

      local fromNode = user:get_inventory():get_stack("main", 1):get_name()
      local toNode = user:get_inventory():get_stack("main", 2):get_name()

      local pos = pointed_thing.under
      local pointedNode = minetest.get_node(pos)

      if (fromNode and toNode and pointedNode) then
	      painting_tools.brush(user, fromNode, toNode, pointedNode, pos, tools.intensity)
	  end

    end
  end
})

-- Methods -----------------------------------------------------------

painting_tools.brush = function (player, fromNode, toNode, pointedNode, pos, loop)

	if (tools.is_pos_air(pos) or (pointedNode.name ~= fromNode)) then return end

	-- If there's air in any side of the block
	local isVisible = false

	for i=-1,1,2 do
		if (isVisible) then break end

		isVisible = tools.is_pos_air({x=pos.x+i,y=pos.y,z=pos.z})
	end
	for j=-1,1,2 do
		if (isVisible) then break end

		isVisible = tools.is_pos_air({x=pos.x,y=pos.y+j,z=pos.z})
	end
	for k=-1,1,2 do
		if (isVisible) then break end

		isVisible = tools.is_pos_air({x=pos.x,y=pos.y,z=pos.z+k})
	end

	if (not isVisible) then return end

	local newNode = {name=toNode, param2=pointedNode.param2}

	minetest.set_node(pos, newNode)

	if (loop > 1) then

		print("next")

		loop = loop - 1

		for i=-1,1,1 do
			for j=-1,1,1 do
				for k=-1,1,1 do

					local newPos = {
						x = pos.x + i,
						y = pos.y + j,
						z = pos.z + k
					}

					painting_tools.brush(player, fromNode, toNode, pointedNode, newPos, loop)
				end
			end	
		end
	end


end