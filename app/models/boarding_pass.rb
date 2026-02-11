class BoardingPass < ApplicationRecord
  belongs_to :ticket
  belongs_to :seat
end
