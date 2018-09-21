class InterviewMailer < ApplicationMailer

  def approve(interviewee,interviewer_email)
    @interviewee = interviewee
    mail to: interviewer_email,
         subject: '面接希望日が決まりました。'
  end

  def decide(approved_interview, interviewer)
    @approved_interview = approved_interview
    @interviewer = interviewer
    mail to: [@approved_interview.user.email, @interviewer.email],
         subject: '面接日時が確定しました。'
  end
end
