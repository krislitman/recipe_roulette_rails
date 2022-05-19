FactoryBot.define do
    factory :recipe do
      sequence(:name) { |n| "#{Faker::Food.dish} #{n}" }
      serves { "#{Faker::Number.between(from: 1, to: 10)}" }
      prep_time { "#{Faker::Number.between(from: 1, to: 60)} Minutes" }
      cooking_time { "#{Faker::Number.between(from: 1, to: 60)} Minutes" }
      ingredients { "#{Faker::Food.ingredient}" }
      instructions { "#{Faker::Hacker.say_something_smart}" }
      author { "#{Faker::Movies::LordOfTheRings.character}" }
    end
  end
