class User < ApplicationRecord
  has_secure_password
  has_many :journals
  validates :name, :username, presence: true
  validates :email, uniqueness: true
  validates :password, length: {minimum: 8}
end
