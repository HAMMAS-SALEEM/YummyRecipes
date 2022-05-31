Rails.application.routes.draw do
  root 'public_recipes#index'
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:new, :create]
  end
  resources :public_recipes, only: [:index]
  resources :general_shopping_list, only: [:index]
end
