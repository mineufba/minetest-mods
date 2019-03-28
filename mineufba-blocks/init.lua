modName = "mineufba_blocks"

-- PILAR COM FAIXA PRETA
------------------------------------------------------------------
minetest.register_alias("pilar", modName .. ":pilar")

minetest.register_node(modName .. ":pilar", {
    description = "Pilar",
    
    tiles = {modName .. "_concreto.png",
             modName .. "_concreto.png",
             modName .. "_pilar.png",
             modName .. "_pilar.png",
             modName .. "_pilar.png",
             modName .. "_pilar.png"},

    groups = {oddly_breakable_by_hand = 3}

})

------------------------------------------------------------------

-- CONCRETO
------------------------------------------------------------------
minetest.register_alias("concreto", modName .. ":concreto")

minetest.register_node(modName .. ":concreto", {
    description = "Concreto",
    
    tiles = {modName .. "_concreto.png"},

    groups = {oddly_breakable_by_hand = 3}

})
------------------------------------------------------------------

-- COBOGO
------------------------------------------------------------------
minetest.register_alias("cobogo", modName .. ":cobogo")

minetest.register_node(modName .. ":cobogo", {
    description = "Cobogo",
    tiles = {
        modName .. "_concreto.png",
        modName .. "_concreto.png",
        modName .. "_concreto.png",
        modName .. "_concreto.png",
        modName .. "_concreto.png",
        modName .. "_concreto.png"
    },
    groups = {oddly_breakable_by_hand = 3},
    paramtype2 = "facedir",
    drawtype = "nodebox",
    paramtype = "light",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5}, -- NodeBox1
            {-0.25, -0.5, -0.5, -0.1875, 0.5, 0.5}, -- NodeBox2
            {0, -0.5, -0.5, 0.0625, 0.5, 0.5}, -- NodeBox3
            {0.25, -0.5, -0.5, 0.3125, 0.5, 0.5}, -- NodeBox4
            {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox8
            {-0.5, 0.1875, -0.5, 0.5, 0.25, 0.5}, -- NodeBox9
            {-0.5, -0.0625, -0.5, 0.5, 0, 0.5}, -- NodeBox10
            {-0.5, -0.3125, -0.5, 0.5, -0.25, 0.5}, -- NodeBox11
        }
    }
})
------------------------------------------------------------------

-- COBOGO CERÂMICA
------------------------------------------------------------------
minetest.register_alias("cobogo_ceramica", modName .. ":cobogo_ceramica")

minetest.register_node(modName .. ":cobogo_ceramica", {
    drawtype = "glasslike",
    description = "Cobogo de Cerâmica",
    paramtype = "light",
    is_ground_content = false,
    sunlight_propagates = true,
    tiles = {modName .. "_cobogo_ceramica.png"},

    groups = {oddly_breakable_by_hand = 3}

})
------------------------------------------------------------------

-- TINTA AZUL
------------------------------------------------------------------
minetest.register_alias("tinta_azul", modName .. ":tinta_azul")

minetest.register_node(modName .. ":tinta_azul", {
    description = "Tinta Azul",
    paramtype = "light",
    is_ground_content = false,
    sunlight_propagates = true,
    tiles = {modName .. "_tinta_azul.png"},

    groups = {oddly_breakable_by_hand = 3}

})
------------------------------------------------------------------

-- TELHADO
------------------------------------------------------------------
minetest.register_alias("telhado", modName .. ":telhado")

minetest.register_node(modName .. ":telhado", {
    description = "Telhado",
    paramtype = "light",
    is_ground_content = false,
    sunlight_propagates = true,
    tiles = {modName .. "_telhado.png",
             modName .. "_concreto.png",
             modName .. "_concreto.png",
             modName .. "_concreto.png",
             modName .. "_concreto.png",
             modName .. "_concreto.png"},

    groups = {oddly_breakable_by_hand = 3}

})
------------------------------------------------------------------

