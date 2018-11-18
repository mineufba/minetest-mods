modName = "mineufba_blocks"

-- PILAR COM FAIXA PRETA
------------------------------------------------------------------

--[[
minetest.register_node(modName .. ":pilar", {
    description = "Pilar com faixa preta",
    
    tiles = {modName .. "_pilar02.png",
    		 modName .. "_pilar02.png",
    		 modName .. "_pilar01.png",
    		 modName .. "_pilar01.png",
    		 modName .. "_pilar01.png",
    		 modName .. "_pilar01.png"},

    groups = {cracky = 3}

})
]]--

minetest.register_node(modName .. ":pilar", {
    description = "Pilar com faixa preta",
    drawtype = "mesh",
    visual_scale = 1/16,
    tiles = {modName .. "_pilar02.png"},
    mesh = modName .. "_pilar_full.obj",
    groups = {cracky = 3}

})

minetest.register_alias("pilar", modName .. ":pilar")


------------------------------------------------------------------