-- COTTONSEED OIL
minetest.register_craftitem("extra:cottonseed_oil", {
   description = "Cottonseed Oil",
   inventory_image = "extra_cottonseed_oil.png",
   groups = {vessel = 1}
})

minetest.register_craft({
   type = "fuel",
   recipe = "extra:cottonseed_oil",
   burntime = 40,
})

minetest.register_craftitem("extra:flour_tortilla", {
   description = "Flour Tortilla",
   inventory_image = "extra_flour_tortilla.png",
   on_use = minetest.item_eat(1),
})

minetest.register_craftitem("extra:french_fries", {
   description = "French Fries",
   inventory_image = "extra_french_fries.png",
   on_use = minetest.item_eat(2),
})

minetest.register_craftitem("extra:onion_rings", {
   description = "Onion Rings",
   inventory_image = "extra_onion_rings.png",
   on_use = minetest.item_eat(3),
})

-- TACOS
minetest.register_craftitem("extra:taco", {
   description = "Taco",
   inventory_image = "extra_taco.png",
   on_use = minetest.item_eat(4),
})

minetest.register_craftitem("extra:super_taco", {
   description = "Super Taco",
   inventory_image = "extra_taco.png",
   on_use = minetest.item_eat(6),
})

minetest.register_craftitem("extra:pasta", {
   description = "Pasta",
   inventory_image = "extra_pasta.png",
   on_use = minetest.item_eat(1),
})

minetest.register_craftitem("extra:pepperoni", {
   description = "Pepperoni",
   inventory_image = "extra_pepperoni.png",
   on_use = minetest.item_eat(8),
})

minetest.register_craftitem("extra:garlic_dough", {
   description = "Garlic Bread Dough",
   inventory_image = "extra_garlic_dough.png",
})

minetest.register_craftitem("extra:garlic_bread", {
   description = "Garlic Bread",
   inventory_image = "extra_garlic_bread.png",
   on_use = minetest.item_eat(6),
})

minetest.register_craftitem("extra:marinara", {
   description = "Jar of Marinara Sauce",
   inventory_image = "extra_marinara.png",
   groups = {vessel = 1},
   on_use = minetest.item_eat(6),
})

minetest.register_craftitem("extra:spaghetti", {
   description = "Spaghetti",
   inventory_image = "extra_spaghetti.png",
   on_use = minetest.item_eat(3),
})

minetest.register_craftitem("extra:lasagna", {
   description = "Lasagna",
   inventory_image = "extra_lasagna.png",
   on_use = minetest.item_eat(4),
})

minetest.register_craftitem("extra:cheese_pizza", {
   description = "Cheese Pizza",
   inventory_image = "extra_cheese_pizza.png",
   on_use = minetest.item_eat(3),
})

minetest.register_craftitem("extra:salsa", {
   description = "Jar of Salsa",
   inventory_image = "extra_salsa.png",
   groups = {vessel = 1},
   on_use = minetest.item_eat(6),
})

minetest.register_craftitem("extra:pepperoni_pizza", {
   description = "Pepperoni Pizza",
   inventory_image = "extra_pepperoni_pizza.png",
   on_use = minetest.item_eat(5),
})

minetest.register_craftitem("extra:deluxe_pizza", {
   description = "Deluxe Pizza",
   inventory_image = "extra_deluxe_pizza.png",
   on_use = minetest.item_eat(8),
})

minetest.register_craftitem("extra:pineapple_pizza", {
   description = "Pineapple Pizza",
   inventory_image = "extra_pineapple_pizza.png",
   on_use = minetest.item_eat(5),
})

minetest.register_craftitem("extra:cornmeal", {
   description = "Corn Meal",
   inventory_image = "extra_cornmeal.png",
})

minetest.register_craftitem("extra:cornbread", {
   description = "Cornbread",
   inventory_image = "extra_cornbread.png",
   on_use = minetest.item_eat(8),
})
