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
            {-0.5, 0.4375, -0, 0.5, 0.5, 0.0625}, -- NodeBox2
            {-0.5, 0.375, -0.0625, 0.5, 0.4375, -0}, -- NodeBox3
            {-0.5, 0.3125, -0.125, 0.5, 0.375, -0.0625}, -- NodeBox8
            {-0.5, 0.1875, -0, 0.5, 0.25, 0.0625}, -- NodeBox9
            {-0.5, 0.125, -0.0625, 0.5, 0.1875, -0}, -- NodeBox10
            {-0.5, 0.0625, -0.125, 0.5, 0.125, -0.0625}, -- NodeBox11
            {-0.5, -0.0625, -0, 0.5, 0, 0.0625}, -- NodeBox12
            {-0.5, -0.125, -0.0625, 0.5, -0.0625, -0}, -- NodeBox13
            {-0.5, -0.1875, -0.125, 0.5, -0.125, -0.0625}, -- NodeBox14
            {-0.5, -0.3125, -0, 0.5, -0.25, 0.0625}, -- NodeBox15
            {-0.5, -0.375, -0.0625, 0.5, -0.3125, -0}, -- NodeBox16
            {-0.5, -0.4375, -0.125, 0.5, -0.375, -0.0625}, -- NodeBox17
            {-0.5, -0.5, -0.125, -0.4375, 0.5, 0.0625}, -- side_left
            {0.4375, -0.5, -0.125, 0.5, 0.5, 0.0625}, -- side_right
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
            {-0.5, 0.375, -0.0625, 0.5, 0.5, 0.0625}, -- NodeBox1
            {-0.5, -0.5, -0.0625, -0.375, 0.5, 0.0625}, -- NodeBox2
            {-0.0625, -0.5, -0.0625, 0, 0.375, 0.0625}, -- NodeBox3
            {0.4375, -0.5, -0.0625, 0.5, 0.375, 0.0625}, -- NodeBox4
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
            {-0.5, 0.375, -0.0625, 0.5, 0.5, 0.0625}, -- NodeBox1
            {-0.0625, -0.5, -0.0625, 0, 0.5, 0.0625}, -- NodeBox2
            {0.4375, -0.5, -0.0625, 0.5, 0.5, 0.0625}, -- NodeBox3
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
            {-0.0625, -0.5, -0.0625, 0, 0.5, 0.0625}, -- NodeBox1
            {0.4375, -0.5, -0.0625, 0.5, 0.5, 0.0625}, -- NodeBox2
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
            {-0.5, -0.5, -0.0625, -0.375, 0.5, 0.0625}, -- NodeBox1
            {-0.0625, -0.5, -0.0625, 0, 0.5, 0.0625}, -- NodeBox2
            {0.4375, -0.5, -0.0625, 0.5, 0.5, 0.0625}, -- NodeBox3
        }
    }
})

