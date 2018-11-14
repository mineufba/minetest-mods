local modpath = minetest.get_modpath(minetest.get_current_modname())

dofile(modpath .. "/bitmap.lua")

local LoadedBitmaps = {
	
	[0] = {

		[0] = Bitmap.from_file(modpath .. "/Bitmaps/00.bmp"),
		[1] = Bitmap.from_file(modpath .. "/Bitmaps/01.bmp")

	},

	[1] = {

		[0] = Bitmap.from_file(modpath .. "/Bitmaps/10.bmp"),
		[1] = Bitmap.from_file(modpath .. "/Bitmaps/11.bmp")

	}
}


BitmapInfo = {}

mapSize = 112

for i=0,1 do
	
	for j=0,1 do

		for x=0,mapSize - 1 do

			BitmapInfo[(i * mapSize) + x] = {}
	
			for y=0,mapSize - 1 do

				BitmapInfo[(i * mapSize) + x][(j * mapSize) + y] = LoadedBitmaps[i][j]:get_pixel(x,y)

			end

		end

	end

end

minetest.register_globalstep(function (dtime)


	print(BitmapInfo[112][32])


	end)