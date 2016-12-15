--pews in different textures.

--[[
Copyright (C) 2016 Joseph 'Tucker' Bamberg AKA 'mootpoint'
This file is part of the pews mod
the pews mod is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
Stats is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with the pews mod.  If not, see <http://www.gnu.org/licenses/>.
]]--

-- part of the church modpack


	
local register_pew_left = function(name, def, wood)
	local n = name
	local name2 = n..'_left'
	def.description = wood..' Pew Left'
	def.tiles = {
		wood..'.png',
		wood..'.png',
		wood..'.png',
		wood..'.png',
		wood..'.png',
		wood..'.png',
	}
	def.drawtype = 'nodebox'
	def.paramtype = 'light'
	def.paramtype2 = 'facedir'
	def.node_box = {
		type = 'fixed',
		fixed = {
			{-0.5, -0.5, -0.5, -0.4375, 0, 0.5},
			{-0.5, -0.5, 0.0625, -0.4375, 0.5, 0.5},
			{-0.5, -0.1875, 0.4375, 0.5, 0.5, 0.5},
			{-0.5, -0.3125, -0.5, 0.5, -0.1875, 0.5},
			{-0.5, -0.5, 0, -0.4375, 0.0625, 0.375},
		}
	}
	def.selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		}
	}
	def.groups = {snappy = 3, oddly_breakable_by_hand = 3,}
	minetest.register_node(name2, def)
	
end


local register_pew_right = function(name, def, wood)
	local n = name
	local name2 = n..'_right'
	def.description = wood..' Pew Right'
	def.tiles = {
		wood..'.png',
		wood..'.png',
		wood..'.png',
		wood..'.png',
		wood..'.png',
		wood..'.png',
	}
	def.drawtype = 'nodebox'
	def.paramtype = 'light'
	def.paramtype2 = 'facedir'
	def.node_box = {
		type = 'fixed',
		fixed = {
			{0.4375, -0.5, -0.5, 0.5, 0, 0.5},
			{0.4375, -0.5, 0.0625, 0.5, 0.5, 0.5},
			{-0.5, -0.1875, 0.4375, 0.5, 0.5, 0.5},
			{-0.5, -0.3125, -0.5, 0.5, -0.1875, 0.5},
			{0.4375, -0.5, 0, 0.5, 0.0625, 0.375},
		}
	}
	def.selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		}
	}
	def.groups = {snappy = 3, oddly_breakable_by_hand = 3,}
	minetest.register_node(name2, def)
	
end

local register_pew_middle = function(name, def, wood)
	local n = name
	local name2 = n..'_middle'
	def.description = wood..' Pew Middle'
	def.tiles = {
		wood..'.png',
		wood..'.png',
		wood..'.png',
		wood..'.png',
		wood..'.png',
		wood..'.png',
	}
	def.drawtype = 'nodebox'
	def.paramtype = 'light'
	def.paramtype2 = 'facedir'
	def.node_box = {
		type = 'fixed',
		fixed = {
			{-0.5, -0.1875, 0.4375, 0.5, 0.5, 0.5},
			{-0.5, -0.3125, -0.5, 0.5, -0.1875, 0.5},
		}
	}
	def.selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		}
	}
	def.groups = {snappy = 3, oddly_breakable_by_hand = 3,}
	minetest.register_node(name2, def)
	
end
local register_pew = function(name, def, wood)
	register_pew_left(name, {}, wood)
	register_pew_right(name, {}, wood)
	register_pew_middle(name, {}, wood)
end

	
register_pew('pews:pew_acacia', {}, 'default_acacia_wood')
register_pew('pews:pew_wood', {}, 'default_wood')
register_pew('pews:pew_junglewood', {}, 'default_junglewood')
register_pew('pews:pew_pine', {}, 'default_pine_wood')

minetest.register_craft({
	output = 'pews:pew_acacia_right',
	recipe = {
		{'', 'default:acacia_wood', ''},
		{'stairs:stair_acacia_wood', 'stairs:stair_acacia_wood', ''},
		{'', '', ''},
	},
})


minetest.register_craft({
	output = 'pews:pew_acacia_left',
	recipe = {
		{'default:acacia_wood', '', ''},
		{'stairs:stair_acacia_wood', 'stairs:stair_acacia_wood', ''},
		{'', '', ''},
	},
})


minetest.register_craft({
	output = 'pews:pew_acacia_middle',
	recipe = {
		{'', '', ''},
		{'stairs:stair_acacia_wood', 'stairs:stair_acacia_wood', ''},
		{'', '', ''},
	},
})

minetest.register_craft({
	output = 'pews:pew_wood_right',
	recipe = {
		{'', 'default:wood', ''},
		{'stairs:stair_wood', 'stairs:stair_wood', ''},
		{'', '', ''},
	},
})


minetest.register_craft({
	output = 'pews:pew_wood_left',
	recipe = {
		{'default:wood', '', ''},
		{'stairs:stair_wood', 'stairs:stair_wood', ''},
		{'', '', ''},
	},
})


minetest.register_craft({
	output = 'pews:pew_wood_middle',
	recipe = {
		{'', '', ''},
		{'stairs:stair_wood', 'stairs:stair_wood', ''},
		{'', '', ''},
	},
})

minetest.register_craft({
	output = 'pews:pew_junglewood_right',
	recipe = {
		{'', 'default:junglewood', ''},
		{'stairs:stair_junglewood', 'stairs:stair_junglewood', ''},
		{'', '', ''},
	},
})


minetest.register_craft({
	output = 'pews:pew_junglewood_left',
	recipe = {
		{'default:junglewood', '', ''},
		{'stairs:stair_junglewood', 'stairs:stair_junglewood', ''},
		{'', '', ''},
	},
})


minetest.register_craft({
	output = 'pews:pew_junglewood_middle',
	recipe = {
		{'', '', ''},
		{'stairs:stair_junglewood', 'stairs:stair_junglewood', ''},
		{'', '', ''},
	},
})

minetest.register_craft({
	output = 'pews:pew_pine_right',
	recipe = {
		{'', 'default:pine_wood', ''},
		{'stairs:stair_pine_wood', 'stairs:stair_pine_wood', ''},
		{'', '', ''},
	},
})


minetest.register_craft({
	output = 'pews:pew_pine_left',
	recipe = {
		{'default:pine_wood', '', ''},
		{'stairs:stair_pine_wood', 'stairs:stair_pine_wood', ''},
		{'', '', ''},
	},
})


minetest.register_craft({
	output = 'pews:pew_pine_middle',
	recipe = {
		{'', '', ''},
		{'stairs:stair_pine_wood', 'stairs:stair_pine_wood', ''},
		{'', '', ''},
	},
})

