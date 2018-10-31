# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BranchesController, type: :controller do
  it 'should show all branches successfully' do
    branch1 = FactoryBot.create(:branch)
    branch2 = FactoryBot.create(:branch)
    get :index
    expect(assigns(:branches)).to include branch1
    expect(assigns(:branches)).to include branch2
    expect(response).to have_http_status(:ok)
  end
  it 'has new branch' do
    get :new
    expect(response).to have_http_status(:ok)
  end
end