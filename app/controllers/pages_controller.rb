class PagesController < ApplicationController
    def show
        if current_user.nil?
            render template: "pages/#{params[:page]}"
        else
            redirect_to team_tasks_path(:team_id => current_team_id)
        end
    end
end
