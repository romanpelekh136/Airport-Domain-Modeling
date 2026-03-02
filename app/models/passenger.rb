class Passenger < ApplicationRecord
  has_many :tickets, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :doc_number, presence: true, uniqueness: true
end
