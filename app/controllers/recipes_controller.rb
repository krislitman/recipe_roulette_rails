# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(show_params[:id])
    Rails.logger.info "recipe_id=#{@recipe.id}"
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new(create_params)

    if recipe.save
      flash[:notice] = "#{recipe.name} was successfully created"

      redirect_to recipes_path
    else
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
