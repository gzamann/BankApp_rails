require 'rails_helper'

RSpec.describe Card, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:card)).to be_valid
  end
end
