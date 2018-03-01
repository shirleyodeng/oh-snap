class Photographer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :photos, dependent: :destroy
  mount_uploader :avatar, PhotoUploader
  validates :description, presence: true
  validates :city, presence: true
  validates :hourly_rate, presence: true

  def self.search(search)
    where("city LIKE ?", "%#{search}%")
  end
end
