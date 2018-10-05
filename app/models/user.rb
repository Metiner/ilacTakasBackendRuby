class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true, presence: true
  has_one :eczane

  def encoded_token
    JWT.encode({token: id}, Rails.application.config.hmac_secret, 'HS256')
  end

end
