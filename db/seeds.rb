# frozen_string_literal: true

100.times do |i|
  category = Category.create!(
    {
      name: Faker::Food.ethnic_category,
      description: "Category #{i}"
    }
  )
  category.recipes.create!(
    {
      name: Faker::Food.dish,
      serves: rand(10).to_s,
      prep_time: "#{rand(30)} minutes",
      cooking_time: "#{rand(100)} minutes",
      ingredients: generate_test_ingredients,
      instructions: Faker::Lorem.sentence(word_count: rand(30)),
      author: Faker::Books::Dune.character
    }
  )
end
