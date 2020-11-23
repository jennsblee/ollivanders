class Wand < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :wood, presence: true, uniqueness: { scope: :core }
  validates :price, presence: true
  validates :size, presence: true
end
