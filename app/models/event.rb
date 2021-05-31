class Event < ApplicationRecord
  belongs_to :tour
  has_many :tour_members, dependent: :destroy
  accepts_nested_attributes_for :tour_members, reject_if: :all_blank, allow_destroy: true
  has_rich_text :schedule
end
