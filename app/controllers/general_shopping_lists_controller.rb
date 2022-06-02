class GeneralShoppingListsController < ApplicationController
  def index
    @total_items = remaining_foods.length 
    @total_amount = total_amount
    @remain_foods = remaining_foods
  end

  private
  def remaining_foods
    total_recipe_foods = []
    current_user.recipes.includes(:recipe_foods).each do |recipe|
      recipe.recipe_foods.each do |recipe_food|
        total_recipe_foods << recipe_food.food
      end
    end
    total_recipe_foods
  end

  def total_amount
    total_amount = 0
    remaining_foods.each do |food_item|
      total_amount += food_item.price
    end
    total_amount
  end
end
