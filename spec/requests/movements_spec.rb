require 'rails_helper'

RSpec.describe 'Movements', type: :request do
  describe 'GET /new' do
    it 'returns http redirect' do
      get '/movements/new'
      expect(response).to have_http_status(:redirect)
    end
  end
  describe 'POST /create' do
    it 'returns http redirect' do
      post '/movements', params: { movement: { amount: 1, group_id: 1, movement_type: 'MyString', user_id: 1 } }
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'PUT /update' do
    it 'returns http redirect' do
      put '/movements/1', params: { movement: { amount: 1, group_id: 1, movement_type: 'MyString', user_id: 1 } }
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'DELETE /destroy' do
    it 'returns http redirect' do
      delete '/movements/1'
      expect(response).to have_http_status(:redirect)
    end
  end
end
