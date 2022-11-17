# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 10, max_length: 20) }
  end

  factory :admin_user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 10, max_length: 20) }
    admin { true }
  end
end
