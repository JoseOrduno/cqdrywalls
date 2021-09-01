class User < ApplicationRecord
  has_secure_password
  has_many :comments
  has_many :reports

  enum role: %i[admin employee]
  validates :role, presence: true
  validates :name, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: true
end
