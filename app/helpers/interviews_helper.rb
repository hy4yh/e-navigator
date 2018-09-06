module InterviewsHelper
  def get_interview_datetime
    @interviews.each do |interview|
      return l interview.interview_datetime, format: :long if interview_approved?(interview)
    end
    return nil
  end
end
