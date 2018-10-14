require 'rails_helper'

RSpec.describe Account, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:account)).to be_valid
  end
  it 'has a client_id' do
    expect(FactoryBot.build(:account, client_id: nil)).to be_invalid
  end
  it 'does not have blank client_id' do
    expect(FactoryBot.build(:account, client_id:'')).to be_invalid
  end
  it 'has a valid client_id' do
    expect(FactoryBot.build(:account, client_id: 'asdF129800')).to be_invalid
  end
  it 'must have integer client_id' do
    expect(FactoryBot.build(:account, client_id:'1.134')).to be_invalid
  end
  it 'has a valid client_id' do
    dummyclient = FactoryBot.create(:client)
    expect(FactoryBot.build(:account, client_id: dummyclient.id)).to be_valid
  end
  it 'has a number' do
    expect(FactoryBot.build(:account, number: nil)).to be_invalid
  end
  it 'does not allow number as blank' do
    expect(FactoryBot.build(:account, number:'')).to be_invalid
  end
  it 'has a valid number' do
    expect(FactoryBot.build(:account, number: '1234')).to be_valid
  end
  it 'can not exceed 12 digits for number' do
    expect(FactoryBot.build(:account, number: '1234567891233')).to be_invalid
  end
  it 'can not have non integer number' do
    expect(FactoryBot.build(:account, number: '12.2')).to be_invalid
  end
  it 'has a a_type' do
    expect(FactoryBot.build(:account, a_type: nil)).to be_invalid
  end
  it 'has valid a_type' do
    expect(FactoryBot.build(:account, a_type:'Saving')).to be_valid
  end
  it 'has valid a_type' do
    expect(FactoryBot.build(:account, a_type:'Current')).to be_valid
  end
  it 'has valid a_type' do
    expect(FactoryBot.build(:account, a_type:'FD')).to be_valid
  end
  it 'has valid a_type' do
    expect(FactoryBot.build(:account, a_type:'NRI')).to be_valid
  end
  it 'can not have invalid a_type' do
    expect(FactoryBot.build(:account,a_type:'asf2123xca')).to be_invalid
  end
  it 'can not have number as a_type' do
    expect(FactoryBot.build(:account, a_type:'1234')).to be_invalid
  end
end