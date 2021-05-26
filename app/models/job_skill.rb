class JobSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill
  validates :skill, uniqueness: { scope: :user }
end
