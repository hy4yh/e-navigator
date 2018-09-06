class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_if_not_current_user
  before_action :set_profile, only: [:edit, :update]

  def create
    params[:profile][:user_id] = current_user.id
    @profile = Profile.create(create_profile)
    render 'edit'
  end

  def edit
    unless @profile
      @profile = Profile.new
    end
  end

  def update
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

    def set_profile
      @profile = Profile.find_by(user_id: current_user.id)
    end

    def redirect_if_not_current_user
      redirect_to root_path unless current_user?
    end
end
