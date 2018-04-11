class DragonsController < ApplicationController
    def create
      @dragon = Dragon.new(dragon_params)

      case @dragon.color
      when 'green'
          @dragon.picture_path = 'img/green_dragon.gif'
      when 'blue'
          @dragon.picture_path = 'img/blue_dragon.gif'
      when 'yellow'
          @dragon.picture_path = 'img/yellow_dragon.gif'
      when 'red'
          @dragon.picture_path = 'img/red_dragon.gif'
      when 'purple'
          @dragon.picture_path = 'img/purple_dragon.gif'
      end

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

#rails g migration add_color_to_dragon color:string -->
