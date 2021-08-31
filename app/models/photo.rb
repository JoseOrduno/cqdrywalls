class Photo < ApplicationRecord
  mount_uploader :name, PhotoUploader
  belongs_to :report
end
