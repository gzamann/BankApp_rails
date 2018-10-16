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
    expect(FactoryBot.build(:card, number: '123456789112')).to be_valid
  end
  it 'has a valid cvv' do
    expect(FactoryBot.build(:card, cvv:'123')).to be_valid
  end
  it 'always have cvv' do
    expect(FactoryBot.build(:card,cvv:nil)).to be_invalid
  end
  it 'does not take blank cvv' do
    expect(FactoryBot.build(:card,cvv:'')).to be_invalid
  end
  it 'always has pass' do
    expect(FactoryBot.build(:card, pass: nil)).to be_invalid
  end
  it 'can not exceed 4digit pass' do
    expect(FactoryBot.build(:card, pass: '12345')).to be_invalid
  end
  it 'can not have blank pass' do
    expect(FactoryBot.build(:card, pass: '')).to be_invalid
  end
  it 'can not have less than 4digit pass' do
    expect(FactoryBot.build(:card, pass: '12')).to be_invalid
  end
  it 'has a valid pass' do
    expect(FactoryBot.build(:card, pass: '1234')).to be_valid
  end
  it 'valid date_of_issue' do
    a = FactoryBot.create(:card)
    expect(a.date_of_issue).to eq (a.date_of_issue)
  end
end