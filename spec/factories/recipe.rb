# frozen_string_literal: true

FactoryBot.define do
  factory :recipe do
    name { Faker::Food.dish.to_s }
    serves { rand(10).to_s }
    prep_time { "#{rand(30)} minutes" }
    cooking_time { "#{rand(100)} minutes" }
    ingredients { Faker::Food.ingredient.to_s }
    instructions { Faker::Hacker.say_something_smart.to_s }
    author { Faker::Movies::LordOfTheRings.character.to_s }
  end

  trait :with_category do
    after(:create) do |recipe|
      category = create(:category)
      category.recipes << recipe
    end
  end
end
