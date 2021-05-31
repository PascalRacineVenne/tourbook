class Event < ApplicationRecord
  belongs_to :tour
  has_rich_text :schedule
  has_many :broadcasts, as: :broadcastable

  def to_label
    "#{show_start_at.strftime("%I:%M%p %a %b %d")}, #{city}, #{venue}"
  end
end
