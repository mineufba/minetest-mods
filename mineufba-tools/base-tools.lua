tools = {}
tools.intensity = 1

-- Alias -------------------------------------------------------------

minetest.register_alias("intensity_picker", modName .. ":intensity_picker")

-- Register ----------------------------------------------------------

minetest.register_tool(modName .. ":intensity_picker", {
  description = "Intensity Picker",
  inventory_image = modName .. "_intensity_picker.png",
  on_use = function(itemstack, user, pointed_thing)

    minetest.show_formspec(user:get_player_name(), modName .. ":intensity_picker_form",
                "size[4,3]" ..
                "label[0,0;Define Tool Instensity:" .. "]" ..
                "field[1,1.5;3,1;name;Intensity;" .. tools.intensity .. "]" ..
                "button_exit[1,2;2,1;exit;OK]")

  end,
  on_place = function(itemstack, user, pointed_thing)
  end
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
    
    if (formname == modName .. ":intensity_picker_form") then    
        
        tools.intensity = tonumber(fields.name)

        if (tools.intensity == nil or tools.intensity < 1) then tools.intensity = 1 end

        return true
    end

    return false
end)

-- Methods -----------------------------------------------------------

tools.is_pos_air = function (pos) 

  n = minetest.get_node(pos).name

  if (n == "air") then
    return true
  end

  return false
end