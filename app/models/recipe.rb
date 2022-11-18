# frozen_string_literal: true

class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :author, presence: true

  has_many :recipe_categories
  has_many :categories, through: :recipe_categories

  has_many :user_recipes
  has_many :recipes, through: :user_recipes

  before_save { generate_test_ingredients if Rails.env.test? }

  def self.find_random
    order('RANDOM()').first
  end

  def generate_test_ingredients
    ingredients = []
    rand(10).times do
      ingredients.push(Faker::Food.ingredient)
    end
    self.ingredients = ingredients.join(', ')
  end
end
