-- water
minetest.register_node("coloorangewater:water_source_orange", {
	description = "Orange Water Source",
	inventory_image = minetest.inventorycube("coloorangewater_water_orange.png"),
	drawtype = "liquid",
	tiles = {
		{
			name = "coloorangewater_water_source_animated_orange.png",
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
			name = "coloorangewater_water_source_animated_orange.png",
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
	liquid_alternative_flowing = "coloorangewater:water_flowing_orange",
	liquid_alternative_source = "coloorangewater:water_source_orange",
	liquid_viscosity = 1,
	post_effect_color = {a=64, r=255, g=127, b=1},
	groups = {water=3, liquid=3, puts_out_fire=1},
})

minetest.register_node("coloorangewater:water_flowing_orange", {
	description = "Orange Flowing Water",
	inventory_image = minetest.inventorycube("coloorangewater_water_orange.png"),
	drawtype = "flowingliquid",
	tiles = {"coloorangewater_water_orange.png"},
	special_tiles = {
		{
			name = "coloorangewater_water_flowing_animated_orange.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "coloorangewater_water_flowing_animated_orange.png",
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
	liquid_alternative_flowing = "coloorangewater:water_flowing_orange",
	liquid_alternative_source = "coloorangewater:water_source_orange",
	liquid_viscosity = 1,
	post_effect_color = {a=64, r=255, g=127, b=1},
	groups = {water=3, liquid=3, puts_out_fire=1, not_in_creative_inventory=1},
})

-- bucket
bucket.register_liquid(
	"coloorangewater:water_source_orange",
	"coloorangewater:water_flowing_orange",
	"coloorangewater:bucket_water_orange",
	"coloorangewater_bucket_orange.png",
	"Orange Water Bucket"
)

-- ice
minetest.register_node("coloorangewater:ice_orange", {
	description = "Orange Ice",
	tiles = {"coloorangewater_ice_orange.png"},
	is_ground_content = false,
	paramtype = "light",
	groups = {cracky=3},
	sounds = default.node_sound_glass_defaults(),
})

-- snow
minetest.register_node("coloorangewater:snow_orange", {
	description = "Orange Snow",
	tiles = {"coloorangewater_snow_orange.png"},
	inventory_image = "coloorangewater_snowball_orange.png",
	wield_image = "coloorangewater_snowball_orange.png",
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


minetest.register_node("coloorangewater:snowblock_orange", {
	description = "Orange Snow Block",
	tiles = {"coloorangewater_snow_orange.png"},
	is_ground_content = true,
	groups = {crumbly=3},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_snow_footstep", gain=0.25},
		dug = {name="default_snow_footstep", gain=0.75},
	}),
})

minetest.register_craft({
	output = 'coloorangewater:snowblock_orange',
	recipe = {
		{'coloorangewater:snow_orange', 'coloorangewater:snow_orange', 'coloorangewater:snow_orange'},
		{'coloorangewater:snow_orange', 'coloorangewater:snow_orange', 'coloorangewater:snow_orange'},
		{'coloorangewater:snow_orange', 'coloorangewater:snow_orange', 'coloorangewater:snow_orange'},
	}
})

minetest.register_craft({
	output = 'coloorangewater:snow_orange 9',
	recipe = {
		{'coloorangewater:snowblock_orange'},
	}
})

-- aliases

minetest.register_alias("water_source_orange", "coloorangewater:water_source_orange")
minetest.register_alias("snow_orange", "coloorangewater:snow_orange")
minetest.register_alias("snowblock_orange", "coloorangewater:snowblock_orange")
minetest.register_alias("bucket_water_orange", "coloorangewater:bucket_water_orange")
minetest.register_alias("ice_orange", "coloorangewater:ice_orange")
