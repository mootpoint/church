-- podium mod for minetest

--[[
Copyright (C) 2016 Joseph 'Tucker' Bamberg
This file is part of the podium mod
the podium mod is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
Stats is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with the podium mod.  If not, see <http://www.gnu.org/licenses/>.
]]--

-- Part of the church Modpack
local register_podium_bottom = function(name, def, texture)
	def.tiles = {
		texture,
		texture,
		texture,
		texture,
		texture,
		texture,
	}
	def.drawtype = 'nodebox'
	def.paramtype = 'light'
	def.paramtype2 = 'facedir'
	def.node_box = {
		type = 'fixed',
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, -0.3125, 0.375},
			{-0.3125, -0.5, -0.3125, 0.3125, -0.1875, 0.3125},
			{-0.125, -0.5, -0.125, 0.125, 0.5, 0.125},
		}
	}
	def.selection_box = {
		type = 'fixed',
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		}
	}
	def.groups = {snappy = 2, oddly_breakable_by_hand = 3,}
	minetest.register_node(name, def)
end 

local register_podium_top = function(name, def, texture)
	def.tiles = {
		texture,
		texture,
		texture,
		texture,
		texture,
		texture,
	}
	def.drawtype = 'nodebox'
	def.paramtype = 'light'
	def.paramtype2 = 'facedir'
	def.node_box = {
		type = 'fixed',
		fixed = {
			{-0.125, -0.5, -0.125, 0.125, -0.0625, 0.125},
			{-0.125, -0.5, -0.125, 0.0625, -0.0625, 0.125},
			{0.4375, -0.5, -0.5, 0.5, -0.4375, 0.5},
			{0.375, -0.4375, -0.5, 0.4375, -0.375, 0.5},
			{0.3125, -0.375, -0.5, 0.375, -0.3125, 0.5},
			{0.25, -0.3125, -0.5, 0.3125, -0.25, 0.5},
			{0.1875, -0.25, -0.5, 0.25, -0.1875, 0.5},
			{0.125, -0.1875, -0.5, 0.1875, -0.125, 0.5},
			{0.0625, -0.125, -0.5, 0.125, -0.0625, 0.5},
		}
	}
	def.selection_box = {
		type = 'fixed',
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		}
	}
	def.groups = {snappy = 2, oddly_breakable_by_hand = 3,}
	minetest.register_node(name, def)
end 
register_podium_bottom('church_podium:podium_bottom_wood', {description = 'podium bottom wood'}, 'default_wood.png')
register_podium_bottom('church_podium:podium_bottom_pine', {description = 'podium bottom pine'}, 'default_pine_wood.png')
register_podium_bottom('church_podium:podium_bottom_acacia', {description = 'podium bottom acacia'}, 'default_acacia_wood.png')
register_podium_bottom('church_podium:podium_bottom_junglewood', {description = 'podium bottom junglewood'}, 'default_junglewood.png')
register_podium_bottom('church_podium:podium_bottom_aspen', {description = 'podium bottom aspen'}, 'default_aspen_wood.png')

register_podium_top('church_podium:podium_top_wood', {description = 'podium top wood'}, 'default_wood.png')
register_podium_top('church_podium:podium_top_pine', {description = 'podium top pine'}, 'default_pine_wood.png')
register_podium_top('church_podium:podium_top_acacia', {description = 'podium top acacia'}, 'default_acacia_wood.png')
register_podium_top('church_podium:podium_top_junglewood', {description = 'podium top acacia'}, 'default_junglewood.png')
register_podium_top('church_podium:podium_top_aspen', {description = 'podium top aspen'}, 'default_aspen_wood.png')



