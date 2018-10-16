# frozen_string_literal: true

FactoryBot.define do
  factory :client do
    branch_id { FactoryBot.create(:branch).id }
    name { Faker::Name.name }
    age { Faker::Number.between(16, 99) }
    number { Faker::Number.number(10) }
    email { Faker::Internet.email }
    pan { Faker::String.random(10) }
    street { Faker::Address.street_name }
    city { Faker::Address.city }
    state { Faker::Address.state }
    pincode { Faker::Number.number(6) }
  end
end
