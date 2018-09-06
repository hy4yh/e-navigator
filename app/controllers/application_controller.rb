class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def current_user?
    current_user.id == params[:user_id].to_i
  end
end
