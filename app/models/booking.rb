class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :photographer
  validates :hours, presence: true
  validates :date, presence: true
  validates :location, presence: true
end
