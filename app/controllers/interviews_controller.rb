class InterviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_if_not_current_user, only: [:create, :edit, :destroy]
  before_action :set_interview, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @interviews = @user.interviews.order(:interview_datetime)
  end

  def show
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
  end

  def update
    if @interview.update(interview_param)
      if @interview.approval_status == 'approval'
        # 承認された面接以外のそのユーザーの面接のapproval_statusをdisapproval(拒否)に設定
        user_id = params[:user_id]
        id = params[:id]
        Interview.where(["user_id = ? and id != ?", user_id, id]).update_all(approval_status: 'disapproval')
      end
      redirect_to user_interview_path(current_user, @interview), notice: "面接を更新しました。"
    else
      render 'edit'
    end
  end

  def destroy
    @interview.destroy
    redirect_to user_interviews_path, notice: "面接を削除しました。"
  end

  private

    def set_interview
      @interview = Interview.find(params[:id])
    end

    def interview_param
      params.require(:interview).permit(:interview_datetime, :approval_status)
    end

    def redirect_if_not_current_user
      redirect_to user_interviews_path(current_user) unless current_user?
    end
end
