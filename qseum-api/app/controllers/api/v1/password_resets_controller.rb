class Api::V1::PasswordResetsController < ApplicationController
  skip_before_action :verify_authentication

  def new
  end

  def create
    @password_reset = PasswordReset.new(pwd_params)
    @user = User.find_by(email: @password_reset.email)
    if @user
      @password_reset.user_id = @user.id
      @password_reset.save
      @password_reset.send_password_reset_email
      render json: { new_token: @password_reset.new_token }, status:201
    else
    end
  end

  def update
    @pwreset = PasswordReset.find_by(new_token: params[:new_token])
    @user = User.find(@pwreset.user_id)
    @user.password = params[:password]
    @user.save(:validate => false)
    params.delete :password
    if @pwreset.update(pwd_params)
      render json: @user, status:200
    else
      render status:400
    end
  end

  private
    def pwd_params
        params.permit(:user_id, :email, :used, :password)
    end


end
