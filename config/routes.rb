Rails.application.routes.draw do
  root 'public_recipes#index'
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :new, :create, :destroy]
  resources :public_recipes, only: [:index]
  resources :general_shopping_list, only: [:index]
end
