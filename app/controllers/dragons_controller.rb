class DragonsController < ApplicationController
    def create

    end

    def new
      @dragon = Team.find(params[:team_id]).dragons.build
    end
end
