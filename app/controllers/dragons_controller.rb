class DragonsController < ApplicationController
    def create
      @dragon = Dragon.new(dragon_params)
      redirect_to team_tasks_path(:id => current_team_id)
    end

    def new
      @dragon = Team.find(params[:team_id]).dragons.build
    end

    private
    def dragon_params
        params.require(:dragon).permit(:picture_path, :name, :id, :xp, :level).merge(team: Team.find(current_team_id))
    end
end
