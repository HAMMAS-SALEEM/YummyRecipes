class RecipesController < ApplicationController
  before_action :authenticate_user!, only: %i[:index]

  def index
    @recipes = current_user.recipes.all
  end

  def show
    @current_user = current_user || User.new 
    @recipes = @current_user.recipes.all
    @recipe = @recipes.find(params[:id])
    @recipe_foods = RecipeFood.where(recipe_id: @recipe.id)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(name: recipe_params[:name], preparation_time: recipe_params[:preparation_time],
                         cooking_time: recipe_params[:cooking_time], user_id: current_user.id,
                         description: recipe_params[:description], public: true)
    if @recipe.save
      flash[:notice] = 'Recipe Successfully Created'
      redirect_to recipes_path
    else
      flash[:notice] = 'Invalid Recipe, all fields have to be completed'
      redirect_to new_recipe_path
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
