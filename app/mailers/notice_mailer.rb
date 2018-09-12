class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_for_approving_interview.subject
  #
  def sendmail_for_approving_interview
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
