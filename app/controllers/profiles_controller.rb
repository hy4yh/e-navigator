class ProfilesController < ApplicationController
  def edit
    if current_user.id == params[:user_id].to_i
      @profile = Profile.find_by(user_id: current_user.id)
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
end
