class Transaction < ApplicationRecord
  validates :transaction_id, presence: true, uniqueness: true
  validates :points, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :user_id, presence: true
end
