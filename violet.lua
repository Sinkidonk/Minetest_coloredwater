-- water
minetest.register_node("coloredwater:water_source_violet", {
	description = "Violet Water Source",
	inventory_image = minetest.inventorycube("coloredwater_water_base.png^[colorize:#8401ffcc:50]"),
	drawtype = "liquid",
	tiles = {
		{
			name = "coloredwater_water_source_animated_base.png^[colorize:#8401ffcc:50]",
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
			name = "coloredwater_water_source_animated_base.png^[colorize:#8401ffcc:50]",
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
	liquid_alternative_flowing = "coloredwater:water_flowing_violet",
	liquid_alternative_source = "coloredwater:water_source_violet",
	liquid_viscosity = 1,
	post_effect_color = {a=64, r=132, g=1, b=255},
	groups = {water=3, liquid=3, puts_out_fire=1},
})

minetest.register_node("coloredwater:water_flowing_violet", {
	description = "Violet Flowing Water",
	inventory_image = minetest.inventorycube("coloredwater_water_base.png^[colorize:#8401ffcc:50]"),
	drawtype = "flowingliquid",
	tiles = {"coloredwater_water_base.png^[colorize:#8401ffcc:50]"},
	special_tiles = {
		{
			name = "coloredwater_water_flowing_animated_base.png^[colorize:#8401ffcc:50]",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "coloredwater_water_flowing_animated_base.png^[colorize:#8401ffcc:50]",
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
	liquid_alternative_flowing = "coloredwater:water_flowing_violet",
	liquid_alternative_source = "coloredwater:water_source_violet",
	liquid_viscosity = 1,
	post_effect_color = {a=64, r=132, g=1, b=255},
	groups = {water=3, liquid=3, puts_out_fire=1, not_in_creative_inventory=1},
})

-- bucket
bucket.register_liquid(
	"coloredwater:water_source_violet",
	"coloredwater:water_flowing_violet",
	"coloredwater:bucket_water_violet",
	"coloredwater_bucket_base.png^[colorize:#8401ffcc:50]^coloredwater_bucket_overlay_base.png",
	"Violet Water Bucket"
)

-- ice
minetest.register_node("coloredwater:ice_violet", {
	description = "Violet Ice",
	tiles = {"coloredwater_ice_base.png^[colorize:#8401ffcc:50]"},
	is_ground_content = false,
	paramtype = "light",
	groups = {cracky=3},
	sounds = default.node_sound_glass_defaults(),
})

-- snow
minetest.register_node("coloredwater:snow_violet", {
	description = "Violet Snow",
	tiles = {"coloredwater_snow_base.png^[colorize:#8401ffcc:50]"},
	inventory_image = "coloredwater_snowball_base.png^[colorize:#8401ffcc:50]",
	wield_image = "coloredwater_snowball_base.png^[colorize:#8401ffcc:50]",
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


minetest.register_node("coloredwater:snowblock_violet", {
	description = "Violet Snow Block",
	tiles = {"coloredwater_snow_base.png^[colorize:#8401ffcc:50]"},
	is_ground_content = true,
	groups = {crumbly=3},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_snow_footstep", gain=0.25},
		dug = {name="default_snow_footstep", gain=0.75},
	}),
})

minetest.register_craft({
	output = 'coloredwater:snowblock_violet',
	recipe = {
		{'coloredwater:snow_violet', 'coloredwater:snow_violet', 'coloredwater:snow_violet'},
		{'coloredwater:snow_violet', 'coloredwater:snow_violet', 'coloredwater:snow_violet'},
		{'coloredwater:snow_violet', 'coloredwater:snow_violet', 'coloredwater:snow_violet'},
	}
})

minetest.register_craft({
	output = 'coloredwater:snow_violet 9',
	recipe = {
		{'coloredwater:snowblock_violet'},
	}
})

-- aliases

minetest.register_alias("water_source_violet", "coloredwater:water_source_violet")
minetest.register_alias("snow_violet", "coloredwater:snow_violet")
minetest.register_alias("snowblock_violet", "coloredwater:snowblock_violet")
minetest.register_alias("bucket_water_violet", "coloredwater:bucket_water_violet")
minetest.register_alias("ice_violet", "coloredwater:ice_violet")

-- make colored water crafting
minetest.register_craft({
 type = "shapeless",
 output = "coloredwater:bucket_water_violet,",
recipe = {"bucket:bucket_water","dye:violet"}
})

