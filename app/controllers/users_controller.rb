class UsersController < ApplicationController

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to root_path
    end
    def update
        new_team_id= params[:new_team_id]
        puts "hello #{new_team_id}"
        @user = User.find(params[:id])
        if @user.update_attributes(:team_id => new_team_id)
            redirect_to team_tasks_path(:team_id => current_team_id, :anchor => 'list')
        else
            redirect_to teams_path(:id => current_team_id, :anchor => 'list')
            #TODO: reload edit modal
        end
    end

    def edit
        @user = User.find params[:id]
    end
end
