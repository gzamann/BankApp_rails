require 'rails_helper'

RSpec.describe Account, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:account)).to be_valid
  end
  it 'has a client_id' do
    expect(FactoryBot.build(:account, client_id: nil)).to be_invalid
  end
  it 'has a number' do
    expect(FactoryBot.build(:account, number: nil)).to be_invalid
  end
  it 'has a a_type' do
    expect(FactoryBot.build(:account, a_type: nil)).to be_invalid
  end
  it 'does not allow number as blank' do
    expect(FactoryBot.build(:branch, number:'')).to be_invalid
  end
  it 'has a valid client_id' do
    expect(FactoryBot.build(:account, client_id: 'asdF129800')).to be_invalid
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
  it 'has invalid a_type' do
    expect(FactoryBot.build(:account,a_type:'asf2123xca')).to be_invalid
  end
end