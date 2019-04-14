mod = {}
mod.name = "quests"
mod.path = minetest.get_modpath(mod.name)

quests = {}
quests.player_quests = {}
quests.file = minetest.get_worldpath() .. "/quests"
quests.callback = nil
quests.hud = {}

dofile(mod.path .. "/save_load.lua")

dofile(mod.path .. "/base.lua")
dofile(mod.path .. "/api.lua")
dofile(mod.path .. "/hud.lua")
dofile(mod.path .. "/goals.lua")
dofile(mod.path .. "/quests.lua")
dofile(mod.path .. "/nodes.lua")

quests.load()