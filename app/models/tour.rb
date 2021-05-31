class Tour < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :tour_members, through: :events
  has_many :users, through: :tour_members
  accepts_nested_attributes_for :events, reject_if: :all_blank
  has_one_attached :logo
  has_many :broadcasts, as: :broadcastable
end

