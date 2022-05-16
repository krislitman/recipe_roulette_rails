require "rails_helper"

RSpec.describe Recipe, type: :model do
    describe "Validations" do
        it { should validate_presence_of :name }
        it { should validate_presence_of :author }
    end
    describe "Relationships" do
    end
end
