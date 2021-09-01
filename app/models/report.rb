class Report < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :comments

  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :description, presence: true
end
