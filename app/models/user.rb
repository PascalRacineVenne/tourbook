class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :tours, through: :tour_member
  has_many :job_skills, dependent: :destroy
  has_many :skills, through: :job_skills
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
