class InterviewMailer < ApplicationMailer

  def approve(interviewee,interviewer_email)
    @interviewee = interviewee
    mail to: interviewer_email,
         subject: '面接希望日が決まりました。'
  end

  def decide(interviewee, interviewer)
    @interviewee = interviewee
    @interviewee_interviews = interviewee.interviews
    @interviewer = interviewer
    mail to: [@interviewee.email, @interviewer.email],
         subject: '面接日時が確定しました。'
  end
end
