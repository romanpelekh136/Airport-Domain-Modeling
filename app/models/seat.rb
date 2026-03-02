class Seat < ApplicationRecord
  belongs_to :aircraft

  validates :seat_number, presence: true
  validates :seat_number, uniqueness: { scope: :aircraft_id, message: "already exists on this aircraft" }

  enum :cabin_class, {
    economy: "economy",
    business: "business",
    first: "first"
  }, prefix: true
end
