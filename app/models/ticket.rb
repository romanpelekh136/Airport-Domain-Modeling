class Ticket < ApplicationRecord
  belongs_to :booking
  belongs_to :passenger
  belongs_to :flight_instance

  has_one :boarding_pass
  has_many :baggages
end
