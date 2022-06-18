Rails.application.routes.draw do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    root to: "home#index"

    #   Recipes
    resources :recipes, only: [:index, :show]

    #   Stripe
    resources :charges, only: [:new, :create]
end
