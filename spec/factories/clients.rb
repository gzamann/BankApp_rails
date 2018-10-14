FactoryBot.define do
  factory :client do
      branch_id { FactoryBot.create(:branch).id }
      name {Faker::Name.name}
      age {Faker::Number.between(16, 99)}
      number {Faker::Number.number(10)}
      email {Faker::Internet.email}
  end
end