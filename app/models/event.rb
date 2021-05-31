class Event < ApplicationRecord
  belongs_to :tour
  has_rich_text :schedule
  has_many :broadcasts, as: :broadcastable
end
