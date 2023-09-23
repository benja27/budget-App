require 'rails_helper'

RSpec.describe Movement, type: :model do
  movement = FactoryBot.create(:movement)

  it 'is valid with valid attributes' do
    expect(movement).to be_valid
  end

  it 'is not valid without a name' do
    movement.name = nil
    expect(movement).to_not be_valid
  end

  it 'is not valid without an amount' do
    movement.amount = nil
    expect(movement).to_not be_valid
  end

  it 'is not valid without an author' do
    movement.author = nil
    expect(movement).to_not be_valid
  end

  it 'is not valid without a group' do
    movement.group = nil
    expect(movement).to_not be_valid
  end

  it 'is not valid with a name shorter than 2 characters' do
    movement.name = 'a'
    expect(movement).to_not be_valid
  end

  it 'is not valid with a name longer than 40 characters' do
    movement.name = 'a' * 41
    expect(movement).to_not be_valid
  end

  it 'is not valid with an amount shorter than 1' do
    movement.amount = 0
    expect(movement).to_not be_valid
  end

  it 'is not valid with an amount longer than 1000000' do
    movement.amount = 1_000_001
    expect(movement).to_not be_valid
  end

  it 'is not valid with a group_id shorter than 1' do
    movement.group_id = 0
    expect(movement).to_not be_valid
  end

  it 'is not valid with a group_id longer than 1000000' do
    movement.group_id = 1_000_001
    expect(movement).to_not be_valid
  end

  it 'is not valid with an author_id shorter than 1' do
    movement.author_id = 0
    expect(movement).to_not be_valid
  end

  it 'is not valid with an author_id longer than 1000000' do
    movement.author_id = 1_000_001
    expect(movement).to_not be_valid
  end

  it 'is not valid with a name that already exists in the same group' do
    movement2 = FactoryBot.build(:movement, name: movement.name, group: movement.group)
    expect(movement2).to_not be_valid
  end

  it 'is not valid with a name that already exists in the same group but with different case' do
    movement2 = FactoryBot.build(:movement, name: movement.name.upcase, group: movement.group)
    expect(movement2).to_not be_valid
  end

  it 'is not valid with a name that already exists in the same group but with different case' do
    movement2 = FactoryBot.build(:movement, name: movement.name.downcase, group: movement.group)
    expect(movement2).to_not be_valid
  end

  it 'is not valid with a name that already exists in the same group but with different case' do
    movement2 = FactoryBot.build(:movement, name: movement.name.capitalize, group: movement.group)
    expect(movement2).to_not be_valid
  end

  it 'is valid with a name that already exists in a different group but with different case' do
    movement2 = FactoryBot.build(:movement, name: movement.name.capitalize)
    expect(movement2).to_not be_valid
  end

  it 'is not valid with a name that already exists in the same group but with different case' do
    movement2 = FactoryBot.build(:movement, name: movement.name.swapcase, group: movement.group)
    expect(movement2).to_not be_valid
  end

  it 'is valid with a name that already exists in a different group but with different case' do
    movement2 = FactoryBot.build(:movement, name: movement.name.swapcase)
    expect(movement2).to_not be_valid
  end
end
