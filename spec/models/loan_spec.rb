require 'rails_helper'

RSpec.describe Loan, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:loan)).to be_valid
  end
end
