Rails.application.routes.draw do
  devise_for :users
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    root to: "home#index"

#   Recipes
    resources :recipes, only: [:index, :show]
end
