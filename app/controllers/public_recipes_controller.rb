class PublicRecipesController < ApplicationController
  def index;
    @recipes = Recipe.includes(:recipe_foods).where(public: true).order(id: :desc)
  end

  def show
    @recipe = Recipe.includes(:recipe_foods).find(params[:id])
  end
end
