FactoryBot.define do
  factory :card do
    account_id { FactoryBot.create(:account).id }
    card_type {Faker::String.random(10)}
    number {Faker::Number.number(10)}
  end
end
