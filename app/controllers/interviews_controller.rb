class InterviewsController < ApplicationController
  before_action :authenticate_user!
  def index
    @interviews = current_user.interviews.order(:interview_datetime)
  end

  def new
    @interview = current_user.interviews.new
  end

  def create
    if current_user?
      @interview = current_user.interviews.new(interview_param)
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
    @interview = Interview.find(params[:id])
  end

  def update
    if current_user?
      @interview = Interview.find(params[:id])
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
      interview = Interview.find(params[:id])
      interview.destroy
      flash[:notice] = "面接を削除しました。"
    end
    redirect_to action: :index
  end

  private
    def interview_param
      params.require(:interview).permit(:interview_datetime)
    end
end
