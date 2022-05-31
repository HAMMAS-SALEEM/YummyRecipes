class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods, dependent: :destroy

  def total_price
    total = 0
    recipe_foods.each do |recipe_food|
      total += recipe_food.quantity * recipe_food.food.price
    end
    total / 1000
  end
end
