class Photographer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :photos
  validates :description, presence: true
  validates :city, presence: true
  validates :hourly_rate, presence: true
  mount_uploader :avatar, PhotoUploader
end
