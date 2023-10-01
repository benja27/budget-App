require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Users', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { FactoryBot.create(:user) }
  let(:group) { FactoryBot.create(:group) }
  let(:movement) { FactoryBot.create(:movement) }

  before do
    sign_in(user)
  end

  it 'allows the user to visit the index page' do
    visit groups_path
    expect(page).to have_content('Groups')
  end  

  it 'visit the index page' do
    sign_out(user)
    visit '/users/sign_in'
    expect(page).to have_content('Log in')
  end

  it 'visit the sign up page' do
    sign_out(user)
    visit '/users/sign_up'
    sleep 1
    expect(page).to have_content('Sign up')
  end

  it 'visit the log in page' do
    visit '/users/edit'
    sleep 1
    expect(page).to have_content('Edit User')
  end

  it 'allows the user to sign out' do
    visit groups_path
    icons = page.all('.fa-bars')
    icons.first.click
    click_button 'Exit'
    sleep 1
    expect(current_path).to eq('/')
  end

  it 'allows the user to visit groups' do
    visit groups_path
    expect(page).to have_content('Groups')
  end

  it 'allows the user to visit movements' do
    visit group_movements_path(group)
    expect(page).to have_content('Movements')
  end

  it 'allows the user to visit welcome' do
    sign_out(user)
    visit welcome_path
    sleep 1
    expect(page).to have_content('Super Wallet')
  end

  it 'allows the user to visit new group' do
    visit new_group_path
    sleep 1
    expect(page).to have_content('New Group')
  end

  it 'allows the user to visit new movement' do
    visit new_group_movement_path(group)

    expect(page).to have_content('New Movement')
  end    

  it 'allows the user to visit show group' do
    visit group_path(group)
    sleep 1
    expect(page).to_not have_content('Group')
  end
end

# =============

RSpec.describe 'Users', type: :feature do
  include Devise::Test::IntegrationHelpers

  let(:user) { FactoryBot.create(:user) }
  let(:group) { FactoryBot.create(:group) }
  let(:movement) { FactoryBot.create(:movement) }

  before do
    sign_in(user)
  end
end
