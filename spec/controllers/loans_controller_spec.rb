# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LoansController, type: :controller do
  it 'should show all loans successfully' do
    loan1 = FactoryBot.create(:loan)
    loan2 = FactoryBot.create(:loan)
    get :index
    expect(assigns(:loans)).to include loan1
    expect(assigns(:loans)).to include loan2
    expect(response).to have_http_status(:ok)
  end
  it 'has new loan' do
    get :new
    expect(response).to have_http_status(:ok)
  end
end
