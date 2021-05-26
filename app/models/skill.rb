class Skill < ApplicationRecord
  has_many :job_skills, dependent: :destroy
end
