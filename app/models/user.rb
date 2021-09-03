class User < ApplicationRecord
  has_secure_password
  has_many :comments
  has_many :reports
  has_many :assigned_reports, class_name: :Report, foreign_key: :employee_id

  enum role: %i[admin employee]
  validates :role, presence: true
  validates :name, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: true
end
