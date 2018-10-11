FactoryBot.define do
  factory :client do
      branch_id { FactoryGirl.create(:branch).id }
        number Faker::Number.number(4)
  end
end
