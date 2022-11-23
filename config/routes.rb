Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"

  resources :recipes

  resources :users, only: [:edit, :update]

  resources :user_recipes, only: [:index, :create, :destroy]
end
