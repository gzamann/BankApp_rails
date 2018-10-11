FactoryGirl.define do
  factory :branch do
    ifsc {Faker::Number.number(8)}
    address {Faker::Address.street_address}
    number {Faker::Number.number(10)}
  end
end