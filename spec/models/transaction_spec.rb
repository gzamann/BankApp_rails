require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.create(:transaction)).to be_valid
  end
end