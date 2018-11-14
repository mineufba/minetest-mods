local modpath = minetest.get_modpath(minetest.get_current_modname())

dofile(modpath .. "/load_maps.lua")
dofile(modpath .. "/area_check.lua")

-- Player

spawPosPlayers = {
	x = 0,
	y = 50,
	z = -15
}

SpawPlayer = function (player)
	
	player:set_pos(spawPosPlayers)

end

minetest.register_on_newplayer(function (player)

	local privs = minetest.get_player_privs(player:get_player_name())
	privs.fly = true
	privs.fast = true

	minetest.set_player_privs(player:get_player_name(), privs)

	SpawPlayer(player)

	end)

minetest.register_on_respawnplayer(function (player)

	SpawPlayer(player)

	end)


-- World Generation
minetest.register_on_mapgen_init(function (mgparams)
		
	minetest.set_mapgen_params({
		mgname = "singlenode",
		flags = ""
		})
end)

minetest.register_on_generated(function(minp, maxp, seed)

	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")

	local data = vm:get_data()
	local area = VoxelArea:new{MinEdge=emin, MaxEdge=emax}

	--[[
	for i=1,bmpInstance.width do

		for k=1,bmpInstance.height do			

			local pixelColor = bmpInstance:get_pixel(i,k)

			if pixelColor >= 200 then

				for j=0,(255 - pixelColor - 1) do

					local idx = area:index(i, j, k)

					data[idx] = minetest.get_content_id("default:stone")	
				end
			end
		end			
	end
	]]--

	for i=math.max(0, emin.x),math.min(223, emax.x) do

		if (math.max(0, emin.x) > math.min(223, emax.x)) then
			break
		end

		for k=math.max(0, emin.z),math.min(223, emax.z) do

			if (math.max(0, emin.z) > math.min(223, emax.z)) then
				break
			end

			print("i = " .. i .. "\nk = " .. k .. "\n")

			pixelColor = BitmapInfo[i][k]


			if pixelColor >= 200 then

				for j=0,(255 - pixelColor - 1) do

					local idx = area:index(i, j, k)

					data[idx] = minetest.get_content_id("default:stone")	
				end
			end
		end			
	end

	vm:set_data(data)
	vm:set_lighting{day=0, night=0}
	vm:calc_lighting()
	vm:write_to_map()

	end)