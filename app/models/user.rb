class User < ApplicationRecord
  has_secure_password
  has_secure_token :auth_token
  validates :email, uniqueness: true, presence: true
  has_one :eczane
end
