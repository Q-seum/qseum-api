class Api::V1::VisitsController < ApplicationController

    def index
        if current_user && current_user.is_admin
            @visits = Visit.todays_visits
        else
            render json: { error: "You are not authorized to access this data."}, status: 401 
        end
    end

    def create
        if current_user && current_user.is_admin
            @visit = Visit.new(visit_params)
            @visit.date = Date.today
            if @visit.save!
                render :index, status:201
            else 
                render json: { error: "You did not follow the visit parameters"}, status: 401
            end
        else
            render json: { error: "You are not authorized for this action."}, status: 401 
        end
    end

    def show
        if current_user && current_user.is_admin
            @visit = Visit.find(params[:id])
            if @visit
                render "api/v1/visits/show.json", status:200
            else
                format.json { render json: @visit.errors, status: :unprocessable_entity }
            end
        else
            render json: { error: "You are not authorized to access this data."}, status: 401 
        end
    end


    private
        def visit_params
            params.permit(:user_id, :account,  :visitors)
        end
end
