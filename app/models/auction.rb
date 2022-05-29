class Auction < ApplicationRecord
  belongs_to :shift
  has_one :user, through: :shift
end
