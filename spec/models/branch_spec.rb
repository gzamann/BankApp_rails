require 'rails_helper'

RSpec.describe Branch, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'has a valid factory' do
    FactoryGirl.build(:branch).should be_valid
  end
  it 'missing address' do
    FactoryGirl.build(:branch, address: nil).should_not be_valid
  end
end