# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CardsController, type: :controller do
  it 'should show all cards successfully' do
    card1 = FactoryBot.create(:card)
    card2 = FactoryBot.create(:card)
    get :index
    expect(assigns(:cards)).to include card1
    expect(assigns(:cards)).to include card2
    expect(response).to have_http_status(:ok)
  end
  it 'has new card' do
    get :new
    expect(response).to have_http_status(:ok)
  end
end
