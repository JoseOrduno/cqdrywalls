class Report < ApplicationRecord
  belongs_to :user
  belongs_to :assigned_report, class_name: :User, foreign_key: :employee_id, optional: true
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :description, presence: true
end
