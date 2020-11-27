class User < ApplicationRecord
  has_many :bookings
  has_many :wands, dependent: :destroy
  has_many :received_bookings, class_name: 'Booking', through: :wands, source: :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
