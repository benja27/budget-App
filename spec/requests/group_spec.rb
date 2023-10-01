require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { FactoryBot.create(:user) }
  let(:group) { FactoryBot.create(:group) }

  describe 'GET /index' do
    it 'returns http success' do
      sign_in user
      get '/groups'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http redirect' do
      sign_in user
      get '/groups/new'
      expect(response).to have_http_status(:success)
    end
  end 

  describe 'POST /create' do
    it 'returns http redirect' do
      sign_in user
      post '/groups', params: { group: { name: 'Group 1', icon: 'icon1', user: } }
      expect(response).to have_http_status(:redirect)
    end
  end  

  describe 'DELETE /destroy' do
    it 'returns http redirect' do
      sign_in user
      group = FactoryBot.create(:group, user:)
      delete "/groups/#{group.id}"
      expect(response).to have_http_status(:redirect)
    end
  end
end
