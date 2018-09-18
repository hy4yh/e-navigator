class InterviewMailer < ApplicationMailer

  def approve(interviewee,interviewer_email)
    @interviewee = interviewee
    mail to: interviewer_email,
         subject: '面接希望日が決まりました。'
  end
end
