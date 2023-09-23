class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :groups
  has_many :movements
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :name, length: { minimum: 2 }
  validates :name, length: { maximum: 40 }
  validates :email, length: { minimum: 5 }
  validates :email, length: { maximum: 50 }
  validates :password, length: { minimum: 6 }
  validates :password, length: { maximum: 20 }
  validates :password_confirmation, length: { minimum: 6 }
  validates :password_confirmation, length: { maximum: 20 }
  validates :email, uniqueness: true
end
