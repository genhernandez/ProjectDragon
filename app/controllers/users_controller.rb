class UsersController < ApplicationController

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to root_path
    end
    def update
        new_team_id= params[:new_team_id]
        @user = User.find(params[:id])
        if @user.update_attributes(:team_id => new_team_id)
            redirect_to team_tasks_path(:team_id => current_team_id, :anchor => 'list')
        else
            redirect_to teams_path(:id => current_team_id, :anchor => 'list')
            #TODO: reload edit modal
        end
    end

    #if we import skel.min.js before main to implement mobile, then this show method is needed
    #the abstraction fairy is going to kill me - Genesis
    def show
        @user = User.find(params[:id])
        @user.destroy
        redirect_to root_path
    end
    
    #SOMETHING NEW
    def delete_confirmation
        respond_to do |format|
            format.html
            format.js
        end
    end
    
    def edit
        @user = User.find params[:id]
    end
end
