-- GENERATED CODE
-- Node Box Editor, version 0.8.1 - Glass
-- Namespace: test

minetest.register_node('altar:end', {
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
			{-0.5, -0.5, -0.375, 0.5, 0.5, 0.5}, -- NodeBox1
			{0.4375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.4375, 0.5, -0.125}, -- NodeBox3
			{-0.4375, 0.25, -0.5, -0.375, 0.5, -0.375}, -- NodeBox4
			{0.375, 0.3125, -0.5, 0.5, 0.5, -0.3125}, -- NodeBox5
			{-0.5, 0.375, -0.5, -0.1875, 0.4375, -0.125}, -- NodeBox7
			{0.1875, 0.375, -0.5, 0.5, 0.4375, 0.5}, -- NodeBox8
			{-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox9
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox10
		}
	}
})

minetest.register_node('altar:middle', {
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
			{-0.5, -0.5, -0.375, 0.5, 0.5, 0.5}, -- NodeBox1
			{0.4375, -0.5, -0.5, 0.5, 0.5, -0.375}, -- NodeBox2
			{-0.5, -0.5, -0.5, -0.4375, 0.5, -0.125}, -- NodeBox3
			{-0.4375, 0.25, -0.5, -0.375, 0.5, -0.375}, -- NodeBox4
			{0.375, 0.3125, -0.5, 0.5, 0.5, -0.3125}, -- NodeBox5
			{-0.5, 0.375, -0.5, -0.1875, 0.4375, -0.125}, -- NodeBox7
			{0.1875, 0.375, -0.5, 0.5, 0.4375, 0.5}, -- NodeBox8
			{-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox9
		}
	}
})

