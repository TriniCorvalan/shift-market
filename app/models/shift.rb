class Shift < ApplicationRecord
  belongs_to :user
  delegate :calendar_id, to: :user
  has_many :auctions, dependent: :destroy
end
