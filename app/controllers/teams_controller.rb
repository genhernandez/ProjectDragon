require 'securerandom'

class TeamsController < ApplicationController
    def index
        if params[:search]
            if params[:search] == ""
                flash[:notice] = "Search cannot be blank."
            elsif Team.where('name LIKE ?', "%#{params[:search]}%").blank?
                            flash[:notice] = "No teams found."

            else
             @teams = Team.where('name LIKE ?', "%#{params[:search]}%")
        end
    end
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
        @team.update_attributes(:confirmation_code => SecureRandom.hex)
        if @team.save!
          current_user.update_attributes(:team => @team)
          current_user.save!
          redirect_to team_dragons_path(:team_id => current_team_id)
        else
          redirect_to teams_path(:id => current_team_id, :anchor => 'list')
          flash[:notice] = "Team can't be created without a name."
        end
      end

    def edit
        @team = Team.find(params[:id])

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
        params.require(:team).permit(:name)
    end
end
