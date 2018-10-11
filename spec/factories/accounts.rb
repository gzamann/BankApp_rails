FactoryBot.define do
  factory :account do
    client_id { FactoryGirl.create(:client).id }
    balance {Faker::Number.number(4)}
    a_type {'Saving'}
    number {Faker::Bank.account_number}
  end
end