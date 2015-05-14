-- water
minetest.register_node("coloredwater:water_source_red", {
	description = "Red Water Source",
	inventory_image = minetest.inventorycube("coloredwater_water_red.png"),
	drawtype = "liquid",
	tiles = {
		{
			name = "coloredwater_water_source_animated_red.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{
			name = "coloredwater_water_source_animated_red.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "coloredwater:water_flowing_red",
	liquid_alternative_source = "coloredwater:water_source_red",
	liquid_viscosity = 1,
	post_effect_color = {a=64, r=255, g=0, b=0},
	groups = {water=3, liquid=3, puts_out_fire=1},
})

minetest.register_node("coloredwater:water_flowing_red", {
	description = "Red Flowing Water",
	inventory_image = minetest.inventorycube("coloredwater_water_red.png"),
	drawtype = "flowingliquid",
	tiles = {"coloredwater_water_red.png"},
	special_tiles = {
		{
			name = "coloredwater_water_flowing_animated_red.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "coloredwater_water_flowing_animated_red.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "coloredwater:water_flowing_red",
	liquid_alternative_source = "coloredwater:water_source_red",
	liquid_viscosity = 1,
	post_effect_color = {a=64, r=255, g=0, b=0},
	groups = {water=3, liquid=3, puts_out_fire=1, not_in_creative_inventory=1},
})

-- bucket
bucket.register_liquid(
	"coloredwater:water_source_red",
	"coloredwater:water_flowing_red",
	"coloredwater:bucket_water_red",
	"coloredwater_bucket_red.png",
	"Red Water Bucket"
)

-- ice
minetest.register_node("coloredwater:ice_red", {
	description = "Red Ice",
	tiles = {"coloredwater_ice_red.png"},
	is_ground_content = false,
	paramtype = "light",
	groups = {cracky=3},
	sounds = default.node_sound_glass_defaults(),
})

-- snow
minetest.register_node("coloredwater:snow_red", {
	description = "Red Snow",
	tiles = {"coloredwater_snow_red.png"},
	inventory_image = "coloredwater_snowball_red.png",
	wield_image = "coloredwater_snowball_red.png",
	is_ground_content = true,
	paramtype = "light",
	buildable_to = true,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5,  0.5, -0.5+2/16, 0.5},
		},
	},
	groups = {crumbly=3,falling_node=1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_snow_footstep", gain=0.25},
		dug = {name="default_snow_footstep", gain=0.75},
	}),

	on_construct = function(pos)
		pos.y = pos.y - 1
		if minetest.get_node(pos).name == "default:dirt_with_grass" then
			minetest.set_node(pos, {name="default:dirt_with_snow"})
		end
	end,
})


minetest.register_node("coloredwater:snowblock_red", {
	description = "Red Snow Block",
	tiles = {"coloredwater_snow_red.png"},
	is_ground_content = true,
	groups = {crumbly=3},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_snow_footstep", gain=0.25},
		dug = {name="default_snow_footstep", gain=0.75},
	}),
})

minetest.register_craft({
	output = 'coloredwater:snowblock_red',
	recipe = {
		{'coloredwater:snow_red', 'coloredwater:snow_red', 'coloredwater:snow_red'},
		{'coloredwater:snow_red', 'coloredwater:snow_red', 'coloredwater:snow_red'},
		{'coloredwater:snow_red', 'coloredwater:snow_red', 'coloredwater:snow_red'},
	}
})

minetest.register_craft({
	output = 'coloredwater:snow_red 9',
	recipe = {
		{'coloredwater:snowblock_red'},
	}
})

-- aliases

minetest.register_alias("water_source_red", "coloredwater:water_source_red")
minetest.register_alias("snow_red", "coloredwater:snow_red")
minetest.register_alias("snowblock_red", "coloredwater:snowblock_red")
minetest.register_alias("bucket_water_red", "coloredwater:bucket_water_red")
minetest.register_alias("ice_red", "coloredwater:ice_red")
