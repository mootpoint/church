-- church mod by Tucker Bamberg AKA 'mootpoint'
--modified by Napiophelios
--[[
Copyright (C) 2016 Joseph 'Tucker' Bamberg
This file is part of the church mod
the church mod is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
Stats is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with the church mod.  If not, see <http://www.gnu.org/licenses/>.
]]--



local load_time_start = os.clock()

local modpath = minetest.get_modpath('church')


screwdriver = screwdriver or {}
cross = {}
--------------------
-- Node Registration
--------------------
--Hanging Wall Crosses
minetest.register_node('church:wallcross_gold', {
	description = 'Gold Wall Cross',
	tiles = {'default_gold_block.png'},
	groups = {oddly_breakable_by_hand = 3},
	drawtype = 'nodebox',
	paramtype = 'light',
	paramtype2 = 'facedir',
	sunlight_propagates = true,
	is_ground_content = false,
	buildable_to = false,
	light_source = 7,
--	sounds = default.node_sound_metal_defaults(),
	on_rotate = screwdriver.rotate_simple, --no upside down crosses :)
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.0625, -0.4375, 0.4375, 0.0625, 0.4375, 0.5},
			{-0.25, 0.0625, 0.4375, 0.25, 0.1875, 0.5},
		}
	},
	selection_box = {
		type = 'fixed',
		fixed = {
			{-0.3125, -0.5, 0.375, 0.3125, 0.5, 0.5},
		}
	}
})

minetest.register_node('church:wallcross_steel', {
	description = 'Steel Wall Cross',
	tiles = {'default_steel_block.png'},
	groups = {oddly_breakable_by_hand = 3},
	drawtype = 'nodebox',
	paramtype = 'light',
	paramtype2 = 'facedir',
	sunlight_propagates = true,
	is_ground_content = false,
	buildable_to = false,
	light_source = 11,
	--sounds = default.node_sound_metal_defaults(),
	on_rotate = screwdriver.rotate_simple,
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.0625, -0.4375, 0.4375, 0.0625, 0.4375, 0.5},
			{-0.25, 0.0625, 0.4375, 0.25, 0.1875, 0.5},
		}
	},
	selection_box = {
		type = 'fixed',
		fixed = {
			{-0.3125, -0.5, 0.375, 0.3125, 0.5, 0.5},
		}
	}
})
--Grave Markers
minetest.register_node('church:grave', {
	description = 'Grave Stone',
	tiles = {'cross_grave_stone_mossy.png', 'cross_grave_stone.png',
	'cross_grave_stone.png', 'cross_grave_stone_mossy.png',
	'cross_grave_stone_mossy.png', 'cross_grave_stone.png'},
	groups = {cracky = 3, oddly_breakable_by_hand = 2, choppy =1 },
	drawtype = 'nodebox',
	paramtype = 'light',
	paramtype2 = 'facedir',
	sunlight_propagates = true,
	is_ground_content = false,
	buildable_to = false,
	--light_source = 1,
--	sounds = default.node_sound_stone_defaults(),
	on_rotate = screwdriver.rotate_simple,
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.3125, -0.3125, -0.125, 0.3125, 0.3125, 0.125},
			{-0.375, -0.4375, -0.1875, 0.375, -0.3125, 0.1875},
			{-0.4375, -0.5, -0.25, 0.4375, -0.4375, 0.25},
			{-0.25, 0.3125, -0.125, 0.25, 0.375, 0.125},
			{-0.125, 0.375, -0.125, 0.125, 0.4375, 0.125},
		}
	},
	selection_box = {
		type = 'fixed',
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			--{-0.5, -0.5, -0.3125, 0.5, 0.5, 0.3125},
		}
	}
})

minetest.register_node('church:grave_fancy', {
	description = 'Cemetary Cross',
	tiles = {'cross_grave_stone_mossy.png', 'cross_grave_stone.png',
	'cross_grave_stone_mossy.png', 'cross_grave_stone.png',
	'cross_grave_stone_mossy.png', 'cross_grave_stone.png'},
	groups = {cracky = 3, oddly_breakable_by_hand = 2, choppy =1 },
	drawtype = 'nodebox',
	paramtype = 'light',
	paramtype2 = 'facedir',
	sunlight_propagates = true,
	is_ground_content = false,
	buildable_to = false,
	--light_source = 1,
--	sounds = default.node_sound_stone_defaults(),
	on_rotate = screwdriver.rotate_simple,
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.125, -0.25, -0.125, 0.125, 0.5, 0.125},
			{-0.3125, 0.0625, -0.125, 0.3125, 0.3125, 0.125},
			{-0.1875, -0.375, -0.1875, 0.1875, -0.25, 0.1875},
			{-0.3125, -0.5, -0.3125, 0.3125, -0.375, 0.3125},
		}
	},
	selection_box = {
		type = 'fixed',
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			--{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		}
	}
})

minetest.register_node('church:grave_simple', {
	description = 'Simple Cemetary Cross',
	tiles = {'cross_grave_stone_mossy.png', 'cross_grave_stone.png',
	'cross_grave_stone.png', 'cross_grave_stone.png',
	'cross_grave_stone_mossy.png', 'cross_grave_stone.png'},
	groups = {cracky = 3, oddly_breakable_by_hand = 2, choppy =1 },
	drawtype = 'nodebox',
	paramtype = 'light',
	paramtype2 = 'facedir',
	sunlight_propagates = true,
	is_ground_content = false,
	buildable_to = false,
	--light_source = 1,
--	sounds = default.node_sound_stone_defaults(),
	on_rotate = screwdriver.rotate_simple,
	node_box = {
		type = 'fixed',
		fixed = {
			{-0.0625, -0.375, -0.0625, 0.0625, 0.5, 0.0625},
			{-0.25, 0.125, -0.0625, 0.25, 0.25, 0.0625},
			{-0.125, -0.4375, -0.125, 0.125, -0.375, 0.125},
			{-0.1875, -0.5, -0.1875, 0.1875, -0.4375, 0.1875},
		}
	},
	selection_box = {
		type = 'fixed',
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			--{-0.25, -0.5, -0.1875, 0.25, 0.5, 0.1875},
		}
	}
})
--Cross Standards
cross.register_cross = function( basename, texture, description, craft_from)-- mat_sounds )
local group_def = {cracky = 3, oddly_breakable_by_hand = 2, choppy =1 };

	minetest.register_node('church:cross_'..basename, {
		description = 'Cross of ' ..description,
		tiles = {texture },
		drawtype = 'nodebox',
		paramtype = 'light',
		paramtype2 = 'facedir',
		light_source = 7,
		sunlight_propagates = true,
		is_ground_content = false,
		buildable_to = false,
		on_rotate = screwdriver.rotate_simple,
		groups = group_def,
--		sounds = mat_sounds,
		node_box = {
			type = 'fixed',
			fixed = {
				{-0.0625, -0.5, -0.0625, 0.0625, 0.4375, 0.0625},
				{-0.25, 0.0625, -0.0625, 0.25, 0.1875, 0.0625},
			}
		},
		selection_box = {
			type = 'fixed',
			fixed = {
				{-0.375, -0.5, -0.0625, 0.375, 0.5, 0.0625},
			},
		},
	})
-----------
-- Crafting
-----------
	minetest.register_craft({
		output = 'church:cross_'..basename,
		recipe = {
			{'', craft_from, ''},
			{'default:stick', 'default:stick', 'default:stick'},
			{'', 'default:stick', ''}
		}
	})

end

minetest.register_craft({
	output = 'church:wallcross_gold',
	recipe = {
		{ '', '', '' },
		{ '', 'church:cross_gold', '' },
		{ '', '', '' },
	}
})

minetest.register_craft({
	output = 'church:wallcross_steel',
	recipe = {
		{ '', '','' },
		{ '', 'church:cross_steel','' },
		{ '', '','' },
	}
})

minetest.register_craft({
	output = 'church:grave',
	recipe = {
		{ '', 'group:stone', '' },
		{ '', 'stairs:slab_cobble', '' },
		{ '', '', '' },
	}
})

minetest.register_craft({
	output = 'church:grave',
	recipe = {
		{ '', '', '' },
		{ '', 'group:stone', '' },
		{ '', 'stairs:slab_cobble', '' },
	}
})

minetest.register_craft({
	output = 'church:grave_fancy',
	recipe = {
		{ '', 'church:cross_stone', '' },
		{ '', 'stairs:slab_cobble', '' },
		{ '', '', '' },
	}
})

minetest.register_craft({
	output = 'church:grave_fancy',
	recipe = {
		{ '', '', '' },
		{ '', 'church:cross_stone', '' },
		{ '', 'stairs:slab_cobble', '' },
	}
})

minetest.register_craft({
	output = 'church:grave_simple',
	recipe = {
		{ '', 'church:cross_stone', '' },
		{ '', 'walls:cobble', '' },
		{ '', '', '' },
	}
})

minetest.register_craft({
	output = 'church:grave_simple',
	recipe = {
		{ '', '', '' },
		{ '', 'church:cross_stone', '' },
		{ '', 'walls:cobble', '' },
	}
})

----------
-- Cooking
----------
minetest.register_craft({
	type = 'cooking',
	output = 'default:gold_ingot',
	recipe = 'church:wallcross_gold',
	cooktime = 5,
})

minetest.register_craft({
	type = 'cooking',
	output = 'default:steel_ingot',
	recipe = 'church:wallcross_steel',
	cooktime = 5,
})

--------------------------
-- Register Node Materials
--------------------------
cross.register_cross( 'diamond', 'default_diamond_block.png', 'Diamond', 'default:diamond')-- default.node_sound_stone_defaults())
cross.register_cross( 'gold', 'default_gold_block.png', 'Gold', 'default:gold_ingot') -- default.node_sound_metal_defaults())
cross.register_cross( 'mese', 'default_meselamp.png', 'Mese', 'default:mese_crystal')-- default.node_sound_stone_defaults())
cross.register_cross( 'obsidian', 'default_obsidian.png', 'Obsidian', 'default:obsidian_shard') -- default.node_sound_stone_defaults())
cross.register_cross( 'steel', 'default_steel_block.png', 'Steel', 'default:steel_ingot') -- default.node_sound_metal_defaults())
cross.register_cross( 'stone', 'default_stone.png', 'Stone', 'default:stone') -- default.node_sound_stone_defaults())
cross.register_cross( 'wood', 'default_pine_wood.png^[transformR90', 'Wood', 'default:stick')-- default.node_sound_wood_defaults())

-------------------
-- Register Aliases
-------------------
minetest.register_alias('church:obsidian', 'church:cross_obsidian')
minetest.register_alias('church:wood', 'church:cross_wood')
minetest.register_alias('church:gold', 'church:cross_gold')
minetest.register_alias('church:diamond', 'church:cross_diamond')
minetest.register_alias('church:mese', 'church:cross_mese')
minetest.register_alias('church:stone', 'church:cross_stone')



dofile(modpath..'/pews.lua')
dofile(modpath..'/podium.lua')

minetest.log(
	'action',
	string.format(
		'['..minetest.get_current_modname()..'] loaded in %.3fs',
		os.clock() - load_time_start
	)
)
