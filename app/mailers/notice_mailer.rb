class NoticeMailer < ApplicationMailer

  def sendmail_for_approving_interview(user,interviewer)
    @user = user
    mail to: interviewer.email,
         subject: '面接希望日が決まりました。'
  end
end
