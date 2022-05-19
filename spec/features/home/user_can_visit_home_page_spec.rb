require "rails_helper"

RSpec.describe "Home Page", type: :feature do
    describe "As a visitor visting the home page" do
        it "I am able to visit the home page" do
            visit root_path

            expect(current_path).to eq(root_path)
            expect(page).to have_content("Welcome to Recipe Roulette")
        end
    end
end
