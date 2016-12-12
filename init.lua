-- cross mod by Tucker Bamberg AKA 'mootpoint'

--[[
Copyright (C) 2016 Joseph 'Tucker' Bamberg
This file is part of the cross mod
the cross mod is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
Stats is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with the cross mod.  If not, see <http://www.gnu.org/licenses/>.
]]--


-- obsidian cross
minetest.register_node('cross:obsidian', {
	description = 'Obsidian Cross',
	tiles = {
		'default_obsidian.png',
		'default_obsidian.png',
		'default_obsidian.png',
		'default_obsidian.png',
		'default_obsidian.png',
		'default_obsidian.png',
	},
	drawtype = 'nodebox',
	paramtype = 'light',
	paramtype2 = 'facedir',
	groups = {oddly_breakable_by_hand = 2},
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625}, -- NodeBox1
			{-0.375, 0.0625, -0.0625, 0.375, 0.1875, 0.0625}, -- NodeBox2
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.0625, 0.375, 0.5, 0.0625},
		},
	},
})

minetest.register_craft({
	output = 'cross:obsidian',
	recipe = {
		{'', 'default:obsidian_shard', ''},
		{'group:wood', 'group:wood', 'group:wood'},
		{'', 'group:wood', ''}
	}
})

minetest.register_node('cross:wood', {
	description = 'Wooden Cross',
	tiles = {
		'default_wood.png',
		'default_wood.png',
		'default_wood.png',
		'default_wood.png',
		'default_wood.png',
		'default_wood.png',
	},
	drawtype = 'nodebox',
	paramtype = 'light',
	paramtype2 = 'facedir',
	groups = {oddly_breakable_by_hand = 2},
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625}, -- NodeBox1
			{-0.375, 0.0625, -0.0625, 0.375, 0.1875, 0.0625}, -- NodeBox2
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.0625, 0.375, 0.5, 0.0625},
		},
	},
})

minetest.register_craft({
	output = 'cross:wood',
	recipe = {
		{'', 'group:wood', ''},
		{'group:wood', 'group:wood', 'group:wood'},
		{'', 'group:wood', ''}
	}
})


minetest.register_node('cross:gold', {
	description = 'Golden Cross',
	tiles = {
		'default_gold_block.png',
		'default_gold_block.png',
		'default_gold_block.png',
		'default_gold_block.png',
		'default_gold_block.png',
		'default_gold_block.png',
	},
	groups = {oddly_breakable_by_hand = 2},
	drawtype = 'nodebox',
	paramtype = 'light',
	paramtype2 = 'facedir',
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625}, -- NodeBox1
			{-0.375, 0.0625, -0.0625, 0.375, 0.1875, 0.0625}, -- NodeBox2
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.0625, 0.375, 0.5, 0.0625},
		},
	},
})

minetest.register_craft({
	output = 'cross:gold',
	recipe = {
		{'', 'default:gold_ingot', ''},
		{'group:wood', 'group:wood', 'group:wood'},
		{'', 'group:wood', ''}
	}
})


minetest.register_node('cross:diamond', {
	description = 'Diamond Cross',
	tiles = {
		'default_diamond_block.png',
		'default_diamond_block.png',
		'default_diamond_block.png',
		'default_diamond_block.png',
		'default_diamond_block.png',
		'default_diamond_block.png',
	},
	groups = {oddly_breakable_by_hand = 2},
	drawtype = 'nodebox',
	paramtype = 'light',
	paramtype2 = 'facedir',
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625}, -- NodeBox1
			{-0.375, 0.0625, -0.0625, 0.375, 0.1875, 0.0625}, -- NodeBox2
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.0625, 0.375, 0.5, 0.0625},
		},
	},
})

minetest.register_craft({
	output = 'cross:diamond',
	recipe = {
		{'', 'default:diamond', ''},
		{'group:wood', 'group:wood', 'group:wood'},
		{'', 'group:wood', ''}
	}
})


minetest.register_node('cross:mese', {
	description = 'Mese Cross',
	tiles = {
		'default_meselamp.png',
		'default_meselamp.png',
		'default_meselamp.png',
		'default_meselamp.png',
		'default_meselamp.png',
		'default_meselamp.png',
	},
	groups = {oddly_breakable_by_hand = 2},
	drawtype = 'nodebox',
	paramtype = 'light',
	paramtype2 = 'facedir',
	light_source = 15,
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625}, -- NodeBox1
			{-0.375, 0.0625, -0.0625, 0.375, 0.1875, 0.0625}, -- NodeBox2
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.0625, 0.375, 0.5, 0.0625},
		},
	},
})

minetest.register_craft({
	output = 'cross:mese',
	recipe = {
		{'', 'default:mese_crystal_fragment', ''},
		{'group:wood', 'group:wood', 'group:wood'},
		{'', 'group:wood', ''}
	}
})

-- stone cross suggested by napiophelios

minetest.register_node('cross:stone', {
	description = 'stone Cross',
	tiles = {
		'default_stone.png',
		'default_stone.png',
		'default_stone.png',
		'default_stone.png',
		'default_stone.png',
		'default_stone.png',
	},
	groups = {oddly_breakable_by_hand = 2},
	drawtype = 'nodebox',
	paramtype = 'light',
	paramtype2 = 'facedir',
	light_source = 15,
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625}, -- NodeBox1
			{-0.375, 0.0625, -0.0625, 0.375, 0.1875, 0.0625}, -- NodeBox2
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.0625, 0.375, 0.5, 0.0625},
		},
	},
})

minetest.register_craft({
	output = 'cross:stone',
	recipe = {
		{'', 'default:stone', ''},
		{'group:wood', 'group:wood', 'group:wood'},
		{'', 'group:wood', ''}
	}
})

