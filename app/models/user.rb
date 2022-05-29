class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shifts, dependent: :destroy
  has_many :auctions, through: :shifts
  has_many :bids, dependent: :destroy, foreign_key: :user_id
end
