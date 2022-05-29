class Auction < ApplicationRecord
  belongs_to :shift
  has_one :user, through: :shift

  enum status: {
    pending: 0,
    trading: 1,
    closed: 2
  }

  validates :price, numericality: { in: (1...5) }
end
