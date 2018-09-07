module InterviewsHelper
  def set_interview_datetime
    @interviews.each do |interview|
      return l interview.interview_datetime, format: :long if interview_approved?(interview)
    end
    return nil
  end

  #面接の編集、削除ボタンをdisabled: trueするかの判定
  def disabled?(interview)
    status = interview.approval_status
    return false if status == 'reserve'
    return true if status == 'approval' || status == 'disapproval'
  end
end
