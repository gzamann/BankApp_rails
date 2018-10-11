require 'rails_helper'

RSpec.describe Branch, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context 'branch validation' do
    it 'should be valid branch' do
			FactoryGirl.build(:branch).should be_valid
    end
  end
end