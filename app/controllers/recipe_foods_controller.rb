class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new(recipe_id: @recipe.id, food_id: recipe_food_params[:food_id],
                                  quantity: recipe_food_params[:quantity])
    if @recipe_food.save
      flash[:notice] = 'Food is successfully added!'
      redirect_to recipe_path(@recipe)
    else
      flash[:notice] = 'Invalid Entry'
      redirect_to current_path
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.all.find(params[:id])
    flash[:notice] = if @recipe_food.destroy
                       'Food Successfully Removed'
                     else
                       'Invalid Transaction'
                     end
    redirect_to recipe_path(@recipe)
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
