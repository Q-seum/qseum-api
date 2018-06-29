class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
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

end
