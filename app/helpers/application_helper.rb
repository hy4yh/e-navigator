module ApplicationHelper
  def interview_approved?(interview)
    interview.approval_status == 'approval'
  end
end
