# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it 'has a valid factory' do
    a = FactoryBot.create(:account)
    t = FactoryBot.create(:transaction, account_id: a.id)
    expect(t).to be_valid
  end
  it 'has a error' do
    a = FactoryBot.create(:account, balance: '1')
    expect(FactoryBot.build(:transaction, t_type: 'w', account_id: a.id)).to be_invalid
  end
  it 'updates balance on deposit' do
    a = FactoryBot.create(:account, balance: 1000)
    t = FactoryBot.create(:transaction, t_type: 'd', amount: 10, account_id: a.id)
    fun = a.balance + 10
    expect(t.account.balance).to eq(fun)
  end
  it 'updates balance withdrawal' do
    a = FactoryBot.create(:account, balance: 1000)
    t = FactoryBot.create(:transaction, t_type: 'w', amount: 10, account_id: a.id)
    fun = a.balance - 10
    expect(t.account.balance).to eq(fun)
  end
end
