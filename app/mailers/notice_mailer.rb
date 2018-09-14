class NoticeMailer < ApplicationMailer

  def sendmail_for_approving_interview(user,interviewer_email)
    @user = user
    mail to: interviewer_email,
         subject: '面接希望日が決まりました。'
  end
end
