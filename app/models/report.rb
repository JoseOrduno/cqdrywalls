class Report < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :description, presence: true
end
