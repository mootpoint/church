--[[
--============
--Work Bench mod by jp
--Copyright (c) 2015-2016 kilbith <jeanpatrick.guerrero@gmail.com>   |
--Code: GPL version 3
--============
--Arches nodes designed by Peak  (LGPLv2.1+)
--Pillars nodes designed by Glunggi  (LGPLv2.1+)
--http://www.gnu.org/licenses/lgpl-2.1.html
--Column / PassageWay nodes designed by Artemis  (WTFPL)
--http://www.wtfpl.net/txt/copying
--============
--]]

crafting_crate = {}

screwdriver = screwdriver or {}

local nodes = { -- Nodes allowed to be cut. Mod name = {node name}.

	["castle"] = {"dungeon_stone", "pavement_brick", "stone", "wall" },

	["darkage"] = {"adobe", "basalt", "basalt_brick", "basalt_cobble", "chalk", "chalk_brick", "desert_stone_cobble", "gneiss", "gneiss_brick", "gneiss_cobble", "marble", "marble_cobble", "marble_dark", "old_stone_brick", "ors", "ors_brick", "ors_cobble", "sandstone_cobble", "schist", "serpentine", "shale", "slate", "slate_brick", "slate_cobble"},

	["default"] = {"acacia_wood", "aspen_wood", "cobble", "desert_cobble", "desert_stone", "desert_stone_block", "desert_stonebrick", "ice", "junglewood", "mossycobble", "obsidian", "obsidian_block", "obsidianbrick", "pine_wood", "sandstone", "sandstone_block", "sandstonebrick", "stone", "stone_block", "stonebrick", "wood" },

	["lapis"] = {"lapis_cobble", "lapis_block", "lazurite_block", "lapis_brick", "lazurite_brick" },

}

local def = { -- Nodebox name, yield, definition.
--  {"slab", 2, { -0.5,-0.5,-0.5, 0.5, 0, 0.5 }},
--  {"stair", 1, {{ -0.5, -0.5, -0.5, 0.5, 0, 0.5 }, { -0.5, 0, 0, 0.5, 0.5, 0.5 }}},
  {"innerstair", 1, {{ -0.5, -0.5, -0.5, 0.5, 0, 0.5 }, { -0.5, 0, 0, 0.5, 0.5, 0.5 }, { -0.5, 0, -0.5, 0, 0.5, 0 }}},
  {"column_top",1, {{-0.3125, -0.5, -0.3125, 0.3125, -0.0625, 0.3125}, {-0.25, -0.5, -0.375, 0.25, -0.125, 0.375}, {-0.375, -0.5, -0.25, 0.375, -0.125, 0.25}, {-0.4375, -0.5, -0.1875, 0.4375, -0.1875, 0.1875}, {-0.1875, -0.5, -0.4375, 0.1875, -0.1875, 0.4375}, {-0.3125, -0.0625, -0.3125, 0.3125, 0.125, 0.3125}, {-0.125, 0.0625, -0.5, 0.125, 0.125, 0.5}, {-0.5, 0.0625, -0.125, 0.5, 0.125, 0.125}, {-0.5, -0.0625, -0.125, -0.4375, 0.125, 0.125}, {-0.125, -0.0625, 0.4375, 0.125, 0.125, 0.5}, {-0.125, -0.0625, -0.5, 0.125, 0.125, -0.4375}, {0.4375, -0.0625, -0.125, 0.5, 0.125, 0.125}, {-0.25, -0.0625, -0.5, 0.25, 0, -0.4375}, {0.4375, -0.0625, -0.25, 0.5, 0, 0.25}, {-0.25, -0.0625, 0.4375, 0.25, 0, 0.5}, {-0.5, -0.0625, -0.25, -0.4375, 0, 0.25}, {-0.5, -0.375, -0.0625, -0.4375, -0.0625, 0.0625}, {-0.0625, -0.375, -0.5, 0.0625, -0.0625, -0.4375}, {0.4375, -0.375, -0.0625, 0.5, -0.0625, 0.0625}, {-0.0625, -0.375, 0.4375, 0.0625, 0, 0.5}, {-0.5, 0.125, -0.5, 0.5, 0.5, 0.5}}},
  {"pillar-top", 2,{{-0.5,0.3125,-0.5,0.5,0.5,0.5}, {-0.375,0.0625,-0.375,0.375,0.3125,0.375}, {-0.25,-0.5,-0.25,0.25,0.0625,0.25}}},
  {"window-lineal",1, {{ -0.4, 0.4, -0.5, 0.4, 0.5, -0.4}, { -0.4, 0.4, 0.4, 0.4, 0.5, 0.5 }, { -0.3, 0.3, -0.4, 0.3, 0.5, -0.3}, { -0.3, 0.3, 0.3, 0.3, 0.5, 0.4}, { -0.2, 0.2, -0.3, 0.2, 0.5, 0.3}, { 0.2, -0.5, -0.3, 0.3, 0.5, 0.3}, { -0.3, -0.5, -0.3, -0.2, 0.5, 0.3}, { 0.3, -0.5, -0.4, 0.4, 0.5, 0.4}, { -0.4, -0.5, -0.4, -0.3, 0.5, 0.4}, { 0.4, -0.5, -0.5, 0.5, 0.5, 0.5 }, { -0.5, -0.5, -0.5, -0.4, 0.5, 0.5 }}},
  {"arch",2, {{-0.5, -0.5, 0.4375, 0.5, 0.5, 0.5}, {-0.5, -0.25, 0.375, 0.5, 0.5, 0.4375}, {-0.5, -0.0625, 0.3125, 0.5, 0.5, 0.375}, {-0.5, -0, 0.25, 0.5, 0.5, 0.3125}, {-0.5, 0.125, 0.1875, 0.5, 0.5, 0.25}, {-0.5, 0.1875, 0.125, 0.5, 0.5, 0.1875}, {-0.5, 0.25, 0, 0.5, 0.5, 0.125}, {-0.5, 0.3125, -0.0625, 0.5, 0.5, 0.0625}, {-0.5, 0.375, -0.25, 0.5, 0.5, 0}, {-0.5, 0.4375, -0.5, 0.5, 0.5, -0.1875}}},
  {"passage-way_double",2, {{-0.5, -0.5, 0.3125, -0.125, 0.5, 0.5}, {-0.5, -0.5, -0.5, -0.125, 0.5, -0.3125}, {-0.125, -0.5, 0.375, 0.125, 0.5, 0.5}, {-0.125, -0.5, -0.5, 0.125, 0.5, -0.375}, {0.125, -0.5, 0.4375, 0.3125, 0.5, 0.5}, {0.125, -0.5, -0.5, 0.3125, 0.5, -0.4375}}},
  {"outerstair", 1, {{ -0.5, -0.5, -0.5, 0.5, 0, 0.5 }, { -0.5, 0, 0, 0, 0.5, 0.5 }}},
  {"column",1, {{ -0.3125, -0.5, -0.3125, 0.3125, 0.5, 0.3125 }, { -0.25, -0.5, -0.375, 0.25, 0.5, 0.375 }, { -0.375, -0.5, -0.25, 0.375, 0.5, 0.25 }, { -0.1875, -0.5, -0.4375, 0.1875, 0.5, 0.4375 }, { -0.4375, -0.5, -0.1875, 0.4375, 0.5, 0.1875 }}},
  {"pillar", 2, { -0.25, -0.5, -0.25, 0.25, 0.5, 0.25 }},
  {"window-casing", 1, {{ 0.2, -0.5, -0.3, 0.3, 0.5, 0.3}, { -0.3, -0.5, -0.3, -0.2, 0.5, 0.3}, { 0.3, -0.5, -0.4, 0.4, 0.5, 0.4}, { -0.4, -0.5, -0.4, -0.3, 0.5, 0.4}, { 0.4, -0.5, -0.5, 0.5, 0.5, 0.5 }, { -0.5, -0.5, -0.5, -0.4, 0.5, 0.5 }}},
  {"arch_inner",1, {{-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5}, {-0.5, 0.375, -0.5, 0.25, 0.4375, 0.5}, {0.25, 0.375, -0.25, 0.5, 0.4375, 0.5}, {-0.5, 0.3125, -0.5, 0.0625, 0.375, 0.5}, {0.0625, 0.3125, -0.0625, 0.5, 0.375, 0.5}, {-0.5, 0.25, -0.5, 0, 0.3125, 0.5}, {0, 0.25, -0, 0.5, 0.3125, 0.5}, {-0.5, 0.1875, -0.5, -0.125, 0.5, 0.1875}, {-0.5, 0.1875, 0.125, 0.5, 0.3125, 0.5}, {-0.5, 0.125, -0.5, -0.1875, 0.1875, 0.1875}, {-0.5, 0.125, 0.1875, 0.5, 0.1875, 0.5}, {-0.5, -0, 0.25, 0.5, 0.125, 0.5}, {-0.5, -0, -0.5, -0.25, 0.1875, 0.3125}, {-0.5, 0, 0.25, 0.5, 0.1875, 0.5}, {-0.375, -0.0625, 0.3125, 0.5, 0, 0.5}, {-0.5, -0.0625, -0.5, -0.3125, 0, 0.4375}, {-0.5, -0.25, -0.5, -0.375, 0, 0.5}, {-0.4375, -0.25, 0.375, 0.5, 0.5, 0.5}, {-0.5, -0.5, -0.5, -0.4375, -0.25, 0.5}, {-0.5, -0.5, 0.4375, 0.5, -0.25, 0.5}}},
  {"passage-way_left",2, {{-0.5, -0.5, -0.5, -0.125, 0.5, -0.3125}, {-0.125, -0.5, -0.5, 0.125, 0.5, -0.375}, {0.125, -0.5, -0.5, 0.3125, 0.5, -0.4375}}},
  {"accent_panel",4, {-0.5, -0.4375, -0.4375, -0.4375, 0.4375, 0.4375}},
  {"column-base",1, {{ -0.3125, -0.5, -0.3125, 0.3125, 0.5, 0.3125 }, { -0.25, -0.5, -0.375, 0.25, 0.5, 0.375 }, { -0.3125, -0.5, -0.25, 0.25, 0.5, 0.3125 }, { -0.25, -0.5, -0.375, 0.1875, 0.5, 0.375 }, { -0.4375, -0.5, -0.1875, 0.4375, 0.5, 0.1875 }, { -0.375, -0.5, -0.25, 0.375, 0.5, 0.25 }, { -0.1875, -0.5, -0.4375, 0.1875, 0.5, 0.4375 }, { -0.5, -0.5, -0.5, 0.5, -0.3125, 0.5 }, { -0.4375, -0.5, -0.4375, 0.4375, -0.1875, 0.4375 }, { -0.375, -0.5, -0.375, 0.375, -0.0625, 0.375 }}},
  {"pillar-base",2, {{ -0.5, -0.5, -0.5, 0.5, -0.375, 0.5 }, { -0.375, -0.375, -0.375, 0.375, -0.125, 0.375 }, { -0.25, -0.125, -0.25, 0.25, 0.5, 0.25 }}},
  {"window-sill", 1, {{ 0.2, -0.4, -0.3, 0.3, 0.5, 0.3 }, { -0.3, -0.4, -0.3, -0.2, 0.5, 0.3 }, { 0.3, -0.4, -0.4, 0.4, 0.5, 0.4 }, { -0.4, -0.4, -0.4, -0.3, 0.5, 0.4 }, { 0.4, -0.4, -0.5, 0.5, 0.5, 0.5 }, { -0.5, -0.4, -0.5, -0.4, 0.5, 0.5 }, { -0.5, -0.5, -0.5, 0.5, -0.4, 0.5 }}},
  {"arch_outer",2, {{0.4375, -0.5, 0.4375, 0.5, -0.25, 0.5}, {0.375, -0.25, 0.375, 0.5, -0.0625, 0.5}, {0.3125, -0.0625, 0.3125, 0.5, 0, 0.5}, {0.25, -0, 0.25, 0.5, 0.125, 0.5}, {0.1875, 0.125, 0.1875, 0.5, 0.1875, 0.5}, {0.125, 0.1875, 0.125, 0.5, 0.25, 0.5}, {-0, 0.25, -0, 0.5, 0.3125, 0.5}, {-0.0625, 0.3125, -0.0625, 0.5, 0.375, 0.5}, {-0.25, 0.375, -0.25, 0.5, 0.4375, 0.5}, {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5}}},
  {"passage-way_right",2, {{-0.5, -0.5, 0.3125, -0.125, 0.5, 0.5}, {-0.125, -0.5, 0.375, 0.125, 0.5, 0.5}, {0.125, -0.5, 0.4375, 0.3125, 0.5, 0.5}}},
}

function crafting_crate.construct(pos)
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()

	inv:set_size("forms", 6*3)
	inv:set_size("input", 1)

	local formspec = "size[8,7;]"..
   "list[context;forms;2, 0;6,3;]" ..
   default.gui_bg..
   default.gui_bg_img..
   default.gui_slots..
   "label[0,0;Crafting Crate]"..
   "list[current_name;input;0,1;1,1;]"..
   "image[1,1;1,1;gui_furnace_arrow_bg.png^[transformR270]"..
   "list[current_player;main;0,3.3;8,4;]"
	meta:set_string("formspec", formspec)
	meta:set_string("infotext", "Crafting Crate")
end

function crafting_crate.dig(pos, _)
	local inv = minetest.get_meta(pos):get_inventory()
	if not inv:is_empty("input") then
		return false end
	return true
end

function crafting_crate.contains(table, element)
	if table then
		for _, value in pairs(table) do
			if value == element then return true end
		end
	end
	return false
end

function crafting_crate.put(_, listname, _, stack, _)
	local stn = stack:get_name()
	local count = stack:get_count()
	local mod, node = stn:match("([%a_]+):([%a_]+)")

	if listname == "forms" then return 0 end
	if listname == "input" then
		if not crafting_crate.contains(nodes[mod], node) then return 0 end
	end
	return count
end

function crafting_crate.take(pos, listname, _, stack, _)
	local inv = minetest.get_meta(pos):get_inventory()
	local inputstack = inv:get_stack("input", 1):get_name()
	local mod, node = inputstack:match("([%a_]+):([%a_]+)")

	if listname == "forms" then
		if not crafting_crate.contains(nodes[mod], node) then return 0 end
		return -1
	end
	return stack:get_count()
end

local function update_inventory(inv, inputstack)

	if inv:is_empty("input") then inv:set_list("forms", {}) return end
	local output = {}

	for _, n in pairs(def) do
		local mat = inputstack:get_name()
		local input = inv:get_stack("input", 1)
		local mod, node = mat:match("([%a_]+):([%a_]+)")
		local count = math.min(n[2] * input:get_count(), inputstack:get_stack_max())

		if not crafting_crate.contains(nodes[mod], node) then return 0 end
		output[#output+1] = string.format("%s_%s %d", mat, n[1], count)
	end
	inv:set_list("forms", output)
end

function crafting_crate.on_put(pos, listname, _, stack, _)
	if listname == "input" then
		local inv = minetest.get_meta(pos):get_inventory()
		update_inventory(inv, stack)
	end
end

function crafting_crate.on_take(pos, listname, index, stack, _)
	local inv = minetest.get_meta(pos):get_inventory()
	if listname == "input" then
		update_inventory(inv, stack)
	elseif listname == "forms" then
		local inputstack = inv:get_stack("input", 1)
		inputstack:take_item(math.ceil(stack:get_count() / def[index][2]))
		inv:set_stack("input", 1, inputstack)
		update_inventory(inv, inputstack)
	end
end

minetest.register_node("church_crafter:crafter", {
	description = "Crafting Crate",
	tiles = {"church_crafter_crate_top.png", "church_crafter_crate_bottom.png", "church_crafter_crate_sides.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = false,
	is_ground_content = false,
	groups = { snappy = 2, choppy = 3, cracky = 3,oddly_breakable_by_hand = 1 },
	on_rotate = screwdriver.rotate_simple,
	sounds = default.node_sound_wood_defaults(),
	can_dig = crafting_crate.dig,
	on_construct = crafting_crate.construct,
	on_receive_fields = crafting_crate.fields,
	on_metadata_inventory_put = crafting_crate.on_put,
	on_metadata_inventory_take = crafting_crate.on_take,
	allow_metadata_inventory_put = crafting_crate.put,
	allow_metadata_inventory_take = crafting_crate.take,
	allow_metadata_inventory_move = crafting_crate.move
})

for _, d in pairs(def) do
for mod, n in pairs(nodes) do
for _, name in pairs(n) do
	local ndef = minetest.registered_nodes[mod..":"..name]
	if ndef then
		local groups = {}
		groups.not_in_creative_inventory=1
		groups.not_in_craft_guide=1

		for k, v in pairs(ndef.groups) do
			if k ~= "wood" and k ~= "stone" and k ~= "level" then
				groups[k] = v end
		end

		minetest.register_node(":"..mod..":"..name.."_"..d[1], {
			description = ndef.description.." "..d[1]:gsub("^%l", string.upper),
			paramtype = "light",
			paramtype2 = "facedir",
			drawtype = "nodebox",
			light_source = ndef.light_source,
			sounds = ndef.sounds,
			tiles = {ndef.tiles[6] or ndef.tiles[1]},
			groups = groups,
			node_box = {type = "fixed", fixed = d[3]},
			sunlight_propagates = true,
			--on_place = minetest.rotate_node
		})
	end
	minetest.register_alias("church_crafter:"..d[1].."_"..name, mod..":"..name.."_"..d[1])
end
end
end

function crafting_crate.register(name, def)
	def.drawtype = def.drawtype or (def.node_box and "nodebox")
	def.paramtype = def.paramtype or "light"
	def.sounds = def.sounds or default.node_sound_defaults()

	if not (def.drawtype == "glasslike_framed" or
			def.drawtype == "glasslike_framed_optional" or def.drawtype == "plantlike" or
			def.drawtype == "signlike" or def.drawtype == "normal") then
		def.paramtype2 = def.paramtype2 or "facedir"
	end

	if def.drawtype == "plantlike" or def.drawtype == "torchlike" or
			def.drawtype == "signlike" or def.drawtype == "fencelike" then
		def.sunlight_propagates = true
	end

	minetest.register_node("church_crafter:".. name, def)
end

crafting_crate.box = {
	slab_y = function(height, shift) return { -0.5, -0.5+(shift or 0), -0.5, 0.5, -0.5+height+(shift or 0), 0.5 } end,
	slab_z = function(depth) return { -0.5, -0.5, -0.5+depth, 0.5, 0.5, 0.5 } end,
	bar_y = function(radius) return {-radius, -0.5, -radius, radius, 0.5, radius} end,
	cuboid = function(radius_x, radius_y, radius_z) return {-radius_x, -radius_y, -radius_z, radius_x, radius_y, radius_z} end
}

crafting_crate.nodebox = {
	regular = { type = "regular" },
	null = { type = "fixed", fixed = { 0, 0, 0, 0, 0, 0 } }
}

local mt = {}
mt.__index = function(table, key)
	local ref = crafting_crate.box[key]
	local ref_type = type(ref)
	if ref_type == "function" then
		return function(...)
			return { type = "fixed", fixed = ref(...) }
		end
	elseif ref_type == "table" then
		return { type = "fixed", fixed = ref }
	elseif ref_type == "nil" then
		error(key .. "could not be found among nodebox presets and functions")
	end
	error("unexpected datatype " .. tostring(type(ref)) .. " while looking for " .. key)
end
setmetatable(crafting_crate.nodebox, mt)

minetest.register_craft({
	output = "church_crafter:crafting_crate",
	recipe = {
		{"group:wood", "default:steel_ingot", "group:wood"},
		{"default:steel_ingot", "default:chest", "default:steel_ingot"},
		{"group:wood", "default:steel_ingot", "group:wood"}
	}
})
