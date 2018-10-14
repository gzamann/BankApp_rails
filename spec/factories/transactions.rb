FactoryBot.define do
  factory :transaction do
    t_type {'d'}
    amount {Faker::Number.number(2)}
    account_id { FactoryBot.create(:account).id}
  end
end
