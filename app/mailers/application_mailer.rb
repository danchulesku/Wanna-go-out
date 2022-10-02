class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.mailjet[:sender_email]
  layout 'mailer'
end
