class UsersController < ApplicationController

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to root_path
    end

    def update
        new_team_id= params[:new_team_id]
        @user = User.find(params[:id])
        @user.update_attributes!(:team_id => new_team_id)
        redirect_to team_tasks_path(:team_id => current_team_id, :anchor => 'list')
    end

    #if we import skel.min.js before main to implement mobile, then this show method is needed
    #the abstraction fairy is going to kill me - Genesis
    def show
        @user = User.find(params[:id])
        @user.destroy
        redirect_to root_path
    end

    def join
        id = params[:id]
        team_id = params[:new_team_id]
        user_code = params[:user][0]
        team_code = Team.find(team_id).confirmation_code
        if user_code.empty?
            flash[:notice] = "Confirmation code cannot be blank."
            redirect_back(fallback_location: root_path)
        elsif user_code == team_code
            User.find(id).update_attributes!(:team_id => team_id)
            redirect_to team_tasks_path(:team_id => current_team_id, :anchor => 'list')
        else
            flash[:notice] = "Incorrect confirmation code."
            redirect_back(fallback_location: root_path)
        end
    end

    def edit
        @user = User.find params[:id]
    end
end
