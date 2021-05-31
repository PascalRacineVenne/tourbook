class Broadcast < ApplicationRecord
  belongs_to :broadcastable, polymorphic: true
  has_rich_text :content
end
