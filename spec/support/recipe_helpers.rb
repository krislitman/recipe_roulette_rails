# frozen_string_literal: true

module RecipeHelpers
  def create_recipes
    create_list(:recipe, 10)
  end

  def destroy_recipes
    Recipe.destroy_all
  end
end
