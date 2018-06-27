class Api::V1::UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    skip_before_action :verify_authentication, only: [:create]

    def create
        @user = User.new(user_params)
        @member = Membership.find_by(account: params[:account])
        if @member
            users_limit_per_account
            unless @user.errors.any?
                if @user.save!
                    render "api/v1/users/show.json", status:201
                else 
                    render json: { error: "You did not follow the user parameters"}, status: 401
                end
            else 
                format.json { render json: @user.errors, status: :unprocessable_entity }  
            end
        else
            render json: {error: "Not a valid account number"}, status: 401
        end
    end

    def show
        @user = User.find(params[:id])
        if current_user.is_admin
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

        def users_limit_per_account
            @existing_user = User.find_by(account: params[:account])
            if @existing_user
                @second_user = User.where(account: params[:account]).where(:id != @existing_user.id)
            end
            if @member.num_allowed == 2 && @second_user
                @user.errors.add(:account, "2 users already exist for this membership account")
            elsif @member.num_allowed == 1 && @existing_user
                @user.errors.add(:account, "A user already exists for this membership account")
            end
        end

        def user_params
            params.permit(:account, :username, :password, :email)
        end

end
