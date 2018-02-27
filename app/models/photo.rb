class Photo < ApplicationRecord
  belongs_to :photographer
  mount_uploader :photo, PhotoUploader
end
