tool_intensity = 2

-- Alias ---------------------------------------------------------------------------------

minetest.register_alias("extrude_y", modName .. ":extrude_y")
minetest.register_alias("extrude_x_z", modName .. ":extrude_x_z")
minetest.register_alias("intensity_picker", modName .. ":intensity_picker")


-- Functions ---------------------------------------------------------------------------------

tools.is_pos_air = function (pos) 

  n = minetest.get_node(pos).name

  if (n == "air") then
    return true
  end

  return false
end

----------------------------------------------------

tools.extrude_y = function (player, position, direction, nodeInfo, isSure, remove, loop, full)
  
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

  if (remove == false) then    
    -- Didn't place block yet
    if (minetest.get_node(p).name ~= nodeInfo.name) then
      rollback.set_node(player, p, {name=nodeInfo.name, param2=nodeInfo.param2})

      if (full) then

        p = {x = position.x+1,
             y = position.y,
             z = position.z}
        tools.extrude_y(player, p, direction, nodeInfo, isSure, remove, loop, full)

        p = {x = position.x-1,
             y = position.y,
             z = position.z}
        tools.extrude_y(player, p, direction, nodeInfo, isSure, remove, loop, full)

        p = {x = position.x,
             y = position.y,
             z = position.z+1}
        tools.extrude_y(player, p, direction, nodeInfo, isSure, remove, loop, full)

        p = {x = position.x,
             y = position.y,
             z = position.z-1}
        tools.extrude_y(player, p, direction, nodeInfo, isSure, remove, loop, full)

      end
    end
  else

    rollback.set_node(player, position, {name="air"})
    
    if (full) then

      p = {x = position.x+1,
           y = position.y,
           z = position.z}
      tools.extrude_y(player, p, direction, nodeInfo, isSure, remove, loop, full)

      p = {x = position.x-1,
           y = position.y,
           z = position.z}
      tools.extrude_y(player, p, direction, nodeInfo, isSure, remove, loop, full)

      p = {x = position.x,
           y = position.y,
           z = position.z+1}
      tools.extrude_y(player, p, direction, nodeInfo, isSure, remove, loop, full)

      p = {x = position.x,
           y = position.y,
           z = position.z-1}
      tools.extrude_y(player, p, direction, nodeInfo, isSure, remove, loop, full)  
    end
  end

  p = {x = position.x,
       y = position.y+direction,
       z = position.z}

  if (minetest.get_node(p).name == nodeInfo.name and loop >= 2) then
    tools.extrude_y(player, p, direction, nodeInfo, isSure, remove, (loop - 1), false)
  end
end

----------------------------------------------------

tools.extrude_x_z = function (player, position, direction, nodeInfo, isSure, remove, side, loop, full)

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
        tools.extrude_x_z(player, p, direction, nodeInfo, isSure, remove, side, loop, full)

        p = {x = position.x-side.x,
             y = position.y,
             z = position.z-side.z}
        tools.extrude_x_z(player, p, direction, nodeInfo, isSure, remove, side, loop, full)

        p = {x = position.x,
             y = position.y+1,
             z = position.z}
        tools.extrude_x_z(player, p, direction, nodeInfo, isSure, remove, side, loop, full)

        p = {x = position.x,
             y = position.y-1,
             z = position.z}
        tools.extrude_x_z(player, p, direction, nodeInfo, isSure, remove, side, loop, full)
      end
    end
  else

    rollback.set_node(player, position, {name="air"})

    if (full) then
      p = {x = position.x+side.x,
           y = position.y,
           z = position.z+side.z}
      tools.extrude_x_z(player, p, direction, nodeInfo, isSure, remove, side, loop, full)

      p = {x = position.x-side.x,
           y = position.y,
           z = position.z-side.z}
      tools.extrude_x_z(player, p, direction, nodeInfo, isSure, remove, side, loop, full)

      p = {x = position.x,
           y = position.y+1,
           z = position.z}
      tools.extrude_x_z(player, p, direction, nodeInfo, isSure, remove, side, loop, full)

      p = {x = position.x,
           y = position.y-1,
           z = position.z}
      tools.extrude_x_z(player, p, direction, nodeInfo, isSure, remove, side, loop, full)

    end
  end

  p = {x = position.x+direction.x,
       y = position.y,
       z = position.z+direction.z}

  if (minetest.get_node(p).name == nodeInfo.name and loop >= 2) then
    tools.extrude_x_z(player, p, direction, nodeInfo, isSure, remove, side, (loop - 1), false)
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
      tools.extrude_y(user, pos, -1, nodeInfo, false, false, tool_intensity, true);
    end
  end,
  on_place = function(itemstack, user, pointed_thing)
    if pointed_thing.type == "node" then        
      pos = pointed_thing.under
      nodeInfo = minetest.get_node(pos)

      rollback.used_tool(user)
      tools.extrude_y(user, pos, 1, nodeInfo, false, false, tool_intensity, true);
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
      tools.extrude_x_z(user, pos, 1, nodeInfo, false, false, dir, tool_intensity, true);
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
      tools.extrude_x_z(user, pos, -1, nodeInfo, false, false, dir, tool_intensity, true);
    end
  end
})

minetest.register_tool(modName .. ":intensity_picker", {
  description = "Intensity Picker",
  inventory_image = modName .. "_intensity_picker.png",
  on_use = function(itemstack, user, pointed_thing)

    minetest.show_formspec(user:get_player_name(), modName .. ":intensity_picker_form",
                "size[4,3]" ..
                "label[0,0;Define Tool Instensity:" .. "]" ..
                "field[1,1.5;3,1;name;Intensity;" .. tool_intensity .. "]" ..
                "button_exit[1,2;2,1;exit;OK]")

  end,
  on_place = function(itemstack, user, pointed_thing)
  end
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
    
    if (formname == modName .. ":intensity_picker_form") then    
        
        tool_intensity = tonumber(fields.name)

        if (tool_intensity == nil) then tool_intensity = 1 end

        return true
    end

    return false
end)

--