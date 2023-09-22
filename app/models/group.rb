class Group < ApplicationRecord
  belongs_to :user
  has_many :movements, dependent: :destroy
  validates :icon , presence: true
end