class Aircraft < ApplicationRecord
  belongs_to :airline

  has_many :seats, dependent: destroy
  has_many :flight_instances, dependent: destroy

  validates :serial_number, presence: true, uniqueness: true
end
