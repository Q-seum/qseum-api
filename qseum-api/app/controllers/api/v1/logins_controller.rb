class Api::V1::LoginsController < ApplicationController
        skip_before_action :verify_authentication
    
        def create
            user = User.find_by(username: params[:username])
    
            if user && user.authenticate(params[:password])
                render json: { token: user.api_token , id: user.id, admin: user.is_admin }, status: 201
            else
                render json: { error: "Invalid credentials" }, status: 401
            end
        end
    end
