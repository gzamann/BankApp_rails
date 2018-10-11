require 'rails_helper'

RSpec.describe Account, type: :model do
  it 'has a valid factory' do
    account = FactoryBot.build(:account)
    expect(account).to be_valid
  end
end
