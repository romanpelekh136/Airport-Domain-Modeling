class Gate < ApplicationRecord
  belongs_to :terminal

  validates :code, presence: true
  validates :code, uniqueness: { scope: :terminal_id, message: "already exists at this terminal" }
end
