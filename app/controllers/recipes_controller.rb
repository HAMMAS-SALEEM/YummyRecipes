class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.includes(:user)
  end

  def show
    @recipes = Recipe.all.includes(:user)
    @recipe = @recipes.find(params[:id])
    @recipe_foods = RecipeFood.where(recipe_id: @recipe.id)
  end
end
