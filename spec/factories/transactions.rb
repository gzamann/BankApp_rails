FactoryGirl.define do
  factory :transaction do
    account_id { FactoryGirl.create(:account).id }
    t_type {'w'}
    amount {Faker::Number.number(3)}
  end
end
