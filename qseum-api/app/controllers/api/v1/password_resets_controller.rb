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
    @passwordreset = User.find_by(api_token: params[:id])
    if @passwordreset.update
      @passwordreset.user.password = params[:password]
      @passwordreset.user.save
      render status:200
    else
      render status:400
    end
  end

  private
    def pwd_params
        params.permit(:user_id, :email)
    end


end
