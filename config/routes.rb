Rails.application.routes.draw do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    root to: "home#index"

#   Recipes
    namespace :random do
        resources :recipe, only: [:show]
    end
end
