class TeamsController < ApplicationController
    def index
        if params[:search] 
            if params[:search] == ""
                flash[:notice] = "Search cannot be blank."
            else
             @teams = Team.where('name LIKE ?', "%#{params[:search]}%")
              

          #redirect_to teams_path(:team_id => current_team_id)
          #Team.all
          #wait for search
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
        @team.save!
        current_user.update_attributes(:team => @team)
        current_user.save!
        redirect_to team_dragons_path(:team_id => current_team_id)

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
        params.require(:team).permit(:name, :users, :tasks, :dragon, :search)
    end
end
