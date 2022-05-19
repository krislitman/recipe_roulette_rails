FactoryBot.define do
    factory :recipe do
      sequence(:name) { |n| "Item #{n}" }
      sequence(:description) { |n| "Description #{n}" }
      sequence(:unit_price) { |n| "Unit price #{n}" }
      merchant
    end
  end
