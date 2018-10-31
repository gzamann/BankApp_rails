# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  it 'should show all transactions successfully' do
    transaction1 = FactoryBot.create(:transaction)
    transaction2 = FactoryBot.create(:transaction)
    get :index
    expect(assigns(:transactions)).to include transaction1
    expect(assigns(:transactions)).to include transaction2
    expect(response).to have_http_status(:ok)
  end
  it 'has new transaction' do
    get :new
    expect(response).to have_http_status(:ok)
  end
end
