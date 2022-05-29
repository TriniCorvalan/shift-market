class Bid < ApplicationRecord
  belongs_to :auction
  belongs_to :shift
  belongs_to :bidder, class_name: 'User'
end
