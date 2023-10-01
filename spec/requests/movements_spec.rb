require 'rails_helper'

RSpec.describe 'Movements', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { create(:user) }
  let(:group) { create(:group, user:) }

  before do
    sign_in user
  end

  describe 'GET /new' do
    it 'returns http redirect' do
      get new_group_movement_path(group)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /index' do
    it 'returns http redirect' do
      get group_movements_path(group)
      expect(response).to have_http_status(:success)
    end
  end
end
