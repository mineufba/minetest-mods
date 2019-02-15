base_functions = {}

base_functions.canPlayerPlaceAt = function (player, pos)
	
	if (areas == nil) then return true end

	return areas:canInteract(pos, player:get_player_name())

end