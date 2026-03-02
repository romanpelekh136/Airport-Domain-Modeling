class FlightInstance < ApplicationRecord
  belongs_to :flight
  belongs_to :aircraft

  enum :status, {
    scheduled: "scheduled",
    boarding: "boarding",
    delayed: "delayed",
    departed: "departed",
    arrived: "arrived",
    cancelled: "cancelled"
  }, prefix: true, default: "scheduled"

  validates :scheduled_departure_at, presence: true
  validates :scheduled_arrival_at, presence: true

  validate :arrival_after_departure

  private

  def arrival_after_departure
    if scheduled_arrival_at <= scheduled_departure_at
      errors.add(:scheduled_arrival_at, "must be after departure time")
    end
  end
end
