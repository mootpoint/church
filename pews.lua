--church pews in different textures.

	
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


register_pew_left('cross:pew_acacia', {}, 'default_acacia_wood')
register_pew_right('cross:pew_acacia', {}, 'default_acacia_wood')
register_pew_middle('cross:pew_acacia', {}, 'default_acacia_wood')
register_pew_left('cross:pew_wood', {}, 'default_wood')
register_pew_middle('cross:pew_wood', {}, 'default_wood')
register_pew_right('cross:pew_wood', {}, 'default_wood')
register_pew_left('cross:pew_junglewood', {}, 'default_junglewood')
register_pew_right('cross:pew_junglewood', {}, 'default_junglewood')
register_pew_middle('cross:pew_junglewood', {}, 'default_junglewood')
register_pew_left('cross:pew_pine', {}, 'default_pine_wood')
register_pew_right('cross:pew_pine', {}, 'default_pine_wood')
register_pew_middle('cross:pew_pine', {}, 'default_pine_wood')
