class LoginsController < ApplicationController
        skip_before_action :verify_authentication
    
        def create
            user = User.find_by(username: params[:username])
    
            if user && user.authenticate(params[:password])
                render json: { token: user.api_token , id: user.id }, status: 201
            else
                render json: { error: "Invalid credentials" }, status: 401
            end
        end

        # def destroy
        #     bearer_token = nil
        # end
    
    end
