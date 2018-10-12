require 'rails_helper'

RSpec.describe Client, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:client)).to be_valid
  end
end
