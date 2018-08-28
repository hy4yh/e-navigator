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

  def edit
    @interview = Interview.find(params[:interview_id])
  end

  def update
    if current_user?
      @interview = Interview.find(params[:interview_id])
      if @interview.update(interview_param)
        flash.now[:notice] = "面接を更新しました。"
      else
        render 'edit'
      end
    else
      redirect_to :root
    end
  end

  def destroy
    if current_user?
      interview = Interview.find(params[:interview_id])
      interview.destroy
      flash[:notice] = "面接を削除しました。"
    end
    redirect_to action: :index
  end

  private
    def interview_param
      params.require(:interview).permit(:interview_datetime)
    end

    def get_current_user_record
      User.find(current_user.id)
    end
end
