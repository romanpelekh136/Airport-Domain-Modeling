class Flight < ApplicationRecord
  belongs_to :airline

  belongs_to :origin_airport, class_name: "Airport"
  belongs_to :destination_airport, class_name: "Airport"

  has_many :flight_instances, dependent: :destroy

  validates :flight_number, presence: true, uniqueness: true

  validate :origin_and_destination_must_be_different

  def origin_and_destination_must_be_different
    if origin_airport_id == destination_airport_id
      errors.add(:destination_airport, "must be different from origin airport")
    end
  end
end
