class TasksController < ApplicationController
    def index
        sort = params["sort_by"]
        if sort == nil || sort.empty?
            sort = "title"
        end
        @tasks = current_user.team.tasks.all.order("complete ASC, #{sort} ASC")
    end

    def show
        id = params[:id] # retrieve movie ID from URI route
        @task = Task.find(id)
        # will render app/views/movies/show.html.haml by default
    end

    def new
        @task = current_user.team.tasks.build
    end

    def create
        #raise @params.inspect 
        @task = Task.create!(task_params)
        redirect_to team_tasks_path(:id => current_team_id, :anchor => 'list')
    end

    def edit
        @task = Task.find params[:id]
    end

    def update
        @task = Task.find params[:id]
        if @task.update_attributes(task_params)
            redirect_to team_tasks_path(:id => current_team_id, :anchor => 'list')
        else 
            redirect_to team_tasks_path(:id => current_team_id, :anchor => 'list')
            #TODO: reload edit modal 
        end
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to team_tasks_path(:id => current_team_id, :anchor => 'list')
    end
    
    def complete
        @task = Task.find params[:id]
        completed = !@task.complete
        @task.update_attributes!(:complete => completed)
        dragon = current_user.team.dragon
        points = 10
        case @task.priority
        when 1
            points *= 5
        when 2
            points *= 4
        when 3
            points *= 3
        when 4
            points *= 2
        end
        if completed 
            dragon.level_up(current_user, points)
        else 
            dragon.level_up(current_user, -points)
        end
        redirect_to team_tasks_path(:id => current_team_id, :anchor => 'list')
    end
end
    private
    def task_params
 params.require(:task).permit(:title, :priority, :description, :complete, :team, :timestamps, :due).merge(team: Team.find(current_team_id), complete: false)
        #params.permit(:title, :priority, :description, :complete, :team, :timestamps, :due).merge(team: Team.find(current_team_id), complete: false)
    end
