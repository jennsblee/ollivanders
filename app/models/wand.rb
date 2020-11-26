class Wand < ApplicationRecord
  WOOD_TYPES = ["Acacia", "Alder", "Apple", "Ash", "Aspen", "Beech", "Birch", "Blackthorn", "Black Walnut", "Cedar", "Cherry", "Chestnut", "Cypress", "Dogwood", "Ebony", "Elder", "Elm", "English Oak", "Fir", "Hawthorn", "Hazel", "Holly", "Hornbeam", "Larch", "Laurel", "Maple", "Pear", "Pine", "Poplar", "Red Oak", "Redwood", "Rosewood", "Rowan", "Silver Lime", "Spruce", "Sycamore", "Vine", "Walnut", "Willow", "Yew"]
  CORE_TYPES = ["Unicorn Hair", "Dragon Heartstring", "Pheonix Feather", "Veela Hair", "Thestral Tail Hair", "Thunderbird Feather", "Jackalope Antler","Fairy Wing"]

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :wood, presence: true, uniqueness: { scope: :core }, inclusion: { in: WOOD_TYPES }
  validates :core, presence: true, inclusion: { in: CORE_TYPES }
  validates :name, :price, :size, :description, presence: true
  validates :photos, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  multisearchable against: [:name, :wood, :core]

  pg_search_scope :search,
                  against: [:name, :wood, :core],
                  associated_against: {
                    user: [:first_name, :last_name]
                  },
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }
end
