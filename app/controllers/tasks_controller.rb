class TasksController < ApplicationController
def index
    @tasks = Task.all
    end

    def show
        id = params[:id] # retrieve movie ID from URI route
        @task = Task.find(id) # look up movie by unique ID
        # will render app/views/movies/show.html.haml by default
    end

    def new
        # default: render 'new' template
        # rails will default to an empty method if it's not there
        # so this one is optional 
    end

    def create
        # raise @params.inspect 
        @task = Task.create!(task_params)
        flash[:notice] = "#{@task.title} was successfully created."
        redirect_to tasks_path
    end

    def edit
        @task = Task.find params[:id]
    end

    def update
        @task = Task.find params[:id]
        @task.update_attributes!(task_params)
        flash[:notice] = "#{@task.title} was successfully updated."
        redirect_to movie_path(@task)
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        flash[:notice] = "Task '#{@task.title}' deleted."
        redirect_to tasks_path
    end

    private
    def task_params
        params.require(:task).permit(:title, :priority, :description, :complete, :team, :timestamps, :due).merge(team: Team.find(1), complete: false) #TODO: find team by user's team
    end
end
