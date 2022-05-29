class Shift < ApplicationRecord
  belongs_to :user
  delegate :calendar_id, to: :user
  has_many :auctions, dependent: :destroy
  has_many :bids, dependent: :destroy

  def date
    "#{start.strftime("%d-%m %H:%M")} a #{self.end.strftime("%H:%M")}"
  end

  def self.options_for_select
    options = []
    self.all.each do |shift| 
      options << [shift.date, shift.id]
    end
    options
  end
end
