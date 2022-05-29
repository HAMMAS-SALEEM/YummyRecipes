Rails.application.routes.draw do
  root 'foods#index'
  resources :foods, only: [:index]
  resources :recipes, only: [:index, :show]
  resources :public_recipes, only: [:index]
  resources :general_shopping_list, only: [:index]
end
