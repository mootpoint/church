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

minetest.register_node('podium:podium_bottom_wood', {
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
			{-0.375, -0.5, -0.375, 0.375, -0.3125, 0.375},
			{-0.3125, -0.5, -0.3125, 0.3125, -0.1875, 0.3125},
			{-0.125, -0.5, -0.125, 0.125, 0.5, 0.125},
		}
	}
})


minetest.register_node('podium:podium_top_wood', {
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
})

