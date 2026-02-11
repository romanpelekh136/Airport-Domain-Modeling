class Baggage < ApplicationRecord
  belongs_to :ticket

  validates :weight, presence: true
  validates :tag_number, presence: true, uniqueness: true
end
