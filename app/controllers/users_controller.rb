class UsersController < ApplicationController
  def signup
    user = User.create(user_params)
    user.create_eczane(eczane_params)
    if user.persisted?
      render json: {user: user, token: user.encoded_token }
    else
      render json: { error: user.errors }, status: 422
    end
  end

  def signin
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: { token: user.auth_token , eczane: Eczane.find(user.eczane_id)}
    else
      render json: { error: 'auth failed'}
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def eczane_params
    params.require(:eczane).permit(:ad, :gln_no, :grup_id, :bakiye, :actigi_teklif_sayisi)
  end
end
