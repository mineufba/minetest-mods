building_tools = {}

-- Alias ---------------------------------------------------------------------------------

minetest.register_alias("extrude_y", modName .. ":extrude_y")
minetest.register_alias("extrude_x_z", modName .. ":extrude_x_z")

-- Functions ---------------------------------------------------------------------------------

building_tools.extrude_y = function (player, position, direction, nodeInfo, isSure, remove, loop)
  
  if (base_functions.is_pos_air(position) or minetest.get_node(position).name ~= nodeInfo.name) then return end 

  p = {x = position.x,
       y = position.y+direction,
       z = position.z}  

  if (isSure == false) then
    
    isSure = true
    
    remove = not base_functions.is_pos_air(p)

  end

  if (not base_functions.canPlayerPlaceAt(player, p)) then return end 

  if (remove == false) then    
    -- Didn't place block yet
    if (minetest.get_node(p).name ~= nodeInfo.name) then
      
      rollback.set_node(player, p, {name=nodeInfo.name, param2=nodeInfo.param2})

      p = {x = position.x+1,
           y = position.y,
           z = position.z}
      building_tools.extrude_y(player, p, direction, nodeInfo, isSure, remove, loop)

      p = {x = position.x-1,
           y = position.y,
           z = position.z}
      building_tools.extrude_y(player, p, direction, nodeInfo, isSure, remove, loop)

      p = {x = position.x,
           y = position.y,
           z = position.z+1}
      building_tools.extrude_y(player, p, direction, nodeInfo, isSure, remove, loop)

      p = {x = position.x,
           y = position.y,
           z = position.z-1}
      building_tools.extrude_y(player, p, direction, nodeInfo, isSure, remove, loop)

    end
  else

    p = {x = position.x,
         y = position.y - direction,
         z = position.z}

    if (base_functions.is_pos_air(p)) then

      rollback.set_node(player, position, {name="air"})

      p = {x = position.x+1,
           y = position.y,
           z = position.z}
      building_tools.extrude_y(player, p, direction, nodeInfo, isSure, remove, loop)

      p = {x = position.x-1,
           y = position.y,
           z = position.z}
      building_tools.extrude_y(player, p, direction, nodeInfo, isSure, remove, loop)

      p = {x = position.x,
           y = position.y,
           z = position.z+1}
      building_tools.extrude_y(player, p, direction, nodeInfo, isSure, remove, loop)

      p = {x = position.x,
           y = position.y,
           z = position.z-1}
      building_tools.extrude_y(player, p, direction, nodeInfo, isSure, remove, loop)  
    end
  end

  p = {x = position.x,
       y = position.y+direction,
       z = position.z}

  if (minetest.get_node(p).name == nodeInfo.name and loop >= 2) then
    building_tools.extrude_y(player, p, direction, nodeInfo, isSure, remove, (loop - 1))
  end
end

----------------------------------------------------

building_tools.extrude_x_z = function (player, position, direction, nodeInfo, isSure, remove, side, loop)

  if (base_functions.is_pos_air(position) or minetest.get_node(position).name ~= nodeInfo.name) then return end 

  if (isSure == false) then

    isSure = true

    local d = -direction

    direction = {}

    direction.x = d * side.x
    direction.z = d * side.z
    
    nextPos = {x = position.x+direction.x,
         y = position.y,
         z = position.z+direction.z}  

    remove = not base_functions.is_pos_air(nextPos)

  end

  p = {x = position.x+direction.x,
       y = position.y,
       z = position.z+direction.z}

  if (not base_functions.canPlayerPlaceAt(player, p)) then return end

  if (remove == false) then    
    -- Didn't place block yet
    if (minetest.get_node(p).name ~= nodeInfo.name) then

      rollback.set_node(player, p, {name=nodeInfo.name, param2=nodeInfo.param2})

      p = {x = position.x+side.z,
           y = position.y,
           z = position.z+side.x}
      building_tools.extrude_x_z(player, p, direction, nodeInfo, isSure, remove, side, loop)

      p = {x = position.x-side.z,
           y = position.y,
           z = position.z-side.x}
      building_tools.extrude_x_z(player, p, direction, nodeInfo, isSure, remove, side, loop)

      p = {x = position.x,
           y = position.y+1,
           z = position.z}
      building_tools.extrude_x_z(player, p, direction, nodeInfo, isSure, remove, side, loop)

      p = {x = position.x,
           y = position.y-1,
           z = position.z}
      building_tools.extrude_x_z(player, p, direction, nodeInfo, isSure, remove, side, loop)
    
    end

  else

    p = {x = position.x - direction.x,
         y = position.y,
         z = position.z - direction.z}

    if (base_functions.is_pos_air(p)) then

      rollback.set_node(player, position, {name="air"})

      p = {x = position.x+side.z,
           y = position.y,
           z = position.z+side.x}
      building_tools.extrude_x_z(player, p, direction, nodeInfo, isSure, remove, side, loop)

      p = {x = position.x-side.z,
           y = position.y,
           z = position.z-side.x}
      building_tools.extrude_x_z(player, p, direction, nodeInfo, isSure, remove, side, loop)

      p = {x = position.x,
           y = position.y+1,
           z = position.z}
      building_tools.extrude_x_z(player, p, direction, nodeInfo, isSure, remove, side, loop)

      p = {x = position.x,
           y = position.y-1,
           z = position.z}
      building_tools.extrude_x_z(player, p, direction, nodeInfo, isSure, remove, side, loop)

    end
  end

  p = {x = position.x+direction.x,
       y = position.y,
       z = position.z+direction.z}

  if (minetest.get_node(p).name == nodeInfo.name and loop >= 2) then
    building_tools.extrude_x_z(player, p, direction, nodeInfo, isSure, remove, side, (loop - 1))
  end

end

-- Tools ---------------------------------------------------------------------------------

minetest.register_tool(modName .. ":extrude_y", {
  description = "Extrude Y",
  inventory_image = modName .. "_extrude_y.png",
  on_use = function(itemstack, user, pointed_thing)
    if pointed_thing.type == "node" then      
      pos = pointed_thing.under
      nodeInfo = minetest.get_node(pos)

      rollback.used_tool(user)
      building_tools.extrude_y(user, pos, -1, nodeInfo, false, false, tools.intensity[user:get_player_name()]);
    end
  end,
  on_place = function(itemstack, user, pointed_thing)
    if pointed_thing.type == "node" then        
      pos = pointed_thing.under
      nodeInfo = minetest.get_node(pos)

      rollback.used_tool(user)
      building_tools.extrude_y(user, pos, 1, nodeInfo, false, false, tools.intensity[user:get_player_name()]);
    end
  end
})

minetest.register_tool(modName .. ":extrude_x_z", {
  description = "Extrude XZ",
  inventory_image = modName .. "_extrude_x_z.png",
  on_use = function(itemstack, user, pointed_thing)
    if pointed_thing.type == "node" then      

      dir = base_functions.getPlayerLookDir(user)

      pos = pointed_thing.under
      nodeInfo = minetest.get_node(pos)

      rollback.used_tool(user)
      building_tools.extrude_x_z(user, pos, 1, nodeInfo, false, false, dir, tools.intensity[user:get_player_name()]);
    end
  end,
  on_place = function(itemstack, user, pointed_thing)
    if pointed_thing.type == "node" then        

      dir = base_functions.getPlayerLookDir(user)

      pos = pointed_thing.under
      nodeInfo = minetest.get_node(pos)

      rollback.used_tool(user)
      building_tools.extrude_x_z(user, pos, -1, nodeInfo, false, false, dir, tools.intensity[user:get_player_name()]);
    end
  end
})