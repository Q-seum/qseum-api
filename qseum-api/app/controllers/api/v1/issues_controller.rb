class Api::V1::IssuesController < ApplicationController

    def index
        if current_user && current_user.is_admin
            @issues_new = Issue.weeks_issues.where(resolved: false)
            @issues_resolved = Issue.weeks_issues.where(resolved: true)
        else
            render json: { error: "You are not authorized to access this data."}, status: 401 
        end
    end

    def create
        @issue = Issue.new(issue_params)
        if @issue.save
            render "api/v1/issues/show.json"
        else
            render json: { error: "You did not follow the issue parameters"}, status: 401 
        end
    end

    def show
        @issue = Issue.find(params[:id])
        if current_user && (current_user.is_admin || (current_user == @issue.user))
            if @issue
                render "api/v1/issues/show.json", status:200
            else
                format.json { render json: @issue.errors, status: :unprocessable_entity }
            end
        else
            render json: { error: "You are not authorized to access this data."}, status: 401 
        end
    end


      def update
        @issue = Issue.find(params[:id])
        respond_to do |format|
          if @issue.update(issue_params)
            format.json { render json: @issue, status: :ok, location: @issue }
          else
            format.json { render json: @issue.errors, status: :unprocessable_entity }
          end
        end
      end

    private
        def issue_params
            params.permit(:user_id, :text, :resolved)
        end
end
