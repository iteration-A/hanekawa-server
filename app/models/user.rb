class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, length: { minimum: 3, maximum: 12 }, format: { with: /\A[A-Z_0-9.]+\z/i }
end
