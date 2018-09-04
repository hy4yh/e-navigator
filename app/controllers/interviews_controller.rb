class InterviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_if_not_current_user, only: [:create, :update, :destroy]

  def index
    @interviews = current_user.interviews.order(:interview_datetime)
  end

  def show
    @interview = Interview.find(params[:id])
  end

  def new
    @interview = current_user.interviews.new
  end

  def create
    @interview = current_user.interviews.new(interview_param)
    if @interview.save
      redirect_to user_interview_path(current_user, @interview), notice: "面接を作成しました。"
    else
      render 'new'
    end
  end

  def edit
    @interview = Interview.find(params[:id])
  end

  def update
    @interview = Interview.find(params[:id])
    if @interview.update(interview_param)
      redirect_to user_interview_path(current_user, @interview), notice: "面接を更新しました。"
    else
      render 'edit'
    end
  end

  def destroy
    interview = Interview.find(params[:id])
    interview.destroy
    redirect_to user_interviews_path, notice: "面接を削除しました。"
  end

  private
    def interview_param
      params.require(:interview).permit(:interview_datetime)
    end

    def redirect_if_not_current_user
      redirect_to user_interviews_path(current_user) unless current_user?
    end
end
