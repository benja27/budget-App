require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @group = create(:group)
  end

  it 'is valid with valid attributes' do
    expect(@group).to be_valid
  end

  it 'is not valid without a name' do
    @group.name = nil
    expect(@group).to_not be_valid
  end

  it 'is not valid without an icon' do
    @group.icon = nil
    expect(@group).to_not be_valid
  end

  it 'is not valid without a user' do
    @group.user = nil
    expect(@group).to_not be_valid
  end

  it 'is not valid with a name shorter than 2 characters' do
    @group.name = 'a'
    expect(@group).to_not be_valid
  end

  it 'is not valid with a name longer than 40 characters' do
    @group.name = 'a' * 41
    expect(@group).to_not be_valid
  end

  it 'is not valid with an icon shorter than 2 characters' do
    @group.icon = 'a'
    expect(@group).to_not be_valid
  end

  it 'is not valid with an icon longer than 40 characters' do
    @group.icon = 'a' * 41
    expect(@group).to_not be_valid
  end

  it 'is not valid with a duplicate name for the same user' do
    @group2 = build(:group, name: @group.name, user: @group.user)
    expect(@group2).to_not be_valid
  end

  it 'is valid with a duplicate name for different users' do
    @group2 = build(:group, name: @group.name)
    expect(@group2).to be_valid
  end

  it 'is not valid with a duplicate icon for the same user' do
    @group2 = build(:group, icon: @group.icon, user: @group.user)
    expect(@group2).to_not be_valid
  end

  it 'is valid with a duplicate icon for different users' do
    @group2 = build(:group, icon: @group.icon)
    expect(@group2).to be_valid
  end

  it 'is not valid with a duplicate name and icon for the same user' do
    @group2 = build(:group, name: @group.name, icon: @group.icon, user: @group.user)
    expect(@group2).to_not be_valid
  end

  it 'is valid with a duplicate name and icon for different users' do
    @group2 = build(:group, name: @group.name, icon: @group.icon)
    expect(@group2).to be_valid
  end

  it 'is valid with a duplicate name and different icon for the same user' do
    @group2 = build(:group, name: @group.name, user: @group.user)
    expect(@group2).to_not be_valid
  end

  it 'is valid with a duplicate icon and different name for the same user' do
    @group2 = build(:group, icon: @group.icon, user: @group.user)
    expect(@group2).to_not be_valid
  end

  it 'is valid with a duplicate name and different icon for different users' do
    @group2 = build(:group, name: @group.name)
    expect(@group2).to be_valid
  end

  it 'is valid with a duplicate icon and different name for different users' do
    @group2 = build(:group, icon: @group.icon)
    expect(@group2).to be_valid
  end

  it 'is not valid with a name with invalid characters' do
    @group.name = 'a@'
    expect(@group).to_not be_valid
  end

  
end
