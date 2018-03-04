
minetest.register_node("extra:tequila", {
	description = "Bottle of Tequila",
	drawtype = "plantlike",
	tiles = {"extra_tequila.png"},
	inventory_image = "extra_tequila.png",
	wield_image = "extra_tequila.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
   on_use = minetest.item_eat(10, "vessels:glass_bottle"),
})

minetest.register_node("extra:rum", {
	description = "Bottle of Rum",
	drawtype = "plantlike",
	tiles = {"extra_rum.png"},
	inventory_image = "extra_rum.png",
	wield_image = "extra_rum.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
   on_use = minetest.item_eat(10, "vessels:glass_bottle"),
})
