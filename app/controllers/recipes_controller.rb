class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.includes(:user)
  end

  def show; end
end
