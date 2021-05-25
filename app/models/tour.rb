class Tour < ApplicationRecord
  has_many :tour_statuses
  has_many :users, through: :tour_status
  has_many :events, dependent: :destroy
end
