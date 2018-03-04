-- extra mod
-- by dhausmig
-- consisting of many different things
---------------------------------------------------------------

extra = {}
extra.version = "1.0"
extra.sand_mod     = true
extra.oil_mod      = true
extra.marinara_mod = true
extra.pasta_mod    = true
extra.pizza_mod    = true
extra.fries_mod    = true
extra.ore_recovery = true
extra.liquor       = true

local path = minetest.get_modpath("extra")

-- Load new settings if found
local input = io.open(path.."/settings.conf", "r")
if input then
	dofile(path .. "/settings.conf")
	input:close()
	input = nil
end

dofile(path .. "/craftitems.lua")
dofile(path .. "/nodes.lua")

---------------------------------------------------------------
-- this allows conversion of glass panes back to sand
-- does not increase or decrease resources
-- with the sand type given by example
-- also allows sand type to be changed by
-- sand -> glass -> panes -> different sand
if extra.sand_mod then
	dofile(path .. "/glass_sand.lua")
end

-- Detect which items are present so we can adjust which crafts get defined

extra.alloy = (minetest.registered_items["technic:lv_alloy_furnace"] ~= nil)
extra.extractor = (minetest.registered_items['technic:lv_extractor'] ~= nil)
extra.grinder = (minetest.registered_items["technic:grinder"] ~= nil)
extra.tech_corn = (minetest.registered_items["technic:cornmeal"] ~= nil)
extra.wild = (minetest.registered_items["ethereal:wild_onion_plant"] ~= nil)

-- PASTA
if extra.pasta_mod then
   minetest.register_craft({
      output = 'extra:pasta 5',
      type = "shapeless",
      recipe = {'farming:flour', 'bucket:bucket_water'},
      replacements = {{ "bucket:bucket_water", "bucket:bucket_empty"}}
   })
end

-- PEPPERONI
minetest.register_craft({
   type = "shapeless",
   output = 'extra:pepperoni',
   recipe = {'mobs:pork_raw', 'farming:chili_pepper'},
})

-- MARANARA
if extra.marinara_mod then
   minetest.register_craft({
      type = "shapeless",
         output = "extra:marinara",
         recipe = {"farming:tomato", "farming:tomato", "farming:onion",
                   "farming:garlic_clove"}
   })
   minetest.register_craft({
      type = "shapeless",
      output = "extra:marinara",
      recipe = {"farming:tomato", "farming:tomato",
                "ethereal:wild_onion_plant", "farming:garlic_clove"}
   })
end

-- SALSA
minetest.register_craft({
   type = "shapeless",
   output = "extra:salsa",
   recipe = {"farming:chili_pepper", "ethereal:wild_onion_plant",
             "farming:tomato"},
})

minetest.register_craft({
   type = "shapeless",
   output = "extra:salsa",
   recipe = {"farming:chili_pepper", "farming:onion", "farming:tomato"},
})

-- COTTONSEED OIL
if extra.oil_mod then
   minetest.register_craft({
      output = 'extra:cottonseed_oil',
      recipe = {
         {'farming:seed_cotton', 'farming:seed_cotton', 'farming:seed_cotton'},
         {'farming:seed_cotton', 'farming:seed_cotton', 'farming:seed_cotton'},
         {'farming:seed_cotton', 'farming:seed_cotton', 'farming:seed_cotton'},
      }
   })

   if extra.extractor then
		technic.register_extractor_recipe({input = {"farming:seed_cotton 3"}, output = "extra:cottonseed_oil"})
   end
end

-- GARLIC BREAD
minetest.register_craft({
   type = "shapeless",
   output = "extra:garlic_dough",
   recipe = {"farming:flour", "farming:garlic_clove"}
})

minetest.register_craft({
   type = "cooking",
   output = "extra:garlic_bread",
   recipe = "extra:garlic_dough"
})

-- FRENCH FRIES and ONION RINGS
if extra.alloy and extra.fries_mod then
   local alloy_recipes = {
      {"farming:potato", "extra:cottonseed_oil", "extra:french_fries"},
      {"farming:onion",  "extra:cottonseed_oil", "extra:onion_rings"}
   }
   if extra.wild then
      table.insert(alloy_recipes,
         {"ethereal:wild_onion_plant", "extra:cottonseed_oil",
          "extra:onion_rings"})
   end
   for _, data in pairs(alloy_recipes) do
      technic.register_alloy_recipe({input = {data[1], data[2]}, output = data[3], time = data[4]})
   end
end

-- TACOS
minetest.register_craft({
   type = "shapeless",
   output = 'extra:flour_tortilla 10',
   recipe = {'farming:flour', 'extra:cottonseed_oil'},
})

minetest.register_craft({
   type = "shapeless",
   output = 'extra:taco 5',
   recipe = {'mobs:meat', 'mobs:cheese', 'extra:flour_tortilla',
      'extra:flour_tortilla', 'extra:flour_tortilla',
      'extra:flour_tortilla', 'extra:flour_tortilla'},
   })

minetest.register_craft({
   type = "shapeless",
   output = "extra:super_taco 5",
   recipe = {"extra:salsa", "extra:taco", "extra:taco",
             "extra:taco", "extra:taco","extra:taco"},
 })

-- SPAGHETTI AND LASAGNA
minetest.register_craft({
   type = "shapeless",
   output = 'extra:spaghetti 5',
   recipe = {"extra:marinara", "extra:pasta", "extra:pasta", "extra:pasta",
             "extra:pasta", "extra:pasta"},
})

minetest.register_craft({
   type = "shapeless",
   output = 'extra:lasagna 5',
   recipe = {"extra:marinara", "extra:pasta", "extra:pasta", "extra:pasta",
             "extra:pasta", "extra:pasta", "mobs:cheese"},
})

-- PIZZA
if extra.pizza_mod then
   minetest.register_craft({
      type = "shapeless",
      output = 'extra:cheese_pizza 8',
      recipe = {"farming:flour", "extra:marinara", "mobs:cheese"},
   })

   minetest.register_craft({
      type = "shapeless",
      output = "extra:pepperoni_pizza 8",
      recipe = {"farming:flour", "extra:marinara", "mobs:cheese",
                "extra:pepperoni"},
   })

   minetest.register_craft({
      type = "shapeless",
      output = "extra:deluxe_pizza 8",
      recipe = {"farming:flour", "extra:marinara", "mobs:cheese",
                "extra:pepperoni", "farming:onion", "farming:tomato",
                "flowers:mushroom_brown"}
   })

   minetest.register_craft({
      type = "shapeless",
      output = "extra:deluxe_pizza 8",
      recipe = {"farming:flour", "extra:marinara", "mobs:cheese",
                "extra:pepperoni", "ethereal:wild_onion_plant",
                "farming:tomato", "flowers:mushroom_brown"}
   })

   minetest.register_craft({
      type = "shapeless",
      output = "extra:pineapple_pizza 8",
      recipe = {"farming:flour", "extra:marinara", "mobs:cheese",
                "mobs:pork_cooked", "farming:pineapple_ring"},
   })
end

-- CORNMEAL AND CORNBREAD
if not extra.tech_corn then
   minetest.register_craft({
      type = "cooking",
      cooktime = 10,
      output = "extra:cornbread",
      recipe = "extra:cornmeal"
   })

   minetest.register_craft({
      type = "shapeless",
      output = 'extra:cornmeal 4',
      recipe = {'farming:corn', 'farming:corn','farming:corn', 'farming:corn'},
   })

   if extra.grinder then
      local recipes = {}
      table.insert(recipes, {"farming:corn",   "extra:cornmeal 2"})

      for _, data in pairs(recipes) do
         technic.register_grinder_recipe({input = {data[1]}, output = data[2]})
      end
   end
end

-- ORE RECOVERY
if extra.ore_recovery then
   minetest.register_craft({
      output = 'default:stone_with_coal 4',
      recipe = {
         {'default:coal_lump', 'default:coal_lump'},
         {'default:coal_lump', 'default:coal_lump'},
      }
   })

   minetest.register_craft({
      output = 'default:stone_with_iron 4',
      recipe = {
         {'default:iron_lump', 'default:iron_lump'},
         {'default:iron_lump', 'default:iron_lump'},
      }
   })

   minetest.register_craft({
      output = 'default:stone_with_copper 4',
      recipe = {
         {'default:copper_lump', 'default:copper_lump'},
         {'default:copper_lump', 'default:copper_lump'},
      }
   })

   minetest.register_craft({
      output = 'default:stone_with_tin 4',
      recipe = {
         {'default:tin_lump', 'default:tin_lump'},
         {'default:tin_lump', 'default:tin_lump'},
      }
   })

   minetest.register_craft({
      output = 'default:stone_with_gold 4',
      recipe = {
         {'default:gold_lump', 'default:gold_lump'},
         {'default:gold_lump', 'default:gold_lump'},
      }
   })

   minetest.register_craft({
      output = 'default:stone_with_mese 4',
      recipe = {
         {'default:mese_crystal', 'default:mese_crystal'},
         {'default:mese_crystal', 'default:mese_crystal'},
      }
   })

   minetest.register_craft({
      output = 'default:stone_with_diamond 4',
      recipe = {
         {'default:diamond', 'default:diamond'},
         {'default:diamond', 'default:diamond'},
      }
   })

   minetest.register_craft({
      output = 'technic:mineral_zinc 4',
      recipe = {
         {'technic:zinc_lump', 'technic:zinc_lump'},
         {'technic:zinc_lump', 'technic:zinc_lump'},
      }
   })

   minetest.register_craft({
      output = 'technic:mineral_lead 4',
      recipe = {
         {'technic:lead_lump', 'technic:lead_lump'},
         {'technic:lead_lump', 'technic:lead_lump'},
      }
   })

   minetest.register_craft({
      output = 'moreores:mineral_silver 4',
      recipe = {
         {'moreores:silver_lump', 'moreores:silver_lump'},
         {'moreores:silver_lump', 'moreores:silver_lump'},
      }
   })

   minetest.register_craft({
      output = 'moreores:mineral_mithril 4',
      recipe = {
         {'moreores:mithril_lump', 'moreores:mithril_lump'},
         {'moreores:mithril_lump', 'moreores:mithril_lump'},
      }
   })
end

if extra.liquor then

minetest.register_craft( {
   type = "shapeless",
	output = "extra:tequila",
	recipe = {"vessels:glass_bottle", "default:cactus", "default:cactus",
      "default:cactus", "default:cactus", "default:cactus",
      "default:cactus", "default:cactus", "default:cactus"}
})

minetest.register_craft( {
   type = "shapeless",
	output = "extra:rum",
	recipe = {"vessels:glass_bottle", "default:papyrus", "default:papyrus",
      "default:papyrus", "default:papyrus", "default:papyrus",
      "default:papyrus", "default:papyrus", "default:papyrus"}
})
end
