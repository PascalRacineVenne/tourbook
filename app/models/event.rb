class Event < ApplicationRecord
  belongs_to :tour
  has_many :tour_members, dependent: :destroy
  has_many :users, through: :tour_members
  accepts_nested_attributes_for :tour_members, reject_if: :all_blank, allow_destroy: true
  has_rich_text :schedule
  has_many :broadcasts, as: :broadcastable

  def to_label
    "#{show_start_at.strftime("%I:%M%p %a %b %d")}, #{city}, #{venue}"
  end
end
