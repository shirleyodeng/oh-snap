class Photographer < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :description, presence: true
  validates :city, presence: true
  validates :price, presence: true
  validates :categories, inclusion: { in: %w(weddings birthdays portraits graduation fashion new_born real_estate) }
end
