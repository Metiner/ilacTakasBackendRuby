class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  before_action :check_authorization

  def check_authorization
    user_data = JWT.decode request.headers['Authorization'], Rails.application.config.hmac_secret,true, algorithm: 'HS256'
    user = User.find(user_data[0]['login_token'])
  end
end
