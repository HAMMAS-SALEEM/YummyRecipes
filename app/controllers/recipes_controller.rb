class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = Recipe.all.includes(:user)
  end

  def show
    @recipes = Recipe.all.includes(:user)
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
      flash[:notice] = 'Invalid Recipe'
      redirect_to new_recipe_path
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
