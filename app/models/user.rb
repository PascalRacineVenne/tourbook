class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :tour_status
  has_many :tours, through: :tour_status
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
