class Broadcast < ApplicationRecord
  belongs_to :broadcastable, polymorphic: true
end
