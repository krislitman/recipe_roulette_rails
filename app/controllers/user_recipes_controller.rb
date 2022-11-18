# frozen_string_literal: true

class UserRecipesController < ApplicationController
  before_action :authenticate_user!

  include Loggable

  def create
    recipe = Recipe.find get_recipe_id
    user_recipe = UserRecipe.new({
      recipe_id: recipe.id,
      user_id: current_user.id,
    })

    if user_recipe.save
      flash[:notice] = "Added #{recipe.name} to your Recipes!"

      log_create_user_recipe(:success, current_user, recipe)

      redirect_to recipe_path(recipe.id)
    else
      flash[:error] = "Recipe not added, please try again"

      log_create_user_recipe(nil, current_user)

      redirect_to recipe_path(recipe.id)
    end
  end

  private

  def get_recipe_id
    params.permit(:recipe_id).dig(:recipe_id)
  end
end
