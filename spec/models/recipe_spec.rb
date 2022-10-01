# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :author }
  end

  describe 'Relationships' do
    it { should have_many(:recipe_categories) }
    it { should have_many(:categories).through(:recipe_categories) }
  end

  describe 'Methods' do
    it '#find_random' do
      allow(Recipe).to receive(:find_random).and_return('Random Recipe')

      random = Recipe.find_random
      expect(random).to eq('Random Recipe')
    end
  end
end
