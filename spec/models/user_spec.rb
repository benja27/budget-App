require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = create(:user)
  end

  it 'is valid with valid attributes' do
    expect(@user).to be_valid
  end

  it 'is not valid without a name' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'is not valid without an email' do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it 'is not valid without a password' do
    @user.password = nil
    expect(@user).to_not be_valid
  end

  it 'is not valid with a name shorter than 2 characters' do
    @user.name = 'a'
    expect(@user).to_not be_valid
  end

  it 'is not valid with a name longer than 40 characters' do
    @user.name = 'a' * 41
    expect(@user).to_not be_valid
  end

  it 'is not valid with an email shorter than 5 characters' do
    @user.email = 'a' * 4
    expect(@user).to_not be_valid
  end

  it 'is not valid with an email longer than 50 characters' do
    @user.email = 'a' * 51
    expect(@user).to_not be_valid
  end

  it 'is not valid with a password shorter than 6 characters' do
    @user.password = 'a' * 5
    expect(@user).to_not be_valid
  end

  it 'is not valid with a password longer than 20 characters' do
    @user.password = 'a' * 21
    expect(@user).to_not be_valid
  end

  it 'is not valid with a password_confirmation shorter than 6 characters' do
    @user.password_confirmation = 'a' * 5
    expect(@user).to_not be_valid
  end

  it 'is not valid with a password_confirmation longer than 20 characters' do
    @user.password_confirmation = 'a' * 21
    expect(@user).to_not be_valid
  end

  it 'is not valid with a duplicate email' do
    @user2 = build(:user, email: @user.email)
    expect(@user2).to_not be_valid
  end

  it 'is valid with a duplicate email for different users' do
    @user2 = build(:user, email: @user.email)
    @user2.email = "hola#{@user.email}"
    expect(@user2).to be_valid
  end

  it 'is not valid with a duplicate name' do
    @user2 = build(:user, name: @user.name)
    expect(@user2).to be_valid
  end

  it 'is valid with a duplicate name for different users' do
    @user2 = build(:user, name: @user.name)
    @user2.name = "hola#{@user.name}"
    expect(@user2).to be_valid
  end

  it 'is not valid with a duplicate name and different email' do
    @user2 = build(:user, name: @user.name)
    @user2.email = "hola#{@user.email}"
    expect(@user2).to be_valid
  end

  it 'is not valid with a duplicate email and different name' do
    @user2 = build(:user, email: @user.email)
    @user2.name = "hola#{@user.name}"
    expect(@user2).to_not be_valid
  end

  it 'is not valid with a duplicate name and email for the same user' do
    @user2 = build(:user, name: @user.name, email: @user.email)
    @user2.name = @user.name
    @user2.email = @user.email
    expect(@user2).to_not be_valid
  end
end
