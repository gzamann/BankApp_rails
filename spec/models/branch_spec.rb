require 'rails_helper'
require '/home/ken/bankapp/spec/support/factory_girl'
RSpec.describe Branch, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'has a valid factory' do
    FactoryGirl.build(:branch).should be_valid
end
end