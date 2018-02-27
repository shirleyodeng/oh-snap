class Photographer < ApplicationRecord

  belongs_to :user
  has_many :bookings
  validates :description, presence: true
  validates :city, presence: true
  validates :hourly_rate, presence: true
  mount_uploader :photo, PhotoUploader
  # validates :categories, inclusion: { in: ["weddings", "birthdays", "portraits", "graduation", "fashion", "new born", "real estate"] }
end
