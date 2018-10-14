FactoryBot.define do
  factory :branch do
    ifsc {Faker::Number.number(12)}
    number {Faker::Number.number(10)}
    street {Faker::Address.street_name}
    city {Faker::Address.city}
    state {Faker::Address.state}
    pincode {Faker::Number.number(6)}
  end
end