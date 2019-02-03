local mod_name = "mineufba_panes"


-- Brise --------------------------------------------------------------------------------------
minetest.register_alias("brise_top", mod_name .. ":brise_top")

minetest.register_node(mod_name .. ":brise_top", {
    tiles = {
        mod_name .. "_default.png",
        mod_name .. "_default.png",
        mod_name .. "_default.png",
        mod_name .. "_default.png",
        mod_name .. "_default.png",
        mod_name .. "_default.png"
    },
    groups = {oddly_breakable_by_hand = 3},
    drawtype = "nodebox",
    paramtype = "light",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, 0.375, -0.5, -0.4375, 0.5, 0.5}, 
            {-0.4375, 0.25, -0.5, -0.375, 0.375, 0.5}, 
            {-0.3125, 0, -0.5, -0.25, 0.125, 0.5}, 
            {-0.25, -0.125, -0.5, -0.1875, 0, 0.5}, 
            {-0.125, -0.375, -0.5, -0.0625, -0.25, 0.5}, 
            {-0.0625, -0.5, -0.5, 0, -0.375, 0.5}, 
        }
    }
})

minetest.register_alias("brise_bottom", mod_name .. ":brise_bottom")

minetest.register_node(mod_name .. ":brise_bottom", {
    tiles = {
        mod_name .. "_default.png",
        mod_name .. "_default.png",
        mod_name .. "_default.png",
        mod_name .. "_default.png",
        mod_name .. "_default.png",
        mod_name .. "_default.png"
    },
    groups = {oddly_breakable_by_hand = 3},
    drawtype = "nodebox",
    paramtype = "light",
    node_box = {
        type = "fixed",
        fixed = {
            {0.125, 0.125, -0.5, 0.1875, 0.25, 0.5}, -- NodeBox1
            {0.0625, 0.25, -0.5, 0.125, 0.375, 0.5}, -- NodeBox4
            {0.3125, -0.25, -0.5, 0.375, -0.125, 0.5}, -- NodeBox5
            {0.25, -0.125, -0.5, 0.3125, 0, 0.5}, -- NodeBox6
            {0.375, -0.5, -0.5, 0.4375, -0.375, 0.5}, -- NodeBox8
        }
    }

})

-- Grade --------------------------------------------------------------------------------------

minetest.register_alias("grade_top_side", mod_name .. ":grade_top_side")

minetest.register_node(mod_name .. ":grade_top_side", {
    tiles = {
        mod_name .. "_default.png",
        mod_name .. "_default.png",
        mod_name .. "_default.png",
        mod_name .. "_default.png",
        mod_name .. "_default.png",
        mod_name .. "_default.png"
    },
    drawtype = "nodebox",
    groups = {oddly_breakable_by_hand = 3},
    paramtype = "light",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.0625, 0.375, -0.5, 0.0625, 0.5, 0.5}, -- NodeBox1
            {-0.0625, -0.5, -0.5, 0.0625, 0.5, -0.375}, -- NodeBox2
            {-0.0625, -0.5, -0.0625, 0.0625, 0.375, 0}, -- NodeBox3
            {-0.0625, -0.5, 0.5, 0.0625, 0.375, 0.4375}, -- NodeBox4
        }
    }
})

minetest.register_alias("grade_top", mod_name .. ":grade_top")

minetest.register_node(mod_name .. ":grade_top", {
    tiles = {
        mod_name .. "_default.png",
        mod_name .. "_default.png",
        mod_name .. "_default.png",
        mod_name .. "_default.png",
        mod_name .. "_default.png",
        mod_name .. "_default.png"
    },
    drawtype = "nodebox",
    groups = {oddly_breakable_by_hand = 3},
    paramtype = "light",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.0625, 0.375, -0.5, 0.0625, 0.5, 0.5}, -- NodeBox1
            {-0.0625, -0.5, 0, 0.0625, 0.5, -0.0625}, -- NodeBox2
            {-0.0625, -0.5, 0.5, 0.0625, 0.5, 0.4375}, -- NodeBox3
        }
    }
})

minetest.register_alias("grade_middle", mod_name .. ":grade_middle")

minetest.register_node(mod_name .. ":grade_middle", {
    tiles = {
        mod_name .. "_default.png",
        mod_name .. "_default.png",
        mod_name .. "_default.png",
        mod_name .. "_default.png",
        mod_name .. "_default.png",
        mod_name .. "_default.png"
    },
    drawtype = "nodebox",
    groups = {oddly_breakable_by_hand = 3},
    paramtype = "light",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0}, -- NodeBox1
            {-0.0625, -0.5, 0.4375, 0.0625, 0.5, 0.5}, -- NodeBox2
        }
    }
})

minetest.register_alias("grade_side", mod_name .. ":grade_side")

minetest.register_node(mod_name .. ":grade_side", {
    tiles = {
        mod_name .. "_default.png",
        mod_name .. "_default.png",
        mod_name .. "_default.png",
        mod_name .. "_default.png",
        mod_name .. "_default.png",
        mod_name .. "_default.png"
    },
    drawtype = "nodebox",
    groups = {oddly_breakable_by_hand = 3},
    paramtype2 = "facedir",
    paramtype = "light",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.0625, -0.5, -0.5, 0.0625, 0.5, -0.375}, -- NodeBox1
            {-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0}, -- NodeBox2
            {-0.0625, -0.5, 0.4375, 0.0625, 0.5, 0.5}, -- NodeBox3
        }
    }
})

