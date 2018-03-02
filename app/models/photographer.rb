class Photographer < ApplicationRecord
  include PgSearch
  pg_search_scope :global_search,
    against: [ :description, :category, :city ],
    associated_against: {
      user: [ :first_name, :last_name ]
    },
    using: {
      tsearch: { prefix: true }
    }

  belongs_to :user
  has_many :bookings
  has_many :photos, dependent: :destroy
  mount_uploader :avatar, PhotoUploader
  validates :description, presence: true
  validates :city, presence: true
  validates :hourly_rate, presence: true
  validates :category, presence: true, inclusion: { in: [ "Weddings", "Birthdays", "Graduation", "Fashion", "Portraits", "Maternity", "Pets"] }
end
