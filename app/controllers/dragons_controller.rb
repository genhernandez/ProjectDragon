class DragonsController < ApplicationController
    def create
      @dragon = Dragon.new(dragon_params)
      case @dragon.color
      when 'Green'
          picture_path = image_urls[0]
      when 'Blue'
          picture_path = image_urls[1]
      when 'Yellow'
          picture_path = image_urls[4]
      when 'Red'
          picture_path = image_urls[3]
      when 'Purple'
          picture_path = image_urls[2]
      end
      if @dragon.save
        @dragon.update_attributes!(:picture_path => picture_path)
        @dragon.update_attributes!(:level => 1)
        @dragon.update_attributes!(:xp => 0)
        redirect_to team_tasks_path(:id => current_team_id)
      else
        redirect_to team_dragons_path(:id => current_team_id)
        flash[:notice] = "Dragon can't be created without a name."
      end
    end

    def new
      @dragon = Team.find(params[:team_id]).dragons.build
    end

    private
    def dragon_params
        params.require(:dragon).permit(:picture_path, :name, :id, :xp, :level, :color).merge(team: Team.find(current_team_id))
    end
end
