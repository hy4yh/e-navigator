class InterviewsController < ApplicationController
  def index
    user = get_current_user_record
    @interviews = user.interviews.order(:interview_datetime)
  end

  def new
    user = get_current_user_record
    @interview = user.interviews.new
  end

  def create
    if current_user?
      user = get_current_user_record
      @interview = user.interviews.new(interview_param)
      if @interview.save
        flash.now[:notice] = "面接を作成しました。"
      else
        render 'new'
      end
    else
      redirect_to :root
    end
  end

  private
    def interview_param
      params.require(:interview).permit(:interview_datetime)
    end

    def get_current_user_record
      User.find(current_user.id)
    end
end
