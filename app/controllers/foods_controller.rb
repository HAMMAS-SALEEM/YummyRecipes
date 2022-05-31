class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.new(name: food_params[:name],
                                   measurement_unit: food_params[:measurement_unit],
                                   price: food_params[:price])
    if @food.save
      flash[:notice] = 'Food is successfully created'
      redirect_to foods_path
    else
      flash[:notice] = 'Invalid Entry'
      redirect_to new_food_path
    end
  end

  def destroy
    @food_to_delete = Food.all.find([:id]).destroy
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
