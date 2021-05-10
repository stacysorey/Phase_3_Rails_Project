class User < ApplicationRecord
  has_secure_password
  has_many :journals
  validates :username, presence: true
  validates :password, length: {minimum: 8, message: "Password must be at least 8 characters"}
end
