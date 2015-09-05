class ModelMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_record_notification.subject
  #
  default from: "postmaster@sandboxdc6af2b2422d42d399d98b173dab9f91.mailgun.org"

  def new_record_notification(feedback)
    @greeting = "Hi"

    mail to: "miguel_bahena@hotmail.com"
  end
end
