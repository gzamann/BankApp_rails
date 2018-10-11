require 'rails_helper'

RSpec.describe Loan, type: :model do
  it 'has a valid factory' do
    FactoryBot.build(:loan).should be_valid
  end
end
