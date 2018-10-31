# frozen_string_literal: true

FactoryBot.define do
  factory :card do
    account_id { FactoryBot.create(:account).id }
    card_type { Faker::String.random(10) }
    number { Faker::Number.number(12) }
    cvv { Faker::Number.number(3) }
    pass { Faker::Number.number(4) }
  end
end
