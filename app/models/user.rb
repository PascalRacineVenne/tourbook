class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :tour_members
  has_many :job_skills, dependent: :destroy
  has_many :skills, through: :job_skills
  has_one_attached :avatar
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def to_label
    full_name
  end
end
