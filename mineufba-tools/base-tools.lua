tools = {}
tools.intensity = {}

-- Alias -------------------------------------------------------------

minetest.register_alias("intensity_picker", modName .. ":intensity_picker")

-- Register ----------------------------------------------------------

minetest.register_tool(modName .. ":intensity_picker", {
  description = "Intensity Picker",
  inventory_image = modName .. "_intensity_picker.png",
  on_use = function(itemstack, user, pointed_thing)

    local name = user:get_player_name()

    if (tools.intensity[name] == nil) then tools.intensity[name] = 1 end 

    minetest.show_formspec(user:get_player_name(), modName .. ":intensity_picker_form",
                "size[4,3]" ..
                "label[0,0;Define Tool Instensity:" .. "]" ..
                "field[1,1.5;3,1;name;Intensity;" .. tools.intensity[name] .. "]" ..
                "button_exit[1,2;2,1;exit;OK]")

  end
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
    
    if (formname == modName .. ":intensity_picker_form") then    
        
        local name = player:get_player_name()

        tools.intensity[name] = tonumber(fields.name)

        if (tools.intensity[name] == nil or tools.intensity[name] < 1) then tools.intensity[name] = 1 end

        return true
    end

    return false
end)

minetest.register_on_joinplayer(function (player)
  
  tools.intensity[player:get_player_name()] = 1

end)