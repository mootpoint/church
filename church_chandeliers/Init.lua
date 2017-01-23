screwdriver = screwdriver or {}

local chandeliers = {}

chandeliers.types = {
{"bronze", "bronze", "church_chandelier_bronze", "default:bronze_ingot"},
{"copper", "copper", "church_chandelier_copper", "default:copper_ingot"},
{"gold", "gold", "church_chandelier_gold", "default:gold_ingot"},
{"steel", "Steel", "church_chandelier_steel", "default:steel_ingot"},
}



for _, row in ipairs(chandeliers.types) do
	local name = row[1]
	local desc = row[2]
	local image = row[3]
	local craft_material = row[4]

chandeliers.light = function(pos, node, puncher)
	if not puncher or not node then
		return
	end
	local wield = puncher:get_wielded_item()
	if not wield then
		return
	end
	wield = wield:get_name()
	if wield and wield == "default:torch" then
		minetest.env:add_node(pos,{name="church_chandeliers:chandelier_flame_"..name.."_lit", param1=node.param1, param2=node.param2})
		end
            local p1 = {x=pos.x, y=pos.y-1, z=pos.z}
            local n1 = minetest.get_node(p1)
            if n1.name == "air" then
                minetest.env:add_node(p1, {name= "church_chandeliers:chandelier_base_"..name, param1=node.param1, param2=node.param2})
            end
	end

chandeliers.snuff = function(pos, node, puncher)
	if not puncher or not node then
		return
	end
	local wield = puncher:get_wielded_item()
	if not wield then
		return
	end
	wield = wield:get_name()
	if not wield or wield ~= "default:torch" then
		minetest.env:add_node(pos,{name="church_chandeliers:chandelier_flame_"..name.."_unlit", param1=node.param1, param2=node.param2})
		end
            local p1 = {x=pos.x, y=pos.y-1, z=pos.z}
            local n1 = minetest.get_node(p1)
            if n1.name == "air" then
                minetest.env:add_node(p1, {name = "church_chandeliers:chandelier_base_"..name, param1=node.param1, param2=node.param2})
            end
    end

minetest.register_node("church_chandeliers:chandelier_base_"..name,{
		tiles = { image..".png"},
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {oddly_breakable_by_hand = 3, not_in_creative_inventory = 1},
		sunlight_propagates = true,
		walkable = false,
        pointable = false,
        drop = "",
		sounds = default.node_sound_metal_defaults(),
		on_rotate = screwdriver.rotate_simple,
        node_box = {
            type = "fixed",
            fixed = {
                {-0.375, 0.3125, -0.0625, -0.125, 0.4375, 0.0625},
                {0.125, 0.3125, -0.0625, 0.375, 0.375, 0.0625},
                {-0.0625, 0.3125, -0.375, 0.0625, 0.375, -0.125},
                {-0.0625, 0.3125, 0.125, 0.0625, 0.375, 0.375},
                {-0.0625, 0.375, -0.4375, 0.0625, 0.4375, 0.4375},
                {-0.4375, 0.375, -0.0625, 0.4375, 0.4375, 0.0625},
                {-0.125, 0.375, -0.125, 0.125, 0.4375, 0.125},
                {-0.0625, 0.3125, -0.0625, 0.0625, 0.5, 0.0625},
                {0.25, 0.4375, -0.125, 0.5, 0.5, 0.125},
                {-0.5, 0.4375, -0.125, -0.25, 0.5, 0.125},
                {-0.125, 0.4375, 0.25, 0.125, 0.5, 0.5},
                {-0.125, 0.4375, -0.5, 0.125, 0.5, -0.25},
            },
        },
        selection_box = {
            type = "fixed",
            fixed = {
                {-0.5, 0.25, -0.5, 0.5, 1.5, 0.5},
            },
        },
        after_destruct = function(pos,oldnode)
            local node = minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z})
            if node.name == "church_chandeliers:chandelier_flame_"..name.."_unlit"  or
                node.name == "church_chandeliers:chandelier_flame_"..name.."_lit"  then
                    minetest.dig_node({x=pos.x,y=pos.y+1,z=pos.z})
            end
        end
	})

	minetest.register_node("church_chandeliers:chandelier_flame_"..name.."_unlit", {
		description = desc.." Chandelier",
        inventory_image = image.."_wield.png",
        wield_image = image.."_wield.png",
        tiles = { image.."_flame_unlit.png"},
        drawtype = "plantlike",
        paramtype = "light",
        paramtype2 = "meshoptions",
        place_param2 = 1,
        sunlight_propagates = true,
        is_ground_content = false,
        walkable = false,
        buildable_to = false,
		drop = "church_chandeliers:chandelier_flame_"..name.."_unlit",
		groups = {crumbly = 3, oddly_breakable_by_hand = 2},
		on_punch = chandeliers.light,
		sounds = default.node_sound_metal_defaults({
			dug = {name = "default_dig_crumbly", gain = 1.0},
			dig = {name = "default_dig_crumbly", gain = 0.1},
			}
		),
        selection_box = {
            type = "fixed",
            fixed = {
                {-0.5, -0.7, -0.5, 0.5, 0.5, 0.5},
            },
        },
        on_construct =function(pos, placer)
            local p1 = {x=pos.x, y=pos.y-1, z=pos.z}
            local n1 = minetest.get_node(p1)
            if n1.name == "air" then
                minetest.add_node(p1, {name = "church_chandeliers:chandelier_base_"..name})
            end
        end,
        after_destruct = function(pos,oldnode)
            local node = minetest.get_node({x=pos.x,y=pos.y-1,z=pos.z})
            if node.name == "church_chandeliers:chandelier_base_"..name  then
                    minetest.dig_node({x=pos.x,y=pos.y-1,z=pos.z})
            end
        end
	})

	minetest.register_node("church_chandeliers:chandelier_flame_"..name.."_lit", {
        tiles = {{name = image.."_flame_lit.png",
        animation = {
                    type = "vertical_frames",
                    aspect_w = 16,
                    aspect_h = 16,
                    length = 1.0
                },
            },
        },
        drawtype = "plantlike",
        paramtype = "light",
        paramtype2 = "meshoptions",
        place_param2 = 1,
        sunlight_propagates = true,
        is_ground_content = false,
        walkable = false,
        buildable_to = false,
        light_source = 13,
		drop = "church_chandeliers:chandelier_flame_"..name.."_unlit",
		groups = {oddly_breakable_by_hand = 3, not_in_creative_inventory = 1},
		on_punch = chandeliers.snuff,
		sounds = default.node_sound_metal_defaults({
			dug = {name = "default_dig_crumbly", gain = 1.0},
			dig = {name = "default_dig_crumbly", gain = 0.1},
			}
		),
        selection_box = {
            type = "fixed",
            fixed = {
                {-0.5, -0.7, -0.5, 0.5, 0.5, 0.5},
            },
        },
		can_dig = function(pos,player)
			return false
		end,
        on_construct =function(pos, placer)
            local p1 = {x=pos.x, y=pos.y-1, z=pos.z}
            local n1 = minetest.get_node(p1)
            if n1.name == "air" then
                minetest.add_node(p1, {name = "church_chandeliers:chandelier_base_"..name})
            end
        end
	})

	minetest.register_craft({
		output = "church_chandeliers:chandelier_flame_"..name.."_unlit",
		recipe = {
            {"", "church_chandeliers:chandelier_chain", ""},
			{"church_candles:candle","church_candles:candle","church_candles:candle"},
			{craft_material,craft_material,craft_material},
		}
	})

minetest.register_node( "church_chandeliers:chandelier_chain_"..name, {
	description = desc.." Chandelier Chain",
	inventory_image = "church_chandelier_"..name.."_chain.png",
	inventory_image = "church_chandelier_"..name.."_chain.png",
	drawtype = "plantlike",
	tiles = {"church_chandelier_"..name.."_chain.png"},
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 1,
    climbable = true,
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 2},
	sounds = default.node_sound_metal_defaults({
	footstep = {name = "default_glass_footstep", gain = 0.1},}),
	selection_box = {
		type = "fixed",
		fixed = {
			{0.1,-0.5,0.1,-0.1,0.5,-0.1},
		},
	},
})

	minetest.register_craft({
		output = "church_chandeliers:chandelier_chain_"..name.. "8",
		recipe = {
            {"", "craft_material", ""},
			{"craft_material","", "craft_material"},
            {"", "craft_material", ""},
		}
	})
end

