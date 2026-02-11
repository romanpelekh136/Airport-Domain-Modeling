class GateAssignment < ApplicationRecord
  belongs_to :gate
  belongs_to :flight_instance

  validates :active_to, presence: true
  validates :active_from, presence: true

  validate :end_after_start

  private

  def end_after_start
    return unless active_to && active_from
    if active_to <= active_from
      errors.add(:active_to, "must be after the start")
    end
  end

  def gete_must_be_free_during_time
    return unless active_to && active_from

    assignments = GateAssignment.where(gate_id: gate_id)

    assignments = assignments.where.not(id: id) if persisted?

    is_overlapping = assignments.where(
      "active_from < ? AND active_to > ?", active_to, active_from
    ).exists?

    if is_overlapping
      errors.add(:base, "Gate is already occupied during this time period")
    end
  end
end
