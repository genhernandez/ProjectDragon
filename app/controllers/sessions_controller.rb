class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
  if current_user && Team.find(current_team_id).name != "TaskDragon"
    redirect_to team_tasks_path(:team_id => current_team_id)\
  else  
    #if user is brand new looking for team 
    redirect_to teams_path
  end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
