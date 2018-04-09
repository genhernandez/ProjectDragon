class TasksController < ApplicationController
    def index
        sort = params["sort_by"]
        if sort == nil || sort.empty?
            sort = "title"
        end
        @tasks = Team.find(current_team_id).tasks.all.order("complete ASC, #{sort} ASC")
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
        @task = Task.new(task_params)
        # respond_to do |format|
        #     if @task.save
        #       format.html { redirect_to team_tasks_path(:id => current_team_id, :anchor => 'list'), notice: 'Task was successfully created.' }
        #       format.json
        #     else
        #       format.html { render action: '_new' }
        #       format.json { render json: @task.errors, status: :unprocessable_entity }
        #     end
        # end
        if @task.save
            redirect_to team_tasks_path(:id => current_team_id, :anchor => 'list')
        else 
            #TODO: reload new modal 
            redirect_to team_tasks_path(:id => current_team_id, :anchor => 'list')
            flash[:notice] = "Task can't be created without a title."
        end
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
        completed = @task.complete
        @task.update_attributes!(:complete => !completed)
        dragon = current_user.team.dragon
        dragon.level_up(current_user)
        redirect_to team_tasks_path(:id => current_team_id, :anchor => 'list')
    end

    private
    def task_params
        params.require(:task).permit(:title, :priority, :description, :complete, :team, :timestamps, :due).merge(team: Team.find(current_team_id))
    end
end
