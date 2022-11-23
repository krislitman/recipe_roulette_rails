# frozen_string_literal: true

class UserRecipesController < ApplicationController
  before_action :authenticate_user!

  include Loggable

  def index
    @recipes = current_user.recipes
  end

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

  def destroy
    recipe = Recipe.find get_recipe_id
    user_recipes = current_user.user_recipes.where(recipe_id: recipe.id)

    user_recipes.destroy_all
    flash[:notice] = "Removed #{recipe.name} from your Recipes!"
    log_destroy_user_recipe(:success, current_user, recipe)

    redirect_to user_recipes_path
  rescue
    flash[:error] = "Unable to remove Recipe, please try again"
    log_destroy_user_recipe(nil, current_user)

    redirect_to user_recipes_path
  end

  private

  def get_recipe_id
    params.permit(:recipe_id).dig(:recipe_id)
  end
end
