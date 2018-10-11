FactoryGirl.define do
  factory :card do
    account_id { FactoryGirl.create(:account).id }
    card_type {Faker::String.random}
    number {Faker::Number.number(5)}
  end
end
