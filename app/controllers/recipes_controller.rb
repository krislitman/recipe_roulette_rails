# frozen_string_literal: true

class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(recipe_params[:id])
  end

  private

  def recipe_params
    params.permit(:id)
  end
end
