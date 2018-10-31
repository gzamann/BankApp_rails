# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ClientsController, type: :controller do
  it 'should show all clients successfully' do
    client1 = FactoryBot.create(:client)
    client2 = FactoryBot.create(:client)
    get :index
    expect(assigns(:clients)).to include client1
    expect(assigns(:clients)).to include client2
    expect(response).to have_http_status(:ok)
  end
  it 'has new client' do
    get :new
    expect(response).to have_http_status(:ok)
  end
end
