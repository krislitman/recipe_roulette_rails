class Recipe < ApplicationRecord
    validates :name, presence: true
    validates :author, presence: true

    has_many :recipe_categories
    has_many :categories, through: :recipe_categories

    def self.find_random
        order("RANDOM()").first
    end
end
