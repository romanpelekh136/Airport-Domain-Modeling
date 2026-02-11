class CheckinAssignment < ApplicationRecord
  belongs_to :flight_instance
  belongs_to :checkin_counter

  validates :active_from, presence: true
  validates :active_to, presence: true

  validate :end_after_start
  validate :counter_must_be_free_during_period

  private

  def end_after_start
    return unless active_from && active_to
    if active_to <= active_from
      errors.add(:active_to, "must be after active_from")
    end
  end

  def counter_must_be_free_during_period
    return unless active_from && active_to && checkin_counter_id

    overlapping = CheckinAssignment.where(checkin_counter_id: checkin_counter_id)

    overlapping = overlapping.where.not(id: id) if persisted?

    is_overlapping = overlapping.where(
      "active_from < ? AND active_to > ?", active_to, active_from
    ).exists?

    if is_overlapping
      errors.add(:base, "Checkin counter is already occupied during this time period")
    end
  end
end
