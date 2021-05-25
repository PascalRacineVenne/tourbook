class TourMember < ApplicationRecord
  belongs_to :tour
  belongs_to :user, optional: true
end
