Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"

  resources :recipes

  resources :user_recipes, only: [:create]
end
