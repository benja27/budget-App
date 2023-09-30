require 'rails_helper'

RSpec.describe 'Users', type: :request do
  it 'get signed up' do
    get '/users/sign_up'
    expect(response).to have_http_status(:success)
  end

  it 'get signed in' do
    get '/users/sign_in'
    expect(response).to have_http_status(:success)
  end

  it 'get edit' do
    get '/users/edit'
    expect(response).to have_http_status(:redirect)
  end

  it 'get update' do
    put '/users'
    expect(response).to have_http_status(:redirect)
  end

  it 'get destroy' do
    delete '/users'
    expect(response).to have_http_status(:redirect)
  end
end
