class Bid < ApplicationRecord
  belongs_to :auction
  belongs_to :shift
  belongs_to :bidder, class_name: 'User'

  def bidder
    shift&.user
  end

  def date
    "#{shift.start.strftime("%d-%m %H:%M")} a #{shift.end.strftime("%H:%M")}"
  end
end
