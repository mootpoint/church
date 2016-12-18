

--------------------
-- Register Nodes
--------------------

minetest.register_node("church_altar:altar_end", {
  description = "Alter End",
  tiles = {"church_altar_end_top.png", --top
  "church_altar_end_top.png^[transformFXR180", --bottom
  "church_altar_sides.png", --left
  "church_altar_sides.png", --right
  "church_altar_end.png^[transformFX",--back
  "church_altar_end.png"}, --front
  drawtype = 'nodebox',
  paramtype = "light",
  paramtype2 = "facedir",
  sunlight_propagates = true,
  is_ground_content = false,
  groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
  node_box = {
		type = 'fixed',
		fixed = {
			{-0.4375, 0.0625, -0.5, 0.5, 0.25, 0.5},
			{-0.5, -0.5, -0.5, 0.5, -0.3125, 0.5},
			{-0.3125, -0.1875, -0.375, 0.5, 0, 0.375},
			{-0.375, 0, -0.4375, 0.5, 0.0625, 0.4375},
			{-0.4375, -0.3125, -0.4375, 0.5, -0.1875, 0.4375},
			{-0.0625, -0.3125, -0.5, 0.0625, 0.0625, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.3125, 0.5},
		},
	},
})

--------------------
-- Formspec
--------------------
local altar_formspec =
	"size[8,5.25]"..
	default.gui_bg..
	default.gui_bg_img..
	default.gui_slots..
	"list[current_name;main;0,0;8,1;]"..
	"list[current_player;main;0,1.5;8,4;]"..
	"listring[current_name;main]" ..
	"listring[current_player;main]"
	default.get_hotbar_bg(0,4.85)


	-- Helper functions
local function drop_stuff()
	return function(pos, oldnode, oldmetadata, digger)
		local meta = minetest.get_meta(pos)
		meta:from_table(oldmetadata)
		local inv = meta:get_inventory()
		for i = 1, inv:get_size("main") do
			local stack = inv:get_stack("main", i)
			if not stack:is_empty() then
				local p = {
					x = pos.x + math.random(0, 5)/5 - 0.5,
					y = pos.y,
					z = pos.z + math.random(0, 5)/5 - 0.5}
				minetest.add_item(p, stack)
			end
		end
	end
end

minetest.register_node("church_altar:altar_middle", {
  description = "Alter",
  tiles = {"church_altar_center_top.png", --top
  "church_altar_center_top.png^[transformFX", --bottom
  "church_altar_sides.png", --left
  "church_altar_sides.png", --right
  "church_altar_center.png^[transformFX",--back
  "church_altar_center.png"}, --front
  drawtype = 'nodebox',
  paramtype = "light",
  paramtype2 = "facedir",
  sunlight_propagates = true,
  is_ground_content = false,
  groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
	after_dig_node = drop_stuff(),
  node_box = {
		type = 'fixed',
		fixed = {
			{-0.5, 0.0625, -0.5, 0.5, 0.25, 0.5},
			{-0.5, -0.5, -0.5, 0.5, -0.3125, 0.5},
			{-0.5, -0.1875, -0.375, 0.5, 0, 0.375},
			{-0.5, 0, -0.4375, 0.5, 0.0625, 0.4375},
			{-0.5, -0.3125, -0.4375, 0.5, -0.1875, 0.4375},
			{-0.25, -0.3125, -0.5, 0.25, 0.0625, 0.5},
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.3125, 0.5},
		},
	},

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", altar_formspec)
		meta:set_string("infotext", "Altar")
		local inv = meta:get_inventory()
		inv:set_size("main", 8*1)
	end,

	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name()..
		" moves stuff in altar at "..minetest.pos_to_string(pos))
	end,

    on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
		" moves stuff to altar at "..minetest.pos_to_string(pos))
	end,

    on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name()..
		" takes stuff from altar at "..minetest.pos_to_string(pos))
	end,
	
	on_blast = function(pos)
		local drops = {}
		default.get_inventory_drops(pos, "main", drops)
		drops[#drops+1] = "church_altar:altar_middle"
		minetest.remove_node(pos)
		return drops
	end,
})

-------------------
-- Register ABM
-------------------
-- suck in items [code by jordan4ibanez / Hopper mod]
minetest.register_abm({
	nodenames = {"church_altar:altar_middle"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local posob

		for _,object in ipairs(minetest.get_objects_inside_radius(pos, 2)) do
			if not object:is_player() and object:get_luaentity() and object:get_luaentity().name == "__builtin:item" then
				if inv and inv:room_for_item("main", ItemStack(object:get_luaentity().itemstring)) then
					posob = object:getpos()
					if math.abs(posob.x-pos.x) <= 1.5 and (posob.y-pos.y <= 0.85 and posob.y-pos.y >= 0.3) then
						inv:add_item("main", ItemStack(object:get_luaentity().itemstring))
						object:get_luaentity().itemstring = ""
						object:remove()
					end
				end
			end
		end
	end,
})

-----------------------------
-- Register Craft Recipes
-----------------------------

minetest.register_craft({
	output = 'church_altar:altar_end',
	recipe = {
		{'', '', ''},
		{'', '','stairs:slab_stone'},
		{'', '', 'group:stone'}
	}
})

minetest.register_craft({
	output = 'church_altar:altar_end',
	recipe = {
		{'', '', ''},
		{'stairs:slab_stone', '', ''},
		{'group:stone', '', ''}
	}
})

minetest.register_craft({
	output = 'church_altar:altar_middle',
	recipe = {
		{'', '', ''},
		{'', 'stairs:slab_stone', ''},
		{'', 'group:stone', ''}
	}
})

minetest.register_craft({
	output = 'church_altar:altar_middle',
	recipe = {
		{'', 'stairs:slab_stone', ''},
		{'', 'group:stone', ''},
		{'', '', ''}
	}
})

