class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :tours, through: :tour_status
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
