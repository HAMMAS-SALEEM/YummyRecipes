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
      flash[:success] = 'Food is successfully created'
      redirect_to foods_path
    else
      flash[:error] = 'Invalid Entry'
      redirect_to new_food_path
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
