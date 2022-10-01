# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home Page', type: :feature do
  before(:all) do
    create_list(:recipe, 10)
  end

  after(:all) do
    Recipe.destroy_all
  end

  describe 'As a visitor' do
    scenario 'I am able to visit the home page' do
      visit root_path

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Welcome to Recipe Roulette')
    end

    scenario 'I do not see a buttom to find a random recipe' do
      visit root_path

      expect(page).not_to have_button('Find a Recipe')
    end
  end
end
