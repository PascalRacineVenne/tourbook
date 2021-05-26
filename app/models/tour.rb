class Tour < ApplicationRecord
  has_many :tour_members, dependent: :destroy
  has_many :users, through: :tour_members
  has_many :events, dependent: :destroy
  accepts_nested_attributes_for :tour_members
end
