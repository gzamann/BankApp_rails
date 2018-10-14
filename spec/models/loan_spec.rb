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
end