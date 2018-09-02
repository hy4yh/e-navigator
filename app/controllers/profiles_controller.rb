class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_if_not_current_user

  def create
    params[:profile][:user_id] = current_user.id
    @profile = Profile.create(create_profile)
    render 'edit'
  end

  def edit
    unless @profile = Profile.find_by(user_id: current_user.id)
      @profile = Profile.new
    end
  end

  def update
    @profile = Profile.find_by(user_id: current_user.id)
    @profile.update(profile_params)
    render :edit
  end

  private
    def profile_params
      params.require(:profile).permit(:name, :birthday, :gender, :school_name)
    end

    def create_profile
      params.require(:profile).permit(:user_id, :name, :birthday, :gender, :school_name)
    end

    def redirect_if_not_current_user
      redirect_to :root unless current_user?
    end
end
