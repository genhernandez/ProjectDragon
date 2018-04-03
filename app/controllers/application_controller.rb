class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
  end

  helper_method :current_team_id
  def current_team_id
    @current_team_id = current_user.team.id
  end
end

