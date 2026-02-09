class Airport < ApplicationRecord
  has_many :terminals, dependent: destroy

  validates :name, presence: true
end
