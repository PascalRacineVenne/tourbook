class Event < ApplicationRecord
  belongs_to :tour
  has_rich_text :schedule
end
