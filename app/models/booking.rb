class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :wand

  validates :check_out, :check_in, presence: true
end
