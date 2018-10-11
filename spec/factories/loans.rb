FactoryBot.define do
  factory :loan do
    client_id { FactoryBot.create(:client).id }
    loan_type {'Home'}
    amount {Faker::Number.number(4)}
  end
end
