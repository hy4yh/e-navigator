module ApplicationHelper
  def interview_approved?(interview)
    interview.approval_status_i18n == "承認"
  end
end
