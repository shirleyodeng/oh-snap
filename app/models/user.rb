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
    if Photographer.where(user_id: self.id).any?
      return true
    else
      false
    end
  end

  def photographer_id
    Photographer.where(user_id: self.id).first.id
  end
end
