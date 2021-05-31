class Tour < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :tour_members, through: :events
  has_one_attached :logo
end
