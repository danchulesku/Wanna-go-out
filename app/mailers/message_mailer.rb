class MessageMailer < ApplicationMailer
  def send_email(email:, subject:, body:)
    @body = body

    debugger
    mail to: email, subject: subject
  end
end
