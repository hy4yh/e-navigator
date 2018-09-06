class UsersController < ApplicationController
  def index
    if user_signed_in?
      @users = User.includes(:profile, :interviews).where.not(id: current_user.id)
    else
      redirect_to new_user_session_path
    end
  end
end
