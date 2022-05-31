# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ally = User.create(name: 'Ally')
inventory_ally =  Inventory.create(name: "inventory for ally", user: ally)

recipe_ally_1 = Recipe.create(name: 'Apple Pie', preparation_time: '20 min', cooking_time: '45 min', description: 'I remember coming home sullen one day because we d lost a softball game. Grandma, in her wisdom, suggested, "Maybe a slice of my homemade apple pie will make you feel better." One bite, and Grandma was right. If you want to learn how to make homemade apple pie filling, this is really the only recipe you need. —Maggie Greene, Granite Falls, Washington', public: true, user: ally)
recipe_ally_2 = Recipe.create(name: 'Puff Pastry Apple Strudel', preparation_time: '30 min', cooking_time: '25 min', description: 'This puff pastry apple strudel is such a fun recipe. It can be served alone or with a side salad. Different types of cheese, like goat, feta or jack, can be used in this dish. —Donna-Marie Ryan, Topsfield, Massachusetts', public: true, user: ally)
recipe_ally_3 = Recipe.create(name: 'Homemade Air-Fryer Churros', preparation_time: '15 min', cooking_time: '15 min', description: 'Serve these cinnamon-sugar air-fryer churros fresh and hot with a cup of coffee or hot chocolate. They re sure to become a family favorite! —Taste of Home Test Kitchen', public: false, user: ally)

# food= Food.create(name: 'Dough for double-crust pie',measuring_unit: 'g', price: 3, user: ally)
# RecipeFood.create(quantity: 300, recipe: recipe_ally_1, food: food)
# InventoryFood.create(quantity: 1000, inventory: inventory_ally, food: food)

# food= Food.create(name: 'Sugar', measuring_unit: 'g', price: 1,user: ally)
# RecipeFood.create(quantity: 300, recipe: recipe_ally_1, food: food)
# InventoryFood.create(quantity: 1000, inventory: inventory_ally, food: food)

# food= Food.create(name: 'Brown sugar',measuring_unit: 'g', price: 2, user: ally)
# RecipeFood.create(quantity: 300, recipe: recipe_ally_1, food: food)
# InventoryFood.create(quantity: 1000, inventory: inventory_ally, food: food)

# food= Food.create(name: 'Flour', measuring_unit: 'g', price: 1,user: ally)
# RecipeFood.create(quantity: 250, recipe: recipe_ally_1, food: food)
# InventoryFood.create(quantity: 1000, inventory: inventory_ally, food: food)
