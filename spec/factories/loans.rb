FactoryBot.define do
  factory :loan do
    client_id { FactoryBot.create(:client).id }
    loan_type {'Home'}
    amount {Faker::Number.number(8)}
    months {Faker::Number.between(1, 120)}
    rate {Faker::Number.decimal(2)}
  end
end
