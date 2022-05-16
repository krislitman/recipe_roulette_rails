require "rails_helper"

RSpec.describe Category, type: :model do
    describe "Validations" do
        it { should validate_presence_of :name }
    end
    describe "Relationships" do
        it { should have_many(:recipe_categories) }
        it { should have_many(:recipes).through(:recipe_categories) }
    end
end
