require 'rails_helper'

RSpec.describe Client, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:client)).to be_valid
  end
  it 'does not contain invalid branch_id' do
    expect(FactoryBot.build(:client, branch_id:'q23jJ')).to be_invalid
  end
  it 'is invalid to nil branch_id' do
    expect(FactoryBot.build(:client, branch_id:nil)).to be_invalid
  end
  it 'can not have blank branch_id' do
    expect(FactoryBot.build(:client, branch_id: '')).to be_invalid
  end
  it 'can only have integer branch_id' do
    expect(FactoryBot.build(:client, branch_id: '1.4')).to be_invalid
  end
  it 'is invalid to nil name' do
    expect(FactoryBot.build(:client, name:nil)).to be_invalid
  end
  it 'is invalid to nil age' do
    expect(FactoryBot.build(:client, age:nil)).to be_invalid
  end
  it 'only has integer age' do
    expect(FactoryBot.build(:client, age: 'twenty')).to be_invalid
  end
  it 'only have 2 digit age' do
    expect(FactoryBot.build(:client, age: '100')).to be_invalid
  end
  it 'is invalid to nil number' do
    expect(FactoryBot.build(:client, number:nil)).to be_invalid
  end
  it 'can not have number digits>10' do
    expect(FactoryBot.build(:client, number: '12345678913')).to be_invalid
  end
  it 'takes only integer number' do
    expect(FactoryBot.build(:client, number: '123.55')).to be_invalid
  end
  it 'can not have blank number' do
    expect(FactoryBot.build(:client, number: '')).to be_invalid
  end
  it 'has only valid email' do
    expect(FactoryBot.build(:client, email: '123')).to be_invalid
  end
  it 'has only valid email' do
    expect(FactoryBot.build(:client, email: 'zaman@')).to be_invalid
  end
  it 'has a valid email' do
    expect(FactoryBot.build(:client, email: 'test@gmail.com')).to be_valid
  end
  it 'allows email as nil' do
    expect(FactoryBot.build(:client, email:nil)).to be_valid
  end
  it 'can not have pan less than 10 char' do
    expect(FactoryBot.build(:client, pan: '123fa')).to be_invalid
  end
  it 'can only have 10 char pan' do
    expect(FactoryBot.build(:client, pan: '123456lajsdf')).to be_invalid
  end
  it 'has a valid pan' do
    expect(FactoryBot.build(:client, pan: 'ABCDE12342')).to be_valid
  end
end