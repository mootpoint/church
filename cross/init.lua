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
minetest.register_node('cross:wallcross_gold', {
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

minetest.register_node('cross:wallcross_steel', {
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
--Cross Standards
cross.register_cross = function( basename, texture, description, craft_from)-- mat_sounds )
local group_def = {cracky = 3, oddly_breakable_by_hand = 2, choppy =1 };

	minetest.register_node('cross:cross_'..basename, {
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
		output = 'cross:cross_'..basename,
		recipe = {
			{'', craft_from, ''},
			{'default:stick', 'default:stick', 'default:stick'},
			{'', 'default:stick', ''}
		}
	})

end

minetest.register_craft({
	output = 'cross:wallcross_gold',
	recipe = {
		{ '', '', '' },
		{ '', 'cross:cross_gold', '' },
		{ '', '', '' },
	}
})

minetest.register_craft({
	output = 'cross:wallcross_steel',
	recipe = {
		{ '', '','' },
		{ '', 'cross:cross_steel','' },
		{ '', '','' },
	}
})

minetest.register_craft({
	output = 'cross:grave',
	recipe = {
		{ '', 'group:stone', '' },
		{ '', 'stairs:slab_cobble', '' },
		{ '', '', '' },
	}
})


minetest.register_craft({
	output = 'cross:grave_simple',
	recipe = {
		{ '', '', '' },
		{ '', 'cross:cross_stone', '' },
		{ '', 'walls:cobble', '' },
	}
})

----------
-- Cooking
----------
minetest.register_craft({
	type = 'cooking',
	output = 'default:gold_ingot',
	recipe = 'cross:wallcross_gold',
	cooktime = 5,
})

minetest.register_craft({
	type = 'cooking',
	output = 'default:steel_ingot',
	recipe = 'cross:wallcross_steel',
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
minetest.register_alias('cross:obsidian', 'cross:cross_obsidian')
minetest.register_alias('cross:wood', 'cross:cross_wood')
minetest.register_alias('cross:gold', 'cross:cross_gold')
minetest.register_alias('cross:diamond', 'cross:cross_diamond')
minetest.register_alias('cross:mese', 'cross:cross_mese')
minetest.register_alias('cross:stone', 'cross:cross_stone')



minetest.log(
	'action',
	string.format(
		'['..minetest.get_current_modname()..'] loaded in %.3fs',
		os.clock() - load_time_start
	)
)
