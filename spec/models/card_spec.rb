require 'rails_helper'

RSpec.describe Card, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:card)).to be_valid
  end
  it 'has a client_id' do
    expect(FactoryBot.build(:card, account_id: nil)).to be_invalid
  end
  it 'does not have blank account_id' do
    expect(FactoryBot.build(:card, account_id:'')).to be_invalid
  end
  it 'has a valid account_id' do
    expect(FactoryBot.build(:card, account_id: 'asdF129800')).to be_invalid
  end
  it 'must have integer account_id' do
    expect(FactoryBot.build(:card, account_id:'1.134')).to be_invalid
  end
  it 'has a valid account_id' do
    dummyaccount = FactoryBot.create(:account)
    expect(FactoryBot.build(:card, account_id: dummyaccount.id)).to be_valid
  end
  it 'can not have non integer number' do
    expect(FactoryBot.build(:card, number: '11231.213')).to be_invalid
  end
  it 'has only 10 digit number' do
    expect(FactoryBot.build(:card, number: '1235')).to be_invalid
  end
  it 'has only 10 digit number' do
    expect(FactoryBot.build(:card, number: '12345678912')).to be_invalid
  end
  it 'has a valid number' do
    expect(FactoryBot.build(:card, number: '1234567891')).to be_valid
  end
end