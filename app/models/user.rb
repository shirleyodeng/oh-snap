class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bookings
  has_many :photographers, through: :bookings
  validates :first_name, presence: true
  validates :last_name, presence: true

  def is_photographer?
    self.photographers.blank?
  end
end
