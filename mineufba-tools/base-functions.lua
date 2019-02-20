base_functions = {}

base_functions.is_pos_air = function (pos) 

  n = minetest.get_node(pos).name

  if (n == "air") then
    return true
  end

  return false
end

base_functions.canPlayerPlaceAt = function (player, pos)
	
	if (areas == nil) then return true end

	return areas:canInteract(pos, player:get_player_name())

end

base_functions.getPlayerLookDir = function (player)

	local yaw = player:get_look_horizontal()
	

	local dir = {}

	if (yaw >= 3.8 and yaw < 5.5) then
		dir = {x = -1, z = 0}
	elseif (yaw >= 5.5 or yaw < 0.8) then
		dir = {x = 0, z = -1}
	elseif (yaw >= 0.8 and yaw < 2.4) then
		dir = {x = 1, z = 0}
	elseif (yaw >= 2.4 and yaw < 3.8) then
		dir = {x = 0, z = 1}
	end

	local pitch = player:get_look_vertical() 

	if (pitch >= 0) then

		dir.y = -1

	else

		dir.y = 1
	end

	return dir

end

base_functions.hasAirInDirs = function (pos, dirs)
	
	if (base_functions.is_pos_air({x=pos.x+dirs.x, y=pos.y, z=pos.z})) then return true end 
	if (base_functions.is_pos_air({x=pos.x, y=pos.y+dirs.y, z=pos.z})) then return true end 
	if (base_functions.is_pos_air({x=pos.x, y=pos.y, z=pos.z+dirs.z})) then return true end 
	
	return false
end