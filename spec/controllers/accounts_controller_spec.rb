# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  it 'should show all accounts successfully' do
    account1 = FactoryBot.create(:account)
    account2 = FactoryBot.create(:account)
    get :index
    expect(assigns(:accounts)).to include account1
    expect(assigns(:accounts)).to include account2
    expect(response).to have_http_status(:ok)
  end
  it 'has new account' do
    get :new
    expect(response).to have_http_status(:ok)
  end
end
