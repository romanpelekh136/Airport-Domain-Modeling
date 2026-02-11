class Booking < ApplicationRecord
  has_many :tickets

  validates :reference_number, presence: true, uniqueness: true
end
