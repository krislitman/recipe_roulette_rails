require "rails_helper"

RSpec.describe RecipeCategory, type: :model do
    describe "Relationships" do
        it { should belong_to(:recipe) }
        it { should belong_to(:category) }
        stuff = new Recipe
    end
end
