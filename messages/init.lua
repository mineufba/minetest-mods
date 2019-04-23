mod = {}
mod.name = "messages"
mod.path = minetest.get_modpath(mod.name)

messages = {}
messages.players = {}

dofile(mod.path .. "/queue.lua")
dofile(mod.path .. "/formspec_handle.lua")
dofile(mod.path .. "/messages.lua")