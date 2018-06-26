class Api::V1::UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    skip_before_action :verify_authentication

    def create
        @user = User.new(user_params)
        if Membership.find_by(account: user_params.account)
            if @user.save!
                render "api/v1/users/show.json", status:201
            else 
                render json: { error: "You did not follow the user parameters"}, status: 401
            end
        else
            render json: {error: "Not a valid account number"}, status: 401
        end
    end

    def show
        @user = User.find(params[:id])
        if @user.is_admin
            render "api/v1/users/show.json", status:200
        elsif @user == current_user
            render "api/v1/users/profile.json", status:200
        else
            format.json { render json: @user.errors, status: :unprocessable_entity }
        end
    end


    def destroy
        if @user.destroy
            respond_to do |format|
                format.json { head :no_content }
            end
        else
            format.json { render json: @user.errors, status: :unprocessable_entity }
        end
    end

    private
        def set_user
            @user = User.find(params[:id])
        end

        def user_params
            params.permit(:account, :username, :password, :email)
        end

end
