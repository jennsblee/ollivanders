class Wand < ApplicationRecord
  WOOD_TYPES = ["Acacia", "Alder", "Apple", "Ash", "Aspen", "Beech", "Blackthorn", "Black Walnut", "Cedar", "Cherry", "Chestnut", "Cypress", "Dogwood", "Ebony", "Elder", "Elm", "English Oak", "Fir", "Hawthorn", "Hazel", "Holly", "Hornbeam", "Larch", "Laurel", "Maple", "Pear", "Pine", "Poplar", "Red Oak", "Redwood", "Rowan", "Silver Lime", "Spruce", "Sycamore", "Vine", "Walnut", "Willow", "Yew"]
  CORE_TYPES = ["Unicorn Hair", "Dragon Heartstring", "Pheonix Feather", "Veela Hair", "Thestral Tail Hair", "Thunderbird Feather", "Jackalope Antler","Fairy Wing"]

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :wood, presence: true, uniqueness: { scope: :core }, inclusion: { in: WOOD_TYPES }
  validates :core, presence: true, inclusion: { in: CORE_TYPES }
  validates :name, :price, :size, :description, presence: true
end
