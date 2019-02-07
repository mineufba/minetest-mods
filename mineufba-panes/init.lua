local mod_name = "mineufba_panes"


-- Brise --------------------------------------------------------------------------------------
minetest.register_alias("brise", mod_name .. ":brise")

minetest.register_node(mod_name .. ":brise", {
	description = "Brise",
    tiles = {
        mod_name .. "_default.png",
        mod_name .. "_default.png",
        mod_name .. "_default.png",
        mod_name .. "_default.png",
        mod_name .. "_default.png",
        mod_name .. "_default.png"
    },
    groups = {oddly_breakable_by_hand = 3},
    paramtype2 = "facedir",
    drawtype = "nodebox",
    paramtype = "light",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.0625, 0.4375, -0.5, 0, 0.5, 0.5}, -- NodeBox2
            {0, 0.375, -0.5, 0.0625, 0.4375, 0.5}, -- NodeBox3
            {0.0625, 0.3125, -0.5, 0.125, 0.375, 0.5}, -- NodeBox8
            {-0.0625, 0.1875, -0.5, 0, 0.25, 0.5}, -- NodeBox9
            {0, 0.125, -0.5, 0.0625, 0.1875, 0.5}, -- NodeBox10
            {0.0625, 0.0625, -0.5, 0.125, 0.125, 0.5}, -- NodeBox11
            {-0.0625, -0.0625, -0.5, 0, 0, 0.5}, -- NodeBox12
            {0, -0.125, -0.5, 0.0625, -0.0625, 0.5}, -- NodeBox13
            {0.0625, -0.1875, -0.5, 0.125, -0.125, 0.5}, -- NodeBox14
            {-0.0625, -0.3125, -0.5, 0, -0.25, 0.5}, -- NodeBox15
            {0, -0.375, -0.5, 0.0625, -0.3125, 0.5}, -- NodeBox16
            {0.0625, -0.4375, -0.5, 0.125, -0.375, 0.5}, -- NodeBox17
            {-0.0625, -0.5, -0.5, 0.125, 0.5, -0.4375}, -- side_left
            {-0.0625, -0.5, 0.4375, 0.125, 0.5, 0.5}, -- side_right
        }
    }
})

-- Grade --------------------------------------------------------------------------------------

minetest.register_alias("grade_top_side", mod_name .. ":grade_top_side")

minetest.register_node(mod_name .. ":grade_top_side", {
	description = "Grade Top Side",
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
            {-0.0625, 0.375, -0.5, 0.0625, 0.5, 0.5}, -- NodeBox1
            {-0.0625, -0.5, -0.5, 0.0625, 0.5, -0.375}, -- NodeBox2
            {-0.0625, -0.5, -0.0625, 0.0625, 0.375, 0}, -- NodeBox3
            {-0.0625, -0.5, 0.5, 0.0625, 0.375, 0.4375}, -- NodeBox4
        }
    }
})

minetest.register_alias("grade_top", mod_name .. ":grade_top")

minetest.register_node(mod_name .. ":grade_top", {
	description = "Grade Top",
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
            {-0.0625, 0.375, -0.5, 0.0625, 0.5, 0.5}, -- NodeBox1
            {-0.0625, -0.5, 0, 0.0625, 0.5, -0.0625}, -- NodeBox2
            {-0.0625, -0.5, 0.5, 0.0625, 0.5, 0.4375}, -- NodeBox3
        }
    }
})

minetest.register_alias("grade_middle", mod_name .. ":grade_middle")

minetest.register_node(mod_name .. ":grade_middle", {
	description = "Grade Middle",
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
            {-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0}, -- NodeBox1
            {-0.0625, -0.5, 0.4375, 0.0625, 0.5, 0.5}, -- NodeBox2
        }
    }
})

minetest.register_alias("grade_side", mod_name .. ":grade_side")

minetest.register_node(mod_name .. ":grade_side", {
	description = "Grade Side",
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

