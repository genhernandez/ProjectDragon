class TeamsController < ApplicationController
    def index
        @teams = Team.all
        if params[:search]
            @teams = Team.search(params[:search]).order("created_at DESC")
        else
            @teams = Team.all.order("created_at DESC")
        end
    end

    def self.search(search)
        where("name ILIKE ?","%#{search}%") 
    end

    def show
    end

    def new
        # default: render 'new' template
        # rails will default to an empty method if it's not there
        # so this one is optional
    end

    def create
        # raise @params.inspect
        @team = Team.create!(team_params)
        @team.update_attributes(:user_ids => [current_user.id])
        @team.save!
        current_user.update_attributes(:team => @team)
        current_user.save!
        redirect_to team_tasks_path(:team_id => current_team_id)
    end

    def edit
        @team = Team.find params[:id]
    end

    def update
    end

    def destroy
        @team = Team.find(params[:id])
        @team.destroy
        redirect_to root_path
    end


    private
    def team_params
        params.permit(:name, :users, :tasks, :dragon)
    end
end
