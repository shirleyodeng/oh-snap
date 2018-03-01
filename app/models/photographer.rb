class Photographer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :photos, dependent: :destroy
  mount_uploader :avatar, PhotoUploader
  validates :description, presence: true
  validates :city, presence: true
  validates :hourly_rate, presence: true
  validates :category, presence: true, inclusion: { in: [ "Weddings", "Birthdays", "Graduation", "Event", "Fashion", "Portrait", "New born", "Pets"] }

  def self.search(search)
    where("city LIKE ?", "%#{search}%")
  end
end
