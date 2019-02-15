building_tools = {}

-- Alias ---------------------------------------------------------------------------------

minetest.register_alias("extrude_y", modName .. ":extrude_y")
minetest.register_alias("extrude_x_z", modName .. ":extrude_x_z")

-- Functions ---------------------------------------------------------------------------------

building_tools.extrude_y = function (player, position, direction, nodeInfo, isSure, remove, loop, full)
  
  if (tools.is_pos_air(position) or minetest.get_node(position).name ~= nodeInfo.name) then
    return
  end 


  p = {x = position.x,
       y = position.y+direction,
       z = position.z}  

  if (isSure == false) then
    isSure = true
    if (tools.is_pos_air(p) == true) then
      remove = false
    else
      remove = true
    end    
  end

  if (not base_functions.canPlayerPlaceAt(player, p)) then
    return
  end 

  if (remove == false) then    
    -- Didn't place block yet
    if (minetest.get_node(p).name ~= nodeInfo.name) then
      rollback.set_node(player, p, {name=nodeInfo.name, param2=nodeInfo.param2})

      if (full) then

        p = {x = position.x+1,
             y = position.y,
             z = position.z}
        building_tools.extrude_y(player, p, direction, nodeInfo, isSure, remove, loop, full)

        p = {x = position.x-1,
             y = position.y,
             z = position.z}
        building_tools.extrude_y(player, p, direction, nodeInfo, isSure, remove, loop, full)

        p = {x = position.x,
             y = position.y,
             z = position.z+1}
        building_tools.extrude_y(player, p, direction, nodeInfo, isSure, remove, loop, full)

        p = {x = position.x,
             y = position.y,
             z = position.z-1}
        building_tools.extrude_y(player, p, direction, nodeInfo, isSure, remove, loop, full)

      end
    end
  else

    rollback.set_node(player, position, {name="air"})
    
    if (full) then

      p = {x = position.x+1,
           y = position.y,
           z = position.z}
      building_tools.extrude_y(player, p, direction, nodeInfo, isSure, remove, loop, full)

      p = {x = position.x-1,
           y = position.y,
           z = position.z}
      building_tools.extrude_y(player, p, direction, nodeInfo, isSure, remove, loop, full)

      p = {x = position.x,
           y = position.y,
           z = position.z+1}
      building_tools.extrude_y(player, p, direction, nodeInfo, isSure, remove, loop, full)

      p = {x = position.x,
           y = position.y,
           z = position.z-1}
      building_tools.extrude_y(player, p, direction, nodeInfo, isSure, remove, loop, full)  
    end
  end

  p = {x = position.x,
       y = position.y+direction,
       z = position.z}

  if (minetest.get_node(p).name == nodeInfo.name and loop >= 2) then
    building_tools.extrude_y(player, p, direction, nodeInfo, isSure, remove, (loop - 1), false)
  end
end

----------------------------------------------------

building_tools.extrude_x_z = function (player, position, direction, nodeInfo, isSure, remove, side, loop, full)

  if (tools.is_pos_air(position) or minetest.get_node(position).name ~= nodeInfo.name) then
    return
  end  
  if (isSure == false) then
    isSure = true

    local d = -direction
    direction = {}

    if (side.x ~= 0) then
      direction.x = 0
      direction.z = d * side.x
    else 
      direction.x = d * side.z
      direction.z = 0
    end

    p = {x = position.x+direction.x,
         y = position.y,
         z = position.z+direction.z}  

    if (tools.is_pos_air(p) == true) then
      remove = false
    else
      remove = true
    end
  end

  p = {x = position.x+direction.x,
       y = position.y,
       z = position.z+direction.z}

  if (remove == false) then    
    -- Didn't place block yet
    if (minetest.get_node(p).name ~= nodeInfo.name) then

      rollback.set_node(player, p, {name=nodeInfo.name, param2=nodeInfo.param2})

      if (full) then

        p = {x = position.x+side.x,
             y = position.y,
             z = position.z+side.z}
        building_tools.extrude_x_z(player, p, direction, nodeInfo, isSure, remove, side, loop, full)

        p = {x = position.x-side.x,
             y = position.y,
             z = position.z-side.z}
        building_tools.extrude_x_z(player, p, direction, nodeInfo, isSure, remove, side, loop, full)

        p = {x = position.x,
             y = position.y+1,
             z = position.z}
        building_tools.extrude_x_z(player, p, direction, nodeInfo, isSure, remove, side, loop, full)

        p = {x = position.x,
             y = position.y-1,
             z = position.z}
        building_tools.extrude_x_z(player, p, direction, nodeInfo, isSure, remove, side, loop, full)
      end
    end
  else

    rollback.set_node(player, position, {name="air"})

    if (full) then
      p = {x = position.x+side.x,
           y = position.y,
           z = position.z+side.z}
      building_tools.extrude_x_z(player, p, direction, nodeInfo, isSure, remove, side, loop, full)

      p = {x = position.x-side.x,
           y = position.y,
           z = position.z-side.z}
      building_tools.extrude_x_z(player, p, direction, nodeInfo, isSure, remove, side, loop, full)

      p = {x = position.x,
           y = position.y+1,
           z = position.z}
      building_tools.extrude_x_z(player, p, direction, nodeInfo, isSure, remove, side, loop, full)

      p = {x = position.x,
           y = position.y-1,
           z = position.z}
      building_tools.extrude_x_z(player, p, direction, nodeInfo, isSure, remove, side, loop, full)

    end
  end

  p = {x = position.x+direction.x,
       y = position.y,
       z = position.z+direction.z}

  if (minetest.get_node(p).name == nodeInfo.name and loop >= 2) then
    building_tools.extrude_x_z(player, p, direction, nodeInfo, isSure, remove, side, (loop - 1), false)
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
      building_tools.extrude_y(user, pos, -1, nodeInfo, false, false, tools.intensity, true);
    end
  end,
  on_place = function(itemstack, user, pointed_thing)
    if pointed_thing.type == "node" then        
      pos = pointed_thing.under
      nodeInfo = minetest.get_node(pos)

      rollback.used_tool(user)
      building_tools.extrude_y(user, pos, 1, nodeInfo, false, false, tools.intensity, true);
    end
  end
})

minetest.register_tool(modName .. ":extrude_x_z", {
  description = "Extrude XZ",
  inventory_image = modName .. "_extrude_x_z.png",
  on_use = function(itemstack, user, pointed_thing)
    if pointed_thing.type == "node" then      

      -- Get direction
      local yaw = user:get_look_horizontal()
      local dir = {}
      if (yaw >= 3.8 and yaw < 5.5) then
        dir = {x = 0, z = -1}
      elseif (yaw >= 5.5 or yaw < 0.8) then
        dir = {x = -1, z = 0}
      elseif (yaw >= 0.8 and yaw < 2.4) then
        dir = {x = 0, z = 1}
      elseif (yaw >= 2.4 and yaw < 3.8) then
        dir = {x = 1, z = 0}
      end

      pos = pointed_thing.under
      nodeInfo = minetest.get_node(pos)

      rollback.used_tool(user)
      building_tools.extrude_x_z(user, pos, 1, nodeInfo, false, false, dir, tools.intensity, true);
    end
  end,
  on_place = function(itemstack, user, pointed_thing)
    if pointed_thing.type == "node" then        

      -- Get direction
      local yaw = user:get_look_horizontal()
      local dir = {}
      if (yaw >= 3.8 and yaw < 5.5) then
        dir = {x = 0, z = -1}
      elseif (yaw >= 5.5 or yaw < 0.8) then
        dir = {x = -1, z = 0}
      elseif (yaw >= 0.8 and yaw < 2.4) then
        dir = {x = 0, z = 1}
      elseif (yaw >= 2.4 and yaw < 3.8) then
        dir = {x = 1, z = 0}
      end

      pos = pointed_thing.under
      nodeInfo = minetest.get_node(pos)

      rollback.used_tool(user)
      building_tools.extrude_x_z(user, pos, -1, nodeInfo, false, false, dir, tools.intensity, true);
    end
  end
})