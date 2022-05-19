require "rails_helper"

RSpec.describe "Recipe Show Page", type: :feature do
    before(:all) do
        recipes = create_list(:recipe, 10)
        @mock_recipe = recipes.first
    end

    after(:all) do
        Recipe.destroy_all
    end

    describe "As a visitor visting the home page" do
        it "I click a button to find a recipe, and am taken to the recipes show page" do
            visit root_path
            allow(Recipe).to receive(:find_random).and_return(@mock_recipe)

            click_button("Find a Recipe")
            expect(current_path).to eq(recipes_path(@mock_recipe.id))
        end
    end
end
