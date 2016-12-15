-- Grave mod written by mootpoint and Napiophelios
--[[
Copyright (C) 2016 Joseph 'Tucker' Bamberg
Copyright (C) 2016 -- for napiophelios
This file is part of the grave mod
the grave mod is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
Stats is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with the grave mod.  If not, see <http://www.gnu.org/licenses/>.
]]--

-- big thanks to pyrollo for the grave marker text
------------------------------
--Part of the church Modpack--
------------------------------
local load_time_start = os.clock()
screwdriver = screwdriver or {}
grave = {}
display_lib.register_display_entity("grave:text")
--Grave Markers
minetest.register_node('grave:grave', {
	description = 'Grave Stone',
	tiles = {'grave_stone_mossy.png', 'grave_stone.png',
	'grave_stone.png', 'grave_stone_mossy.png',
	'grave_stone_mossy.png', 'grave_stone.png'},
	groups = {cracky = 3, oddly_breakable_by_hand = 2, choppy =1 },
	drawtype = 'nodebox',
	paramtype = 'light',
	paramtype2 = 'facedir',
	sunlight_propagates = true,
	is_ground_content = false,
	buildable_to = false,
	--light_source = 1,
--	sounds = default.node_sound_stone_defaults(),
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
	},
	display_entities = {
		["grave:text"] = {
			on_display_update = font_lib.on_display_update,
			depth = -2/16-0.001, height = 2/16,
			size = { x = 14/16, y = 12/16 },
			resolution = { x = 144, y = 64 },
			maxlines = 3,
			},
		},
	on_place = display_lib.on_place,
	on_construct = 	function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "size[6,4]"..
		"textarea[0.5,0.7;5.5,2;display_text;Displayed text (3 lines max);${display_text}]"..
									"button_exit[2,3;2,1;ok;Write]")
		display_lib.on_construct(pos)
	end,
	on_destruct = display_lib.on_destruct,
	on_rotate = display_lib.on_rotate,
	on_receive_fields = function(pos, formname, fields, player)
		if not minetest.is_protected(pos, player:get_player_name()) then
			local meta = minetest.get_meta(pos)
			if fields and fields.ok then
				meta:set_string("display_text", fields.display_text)
				meta:set_string("infotext", "\""..fields.display_text.."\"")
				display_lib.update_entities(pos)
			end
		end
	end,
})


minetest.register_node('grave:grave_fancy', {
	description = 'Cemetary Cross',
	tiles = {'grave_stone_mossy.png', 'grave_stone.png',
	'grave_stone_mossy.png', 'grave_stone.png',
	'grave_stone_mossy.png', 'grave_stone.png'},
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

minetest.register_node('grave:grave_simple', {
	description = 'Simple Cemetary Cross',
	tiles = {'grave_stone_mossy.png', 'grave_stone.png',
	'grave_stone.png', 'grave_stone.png',
	'grave_stone_mossy.png', 'grave_stone.png'},
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


--------------------
--Crafting Recipes--
--------------------


minetest.register_craft({
	output = 'grave:grave',
	recipe = {
		{ '', '', '' },
		{ '', 'group:stone', '' },
		{ '', 'stairs:slab_cobble', '' },
	}
})

minetest.register_craft({
	output = 'grave:grave_fancy',
	recipe = {
		{ '', 'cross:stone', '' },
		{ '', 'stairs:slab_cobble', '' },
		{ '', '', '' },
	}
})

minetest.register_craft({
	output = 'grave:grave_simple',
	recipe = {
		{ '', 'cross:stone', '' },
		{ '', 'walls:cobble', '' },
		{ '', '', '' },
	}
})

minetest.log(
	'action',
	string.format(
		'['..minetest.get_current_modname()..'] loaded in %.3fs',
		os.clock() - load_time_start
	)
)

