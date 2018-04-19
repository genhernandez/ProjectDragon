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

  helper_method :image_urls
  def image_urls
   @image_urls = [['/img/dragons/green_egg.png', '/img/dragons/blue_egg.png', '/img/dragons/purple_egg.png', '/img/dragons/red_egg.png', '/img/dragons/yellow_egg.png'],['/img/dragons/green_dragon_still.png', '/img/dragons/blue_dragon_still.png', '/img/dragons/purple_dragon_still.png', '/img/dragons/red_dragon_still.png', '/img/dragons/yellow_dragon_still.png']]
end
