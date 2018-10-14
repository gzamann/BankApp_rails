require 'rails_helper'

RSpec.describe Client, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:client)).to be_valid
  end
  it 'is invalid to nil name' do
    expect(FactoryBot.build(:client, name:nil)).to be_invalid
  end
  it 'is invalid to nil age' do
    expect(FactoryBot.build(:client, age:nil)).to be_invalid
  end
  it 'does not contain invalid branch_id' do
    expect(FactoryBot.build(:client, branch_id:'q23jJ')).to be_invalid
  end
  it 'is invalid to nil branch_id' do
    expect(FactoryBot.build(:client, branch_id:nil)).to be_invalid
  end
  it 'is invalid to nil number' do
    expect(FactoryBot.build(:client, number:nil)).to be_invalid
  end
end