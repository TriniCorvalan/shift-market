class Auction < ApplicationRecord
  belongs_to :shift
  has_many :bids, dependent: :destroy

  enum status: {
    pending: 0,
    trading: 1,
    closed: 2
  }

  validates :price, numericality: { in: (1...5) }
  accepts_nested_attributes_for :shift

  def bidder
    shift.user
  end

  def date
    "#{shift.start.strftime("%d-%m %H:%M")} a #{shift.end.strftime("%H:%M")}"
  end
end
