require 'rails_helper'

RSpec.describe Card, type: :model do
  it 'has a valid factory' do
    FactoryBot.build(:card).should be_valid
  end
end
