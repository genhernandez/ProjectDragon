class TasksController < ApplicationController
    def index
        @tasks = Task.all.order("complete ASC")
    end

    def show
        id = params[:id] # retrieve movie ID from URI route
        @task = Task.find(id)
        # will render app/views/movies/show.html.haml by default
    end

    def new
        @task = Team.find(params[:team_id]).tasks.build
    end

    def create
        # raise @params.inspect 
        @task = Task.create!(task_params)
        redirect_to team_tasks_path(:id => current_team_id, :anchor => 'list')
    end

    def edit
        @task = Task.find params[:id]
    end

    def update
        @task = Task.find params[:id]
        @task.update_attributes!(task_params)
        redirect_to team_tasks_path(:id => current_team_id, :anchor => 'list')
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to team_tasks_path(:id => current_team_id, :anchor => 'list')
    end
    
    def complete
        @task = Task.find params[:id]
        completed = @task.complete
        @task.update_attributes!(:complete => !completed)
        redirect_to team_tasks_path(:id => current_team_id, :anchor => 'list')
    end

    private
    def task_params
        params.require(:task).permit(:title, :priority, :description, :complete, :team, :timestamps, :due).merge(team: Team.find(current_team_id), complete: false)
    end
end
