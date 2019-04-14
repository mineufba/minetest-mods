mod = {}
mod.name = "npcs"
mod.path = minetest.get_modpath(mod.name)

npcs = {}
npcs.npcs = {}
npcs.all_npcs = {}

dofile(mod.path .. "/api.lua")
dofile(mod.path .. "/nodes.lua")
dofile(mod.path .. "/npcs.lua")