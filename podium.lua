-- GENERATED CODE
-- Node Box Editor, version 0.8.1 - Glass
-- Namespace: test

minetest.register_node('church:podium_bottom_wood', {
	description = 'Wooden Podium Bottom',
	tiles = {
		'default_wood.png',
		'default_wood.png',
		'default_wood.png',
		'default_wood.png',
		'default_wood.png',
		'default_wood.png'
	},
	drawtype = 'nodebox',
	paramtype = 'light',
	paramtype2 = 'facedir',
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, -0.3125, 0.375}, -- NodeBox1
			{-0.3125, -0.5, -0.3125, 0.3125, -0.1875, 0.3125}, -- NodeBox2
			{-0.125, -0.5, -0.125, 0.125, 0.5, 0.125}, -- NodeBox3
		}
	}
})


minetest.register_node('church:podium_top_wood', {
	description = 'Wooden Podium Top',
	tiles = {
		'default_wood.png',
		'default_wood.png',
		'default_wood.png',
		'default_wood.png',
		'default_wood.png',
		'default_wood.png'
	},
	drawtype = 'nodebox',
	paramtype = 'light',
	paramtype2 = 'facedir',
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.125, -0.5, -0.125, 0.125, -0.0625, 0.125}, -- NodeBox3
			{-0.125, -0.5, -0.125, 0.0625, -0.0625, 0.125}, -- NodeBox4
			{0.4375, -0.5, -0.5, 0.5, -0.4375, 0.5}, -- NodeBox5
			{0.375, -0.4375, -0.5, 0.4375, -0.375, 0.5}, -- NodeBox6
			{0.3125, -0.375, -0.5, 0.375, -0.3125, 0.5}, -- NodeBox7
			{0.25, -0.3125, -0.5, 0.3125, -0.25, 0.5}, -- NodeBox8
			{0.1875, -0.25, -0.5, 0.25, -0.1875, 0.5}, -- NodeBox9
			{0.125, -0.1875, -0.5, 0.1875, -0.125, 0.5}, -- NodeBox10
			{0.0625, -0.125, -0.5, 0.125, -0.0625, 0.5}, -- NodeBox11
		}
	}
})

