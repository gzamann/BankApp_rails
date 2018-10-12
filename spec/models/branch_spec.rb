require 'rails_helper'

RSpec.describe Branch, type: :model do
  context 'model validations' do
    it 'is a valid factory' do
      branch = FactoryBot.build(:branch)
      expect(branch).to be_valid
    end
    it 'is invalid to have address nil' do
      expect(FactoryBot.build(:branch, address: nil)).to be_invalid
    end
    it 'is invalid to have ifsc nil' do
      expect(FactoryBot.build(:branch, ifsc: nil)).to be_invalid
    end
    it 'is invalid to have number nil' do
      expect(FactoryBot.build(:branch, number: nil)).to be_invalid
    end
    it 'does not allow ifsc blank' do
      expect(FactoryBot.build(:branch, ifsc: '')).to be_invalid
    end
    it 'does not allow address blank' do
      expect(FactoryBot.build(:branch, address: '')).to be_invalid
    end
    it 'does not allow number blank' do
      expect(FactoryBot.build(:branch, number: '')).to be_invalid
    end
    it 'is invalid to exceed 12 char in ifsc' do
      expect(FactoryBot.build(:branch, ifsc: '1234567891234')).to be_invalid
    end
    it 'is invalid take string for number' do
      expect(FactoryBot.build(:branch, number: 'asdf12')).to be_invalid
    end
    it 'is invalid to exceed 10 digit in number' do
      expect(FactoryBot.build(:branch, number: '12345678912')).to be_invalid
    end
  end
end