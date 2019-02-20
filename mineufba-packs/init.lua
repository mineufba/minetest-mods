modName = "mineufba_packs"

packs = {}

-- Load Files

dofile(minetest.get_modpath(modName) .. "/preload.lua")
dofile(minetest.get_modpath(modName) .. "/inventory-api.lua")
dofile(minetest.get_modpath(modName) .. "/packs-api.lua")
dofile(minetest.get_modpath(modName) .. "/commands.lua")