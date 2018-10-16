# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    t_type { 'd' }
    amount { Faker::Number.number(3) }
    account_id { FactoryBot.create(:account).id }
  end
end
