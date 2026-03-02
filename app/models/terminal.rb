class Terminal < ApplicationRecord
  belongs_to :airport

  has_many :gates, dependent: :destroy
  has_many :checkin_counters, dependent: :destroy

  validates :code, presence: true
  validates :code, uniqueness: { scope: :airport_id, message: "already exists at this airport" }
end
