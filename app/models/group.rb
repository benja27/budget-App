class Group < ApplicationRecord
  belongs_to :user
  has_many :movements, dependent: :destroy
  validates :icon, presence: true
  validates :name, presence: true
  validates :name, length: { minimum: 2 }
  validates :name, length: { maximum: 40 }
  validates :icon, length: { minimum: 2 }
  validates :icon, length: { maximum: 40 }
  validates :user, presence: true
  validates :user_id, uniqueness: { scope: :name, message: 'You already have a group with this name' }
end
