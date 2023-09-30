class Movement < ApplicationRecord
  belongs_to :group
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :name, presence: true, length: { in: 2..40 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1_000_000 }
  validates :author_id, :group_id, presence: true,
                                   numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1_000_000 }

  validates_uniqueness_of :name, scope: :group_id, case_sensitive: false
end
