require 'rails_helper'

RSpec.describe Client, type: :model do
  it 'has a valid factory' do
    FactoryBot.build(:client).should be_valid
  end
end
