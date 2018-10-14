require 'rails_helper'

RSpec.describe Loan, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:loan)).to be_valid
  end
  it 'has a client_id' do
    expect(FactoryBot.build(:loan, client_id: nil)).to be_invalid
  end
  it 'does not have blank client_id' do
    expect(FactoryBot.build(:loan, client_id:'')).to be_invalid
  end
  it 'has a valid client_id' do
    expect(FactoryBot.build(:loan, client_id: 'asdF129800')).to be_invalid
  end
  it 'must have integer client_id' do
    expect(FactoryBot.build(:loan, client_id:'1.134')).to be_invalid
  end
  it 'has a valid client_id' do
    dummyclient = FactoryBot.create(:client)
    expect(FactoryBot.build(:loan, client_id: dummyclient.id)).to be_valid
  end
  it 'can not have non integer amount' do
    expect(FactoryBot.build(:loan, amount: '140.12')).to be_invalid
  end
  it 'can not have amount < 1000' do
    expect(FactoryBot.build(:loan,amount: '500')).to be_invalid
  end
  it 'can not have negative amount' do
    expect(FactoryBot.build(:loan, amount: '-1300')).to be_invalid
  end
  it 'can only take amount in number' do
    expect(FactoryBot.build(:loan, amount: 'thousand')).to be_invalid
  end
  it 'has a valid amount' do
    expect(FactoryBot.build(:loan, amount: '3000')).to be_valid
  end
  it 'can not exceed 8 digit amount' do
    expect(FactoryBot.build(:loan, amount: '123456789')).to be_invalid
  end
  it 'can not have blank loan_type' do
    expect(FactoryBot.build(:loan, loan_type:'')).to be_invalid
  end
  it 'has valid loan_type' do
    expect(FactoryBot.build(:loan, loan_type:'Home')).to be_valid
  end
  it 'has valid loan_type' do
    expect(FactoryBot.build(:loan, loan_type:'Personal')).to be_valid
  end
  it 'has valid loan_type' do
    expect(FactoryBot.build(:loan, loan_type:'Education')).to be_valid
  end
  it 'has valid loan_type' do
    expect(FactoryBot.build(:loan, loan_type:'Business')).to be_valid
  end
  it 'has months less than 121' do
    expect(FactoryBot.build(:loan, months: '121')).to be_invalid
  end
  it 'has valid months' do
    expect(FactoryBot.build(:loan, months: '24')).to be_valid
  end
  it 'has integer months' do
    expect(FactoryBot.build(:loan,months: 'abc')).to be_invalid
  end
  it 'only has positive integer in months' do
    expect(FactoryBot.build(:loan,months: '-1')).to be_invalid
  end
  it 'must have months' do
    expect(FactoryBot.build(:loan, months: nil)).to be_invalid
  end
  it 'can not have months blank' do
    expect(FactoryBot.build(:loan, months: '')).to be_invalid
  end
  # it 'always has time_of_issue' do
  #   expect(FactoryBot.build(:loan, time_of_issue:nil)).to be_invalid
  # end
end