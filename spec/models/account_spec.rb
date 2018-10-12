require 'rails_helper'

RSpec.describe Account, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:account)).to be_valid
  end
  it 'has a client_id' do
    expect(FactoryBot.build(:account, client_id: nil)).to be_invalid
  end
  it 'has a valid client_id' do
    expect(FactoryBot.build(:account, client_id: 'asdF129800')).to be_invalid
  end
end
