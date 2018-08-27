class ProfilesController < ApplicationController
  def create
    if current_user?
      params[:profile][:user_id] = current_user.id
      @profile = Profile.create(create_profile)
      render 'edit'
    end
  end

  def edit
    if current_user?
      unless @profile = Profile.find_by(user_id: current_user.id)
        @profile = Profile.new
      end

      if request.patch?
        @profile.update(profile_params)
      end
    else
      redirect_to :root
    end
  end

  def update
  end

  private
    def profile_params
      params.require(:profile).permit(:name, :birthday, :gender, :school_name)
    end

    def create_profile
      params.require(:profile).permit(:user_id, :name, :birthday, :gender, :school_name)
    end
end
