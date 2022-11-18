# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :authenticate_user!

  include Loggable

  def show
    @recipe = Recipe.find(show_params[:id])
    @random_recipe = Recipe.find_random
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new(create_params)

    if recipe.save
      log_create_recipe(:success, current_user, recipe)

      flash[:notice] = "#{recipe.name} was successfully created"

      redirect_to recipes_path
    else
      log_create_recipe(nil, current_user)

      flash[:error] = "Recipe not created, please try again"

      render :new
    end
  end

  private

  def create_params
    params
      .require(:recipe)
      .permit(:name, :serves, :prep_time, :cooking_time,
              :ingredients, :instructions, :author)
  end

  def show_params
    params.permit(:id)
  end
end
