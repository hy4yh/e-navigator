module InterviewsHelper
  
  def set_interview_datetime
    @interviews.each do |interview|
      return l interview.interview_datetime, format: :long if interview.approval?
    end
    return nil
  end

end
