# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { Faker::Food.ethnic_category }
    sequence(:description) { |n| "Category #{n}" }
  end

  trait :with_recipes do
    after(:create) do |category|
      rand(10).times do
        recipe = create(:recipe)
        category.recipes << recipe
      end
    end
  end
end
