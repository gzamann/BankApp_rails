FactoryBot.define do
  factory :client do
      branch_id { FactoryGirl.create(:branch).id }
      name {Faker::Name.name}
      age {Faker::Number.number(2)}
      number {Faker::Number.number(5)}
  end
end