class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @password_reset = PasswordReset.new(pwd_params)
    @user = User.find_by(email: pwd_params[:email])
    if @user
      @password_reset.save
      @user.send_password_reset_email
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
      params.permit(:user_id, :email, :new_token)
  end


end
