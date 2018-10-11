FactoryBot.define do
  factory :branch do
    ifsc {Faker::Number.number(8)}
    address {Faker::Address.street_address}
    phone_no {Faker::Number.number(10)}
  end
end